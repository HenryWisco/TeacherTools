// Arithmetic worked out by code.
//
// An answer key is full of statements like "(1.0379)^14 = 1.6976" or
// "6.00/24.63 = 0.244". A language model gets some of these wrong and a second
// model reading them usually agrees, so they are checked here with a calculator.
// Only plain number arithmetic is checked: anything with a variable, a unit in the
// middle, or words is left alone, and so is any line that is describing a mistake
// on purpose ("Jamal says 1/2 + 1/3 = 2/5").

// Evaluates + - * / ^ and parentheses. Returns null for anything else.
export function evaluate(input: string): number | null {
  let s = input
    .replace(/[−–]/g, "-")
    .replace(/[×·*]/g, "*")
    .replace(/÷/g, "/")
    .replace(/(\d),(?=\d{3}(?!\d))/g, "$1") // 11,630 -> 11630
    .replace(/(\d)\s+(\d+)\s*\/\s*(\d+)/g, "($1+$2/$3)") // 1 7/12 -> (1+7/12)
    .replace(/(?<=[\d)])\s+x\s+(?=[\d(])/gi, "*") // 3 x 4 (but not 2x - 3)
    .replace(/(?<=\d)x(?=\d)/gi, "*"); // 3x4
  // Two numbers side by side ("1. 26 + 9", "24. 12 x 20") are a list number or a new
  // sentence, not one calculation.
  if (/[\d.)]\s+[\d.(]/.test(s)) return null;
  s = s.replace(/\s+/g, "");
  if (!s || /[^0-9.+\-*/^()]/.test(s)) return null;
  let i = 0;
  const peek = () => s[i];
  const expr = (): number => {
    let v = term();
    while (peek() === "+" || peek() === "-") v = s[i++] === "+" ? v + term() : v - term();
    return v;
  };
  const term = (): number => {
    let v = unary();
    for (;;) {
      if (peek() === "*") { i++; v *= unary(); }
      else if (peek() === "/") { i++; v /= unary(); }
      else if (peek() === "(") v *= unary(); // 2(4)
      else return v;
    }
  };
  const unary = (): number => (peek() === "-" ? (i++, -unary()) : power());
  const power = (): number => {
    const base = primary();
    if (peek() === "^") { i++; return Math.pow(base, unary()); }
    return base;
  };
  const primary = (): number => {
    if (peek() === "(") {
      i++;
      const v = expr();
      if (s[i++] !== ")") throw new Error("paren");
      return v;
    }
    const m = s.slice(i).match(/^\d+(?:\.\d+)?|^\.\d+/);
    if (!m) throw new Error("number");
    i += m[0].length;
    return parseFloat(m[0]);
  };
  try {
    const v = expr();
    return i === s.length && Number.isFinite(v) ? v : null;
  } catch {
    return null;
  }
}

