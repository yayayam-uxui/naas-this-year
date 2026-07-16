# Conversation Log — Landing Page / Submission Assembly
**Project:** WISP · One-Link Submission (Vercel landing page) · **Participants:** Yam Meir ↔ Claude Code (Opus 4.8)
_Separate from the video track's [00-CONVERSATION-LOG-VIDEO.md](00-CONVERSATION-LOG-VIDEO.md). This file logs the session that turns the whole team's work into one submittable landing page. Updated every turn._

---

## 15 July 2026

### [Yam] Kickoff — "submit it as a landing page, not a boring Doc"
> אני יכולה להגיש בגוגל דוק משעמם, אבל הראש שלי הולך לדף נחיתה — presenting it. אפשר iframe/embedded. תגיד לי מה האילוצים. הסרטון שם (יוטיוב embed? מצוין). מצגת — Google Docs / Canva / PDF להטמעה. ואז — אולי פרוטוטייפ? לא הגשה רגילה אלא סיפור וכיף. יומני הפרומפטים כדרופדאון מקונן. אפשר לתת לך export של הוואטסאפ, ליצור conversation log לדף. כל אחד מהצוות יצר את החלק שלו — אתן לך את כולם. "שהם ימכרו" את דף הנחיתה — דרך ייחודית ויצירתית להגיש. מה דעתך?

### [Claude]
- הפעיל את מיומנות ה-brainstorming.
- מיפה את המציאות: הטמעת סרטון (self-host / YouTube), הטמעת דק (Slides/Gamma/Canva/PDF), דרופדאונים = `<details>`, ה-WhatsApp כ-making-of.
- **המגבלה המרכזית שהוצגה:** Artifact (claude.ai) חוסם iframes חיצוניים → לא מתאים להטמעות. אתר סטטי אמיתי (Vercel/Cloudflare) = שליטה מלאה.
- שאל שאלת היקף: כל ההגשה הקבוצתית או רק החלק של ים?

### [Yam]
> כל הפרויקט — לינק קבוצתי אחד. אני אוהבת Vercel. אבל צריך **אסטרטגיה** כדי שהגלילה תהיה נעימה והגיונית ולא סיוט.

