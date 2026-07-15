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
