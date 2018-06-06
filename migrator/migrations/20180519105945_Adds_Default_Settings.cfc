/*
  |-------------------------------------------------------------------------------------------|
	| Parameter     | Required | Type    | Default | Description                                |
  |-------------------------------------------------------------------------------------------|
	| table         | Yes      | string  |         | Name of table to add record to             |
	| columnNames   | Yes      | string  |         | Use column name as argument name and value |
  |-------------------------------------------------------------------------------------------|

    EXAMPLE:
      addRecord(table='members',id=1,username='admin',password='#Hash("admin")#');
*/
component extends="wheels.migrator.Migration" hint="Adds Default Settings" {

	function up() {
		transaction {
			try {
				  // Auth
          addRecord(table='settings', name="authentication_gateway", description="Authentication Gateway: set to local for standard local user accounts",  type="select", options="local,LDAP,External", value="local");
          addRecord(table='settings', name="authentication_allowRegistration", description="Allow User Registration",
            type="boolean", value="true");
          addRecord(table='settings', name="authentication_allowPasswordResets", description="Allow Password Resets",
            type="boolean", value="true");
          addRecord(table='settings', name="authentication_defaultRole", description="Default Role for new accounts",
            type="select", options="[[getRoleDropdownList()]]", value="3");

          addRecord(table='settings', name="permissions_cascade", description="Cascade Permissions",
            type="boolean", value="true");


          // Email
          addRecord(table='settings', name="email_send", description="Allow this Application to send email",
            type="boolean", value="true");
          addRecord(table="settings", name="email_fromAddress", description="General 'From' Email address - used in password resets etc", type="textfield", value="admin@domain.com");

          // i8n
          addRecord(table='settings', name="i8n_defaultLanguage", description="Default Language for the main interface",
            type="select", options="[[request.lang.availablelanguages]]", value="en_GB");
          addRecord(table='settings', name="i8n_defaultLocale", description="Default Locale for the main interface: changes date/time/currency formatting etc",
            type="select", options="[[getLocaleListDropDown()]]", value="English (United Kingdom)");
          addRecord(table='settings', name="i8n_defaultTimeZone", description="Default Timezone for all buildings,users,rooms",
            type="select", options="[[getTZListDropDown()]]", value="Europe/London");

          // Misc
          addRecord(table='settings', name="general_sitename", description="General Site Name",
            type="textfield", value="Example App");
	       addRecord(table='settings', name="general_copyright", description="Footer Notice",
            type="textfield", value="Copyright Example CFWheels App");


			} catch (any e) {
				local.exception = e;
			}

			if (StructKeyExists(local, "exception")) {
				transaction action="rollback";
				throw(errorCode="1", detail=local.exception.detail, message=local.exception.message, type="any");
			} else {
				transaction action="commit";
			}
		}
	}

	function down() {
		transaction {
			try {
				removeRecord(table='settings', where="id IS NOT NULL");
			} catch (any e) {
				local.exception = e;
			}

			if (StructKeyExists(local, "exception")) {
				transaction action="rollback";
				throw(errorCode="1", detail=local.exception.detail, message=local.exception.message, type="any");
			} else {
				transaction action="commit";
			}
		}
	}

}
