<cfscript>
	/*
		Place settings that should go in the Application.cfc's "this" scope here.

		Examples:
		this.name = "MyAppName";
		this.sessionTimeout = CreateTimeSpan(0,0,5,0);
	*/

	// Added via CFWheels CLI
	this.name = "exampleApp";

	// buffer the output of a tag/function body to output in case of a exception
	// Currently setting this to true as otherwise you can't do dump then abort in a controller for debugging in
	// Lucee 5.3 and ACF2018(?)
	// Also currently breaks exception handlers if this is false
	this.bufferOutput = true;

	// lifespan of a untouched application scope
	this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 );
	// session handling enabled or not
	this.sessionManagement = true;
	// cfml or jee based sessions
	this.sessionType = "cfml";
	// untouched session lifespan: set to 30 minutes by default here
	this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 );
	//this.sessionStorage = "oxfordlieder_sessions";
	this.sessionStorage = "memory";

	// client scope enabled or not
	this.clientManagement = false;
	this.clientTimeout = createTimeSpan( 90, 0, 0, 0 );
	this.clientStorage = "cookie";

	// using domain cookies or not
	this.setDomainCookies = false;
	this.setClientCookies = true;

	this.sessioncookie.httponly = true;
	this.sessioncookie.encodedvalue = true;
	// Set cookies to SSL Only
	// Set this to true if you're Using SSL!
	// Only set to false for easy local development
	this.sessioncookie.secure = false;

	// max lifespan of a running request
	this.requestTimeout=createTimeSpan(0,0,0,50);

	// charset
	this.charset.web="UTF-8";
	this.charset.resource="UTF-8";

	// This assumes you're using a local smtp server to deliver mail, such as papercut on wind0ze.
	// You'll either want to delete this block or add your own SMTP at /lucee/admin/server.cfm
	if(cgi.server_name CONTAINS "127.0.0.1" || cgi.server_name CONTAINS "localhost"){
		// Default Development STMP Server
		this.tag.mail.server="127.0.0.1";
		this.tag.mail.port=25;
	}


</cfscript>
