window.WISP_CAPTIONS = {"welcome": [{"w": "Hey,", "s": 140, "e": 300}, {"w": "new", "s": 300, "e": 480}, {"w": "teammate.", "s": 480, "e": 1260}, {"w": "We're", "s": 1260, "e": 1410}, {"w": "excited", "s": 1410, "e": 1760}, {"w": "to", "s": 1760, "e": 1860}, {"w": "meet", "s": 1860, "e": 2060}, {"w": "you.", "s": 2060, "e": 2520}, {"w": "This", "s": 2520, "e": 2800}, {"w": "is", "s": 2800, "e": 2900}, {"w": "WISP.", "s": 2900, "e": 3520}, {"w": "Yes,", "s": 3520, "e": 3850}, {"w": "the", "s": 3850, "e": 4060}, {"w": "product", "s": 4060, "e": 4450}, {"w": "is", "s": 4450, "e": 4810}, {"w": "calling", "s": 4810, "e": 5120}, {"w": "you", "s": 5120, "e": 5360}, {"w": "because", "s": 5360, "e": 5640}, {"w": "that's", "s": 5640, "e": 6040}, {"w": "how", "s": 6040, "e": 6190}, {"w": "we", "s": 6190, "e": 6320}, {"w": "do", "s": 6320, "e": 6430}, {"w": "things", "s": 6430, "e": 6800}, {"w": "here.", "s": 6800, "e": 7280}, {"w": "Welcome", "s": 7280, "e": 7830}, {"w": "aboard.", "s": 7830, "e": 8570}, {"w": "Let's", "s": 8570, "e": 8930}, {"w": "go!", "s": 8930, "e": 9360}], "founder": [{"w": "We", "s": 90, "e": 180}, {"w": "built", "s": 180, "e": 650}, {"w": "WISP", "s": 650, "e": 1220}, {"w": "because", "s": 1220, "e": 1480}, {"w": "the", "s": 1480, "e": 1690}, {"w": "world", "s": 1690, "e": 1990}, {"w": "got", "s": 1990, "e": 2320}, {"w": "very", "s": 2320, "e": 2550}, {"w": "good", "s": 2550, "e": 2840}, {"w": "at", "s": 2840, "e": 2980}, {"w": "reminding", "s": 2980, "e": 3380}, {"w": "people", "s": 3380, "e": 3740}, {"w": "and", "s": 3740, "e": 3840}, {"w": "very", "s": 3840, "e": 4080}, {"w": "bad", "s": 4080, "e": 4400}, {"w": "at", "s": 4400, "e": 4480}, {"w": "moving", "s": 4480, "e": 4800}, {"w": "them.", "s": 4800, "e": 5200}, {"w": "You", "s": 5200, "e": 5400}, {"w": "are", "s": 5400, "e": 5600}, {"w": "our", "s": 5600, "e": 5800}, {"w": "first", "s": 5800, "e": 6170}, {"w": "teammate.", "s": 6170, "e": 6890}, {"w": "The", "s": 6890, "e": 7050}, {"w": "company", "s": 7050, "e": 7520}, {"w": "outgrew", "s": 7520, "e": 7840}, {"w": "one", "s": 7840, "e": 8010}, {"w": "person", "s": 8010, "e": 8390}, {"w": "and", "s": 8390, "e": 8640}, {"w": "you", "s": 8640, "e": 8720}, {"w": "are", "s": 8720, "e": 8880}, {"w": "the", "s": 8880, "e": 8990}, {"w": "part", "s": 8990, "e": 9200}, {"w": "we", "s": 9200, "e": 9440}, {"w": "could", "s": 9440, "e": 9600}, {"w": "not", "s": 9600, "e": 9760}, {"w": "do", "s": 9760, "e": 10000}, {"w": "alone.", "s": 10000, "e": 10630}, {"w": "Make", "s": 10630, "e": 10910}, {"w": "it", "s": 10910, "e": 11220}, {"w": "yours.", "s": 11220, "e": 11760}]};

(function () {
  var C = window.WISP_CAPTIONS || {};

  function build(el, words) {
    el.innerHTML = '';
    var spans = [];
    for (var i = 0; i < words.length; i++) {
      var sp = document.createElement('span');
      sp.className = 'cap-w';
      sp.textContent = words[i].w;
      el.appendChild(sp);
      el.appendChild(document.createTextNode(' '));
      spans.push(sp);
    }
    return spans;
  }

  function sync(spans, words, tms) {
    for (var i = 0; i < words.length; i++) {
      var w = words[i], sp = spans[i];
      if (tms >= w.s) { sp.classList.add('spoken'); } else { sp.classList.remove('spoken'); }
      if (tms >= w.s && tms < w.e) { sp.classList.add('current'); } else { sp.classList.remove('current'); }
    }
  }

  var media = [];
  function pauseOthers(cur) {
    for (var i = 0; i < media.length; i++) {
      if (media[i] && media[i] !== cur && !media[i].paused) { media[i].pause(); }
    }
  }

  // Founder audio — minimal custom player
  var fa = document.getElementById('founderAudio');
  var fbtn = document.getElementById('founderBtn');
  var fcap = document.getElementById('founderCaption');
  if (fa && fcap && C.founder) {
    media.push(fa);
    var fspans = build(fcap, C.founder);
    fa.addEventListener('timeupdate', function () { sync(fspans, C.founder, fa.currentTime * 1000); });
    fa.addEventListener('play', function () { if (fbtn) fbtn.classList.add('is-playing'); });
    fa.addEventListener('pause', function () { if (fbtn) fbtn.classList.remove('is-playing'); });
    fa.addEventListener('ended', function () { sync(fspans, C.founder, 0); });
    if (fbtn) fbtn.addEventListener('click', function () {
      if (fa.paused) { pauseOthers(fa); fa.play(); } else { fa.pause(); }
    });
  }

  // Welcome video — circular, click to play with sound
  var wv = document.getElementById('welcomeVideo');
  var wbtn = document.getElementById('welcomeVideoBtn');
  var wcap = document.getElementById('welcomeCaption');
  if (wv && wcap && C.welcome) {
    media.push(wv);
    var wspans = build(wcap, C.welcome);
    wv.addEventListener('timeupdate', function () { sync(wspans, C.welcome, wv.currentTime * 1000); });
    wv.addEventListener('play', function () { if (wbtn) wbtn.classList.add('is-playing'); });
    wv.addEventListener('pause', function () { if (wbtn) wbtn.classList.remove('is-playing'); });
    wv.addEventListener('ended', function () { sync(wspans, C.welcome, 0); });
    if (wbtn) wbtn.addEventListener('click', function () {
      if (wv.paused) { pauseOthers(wv); wv.muted = false; wv.play(); } else { wv.pause(); }
    });
    var wans = document.getElementById('welcomeAnswer');
    var whang = document.getElementById('welcomeHangup');
    if (wans) wans.addEventListener('click', function () { pauseOthers(wv); wv.muted = false; wv.play(); });
    if (whang) whang.addEventListener('click', function () { wv.pause(); wv.currentTime = 0; });
  }
})();
