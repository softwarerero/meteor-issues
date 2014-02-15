# Issues

Manage issues within an application. Some routes based on iron-router already come with the package. There is basic translation support and the only available language is Spanish so far (yeah, no English).

### The current feature set

* Create Versions (for you program)
* Create Issues
* Release Notes
* Demo app (https://github.com/softwarerero/meteor-issues-demo)

In theory all is needed is integrate the routes `issues`, `versions` and `releaseNotes` into you application.
This is not tested well, so let me know if you find problems.

### Coming features

* Validations
* Integrate with meteor-roles
* Tests

### Known Bugs

* User selects are not updated correctly
* Users in the template handler 'userName' are sometimes found and sometimes not.
* Deleting versions and issues leads to an error "operation: pre-submit validation, error: Error: failed validation".