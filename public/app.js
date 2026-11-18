// The generator: sends the form, shows the document as it is written, and handles
// edit / revise / share. Print, Word and copy come from site.js (window.SC).
(function () {
  "use strict";
  var SC = window.SC;

  var esc = function (s) {
    return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");
  };

  // Same safety rules as src/markdown.ts: raw HTML shown as text, no images, http(s)/mailto links only.
  var md = new marked.Marked({
    gfm: true,
    renderer: {
      html: function (token) { return esc(token.text); },
      image: function (token) { return esc(token.text || ""); },
      link: function (token) {
        var text = this.parser.parseInline(token.tokens);
        var href = (token.href || "").trim();
        if (!/^(https?:|mailto:)/i.test(href)) return text;
        return '<a href="' + esc(href) + '" rel="nofollow noopener" target="_blank">' + text + "</a>";
      },
    },
  });
  var protectBlanks = function (text) {
    return text.split("\n").map(function (line) {
      return /^\s*_{3,}\s*$/.test(line) ? line : line.replace(/_{2,}/g, function (run) { return run.replace(/_/g, "\\_"); });
    }).join("\n");
  };
  var renderPlain = function (text) {
    if (!text.trim()) return "";
    return md.parse(protectBlanks(text))
      // Nothing on the page itself told a trusting reader to check the key, so say it there.
      .replace(/<h2>(\s*Answer Key[^<]*)<\/h2>/i, '<h2 class="answer-key">$1</h2><p class="key-note">Written with AI. Check every answer before you use this page.</p>')
      .replace(/<h2>(\s*(?:Version [A-C]|Level [1-3])\b[^<]*)<\/h2>/g, '<h2 class="page-start">$1</h2>');
  };

  // Same as prettyMath in src/markdown.ts: real exponents, root signs and ≤ ≥ for display.
  var prettyMath = function (html) {
    var inCode = 0;
    return html.split(/(<[^>]+>)/).map(function (piece) {
      if (piece.charAt(0) === "<") {
        if (/^<(?:code|pre)\b/i.test(piece)) inCode++;
        else if (/^<\/(?:code|pre)>/i.test(piece)) inCode = Math.max(0, inCode - 1);
        return piece;
      }
      if (inCode) return piece;
      return piece
        .replace(/sqrt\(((?:[^()]|\([^()]*\))*)\)/g, function (_, inner) { return /^[\w.]+$/.test(inner) ? "√" + inner : "√(" + inner + ")"; })
        .replace(/([\w)\]])\^\(([^()]{1,30})\)/g, "$1<sup>$2</sup>")
        .replace(/([\w)\]])\^(-?(?:\d+(?:\.\d+)?|[a-zA-Z]))(?![\w^])/g, "$1<sup>$2</sup>")
        .replace(/(?<=[\w)>]) \* (?=[\w(])/g, " · ")
        .replace(/&lt;=/g, "≤")
        .replace(/&gt;=/g, "≥")
        .replace(/!=/g, "≠");
    }).join("");
  };

  // Same as pairLanguages in src/markdown.ts: a two-language document ("## English"
  // then "## Spanish") laid out as two columns, matched piece by piece.
  var NATIVE_NAMES = {
    Spanish: "Español", French: "Français", Portuguese: "Português", "Chinese (Simplified)": "中文",
    Vietnamese: "Tiếng Việt", Arabic: "العربية", Tagalog: "Tagalog", "Haitian Creole": "Kreyòl ayisyen",
  };
  var PAIR = new RegExp("(^|\\n)## English[ \\t]*\\n([\\s\\S]*?)\\n## (" +
    Object.keys(NATIVE_NAMES).map(function (n) { return n.replace(/[()]/g, "\\$&"); }).join("|") +
    ")[ \\t]*\\n([\\s\\S]*?)(?=\\n## |$)");
  var pairLanguages = function (text) {
    var m = text.match(PAIR);
    if (!m) return null;
    var before = text.slice(0, m.index);
    var after = text.slice(m.index + m[0].length);
    var pieces = function (src) {
      var tokens = md.lexer(protectBlanks(src));
      var one = function (t) { var a = [t]; a.links = tokens.links; return md.parser(a); };
      var out = [];
      tokens.forEach(function (t) {
        if (t.type === "space") return;
        if (t.type === "list" && t.items && t.items.length > 1) {
          var first = typeof t.start === "number" ? t.start : 1;
          t.items.forEach(function (item, i) {
            out.push({ html: one(Object.assign({}, t, { start: first + i, items: [item], raw: item.raw })), heading: false });
          });
        } else out.push({ html: one(t), heading: t.type === "heading" });
      });
      return out;
    };
    var left = pieces(m[2]);
    var right = pieces(m[4]);
    // A table is too wide for half a page, so a pair of tables is stacked instead.
    var row = function (a, b) {
      return /^\s*<table/.test(a) && /^\s*<table/.test(b)
        ? '<tr><td colspan="2">' + a + '</td></tr><tr><td colspan="2" dir="auto">' + b + "</td></tr>"
        : "<tr><td>" + a + '</td><td dir="auto">' + b + "</td></tr>";
    };
    var join = function (list) { return list.map(function (p) { return p.html; }).join(""); };
    var sections = function (list) {
      var out = [[]];
      list.forEach(function (p) {
        if (p.heading && out[out.length - 1].length) out.push([]);
        out[out.length - 1].push(p);
      });
      return out;
    };
    var rows = "";
    if (left.length === right.length) {
      rows = left.map(function (p, i) { return row(p.html, right[i].html); }).join("");
    } else {
      var ls = sections(left);
      var rs = sections(right);
      if (ls.length === rs.length) {
        rows = ls.map(function (sec, i) {
          return sec.length === rs[i].length
            ? sec.map(function (p, k) { return row(p.html, rs[i][k].html); }).join("")
            : row(join(sec), join(rs[i]));
        }).join("");
      } else rows = row(join(left), join(right));
    }
    return renderPlain(before) +
      '<table class="bilingual"><thead><tr><th>English</th><th>' + NATIVE_NAMES[m[3]] + "</th></tr></thead><tbody>" + rows + "</tbody></table>" +
      (after.trim() ? renderPlain(after) : "");
  };

  var render = function (text) {
    // "[TOTAL]" is filled in by the server once the document is finished.
    var src = text.split("[TOTAL]").join("…");
    return prettyMath(pairLanguages(src) || renderPlain(src));
  };

  var remember = function (k, v) { try { localStorage.setItem("sc:" + k, v); } catch (e) {} };
  var recall = function (k) { try { return localStorage.getItem("sc:" + k) || ""; } catch (e) { return ""; } };

  document.querySelectorAll("[data-generator]").forEach(function (root) {
    var form = root.querySelector(".gen-form");
    var go = root.querySelector("[data-go]");
    var status = root.querySelector("[data-status]");
    var result = root.querySelector("[data-result]");
    var doc = root.querySelector("[data-doc]");
    var editor = root.querySelector("[data-editor]");
    var refine = root.querySelector("[data-refine]");
    var tool = root.dataset.tool;
    var goLabel = go.textContent;
    var markdown = "";
    var busy = false;
    var checkInfo = null;
    var hiddenInfo = null;
    var lastInputs = {};
    var docId = "";
    var params = new URLSearchParams(location.search);

    // Convenience: remember grade, subject, country and language between visits (this browser only).
    ["grade", "subject", "region", "language"].forEach(function (name) {
      var el = form.elements[name];
      if (!el || el.tagName !== "SELECT") return;
      var saved = recall(name);
      if (saved && !params.has(name) && (!el.value || el.hasAttribute("data-remember"))) {
        el.value = saved;
        if (el.selectedIndex < 0) el.selectedIndex = 0;
      }
      el.addEventListener("change", function () { remember(name, el.value); });
    });

    // Outside the US, show ages beside grades so "Grade 4" isn't a guess.
    var gradeEl = form.elements.grade;
    var regionEl = form.elements.region;
    function labelGrades() {
      if (!gradeEl || !regionEl) return;
      var us = regionEl.value === "us";
      Array.prototype.forEach.call(gradeEl.options, function (o) {
        if (!o.value) return;
        if (!o.dataset.us) o.dataset.us = o.textContent;
        var parts = o.value.split("-").map(function (p) { return p === "K" ? 0 : parseInt(p, 10); });
        var top = parts.length > 1 ? parts[1] : parts[0];
        o.textContent = us ? o.dataset.us : "Ages " + (parts[0] + 5) + "–" + (top + 6) + " (US " + o.dataset.us + ")";
      });
    }
    // Kindergarten pages come out as words and typed shapes: say so before the teacher waits for one.
    var kNote = root.querySelector("[data-k-note]");
    function noteKindergarten() {
      if (kNote && gradeEl) kNote.hidden = gradeEl.value.charAt(0) !== "K";
    }
    if (gradeEl) gradeEl.addEventListener("change", noteKindergarten);

    // Show which options are switched on, so a remembered setting is never a surprise.
    var more = root.querySelector(".more");
    var moreSummary = root.querySelector("[data-more-summary]");
    var moreDefault = moreSummary ? moreSummary.textContent : "";
    function describeOptions() {
      if (!moreSummary) return;
      var on = [];
      var f = form.elements;
      if (f.versions && f.versions.value) on.push(f.versions.options[f.versions.selectedIndex].text);
      if (f.region && f.region.value !== "us") on.push(f.region.options[f.region.selectedIndex].text);
      if (f.language && f.language.tagName === "SELECT" && f.language.value !== "English") on.push(f.language.value);
      if (f.reference && f.reference.value.trim()) on.push("your own text");
      moreSummary.textContent = on.length ? "· " + on.join(" · ") : moreDefault;
    }
    if (more) {
      more.addEventListener("change", function () { labelGrades(); describeOptions(); });
      more.addEventListener("input", describeOptions);
    }
    labelGrades();
    describeOptions();
    noteKindergarten();

    // Print choices, remembered on this device.
    var aiLabel = recall("ailabel") === "1";
    var press = function (act, on) {
      var b = root.querySelector('[data-act="' + act + '"]');
      if (b) b.setAttribute("aria-pressed", on ? "true" : "false");
    };
    press("ailabel", aiLabel);
    if (recall("compact") === "1") { doc.classList.add("compact"); press("compact", true); }

    function saveDoc() {
      if (!markdown) return;
      if (!docId) docId = Date.now().toString(36) + Math.random().toString(36).slice(2, 6);
      var title = (markdown.match(/^\s*#\s+(.+)/) || [])[1] || "Untitled document";
      var stored = SC.docs.save({
        id: docId, tool: tool, title: title.replace(/[*_`]/g, "").slice(0, 140),
        markdown: markdown, inputs: lastInputs, at: new Date().toISOString(),
      });
      if (stored) {
        try { history.replaceState(null, "", "/tools/" + tool + "?doc=" + docId); } catch (e) {}
      }
    }

    function inputs() {
      var out = {};
      Array.prototype.forEach.call(form.elements, function (el) {
        if (el.name && el.value) out[el.name] = el.value;
      });
      return out;
    }

    function show() {
      doc.innerHTML = render(markdown);
      // Optional line at the foot of the student pages, for schools that want AI use disclosed.
      if (aiLabel && markdown) {
        var p = document.createElement("p");
        p.className = "ai-label";
        p.textContent = "Drafted with AI assistance.";
        var key = doc.querySelector("h2.answer-key");
        if (key) doc.insertBefore(p, key); else doc.appendChild(p);
      }
    }

    function setBusy(on, label) {
      busy = on;
      go.disabled = on;
      refine.querySelector("button").disabled = on;
      go.textContent = on ? label || "Writing…" : goLabel;
      root.classList.toggle("is-busy", on);
    }

    function run(extra) {
      if (busy) return;
      if (!form.reportValidity()) return;
      lastInputs = inputs();
      var body = Object.assign({ tool: tool, inputs: lastInputs }, extra || {});
      if (!extra) docId = "";
      markdown = "";
      editor.hidden = true;
      doc.hidden = false;
      result.hidden = false;
      doc.innerHTML = '<p class="writing">Writing your document…</p>';
      SC.notice(root, "");
      setBusy(true);
      status.textContent = "Writing… this usually takes 10 to 20 seconds, plus a few more to check the answers.";
      if (!extra) result.scrollIntoView({ behavior: "smooth", block: "start" });

      var failed = function (message) {
        if (!markdown) { result.hidden = !!(extra && extra.previous) ? false : true; doc.innerHTML = ""; }
        if (extra && extra.previous && !markdown) { markdown = extra.previous; show(); }
        SC.notice(root, message, "bad");
        result.hidden = false;
        status.textContent = message;
      };

      fetch("/api/generate", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) })
        .then(function (res) {
          if (!res.ok || !res.body) {
            return res.json().catch(function () { return {}; }).then(function (j) {
              throw new Error(j.error || "Something went wrong. Please try again.");
            });
          }
          var reader = res.body.getReader();
          var decoder = new TextDecoder();
          var buffer = "";
          var pending = false;
          var errorText = "";
          checkInfo = null;
          hiddenInfo = null;
          var schedule = function () {
            if (pending) return;
            pending = true;
            requestAnimationFrame(function () { pending = false; show(); });
          };
          var handle = function (line) {
            if (!line.trim()) return;
            var msg = JSON.parse(line);
            if (msg.t) { markdown += msg.t; schedule(); }
            if (msg.note) status.textContent = msg.note;
            // The server re-checked the finished document and sent a cleaned-up copy.
            if (typeof msg.replace === "string" && msg.replace) { markdown = msg.replace; schedule(); }
            if (msg.check) checkInfo = msg.check;
            if (msg.hidden && msg.hidden.length) {
              hiddenInfo = msg.hidden;
              SC.notice(root, "Before sending, we took out what looked like a student's details (" + msg.hidden.join(", ") +
                ") and put [Student] in its place, so it never reached the AI. Add the name yourself after you download.");
            }
            if (msg.error) errorText = msg.error;
          };
          var pump = function () {
            return reader.read().then(function (chunk) {
              if (chunk.done) {
                if (buffer) handle(buffer);
                if (errorText) throw new Error(errorText);
                return;
              }
              buffer += decoder.decode(chunk.value, { stream: true });
              var lines = buffer.split("\n");
              buffer = lines.pop();
              lines.forEach(handle);
              return pump();
            });
          };
          return pump();
        })
        .then(function () {
          show();
          var lang = (lastInputs.language || "").trim();
          // Say plainly what the answer check did, and never more than it did.
          var checked = "";
          if (checkInfo && checkInfo.checked) {
            var n = checkInfo.checked + (checkInfo.checked === 1 ? " answer" : " answers");
            if (checkInfo.unsure && checkInfo.unsure.length) {
              checked = " A second pass re-worked " + n + " and could not settle " + checkInfo.unsure.length + ": see the note at the top of the answer key.";
            } else if (checkInfo.fixed) {
              checked = " A second pass re-worked " + n + " and corrected the document. Please still look it over.";
            } else {
              checked = " A second pass re-worked " + n + " and found no mistakes. Please still look it over.";
            }
          }
          status.textContent = "Done. Print it, download it, or ask for changes below. It's saved under My documents on this device." + checked +
            (lang && !/^english$/i.test(lang) ? " This document includes a translation written by AI: please have a fluent speaker check it before it goes to students or families." : "");
          saveDoc();
        })
        .catch(function (err) { failed(err.message || "Something went wrong. Please try again."); })
        .then(function () { setBusy(false); });
    }

    form.addEventListener("submit", function (e) { e.preventDefault(); run(); });

    refine.addEventListener("submit", function (e) {
      e.preventDefault();
      var request = refine.elements.request.value.trim();
      if (!request || !markdown) return;
      if (!editor.hidden) markdown = editor.value;
      run({ previous: markdown, refine: request });
      refine.reset();
    });

    refine.querySelector("[data-chips]").addEventListener("click", function (e) {
      var chip = e.target.closest("[data-chip]");
      if (!chip || busy || !markdown) return;
      if (!editor.hidden) markdown = editor.value;
      run({ previous: markdown, refine: chip.dataset.chip });
    });

    root.querySelector(".toolbar").addEventListener("click", function (e) {
      var b = e.target.closest("[data-act]");
      if (!b || busy || !markdown) return;
      var act = b.dataset.act;
      if (act !== "edit" && !editor.hidden) { markdown = editor.value; show(); editor.hidden = true; doc.hidden = false; setEditLabel(); saveDoc(); }
      if (act === "large") {
        var on = doc.classList.toggle("large");
        b.setAttribute("aria-pressed", on ? "true" : "false");
      }
      if (act === "compact") {
        var tight = doc.classList.toggle("compact");
        b.setAttribute("aria-pressed", tight ? "true" : "false");
        remember("compact", tight ? "1" : "0");
      }
      if (act === "ailabel") {
        aiLabel = !aiLabel;
        b.setAttribute("aria-pressed", aiLabel ? "true" : "false");
        remember("ailabel", aiLabel ? "1" : "0");
        show();
      }
      if (act === "print") window.print();
      if (act === "word") SC.downloadWord(doc);
      if (act === "copy") SC.copyRich(doc, root);
      if (act === "edit") toggleEdit();
      if (act === "share") share();
    });

    function setEditLabel() {
      var b = root.querySelector('[data-act="edit"]');
      b.textContent = editor.hidden ? "✏ Edit" : "✔ Done editing";
    }

    function toggleEdit() {
      if (editor.hidden) {
        editor.value = markdown;
        editor.hidden = false;
        doc.hidden = true;
        editor.style.height = Math.min(900, Math.max(320, editor.scrollHeight + 8)) + "px";
        editor.focus();
      } else {
        markdown = editor.value;
        show();
        editor.hidden = true;
        doc.hidden = false;
        saveDoc();
      }
      setEditLabel();
    }

    function share() {
      var ok = window.confirm(
        "Share this document so other teachers can use it?\n\n" +
        "• It gets its own link straight away.\n" +
        "• After a quick review it is listed in the public library.\n\n" +
        "Please confirm it contains no student names or personal information."
      );
      if (!ok) return;
      fetch("/api/share", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          tool: tool, markdown: markdown, confirm: true,
          grade: (lastInputs.grade || "").split("-")[0], subject: lastInputs.subject || "", standards: lastInputs.standards || "",
        }),
      })
        .then(function (r) { return r.json().then(function (j) { return { ok: r.ok, j: j }; }); })
        .then(function (res) {
          if (!res.ok) return SC.notice(root, res.j.error || "Couldn't share that.", "bad");
          var url = location.origin + res.j.url;
          var span = document.createElement("span");
          span.append("Shared! Here's the link: ");
          var a = document.createElement("a");
          a.href = res.j.url; a.textContent = url; a.target = "_blank";
          span.append(a, ". Thank you for helping other teachers.");
          SC.notice(root, span, "good");
        })
        .catch(function () { SC.notice(root, "Couldn't share just now. Please try again.", "bad"); });
    }

    // Reopen a saved document (from My documents, or after a refresh): restore the form and the page.
    var wanted = params.get("doc");
    var saved = wanted ? SC.docs.get(wanted) : null;
    if (saved && saved.tool === tool) {
      docId = saved.id;
      markdown = saved.markdown;
      lastInputs = saved.inputs || {};
      Object.keys(lastInputs).forEach(function (name) {
        var el = form.elements[name];
        if (el && "value" in el) el.value = lastInputs[name];
      });
      labelGrades();
      describeOptions();
      show();
      result.hidden = false;
      status.textContent = "Reopened from My documents.";
    }
  });
})();
