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
  var render = function (text) {
    return md.parse(protectBlanks(text)).replace(/<h2>(\s*Answer Key\s*)<\/h2>/i, '<h2 class="answer-key">$1</h2>');
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
    var lastInputs = {};

    // Convenience: remember grade and subject between visits (this browser only).
    ["grade", "subject"].forEach(function (name) {
      var el = form.elements[name];
      if (!el) return;
      if (!el.value && !new URLSearchParams(location.search).has(name)) el.value = recall(name);
      el.addEventListener("change", function () { remember(name, el.value); });
    });

    function inputs() {
      var out = {};
      Array.prototype.forEach.call(form.elements, function (el) {
        if (el.name && el.value) out[el.name] = el.value;
      });
      return out;
    }

    function show() {
      doc.innerHTML = render(markdown);
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
      markdown = "";
      editor.hidden = true;
      doc.hidden = false;
      result.hidden = false;
      doc.innerHTML = '<p class="writing">Writing your document…</p>';
      SC.notice(root, "");
      setBusy(true);
      status.textContent = "Writing… this usually takes 10 to 20 seconds.";
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
          var schedule = function () {
            if (pending) return;
            pending = true;
            requestAnimationFrame(function () { pending = false; show(); });
          };
          var handle = function (line) {
            if (!line.trim()) return;
            var msg = JSON.parse(line);
            if (msg.t) { markdown += msg.t; schedule(); }
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
          status.textContent = "Done. Print it, download it, or ask for changes below.";
          try { sessionStorage.setItem("sc:last:" + tool, markdown); } catch (e) {}
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

    root.querySelector(".toolbar").addEventListener("click", function (e) {
      var b = e.target.closest("[data-act]");
      if (!b || busy || !markdown) return;
      var act = b.dataset.act;
      if (act !== "edit" && !editor.hidden) { markdown = editor.value; show(); editor.hidden = true; doc.hidden = false; setEditLabel(); }
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
          grade: lastInputs.grade || "", subject: lastInputs.subject || "", standards: lastInputs.standards || "",
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

    // Bring back the last document after an accidental refresh.
    try {
      var saved = sessionStorage.getItem("sc:last:" + tool);
      if (saved) { markdown = saved; show(); result.hidden = false; }
    } catch (e) {}

    // "Make my own version" links arrive with the topic filled in: nothing else to do but press the button.
  });
})();
