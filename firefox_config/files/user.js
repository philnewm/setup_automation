// user.js initialized by ansible
//
// Enable auto-scrolling
user_pref("general.autoScroll", true);
// change to dark theme
user_pref("layout.css.prefers-color-scheme.content-override", 0);
// custom home screen
user_pref("browser.startup.homepage", "https://duckduckgo.com/");
// disable sponsored shortcuts
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
// use custom history
user_pref("privacy.history.custom", true);
// disable browsing and download history
user_pref("places.history.enabled", false);
// disable search and form history
user_pref("browser.formfill.enable", false);
// clear history when firefox closes
user_pref("privacy.sanitize.pending", "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"cookies\",\"history\",\"formdata\",\"downloads\",\"sessions\"],\"options\":{}}]");
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.sanitize.pending", "[]");
// disable asking to save logins and passwords
user_pref("signon.rememberSignons", false);
// delete cookies and site data when firefox is closed
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.sanitize.pending", "[{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}},{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"cookies\",\"offlineApps\",\"history\",\"formdata\",\"downloads\",\"sessions\"],\"options\":{}}]");
user_pref("privacy.sanitize.pending", "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"cookies\",\"history\",\"formdata\",\"downloads\",\"sessions\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]");
