component extends="app.controllers.Controller" {

	function config() {
		super.config(restrictAccess=true);
		verifies(except="index", params="key", paramsTypes="integer", handler="objectNotFound");
		filters(through="filterGetAllRoles");
	}

	/**
	* View all permissions
	**/
	function index() {
		allroles=model("role").getRolesOrderBy();
		allpermissions=model("permission").getPermissions();
	}

	/**
	* Edit permission
	**/
	function edit() {
		permission=model("permission").getRolePermissionByKey(params.key);
	}

	/**
	* Update permission
	**/
	function update() {
		updated = model("Permission").updatePermissionByKey(params.key, params.permission);
		if(updated){
			redirectTo(action="index", success="Permission successfully updated: you must reload the application for these to take effect.");
		} else {
			renderView(action="edit");
		}
	}

	/**
	* Redirect away if verifies fails, or if an object can't be found
	**/
	private function objectNotFound() {
		redirectTo(action="index", error="That permission wasn't found");
	}

}
