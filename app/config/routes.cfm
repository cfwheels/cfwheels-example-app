<cfscript>

	// Use this file to add routes to your application and point the root route to a controller action.
	// Don't forget to issue a reload request (e.g. reload=true) after making changes.
	// See https://guides.cfwheels.org/2.5.0/v/3.0.0-snapshot/handling-requests-with-controllers/routing for more info.

	mapper()
		// CLI-Appends-Here

		// The "wildcard" call below enables automatic mapping of "controller/action" type routes.
		// This way you don't need to explicitly add a route every time you create a new action in a controller.
		.wildcard()

		//=====================================================================
		//= 	Authentication Routes
		//=====================================================================
		.get(name="login", pattern="sessions/new", to="sessions##new")
		.get(name="logout", pattern="sessions/delete", to="sessions##delete")
		.post(name="authenticate", pattern="sessions/create",  to="sessions##create")
		.get(name="forgetme", pattern="sessions/forget", to="sessions##forget")
		//=====================================================================
		//= 	User Registration
		//=====================================================================
		.get(name="register-new", pattern="register/new", to="register##new")
		.post(name="register-create", pattern="register", to="register##create")
		.get(name="verify", pattern="verify/[token]", to="register##verify")
		//=====================================================================
		//= 	Password Resets via Email
		//=====================================================================
		.scope(controller="passwordresets", path="password")
			.get(name="Passwordreset-new", pattern="passwordresets/new", action="new")
			.post(name="Passwordreset-create", pattern="passwordresets/create", action="create")
			.get(name="editPasswordreset", pattern="recover/[token]", action="edit")
			.put(name="updatePasswordreset", pattern="reset/[token]", action="update")
		.end()
		//=====================================================================
		//= 	Account
		//=====================================================================
		.get(name="account-show", pattern="accounts/show", to="accounts##show")
		.get(name="account-edit", pattern="accounts/edit", to="accounts##edit")
		.post(name="account-update", pattern="accounts/update", to="accounts##update")
		

		// So User can change their own password outside of a password reset email or if has been flagged by admin
		.get(name="account-getPassword", pattern="accounts/resetPassword", to="accounts##resetPassword")
		.put(name="account-savePassword", pattern="accounts/updatePassword", to="accounts##updatePassword")
		//=====================================================================
		//= 	Administration
		//=====================================================================
		.namespace("")
			.get(name = "users", pattern = "admin/users/index", to = "admin.users##Index")
			.get(name = "newUser", pattern = "admin/users/new", to = "admin.users##new")
			.post(name = "user-create", pattern = "admin/users/create", to = "admin.users##create")
			.get(name = "user", pattern = "admin/users/show/[key]", to = "admin.users##show")
			.get(name = "user-edit", pattern = "admin/users/edit/[key]", to = "admin.users##edit")
			.patch(name = "user-update", pattern = "admin/users/update/[key]", to = "admin.users##update")
			.post(name = "user-assume", pattern = "admin/users/assume/[key]", to = "admin.users##assume")
			.put(name = "user-reset", pattern = "admin/users/reset/[key]", to = "admin.users##reset")
			.patch(name = "user-recover", pattern = "admin/users/recover/[key]", to = "admin.users##recover")
			.delete(name = "user-delete", pattern = "admin/users/delete/[key]", to = "admin.users##delete")
			.delete(name = "user-destroy", pattern = "admin/users/destroy/[key]", to = "admin.users##destroy")
			

			.get(name = "settings", pattern = "admin/settings/index", to = "admin.settings##Index")
			.get(name = "settings-edit", pattern = "admin/settings/edit/[key]", to = "admin.settings##edit")
			.get(name = "settings-update", pattern = "admin/settings/update/[key]", to = "admin.settings##update")

			.get(name = "permissions", pattern = "admin/permissions/index", to = "admin.permissions##Index")
			.get(name = "permissions-edit", pattern = "admin/permissions/edit/[key]", to = "admin.permissions##edit")
			.get(name = "permissions-update", pattern = "admin/permissions/update/[key]", to = "admin.permissions##update")
			
			.get(name = "roles", pattern = "admin/roles/index", to = "admin.roles##Index")
			.get(name = "newRole", pattern = "admin/roles/new", to = "admin.roles##new")
			.post(name = "roles-create", pattern = "admin/roles/create/[key]", to = "admin.roles##create")
			.get(name = "roles-edit", pattern = "admin/roles/edit/[key]", to = "admin.roles##edit")
			.patch(name = "roles-update", pattern = "admin/roles/update/[key]", to = "admin.roles##update")

			.get(name = "logs", pattern = "admin/auditlogs/index", to = "admin.auditlogs##Index")

			.get(name = "permission", pattern = "admin/userpermissions/index/[userkey]", to = "admin.userpermissions##index")
			.post(name = "permissions-create", pattern = "admin/userpermissions/create", to = "admin.userpermissions##create")
			.delete(name = "permissions-delete", pattern = "admin/userpermissions/delete", to = "admin.userpermissions##delete")
		.end()

		// The root route below is the one that will be called on your application's home page (e.g. http://127.0.0.1/).
		.root(to = "main##index", method = "get")
		.root(method = "get")
	.end();
</cfscript>
