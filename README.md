![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/wheels-dev/wheels/snapshot.yml?style=flat-square&logo=github&label=Wheels%20Snapshots)
<img src="https://www.forgebox.io/api/v1/entry/cfwheels/badges/version" />
<img src="https://www.forgebox.io/api/v1/entry/cfwheels/badges/downloads" />
![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fwww.forgebox.io%2Fapi%2Fv1%2Fentry%2Fcfwheels%2Fbadges%2F&query=%24.data.versions.0.version&style=flat-square&label=Bleeding%20Edge%20Release)

# Wheels

[Wheels][1] provides fast application development, a great organization system for your code, and is
just plain fun to use.

One of our biggest goals is for you to be able to get up and running with Wheels quickly. We want for
you to be able to learn it as rapidly as it is to write applications with it.

## Getting Started

In this [Beginner Tutorial: Hello World][2], we'll be writing a simple application to make sure we have
Wheels installed properly and that everything is working as it should. Along the way, you'll get to
know some basics about how applications built on top of Wheels work.

## Environment Variables

This application uses environment variables for sensitive configuration such as SMTP credentials. 

An example file, `.env.example`, is provided in the project root. **Copy this file to `.env` and fill in your actual values.**

```
SMTP_SERVER=smtp.example.com
SMTP_PORT=587
```

The `.env` file is included in `.gitignore` and should not be committed to version control.

## Contributing

We encourage you to contribute to Wheels! Please check out the [Coding Guidelines][3] for guidelines
about how to proceed. Join us!

## Running Tests

**Before running tests, make sure that all debugging is turned OFF**. This could add a considerable amount
of time for the tests to complete and may cause your engine to become unresponsive.

 1. Create a database on a supported database server named `wheelstestdb`. At this time the supported
    database servers are H2, Microsoft SQL Server, PostgreSQL and MySQL.
 2. Create a datasource in your CFML engine's administrator named `wheelstestdb` pointing to the
    `wheelstestdb` database and make sure to give it CLOB and BLOB support.
 3. Open your browser to the Wheels Welcome Page.
 4. In the gray debug area at the bottom of the page, click the `Run Tests` link next to the version number
    on the `Framework` line.

Please report any errors that you may encounter on our [issue tracker][4]. Please be sure to report the
database engine (including version), CFML engine (including version), and HTTP server (including
version).

## License

[Wheels][1] is released under the Apache License Version 2.0.

## Our Contributors

<a href="https://github.com/cfwheels/cfwheels/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cfwheels/cfwheels" />
</a>

Made with [contrib.rocks](https://contrib.rocks).

# Wheels Example App

## Application Overview

This repository contains a **user management and authentication web application** built with the [Wheels](https://wheels.dev/) framework (version 3.x), a modern MVC framework inspired by Ruby on Rails. The app demonstrates best practices for Wheels 3.0, including security, conventions, and a modern UI using Bootstrap.

---

## Key Features

- **User Registration & Verification:**  
  Users can register, receive a verification email, and verify their account before logging in.

- **Authentication:**  
  Secure login and logout, with support for password resets and brute-force protection (noted as a TODO).

- **Account Management:**  
  Authenticated users can view and update their account details, including changing their password.

- **Admin Panel:**  
  Admin users can:
  - Manage users (create, edit, disable, delete, recover, reset passwords, and even assume another user's identity for troubleshooting).
  - Manage roles and permissions (RBAC: Role-Based Access Control).
  - Assign and remove permissions for users and roles.
  - View and filter audit logs for security and activity tracking.
  - Manage application settings.

- **Security:**  
  - CSRF protection on all forms.
  - Input validation and sanitization.
  - Role and permission checks for all admin actions.
  - Audit logging for sensitive actions.

- **Email Notifications:**  
  - Account verification and password reset emails.
  - Admin password reset notifications.

- **Modern UI:**  
  - Uses Bootstrap for a clean, responsive design.
  - All forms and navigation use Wheels helpers for consistency and security.

---

## Intended Audience

- **Developers** looking for a reference or starter app for Wheels 3.x.
- **Teams** wanting to learn or demonstrate best practices in Wheels MVC development.

---

## Summary

**This application is not a complete, full-featured app, but rather a skeleton/example app built with Wheels 3.x. It is designed to help you get started and to showcase best practices in authentication, authorization, auditing, and modern web UI using Wheels.**

[1]: https://wheels.dev/
[2]: https://guides.cfwheels.org/introduction/readme/beginner-tutorial-hello-world
[3]: https://guides.cfwheels.org/working-with-cfwheels/contributing-to-cfwheels
[4]: https://github.com/wheels-dev/wheels/issues
