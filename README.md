# CFWheels Example App

This sample application is *not* a complete Content Management System, and is more of a starting point for your own
applications; it aims to demonstrate some of the framework's features such as Database migrations, routing etc.

## Features

### User Management

 - Create, update & disable users
 - Assume user accounts
 - Disabled (soft deleted) users can then be deleted
 - Searchable/Filterable User Index
 - TODO: Filter audit logs by user activity/ip
 - TODO: Optional User Registration

### Roles & Permissions

 - 3 Default roles: Admin, Editor, User
 - New roles can be added via web interface
 - Each role can have default permissions set
 - Automatic cascading Controller Based Permissions based on controller/action path
 - TODO: Each user can then have additional permissions (overrides)
 - TODO: Permissions can be altered via web interface
 - TODO: Named Permissions

### Authentication

 - Tableless models used for Authentication
 - Easily add your own custom Auth model
 - "Local" user accounts are the default
 - TODO: LDAP example provided
 - This app uses session based authentication, session rotation and session invalidation
 - Sets Set Cache-Control: must-re-validate for authenticated pages
 - Sets HTTPOnly attribute on Cookies
 - TODO: Brute force attack mitigation
 - TODO: "Remember Me" Cookie function
 - TODO: OAuth/Twitter/Facebook, if time allows

### Passwords

 - Passwords hashed via bCrypt (AuthenticateThis plugin)
 - TODO: Password reset feature
 - TODO: Require password change on login

### Settings

 - Database based configuration and settings

### Other

 - Uses Database Migrations
 - TODO: Tests also included
 - Has some rudimentary logging for auditing activity
 - TODO: Add safe extended data
 - TODO: Add severity level
 - TODO: Add an installer
 - TODO: Wiki Documentation

### API

 - TODO: JSON based API using Basic Auth/API Key
 - TODO: JWT Authentication
 - Will still technically use sessions as we can't mix and match in a single app, but would be an example of API Authentication

## Installation

 - Download/Clone Repo
 - Setup a local mySQL database called `exampleapp`
 - In commandbox, ensure you've got the latest version of the cfwheels CLI
 - `$ install cfwheels-cli`
 - Start the server `$ start`
 - You will get an error, that's fine.
 - Add the datasource to `/lucee/admin/server.cfm`
 - Navigate to `http://127.0.0.1:60050/rewrite.cfm?controller=wheels&action=wheels&view=migrate`
 - Select the Migrations Tab
 - Click `Migrate to Latest`
 - Reload the application by visiting `http://127.0.0.1:60050/?reload=true&password=changeme`