### [Claude]
- נעל: Vercel · כל הפרויקט · self-host לסרטון.
- הציג את "התשובה לפחד מהסיוט": 4 עקרונות — sticky nav, כל סקשן=פרק, הכבד מתקפל בדרופדאונים, קצב ויזואלי.
- הציג 3 spines לסדר הסיפור (שתי-שכבות / פיץ'-ואז-הוכחה / התהליך-כציר) עם ASCII previews.

### [Yam]
> לא בטוחה באיזה spine — כי בסוף אנחנו רוצים הגשה אמיתית, כל מה שהם מבקשים ב-PDF. זה מה שאני לא יודעת.
> (הבהרה: קבוצת הוואטסאפ = קבוצת השאלות-ותשובות של הקורס שעוזר ההוראה פתח — כלומר מקור *דרישות*, לא תוכן.)

### [Claude]
- הסכים: המבנה צריך להיגזר מהדרישות, לא מסיפור שהומצא. ביקש את ה-PDF של המטלה + החומרים.

### [Yam] — מסר את המקורות
- **המטלה:** `Final_Project_Brief_Review.pdf` (ShaniAI · One Person Unicorn · רייכמן).
- **דוק של עידו** (רוב התוכן): Google Doc.
- **הדק:** `We-Dont-Remind-You-We-Move-You (2).pdf` (WISP, נבנה ב-Gamma).
- **לוגו:** 2 קבצי JPG (WISP — טיפת מים/להבה).
- רעיון: ה-Gantt/לוח תוכן של מיי → **לוח שנה אינטראקטיבי** (לוחצים על יום → נפתח מה קורה בו).
- ציין שחסר conversation log לסשן הזה.
- **ריפו התהליך (live):** https://github.com/yayayam-uxui/naas-this-year · הלוג הקיים שם.

### [Claude]
- קרא את כל המקורות. **תגליות:** המטלה = 9 דליברבלים + Stretch Zone (30% מהציון); המותג = **WISP**, טאגליין "We Don't Remind You. We Move You.".
- דגל אי-התאמת דדליין (ה-PDF: 07.07; הזיכרון: 16/7) + אי-התאמת שם (קופי שיווקי אומר "NaaS", הדק/לוגו אומרים "WISP") = סיכון עקביות (10 נק').
- יצר את הקובץ הזה (back-fill) והמשיך למיפוי דרישות → מה קיים → פערים.

### [Claude] — סינתזה: מיפוי דרישות מלא
- דגל דדליין (PDF 07.07 מול 16/7), זיהה מותג **WISP**, חילץ פלטה מהדק (נייבי·סגול·טורקיז·ענבר).
- הציג טבלת 9 דליברבלים + Stretch Zone (30%) עם סטטוס HAVE/PARTIAL/GAP, ומבנה FRONT/BACK שנגזר מהדרישות.
- שינה את קבצי הלוג לזוג ברור: `-VIDEO` / `-LANDING-PAGE`.

### [Yam] — סגירת פערים
> **3:** מסמך Market Analysis (docx) — כולל מקורות. **4:** יש prompt log מלא, נוציא הייליטס. **5:** reflection = של ים. **8:** Cowork = מאיה יצרה ותייצא. **Who-did-what:** יש ברמת שמות, כל אחד ימלא + אולי תמונות ב-edit שחור-לבן. **NaaS** = Nudge as a Service, תקין. מחר פגישת צוות — אפשר להציף פתוחים בבוקר.
> שאלה: מה זה Stretch Zone?

### [Claude]
- קרא את docx סעיף 3 (✅ 4 מקורות: PubMed, Batch 4.19%, market CAGR, competitors).
- הסביר Stretch Zone (Role 1 Onboarding = חובה / Role 2 = בוחרים 1); המליץ Role 2 = **GTM** (כ-70% מוכן ב-brief של עידו); Role 1 = בעיקר הרכבה מחומר קיים.
- עדכן סטטוס: רוב הדליברבלים ✅. הכין אג'נדה ל"הצפה" בפגישת מחר. מוכן לבנות שלד.

### [Yam] — נתנה go, וזרמה עם משוב חי תוך כדי בנייה
> קדימה. עידו יצר לוגו (WISP), מיי דק ב-Gamma, החומרים הגיעו. עשה noir לתמונות. בנה על המותג.
> ואז (תוך כדי): הדיזיין סיסטם צועק/לא נגיש · פונט קטן יותר כמו Inter · הסקשנים לא נכנסים למסך · לוח שנה אמיתי · prompt log כשיחה · לא להתחיל מהסרטון · **ניווט בצד שמאל, פלטה רגועה, בלי גרדיאנטים** (רפרנס: withdavid.ai) · remove em dashes · team שניים בשורה · תבנה את ה-Stretch Zone · QA מעיני הבודק/עוזר ההוראה · אני הולכת לישון, תסקור אותנטיות למקורות.

### [Claude] — סשן בנייה (לילה)
- קרא: המטלה (9 חלקים + Stretch Zone = 30%), הדק (WISP/Gamma), הלוגו, דוק עידו (קהל+voice+brief+לוח תוכן מלא), docx סעיף 3 (שוק+מקורות), יומן הפרומפטים (16 רשומות + 4 טעויות AI).
- זיהה שהסרטון הסופי האמיתי = `NaaS-ThisYear-FINAL.mp4` (ממותג WISP), לא v7 — והחליף.
- **3 סבבי עיצוב** עד לנחיתה: (1) dark cinematic → (2) מרוסן → (3) **withdavid: קרם בהיר, Instrument Serif + Inter, סייד-בר שמאלי nested, בלי גרדיאנטים.**
- בנה `06-landing/` (index.html · styles.css · app.js · assets): 16 סקשנים FRONT/BACK, קרוסלת דק, מחליף פרסונות, **לוח חודשי אינטראקטיבי (מרץ 2026, event pills)**, prompt log כשיחה (Yam/Claude), team 2-בשורה noir, אייקונים inline SVG.
- בנה את **ה-Stretch Zone**: Role 1 (Onboarding Handbook) + Role 2 = **Customer Success Playbook** (המלצה + FAQ אמיתי) + כלי AI קוליים מגניבים (Vapi/Retell/Bland/ElevenLabs). זו הדליברבל השני של ים.
- הסיר em dashes מהקופי שלי; השאיר מילה-במילה את הפוסטים של עידו (נאמן למקור).
- QA ויזואלי מלא (screenshots) — הכל נטען.
- כתב `06-landing/MORNING-REVIEW.md`: איך לראות/לפרוס · **סקירת אותנטיות** (מה נשאר verbatim מול מה שעוצב) · QA מעיני הבודק מול 9+Stretch · אג'נדה לפגישה.
- **Deploy חסום** — Vercel CLI לא מאומת ואין token; השאיר פקודת deploy של שורה אחת ל-Yam לבוקר.

## 16 July 2026

### [Yam] — נאמנות למטלה ולמקורות (הבקשה המרכזית)
> האתר מעולה, עכשיו זה **נאמנות למטלה ונאמנות למקורות — החברים שלי**. עברי על המטלה, ואז על כל מקור שהחברים יצרו, ותביני את הכוונה. הפרומט לוג הוא **per section** — כל חבר צוות קיבל סעיף, לכל סעיף יש פרומט לוג/עדות (לינק לצ׳אט / קובץ / דרופדאון שיחה). **Reflection** = כל אחד על עצמו, על המשימה שלו והחוויה שלו. במקום "sources every claim is sourced" → ציטוטים פשוטים בתחתית כמו מאמר. להבליט **כלי AI** (Perplexity, Gemini, Adobe ללוגו), לא mixkit. חוששת שפספסנו את עבודת המותג של עידו (שם, לוגו, brand voice). תעבוד לאט, בזהירות, **תן לכמה סוכנים לבקר**.

### [Claude] — פאס נאמנות מלא (לילה)
- קרא מחדש את כל המקורות: המטלה (PDF, 9 חלקים + Stretch), הדק (WISP, 9 שקפים), ה-market docx של מיי, **`00-PRODUCT-BRIEF.md`** (מקור ה-4 פרסונות verbatim + ה-ethos + הבעלויות), הדוק של עידו (התברר כ**תבנית ריקה** — התוכן האמיתי בדק/docx/product-brief), והמקורות היצירתיים של הוידאו.
- **מיפוי בעלויות מאושר:** Ido=Name+Logo (Adobe) · Mia=Marketing+Cowork · Mei=Deck+Market (Perplexity/ChatGPT/Gamma) · Yam=Video+Stretch+Landing.
- **שינויים:** (1) Prompt Log → **per-section** עם אינדקס עדות לכל דליברבל + owner; (2) Reflection → **per-member** (של ים מלא, השאר slots); (3) Sources → **ציטוטים גלויים** ממוספרים; (4) Tools → 8 כלי AI עם owner, mixkit/ffmpeg/ImageMagick להערת שוליים; (5) הוספת **Name+Logo (Part 1)** ו-**Marketing (Part 2)** עם תוכן אמיתי + placeholders ל-Ido/Mia; (6) הסרת em-dashes מהקופי שלנו.
- **ביקורת 3 סוכנים** (faithful-to-assignment / faithful-to-sources / copy-QA) — כולם עשו עבודה אמיתית. תגלית מרכזית: **הפרסונות/סטטיסטיקות/brand-voice כולם מגובים במקור, שום דבר לא הומצא.** תיקון היושרה היחיד: **80%** היה ללא מקור (ומיי כתבה "prevalent") → הוסף ציטוט אמיתי (solvingprocrastination, 80–95%) + הורד "regularly". תיקונים קטנים נוספים: הסרת סטט מומצא ב-FAQ, יישור שורת hero לציטוט האמיתי, ניגודיות, "illustrative".
- **דגלים לצוות (completeness):** Cowork ריק (Mia) · לינקי proof חסרים ל-1/2/5 · **NaaS→WISP ב-12 הפוסטים** (סיכון consistency, השארתי verbatim לפי בקשתך) · רפלקציות/הצהרות של Mia/Mei/Ido · 2–3 לוגואים שנפסלו (Ido) · marketing brief (Mia).
- **Deploy:** פרוס ל-production, alias ל-`wisp-onepersonunicorn.vercel.app` → **200 ציבורי, OG תקין, בלי login wall.** כתב `MORNING-REVIEW.md` מעודכן עם הכל.
