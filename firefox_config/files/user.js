// user.js initialized by ansible
//
// Enable auto-scrolling
user_pref("general.autoScroll", true);
// Enable smooth scrolling
user_pref("general.smoothScroll", true);

// Enable backspace key to navigate back one page
user_pref("browser.backspace_action", 0);

// Disable sponsored shortcuts
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Delete cookies and site data when Firefox is closed
user_pref("privacy.history.custom", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);
user_pref("privacy.purge_trackers.date_in_cookie_database", "0");
user_pref("privacy.sanitize.pending", "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"cookies\",\"history\",\"formdata\",\"downloads\",\"sessions\",\"siteSettings\"],\"options\":{}}]");
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// Disable "Ask to save logins and passwords for websites"
user_pref("signon.rememberSignons", false);

// Disable other history settings
user_pref("places.history.enabled", false);
user_pref("places.history.autoRefresh", false);
user_pref("places.history.expiration.transient_current_max_pages", 0);
user_pref("places.history.expiration.max_pages", 0);
user_pref("browser.history_expire_days", 0);
user_pref("browser.history_expire_days.mirror", 0);
user_pref("browser.history_expire_sites", 0);
user_pref("browser.history_expire_visits", 0);
