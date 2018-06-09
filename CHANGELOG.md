# Changelog

## 0.0.2 (TBA)

Second Alpha Release

### Bug Fixes

- Email Validation on User Model now doesn't have duplicate errors

### Enhancements

- Audit logs can now be filtered by date range via Date Range Picker JS

## 0.0.1 - 06 Jun 2018

Initial Alpha Release
Note: this is only tested on lucee 5 at the moment.

### User Management

- Create, update & disable users
- Assume user accounts
- Disabled (soft deleted) users can then be deleted
- Searchable/Filterable User Index
- Optional User Registration
- Email confirmation on registration

### Accounts

- Users can update their own passwords / details
- Has basic Gravatar support

### Roles & Permissions

- 3 Default roles: Admin, Editor, User
- New roles can be added via web interface
- Each role can have default permissions set
- Automatic cascading Controller Based Permissions based on controller/action path
- User Permission Overrides
- Permissions can be altered via web interface
- Named Permissions in addition to controller permissions

### Authentication

- Tableless models used for Authentication
- "Local" user accounts are the default
- This app uses session based authentication, session rotation and session invalidation
- Sets Set Cache-Control: must-re-validate for authenticated pages
- Sets HTTPOnly attribute on Cookies
- Simple "Remember Me" Cookie function
- Forces users to reset password if password reset by admin

### Passwords

- Passwords hashed via bCrypt (AuthenticateThis plugin)
- Password reset feature / emails
- Password reset can be turned off
- Require password change on login

### Settings

- Database based configuration and settings

### Logging

- Rudimentary logging for auditing activity
- Automatic logging of changed properties on models when specified in controller
- Facility to skip sensitive fields from automatic changed property logging
- Ability to store extended log data as serialized JSON
- Log files have type, severity, message, as well as IP and authenticated user

### Other

- Uses Database Migrations
