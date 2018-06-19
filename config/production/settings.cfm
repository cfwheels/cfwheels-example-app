<cfscript>

	// Use this file to configure specific settings for the "production" environment.
	// A variable set in this file will override the one in "config/settings.cfm".

	// Example:
	// set(errorEmailAddress="someone@somewhere.com");

	// Automagically migrate the database if in production mode
	set(autoMigrateDatabase=true);
</cfscript>
