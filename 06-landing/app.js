/* WISP submission — interactions. Vanilla JS, no dependencies. */
(function () {
  "use strict";

  /* ---------- scroll reveal ---------- */
  var revealables = document.querySelectorAll(".reveal");
  if ("IntersectionObserver" in window) {
    var ro = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) { if (e.isIntersecting) { e.target.classList.add("is-visible"); ro.unobserve(e.target); } });
    }, { threshold: 0.15 });
    revealables.forEach(function (el) { ro.observe(el); });
  } else { revealables.forEach(function (el) { el.classList.add("is-visible"); }); }

  /* ---------- sidebar: active section + mobile toggle ---------- */
  var links = Array.prototype.slice.call(document.querySelectorAll(".side-nav a"));
  var map = {};
  links.forEach(function (a) { map[a.getAttribute("href").slice(1)] = a; });
  var sections = Object.keys(map).map(function (id) { return document.getElementById(id); }).filter(Boolean);
  if ("IntersectionObserver" in window) {
    var so = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (e.isIntersecting) {
          links.forEach(function (a) { a.classList.remove("is-active"); });
          if (map[e.target.id]) map[e.target.id].classList.add("is-active");
        }
      });
    }, { rootMargin: "-20% 0px -70% 0px" });
    sections.forEach(function (s) { so.observe(s); });
  }
  var sidebar = document.getElementById("sidebar");
  var toggle = document.getElementById("sideToggle");
  if (toggle) {
    toggle.addEventListener("click", function () { sidebar.classList.toggle("open"); });
    sidebar.addEventListener("click", function (e) { if (e.target.tagName === "A") sidebar.classList.remove("open"); });
  }

  /* ---------- personas ---------- */
  var tabs = Array.prototype.slice.call(document.querySelectorAll(".persona-tab"));
  var panels = Array.prototype.slice.call(document.querySelectorAll(".persona-panel"));
  tabs.forEach(function (tab) {
    tab.addEventListener("click", function () {
      var i = tab.getAttribute("data-p");
      tabs.forEach(function (t) { t.setAttribute("aria-selected", t === tab ? "true" : "false"); });
      panels.forEach(function (p) { p.classList.toggle("is-active", p.getAttribute("data-p") === i); });
    });
  });

  /* ---------- deck carousel ---------- */
  var track = document.getElementById("deckTrack");
  if (track) {
    var slides = track.children.length, idx = 0;
    var dotsWrap = document.getElementById("deckDots");
    for (var d = 0; d < slides; d++) {
      var dot = document.createElement("button");
      dot.className = "deck__dot" + (d === 0 ? " is-active" : "");
      dot.setAttribute("aria-label", "slide " + (d + 1));
      (function (n) { dot.addEventListener("click", function () { go(n); }); })(d);
      dotsWrap.appendChild(dot);
    }
    function go(n) {
      idx = (n + slides) % slides;
      track.style.transform = "translateX(" + (-idx * 100) + "%)";
      Array.prototype.forEach.call(dotsWrap.children, function (el, i) { el.classList.toggle("is-active", i === idx); });
    }
    document.getElementById("deckPrev").addEventListener("click", function () { go(idx - 1); });
    document.getElementById("deckNext").addEventListener("click", function () { go(idx + 1); });
  }

  /* ---------- content calendar (team marketing copy, kept verbatim) ---------- */
  var posts = [
    { w: "Week 1 · Mon", pillar: 1, tag: "The Case Against Passive",
      hook: "4.19% of push notifications get opened. The other 95.81% is where your goals go to die.",
      body: "4.19%. That's the average open rate on a push notification — the same technology every productivity app on the market is still betting your discipline on. A red badge and a buzz aren't accountability. They're background noise you've trained yourself to ignore, and every app that relies on them knows it. NaaS doesn't send you a notification. NaaS calls you — an AI Executive Assistant with your schedule, your goals, and zero interest in letting you scroll past them. If a silent banner hasn't gotten you out of bed in three years, it's not going to start tomorrow.",
      cta: "Stop waiting for a banner you'll swipe away. Download NaaS and get an assistant who calls." },
    { w: "Week 1 · Wed", pillar: 2, tag: "Meet Your Assistant · Tough Love",
      hook: "Hey loser. Out of bed. Now.",
      body: "This isn't a notification. It's a phone call from an assistant who was hired to get you moving, not to make you feel good about not moving. Tough Love is one of four Nudging Styles inside NaaS — built for the version of you that needs a direct order, not a gentle suggestion. No badge to swipe away. No snooze button that actually works. Just a voice that knows exactly what you told it you wanted, and isn't going to let you forget it.",
      cta: "Pick your Nudging Style. Meet your Executive Assistant." },
    { w: "Week 1 · Fri", pillar: 3, tag: "Executed, Not Excused · Unbossed Hustler",
      hook: "No boss. No team standup. No one noticing if you don't ship. That was the plan.",
      body: "9 AM. A $3,000 deliverable due Friday. Three coffees deep, scrolling instead of opening Figma — because when you work for yourself, nobody's watching. That's the trade every freelancer makes for the freedom, and it's the same trade that quietly kills more businesses than bad clients do. NaaS doesn't replace your team. It becomes the check-in you never get to skip: a live call at the exact moment you said you'd start, from an assistant who treats your business like it's worth showing up for. You built this alone. You don't have to run it alone.",
      cta: "Get the accountability your business doesn't have. Try NaaS free for 7 days." },
    { w: "Week 2 · Mon", pillar: 1, tag: "The Case Against Passive",
      hook: "Every habit app you've ever downloaded, ranked by how hard they tried.",
      body: "A checklist app with a streak counter, a gold star, and a push notification you turned off in week two. A phone that rings your name and says “It's 6:30. Your workout window is open.” Gamification is a great system for people who already have discipline. It's a terrible plan for the 11 PM version of you who's three procrastinated hours deep in a deadline. Streaks don't call. NaaS does.",
      cta: "Trade your streak counter for an assistant that actually follows up." },
    { w: "Week 2 · Wed", pillar: 2, tag: "Meet Your Assistant · Ego Pumper",
      hook: "Hey champ — that deliverable isn't going to build itself, and neither is the business you keep saying you're building.",
      body: "Ego Pumper is the Nudging Style built for the founder who runs on momentum, not guilt. It doesn't nag. It reminds you, at full volume, exactly why you started — then gets you back in the seat. Four founders, four different mornings, one assistant that adjusts its entire personality to how you actually respond to pressure. That's not a notification. That's a hype man who also happens to know your calendar.",
      cta: "Choose the voice that gets you moving. Set your Nudging Style in NaaS." },
    { w: "Week 2 · Fri", pillar: 3, tag: "Executed, Not Excused · Crisis Crammer",
      hook: "11:47 PM. Paper due at 9 AM. Laptop open to a blank page, phone open to everything except the paper.",
      body: "This is the exact moment every habit-tracking app has already lost you — you're past gamification, past gentle reminders, past caring about a streak. What actually works at 11:47 PM is a phone ringing with a voice that won't let the call go to voicemail of your own excuses. That's Tough Love, and that's the version of NaaS built for the student who needs a wall to hit, not a nudge to skip. Four hours. One call. One paper that actually got turned in.",
      cta: "Stop negotiating with your own deadline. Let NaaS call it in." },
    { w: "Week 3 · Mon", pillar: 1, tag: "The Case Against Passive",
      hook: "Procrastination isn't a productivity problem. It's a mental health problem wearing a to-do list.",
      body: "Research consistently links procrastination to real downstream costs — guilt, anxiety, stress, and worse academic and health outcomes. That's not a personal failing. That's a system failing you: your brain isn't missing willpower, it's missing a strong enough interruption to break the avoidance loop. Every app that hands you a badge or a checklist is asking you to solve a psychological pattern with a UI element. NaaS interrupts the pattern itself — with a voice, in the moment, before the guilt has time to compound.",
      cta: "Break the avoidance loop before it breaks you. Meet NaaS." },
    { w: "Week 3 · Wed", pillar: 2, tag: "Meet Your Assistant · Supportive Partner",
      hook: "I know it's cold and the bed is warmer. But you told me this mattered.",
      body: "You've started this before. Maybe three times, maybe every January. That's not a character flaw — it's what happens when the only thing holding you accountable is a silence you can turn off. Supportive Partner is the Nudging Style built for exactly this: warm enough to not confirm your worst self-narrative, direct enough to still get you out the door. No shame. No skipped call. Just a voice that remembers what you said you wanted, even on the morning you forgot.",
      cta: "Give your goals an assistant who doesn't let you quietly quit. Try NaaS." },
    { w: "Week 3 · Fri", pillar: 3, tag: "Executed, Not Excused · Pragmatist",
      hook: "It is 6:30 AM. Your scheduled deep-work window is open. That's it. That's the whole message.",
      body: "Not every founder needs hype or a hard edge — some just need the facts, stated on time, with zero friction attached. Pragmatist is the Nudging Style for the operator who treats their calendar like a system: block scheduled, block executed, no negotiation. One freelance designer switched to Pragmatist and stopped missing her own deep-work blocks within a week — not because the call was inspiring, but because it was impossible to pretend she hadn't heard it. Sometimes the most premium assistant is the one who doesn't waste your time.",
      cta: "Get the assistant that runs your schedule like it's non-negotiable. Try NaaS." },
    { w: "Week 4 · Mon", pillar: 1, tag: "The Case Against Passive",
      hook: "A phone call from an unknown number has a better answer rate than most productivity apps have an open rate.",
      body: "4.19%. That's the number every “smart reminder” app is quietly built on top of — and it's the number NaaS was built to make irrelevant. We're not competing for a swipe. We're not competing for a glance. We're calling, in real time, with a voice that knows your name and your deadline. If your current app's best feature is a badge count, you already know how this ends.",
      cta: "Replace the badge count with a phone call. Get NaaS." },
    { w: "Week 4 · Wed", pillar: 2, tag: "Meet Your Assistant · All 4 Personas",
      hook: "Four assistants. One job: making sure you actually do the thing.",
      body: "“Hey loser, out of bed. Now.” “It's 6:30 AM. Your scheduled workout window is open.” “I know you're tired, but remember how good you'll feel after.” “Hey champ, time to shine.” Same company, same mission, four completely different ways of getting you there — because the voice that gets a founder out of bed isn't the voice that gets a student off their phone at midnight. NaaS isn't a generic reminder. It's an Executive Assistant that adapts to exactly how you respond to pressure.",
      cta: "Take the 60-second quiz. Find your Nudging Style." },
    { w: "Week 4 · Fri", pillar: 3, tag: "Executed, Not Excused · Social Proof",
      hook: "30 days. One phone call at a time. Here's what actually changed.",
      body: "Not a streak. Not a badge. A deliverable sent on time, a workout that happened before the excuses did, a paper turned in at 8:47 instead of never. That's what a month of NaaS looks like for the freelancers and students who were done pretending a silent notification was ever going to be enough. We're not here to remind you. We're here to make sure it gets done — right now, not later. Your Executive Assistant is one download away.",
      cta: "Stop planning to start. Download NaaS today." }
  ];

  var shorts = ["4.19% open rate", "Tough Love", "Unbossed Hustler", "Every habit app", "Ego Pumper", "Crisis Crammer", "A mental-health problem", "Supportive Partner", "The Pragmatist", "Answer rate", "All 4 personas", "30-day results"];
  var grid = document.getElementById("calGrid");
  var postWrap = document.getElementById("calPost");
  if (grid) {
    // Illustrative launch month: March 2026 (starts Sunday, 31 days).
    var year = 2026, month = 2;
    var firstDow = (new Date(year, month, 1).getDay() + 6) % 7;   // Mon=0 .. Sun=6
    var daysInMonth = new Date(year, month + 1, 0).getDate();
    var prevDays = new Date(year, month, 0).getDate();
    var firstMonday = 1 + ((7 - firstDow) % 7);                   // first Monday on/after the 1st
    var dateToPost = {};
    for (var wk = 0; wk < 4; wk++) {
      dateToPost[firstMonday + wk * 7 + 0] = wk * 3 + 0;   // Mon
      dateToPost[firstMonday + wk * 7 + 2] = wk * 3 + 1;   // Wed
      dateToPost[firstMonday + wk * 7 + 4] = wk * 3 + 2;   // Fri
    }
    for (var i = 0; i < 42; i++) {
      var cell = document.createElement("div");
      var d = null, other = false, num;
      if (i < firstDow) { num = prevDays - firstDow + 1 + i; other = true; }
      else if (i - firstDow < daysInMonth) { num = i - firstDow + 1; d = num; }
      else { num = i - firstDow - daysInMonth + 1; other = true; }
      cell.className = "cal__cell" + (other ? " other" : "");
      var html = '<span class="num">' + num + '</span>';
      if (d != null && d in dateToPost) {
        var pi = dateToPost[d], p = posts[pi];
        html += '<button class="cal__event e' + p.pillar + '" data-i="' + pi + '" aria-expanded="false">' + esc(shorts[pi]) + '</button>';
      }
      cell.innerHTML = html;
      grid.appendChild(cell);
    }
    var current = -1;
    grid.addEventListener("click", function (e) {
      var ev = e.target.closest(".cal__event");
      if (!ev) return;
      var i = +ev.getAttribute("data-i");
      grid.querySelectorAll(".cal__event").forEach(function (c) { c.setAttribute("aria-expanded", "false"); });
      if (current === i) { current = -1; postWrap.innerHTML = ""; return; }
      current = i; ev.setAttribute("aria-expanded", "true");
      var p = posts[i];
      postWrap.innerHTML =
        '<div class="cal__post"><button class="close" aria-label="close">×</button>' +
        '<div class="meta">' + esc(p.w) + ' · ' + esc(p.tag) + '</div>' +
        '<div class="body"><strong>' + esc(p.hook) + '</strong>\n\n' + esc(p.body) + '</div>' +
        '<div class="cta">' + esc(p.cta) + '</div></div>';
      postWrap.querySelector(".close").addEventListener("click", function () {
        current = -1; postWrap.innerHTML = "";
        grid.querySelectorAll(".cal__event").forEach(function (c) { c.setAttribute("aria-expanded", "false"); });
      });
    });
  }

  /* ---------- hero incoming-call cycle ---------- */
  var callData = [
    { p: "Tough Love", l: "“Out of bed. Now.”" },
    { p: "The Pragmatist", l: "“It's 6:30. Let's work.”" },
    { p: "Supportive Partner", l: "“Remember how good you’ll feel.”" },
    { p: "Ego Pumper", l: "“Your time to shine.”" }
  ];
  var cP = document.getElementById("callPersona"), cL = document.getElementById("callLine");
  if (cP && cL) {
    var ci = 0;
    setInterval(function () {
      ci = (ci + 1) % callData.length;
      cP.style.opacity = "0"; cL.style.opacity = "0";
      setTimeout(function () {
        cP.textContent = callData[ci].p; cL.textContent = callData[ci].l;
        cP.style.opacity = "1"; cL.style.opacity = "1";
      }, 260);
    }, 3400);
  }

  function esc(s) { return s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;"); }
})();
