// Draws the "My documents" page from this browser's storage.
(function () {
  "use strict";
  var box = document.querySelector("[data-my-docs]");
  if (!box || !window.SC) return;

  function draw() {
    var list = SC.docs.list();
    box.innerHTML = "";
    if (!list.length) {
      var empty = document.createElement("div");
      empty.className = "empty";
      empty.innerHTML = "<p><strong>Nothing here yet.</strong></p><p>Documents you make will be kept here, on this device.</p>";
      var go = document.createElement("a");
      go.className = "btn primary"; go.href = "/"; go.textContent = "Make something";
      empty.appendChild(go);
      box.appendChild(empty);
      return;
    }
    var wrap = document.createElement("div");
    wrap.className = "my-list";
    list.forEach(function (d) {
      var row = document.createElement("div");
      row.className = "my-item";
      var left = document.createElement("div");
      var a = document.createElement("a");
      a.className = "title";
      a.href = "/tools/" + encodeURIComponent(d.tool) + "?doc=" + encodeURIComponent(d.id);
      a.textContent = d.title || "Untitled document";
      var meta = document.createElement("span");
      meta.className = "meta";
      var when = new Date(d.at);
      meta.textContent = (isNaN(when) ? "" : when.toLocaleDateString(undefined, { month: "short", day: "numeric", year: "numeric" }) + " · ") + String(d.tool).replace(/-/g, " ");
      left.append(a, meta);
      var actions = document.createElement("div");
      var open = document.createElement("a");
      open.className = "btn"; open.href = a.href; open.textContent = "Open";
      var del = document.createElement("button");
      del.className = "btn danger"; del.type = "button"; del.textContent = "Delete";
      del.setAttribute("aria-label", "Delete " + a.textContent);
      del.addEventListener("click", function () {
        if (window.confirm("Delete this document from this device? This can't be undone.")) { SC.docs.remove(d.id); draw(); }
      });
      actions.append(open, " ", del);
      row.append(left, actions);
      wrap.appendChild(row);
    });
    box.appendChild(wrap);
  }
  draw();
})();
