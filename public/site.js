// Runs on every page: document actions (print / Word / copy) and the newsletter form.
(function () {
  "use strict";

  function notice(root, text, kind) {
    var n = root.querySelector("[data-notice]") || document.querySelector("[data-notice]");
    if (!n) return;
    n.hidden = !text;
    n.className = "notice no-print" + (kind ? " " + kind : "");
    n.innerHTML = "";
    if (typeof text === "string") n.textContent = text;
    else if (text) n.appendChild(text);
  }

  function docTitle(doc) {
    var h = doc.querySelector("h1");
    return (h ? h.textContent : document.title).trim() || "document";
  }

  var DOC_CSS =
    "body{font-family:Georgia,'Times New Roman',serif;font-size:12pt;line-height:1.45;color:#000}" +
    "h1{font-size:20pt}h2{font-size:15pt;margin-top:18pt}h3{font-size:13pt}" +
    "table{border-collapse:collapse;width:100%}th,td{border:1px solid #444;padding:5pt 7pt;vertical-align:top;text-align:left}" +
    "th{background:#eee}li{margin-bottom:6pt}h2.answer-key{page-break-before:always}" +
    "table.bilingual td{width:50%;border:0;border-bottom:1px solid #ccc}table.bilingual td+td{border-left:1px solid #666}" +
    ".key-note,.ai-label{font-family:Arial,sans-serif;font-size:9pt;color:#444}";

  function downloadWord(doc) {
    var title = docTitle(doc);
    var page =
      "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word'>" +
      "<head><meta charset='utf-8'><title>" + title.replace(/</g, "&lt;") + "</title><style>" + DOC_CSS + "</style></head>" +
      "<body>" + doc.innerHTML + "</body></html>";
    var blob = new Blob(["﻿", page], { type: "application/msword" });
    var a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = title.replace(/[^\w\- ]+/g, "").trim().slice(0, 80) + ".doc";
    document.body.appendChild(a);
    a.click();
    setTimeout(function () { URL.revokeObjectURL(a.href); a.remove(); }, 500);
  }

  function copyRich(doc, root) {
    var htmlText = "<style>" + DOC_CSS + "</style>" + doc.innerHTML;
    var done = function () { notice(root, "Copied. Paste into Google Docs or Word and the formatting comes with it.", "good"); };
    var fallback = function () {
      var range = document.createRange();
      range.selectNodeContents(doc);
      var sel = window.getSelection();
      sel.removeAllRanges();
      sel.addRange(range);
      try { document.execCommand("copy"); done(); }
      catch (e) { notice(root, "Couldn't copy automatically. Select the text and press Ctrl+C (or ⌘C)."); }
      sel.removeAllRanges();
    };
    if (navigator.clipboard && window.ClipboardItem) {
      navigator.clipboard
        .write([new ClipboardItem({
          "text/html": new Blob([htmlText], { type: "text/html" }),
          "text/plain": new Blob([doc.innerText], { type: "text/plain" }),
        })])
        .then(done, fallback);
    } else fallback();
  }

  // "My documents": the last 20 documents, kept in this browser only (never sent anywhere).
  var DOCS_KEY = "sc:docs";
  var MAX_DOCS = 20;
  var docs = {
    list: function () {
      try { var v = JSON.parse(localStorage.getItem(DOCS_KEY) || "[]"); return Array.isArray(v) ? v : []; }
      catch (e) { return []; }
    },
    get: function (id) {
      return docs.list().filter(function (d) { return d.id === id; })[0] || null;
    },
    // Adds or updates a document. Returns its id, or "" if the browser won't store it.
    save: function (doc) {
      var all = docs.list().filter(function (d) { return d.id !== doc.id; });
      all.unshift(doc);
      all = all.slice(0, MAX_DOCS);
      // If storage is full, drop the oldest until it fits.
      while (all.length) {
        try { localStorage.setItem(DOCS_KEY, JSON.stringify(all)); return doc.id; }
        catch (e) { all.pop(); }
      }
      return "";
    },
    remove: function (id) {
      try { localStorage.setItem(DOCS_KEY, JSON.stringify(docs.list().filter(function (d) { return d.id !== id; }))); } catch (e) {}
    },
  };

  // Shared with app.js and my.js
  window.SC = { notice: notice, downloadWord: downloadWord, copyRich: copyRich, docTitle: docTitle, docs: docs };

  // Library pages: a finished document with a toolbar.
  var bar = document.querySelector("[data-static-doc]");
  if (bar) {
    var root = bar.parentElement;
    var doc = root.querySelector("[data-doc]");
    bar.addEventListener("click", function (e) {
      var b = e.target.closest("[data-act]");
      if (!b) return;
      if (b.dataset.act === "print") window.print();
      if (b.dataset.act === "word") downloadWord(doc);
      if (b.dataset.act === "copy") copyRich(doc, root);
    });
  }

  // Newsletter
  var nl = document.querySelector("[data-newsletter]");
  if (nl) {
    nl.addEventListener("submit", function (e) {
      e.preventDefault();
      var msg = nl.querySelector("[data-newsletter-msg]");
      var email = nl.querySelector("input[name=email]").value;
      fetch("/api/subscribe", { method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ email: email }) })
        .then(function (r) { return r.json().then(function (j) { return { ok: r.ok, j: j }; }); })
        .then(function (res) {
          msg.textContent = res.ok ? "You're on the list. See you next week!" : res.j.error || "Something went wrong.";
          if (res.ok) nl.reset();
        })
        .catch(function () { msg.textContent = "Couldn't subscribe just now. Please try again."; });
    });
  }
})();
