<?php
/**
 * Change core WordPress strings using $overrides array.
 *
 * @author  Pressbooks <code@pressbooks.com>
 * @license GPLv3 (or any later version)
 * @see     l10n/namespace.php
 */

$overrides = [
	'My Sites' => 'הספרים שלי',
	'Create a New Site' => 'צור ספר חדש',
];

if ( \Pressbooks\Book::isBook() ) {
	$overrides['Visit site'] = 'צפה בספר';
	$overrides['Visit Site'] = 'צפה בספר';
	$overrides['Edit Site'] = 'ערוך את הספר';
	$overrides['You have used your space quota. Please delete files before uploading.'] = 'עימך הסליחה, הגעת למכסת מקום האחסון בספר שלך, מעוניין במקום נוסף ? שדרג את ספרך !';
	$overrides['Delete Site'] = 'מחק ספר';
	$overrides['Delete My Site'] = 'מחק את הספר שלי';
	$overrides['Delete My Site Permanently'] = 'מחק את הספר שלי לחלוטין!';
	$overrides["I'm sure I want to permanently disable my site, and I am aware I can never get it back or use %s again."] = "אני מודע, לחולטין, שמחיקת הספר שלי, היא מוחלטת ולא יהיה ניתן לשחזר / לערוך או להשתמש בספר זה ה %s  בשנית, שכן הוא נחמק לגמרי מהאתר ";
	$overrides['If you do not want to use your %s site any more, you can delete it using the form below. When you click <strong>Delete My Site Permanently</strong> you will be sent an email with a link in it. Click on this link to delete your site.'] = 'אם אינך, אכן מעוניין להשתמש בספר %s שלך יותר, תוכל למחוק אותו באמצעות הטופס למטה. כשתלחץ על <strong> מחק את הספר שלי לצמיתות </ strong> יישלח אליך דוא"ל עם קישור. לחץ על קישור זה כדי למחוק את הספר שלך.';
	$overrides['Remember, once deleted your site cannot be restored.'] = 'זכור ! לאחר שמחקת את ספרך, לא ניתן לשחזרו.';
	$overrides['Thank you. Please check your email for a link to confirm your action. Your site will not be deleted until this link is clicked.'] = 'תודה. בדוק בדוא"ל שלך אם יש קישור לאישור פעולת המחיקה. ספרך לא יימחק עד לחיצה על קישור זה.';
	$overrides['Thank you for using %s, your site has been deleted. Happy trails to you until we meet again.' ] = 'תודה לך על שימושך ב- %s, ספרך נמחק.';
}

return $overrides;
