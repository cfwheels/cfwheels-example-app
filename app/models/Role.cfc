component extends="Model" {

	function config() {
		// Associations
		hasMany("rolepermissions");

		// Properties
		validatesPresenceOf("name");
		validatesUniquenessOf(properties="name", message="Role name must be unique");
	}

	function getRoles(){
		return findAll();
	}
	
	function getRolesOrderBy(){
		return findAll(order="name");
	}
	
	function getRoleById(required string key){
		return findByKey(key=arguments.key);
	}

}