const CHARS = "\\d\\s.,()+\\-−–x×*·/÷^";
const TAIL = new RegExp(`[\\d(][${CHARS}]*$`); // arithmetic at the end of a piece of text
const HEAD = new RegExp(`^\\s*[-−–]?[\\d(.][${CHARS}]*`); // arithmetic at the start
const HAS_OPERATOR = /[+x×*·/÷^]|\d\s*[-−–]\s*[\d(]|\)\s*\(/;
// Lines that state a wrong calculation on purpose, or hedge.
const DELIBERATE = /\b(?:wrong|incorrect|mistake|error|misconception|distractor|forg[eo]t|forgets|instead of|rather than|says|said|claims?|thinks?|believes?|student who|if (?:a|the) student|not equal|does not|doesn't|cannot|should (?:be|have)|tempting|common)\b|≠|\?/i;

const decimals = (n: string): number => (n.includes(".") ? n.split(".")[1].replace(/\D/g, "").length : 0);
const tidyNumber = (v: number, places: number): string => {
  const p = Math.min(Math.max(places, 0), 6);
  return (Math.abs(v) >= 1000 ? v.toFixed(Math.min(p, 2)) : v.toFixed(Math.max(p, Math.abs(v) < 10 ? 2 : 1))).replace(/(\.\d*?)0+$/, "$1").replace(/\.$/, "");
};

export type ArithmeticSlip = { shown: string; correct: string };

// Finds "calculation = result" statements whose result is not what the calculation gives.
export function findArithmeticSlips(text: string): ArithmeticSlip[] {
  const slips: ArithmeticSlip[] = [];
  const seen = new Set<string>();
  for (const line of text.split("\n")) {
    if (!/[=≈]/.test(line) || DELIBERATE.test(line)) continue;
    const parts = line.split(/(=|≈)/);
    // parts: text, separator, text, separator, text ...
    for (let k = 0; k + 2 < parts.length; k += 2) {
      const approx = parts[k + 1] === "≈" || /\b(?:about|approximately|roughly|around|nearly)\s*$/i.test(parts[k]);
      const rightMatch = parts[k + 2].match(HEAD);
      if (!rightMatch) continue;

      // The calculation is the longest run of plain arithmetic that ends this piece.
      // Drop leading chunks ("1." of a numbered list, the end of the last sentence)
      // until what is left is one calculation.
      let left = (parts[k].match(TAIL) ?? [""])[0];
      while (left && evaluate(left) === null) {
        const shorter = left.replace(/^\s*\S+\s+/, "");
        left = shorter === left ? "" : shorter;
      }
      left = left.trim();
      if (!left || !HAS_OPERATOR.test(left)) continue;
      const before = parts[k].slice(0, parts[k].lastIndexOf(left));
      // Part of something bigger: "5g + 10 - 3", "e^(-1) * 2", "4 pi (25)(2)", "ln 2 / 0.06".
      if (/[A-Za-z$%^_+\-−–×*·/÷]$/.test(before.trimEnd()) && !/(?:^|[\s(])(?:so|then|thus|therefore|hence|and|or|is|are|get|gets|gives|give|because|since|now|first|next|finally|check|total|answer|solution|work|working)$/i.test(before.trimEnd())) continue;

      const rightRaw = rightMatch[0].trim();
      const right = rightRaw.replace(/[\s,]+$/, "");
      // What follows the number itself, so "3.7 g" (a unit) differs from "4g" (algebra).
      const after = parts[k + 2].slice(rightMatch[0].length - (rightMatch[0].length - rightMatch[0].trimEnd().length));
      // The result runs on into a variable, a constant or more working: "200 pi", "2/e", "4g + 9".
      if (/[x(+\-−–/÷×*·^]$/i.test(right) || /^(?:[A-Za-z_^]|\s*(?:pi|π|e\^|sqrt|root|ln|log|sin|cos|tan|[xyzkpqruvw])(?![A-Za-z.]))/.test(after)) continue;
      if (/^\s*[+\-−–×*·/÷^x]\s*[A-Za-z(]/.test(after)) continue;

      const a = evaluate(left);
      let b = evaluate(right);
      if (a === null || b === null || !right) continue;
      const rightIsNumber = /^[-−–]?[\d.,]+$/.test(right);
      if (/^\s*%/.test(after)) b = b / 100;
      // "83 ÷ 4 = 20 R3": a whole-number quotient with the remainder given separately.
      if (rightIsNumber && Number.isInteger(b) && Math.floor(a + 1e-9) === b && /^\s*(?:R\s?\d|r\s?\d|rem|with|,|and|\(|\+|full|whole|complete|[a-z]+,? (?:with|and|remainder))/i.test(after)) continue;
      const places = rightIsNumber ? decimals(right) : 6;
      const allowed = 0.6 * Math.pow(10, -places) + Math.abs(a) * (approx ? 0.02 : 0.003) + 1e-9;
      if (Math.abs(a - b) <= allowed) continue;
      // Percent written without the sign on one side, e.g. "0.25 x 60 = 15" is fine; "3/4 = 75" is a percent.
      if (rightIsNumber && Math.abs(a * 100 - b) <= allowed * 100) continue;
      const shown = `${left} = ${right}`.replace(/\s+/g, " ");
      if (seen.has(shown)) continue;
      seen.add(shown);
      slips.push({ shown, correct: tidyNumber(/^\s*%/.test(after) ? a * 100 : a, places + 1) });
    }
  }
  return slips.slice(0, 10);
}
