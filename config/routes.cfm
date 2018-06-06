<cfscript>

	// Use this file to add routes to your application and point the root route to a controller action.
	// Don't forget to issue a reload request (e.g. reload=true) after making changes.
	// See http://docs.cfwheels.org/docs/routing for more info.

	mapper()
	//=====================================================================
	//= 	Authentication Routes
	//=====================================================================
		.get(name="login", to="sessions##new")
  		.get(name="logout", to="sessions##delete")
		.post(name="authenticate", to="sessions##create")
		.get(name="forgetme", to="sessions##forget")
	//=====================================================================
	//= 	User Registration
	//=====================================================================
		 .get(name="register", pattern="register", to="register##new")
		 .post(name="register", pattern="register", to="register##create")
		 .get(name="verify", pattern="verify/[token]", to="register##verify")
	//=====================================================================
	//= 	Password Resets via Email
	//=====================================================================
		.scope(controller="passwordresets", path="password")
			.get(name="Passwordreset", pattern="forgot", action="new")
			.post(name="Passwordreset", pattern="forgot", action="create")
			.get(name="editPasswordreset", pattern="recover/[token]", action="edit")
			.put(name="updatePasswordreset", pattern="reset/[token]", action="update")
		.end()
	//=====================================================================
	//= 	Account
	//=====================================================================
		// Note: resource (singular!) to avoid [key], as this is specific to the logged in user
		.resource(name="account", only="show,edit,update")
		// So User can change their own password outside of a password reset email or if has been flagged by admin
		.get(name="accountPassword", pattern="/account/password", to="accounts##resetPassword")
		.put(name="accountPassword", pattern="/account/password", to="accounts##updatePassword")
	//=====================================================================
	//= 	Administration
	//=====================================================================
		// We're using scope instead of package etc as we want the controller to be in the admin folder,
		// and also want admin in the URL, however, we don't want to include admin in the route name
		.scope(path="admin", package="admin")
			.resources(name="users", nested=true)
				// userpermissions are nested in the user controller as they always act on a user
				.resources(name="permissions", controller="userpermissions", only="index,create,delete")
				// member() acts on an existing user
				.member()
					// These should never be GET, otherwise you have a possible CSRF attack
					.post("assume")
					.put("reset")
					.put("recover")
					.delete("destroy")
				.end()
			.end()
			.resources(name="settings", only="edit,update,index")
			.resources(name="permissions", only="edit,update,index")
			.resources(name="roles", except="show")
			.resources(name="logs", controller="auditlogs", only="index,show")
		.end()
		// The root route below is the one that will be called on your application's home page (e.g. http://127.0.0.1/).
		// You can, for example, change "wheels##wheels" to "home##index" to call the "index" action on the "home" controller instead.
		.root(to="main##index", method="get")
	.end();

</cfscript>
