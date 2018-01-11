## Assumptions / alterations

* Single user application.
* Client extends person.
* A person may be associated with more than one client.
  * logic check: if two clients are associated with the same contact, that person is associated with two clients.
* Database doesn't save data directly to file system, everything is in memory.
* Don't worry about server errors.
    * i.e landing on a person id that is not created returns EmptyResultDataAccessException
* Don't worry about security because this is not real life (this is just fantasy).

## Would be nice if time permits:

* Database to save the data to file system so data persists between server sessions.
* Don't show user any errors. Instead, have a catch-all page for server error messages.

# Aquent developer candidate project

You can find the code to use as the basis for this project at https://github.com/aquent/crud-app. Please fork the repo on GitHub and submit a link to your fork.

This is a Maven project. It is a simple CRUD web application known to work with Java 8 and Tomcat 7. It uses Spring MVC with JSP views and Spring JDBC with an embedded database. The established features allow the user to manage a list of people with contact information.

Please implement the stories below to the best of your ability. Feel free to add features or technical improvements you feel are important or valuable as you see fit and have time.

## Story #1

Add ability to manage clients (companies):

* The user should be able to create, edit, delete and list Clients.
* Clients should have a company name, website URI, phone number, and physical/mailing address.
* Clients can have zero, one, or multiple associated contacts.
* When editing a person, the user should be able to choose the associated client.
* When viewing a person, the associated client should be shown.
* When viewing a client, the associated contacts should be shown.
* When editing a client, the user should be able to add or remove associated contacts.

## Story #2

Add client­side styling and validation:

* Using jQuery and your preferred javascript validation technique, prevent the submission on invalid data on the edit forms and inform the user of errors. The validations implemented on the front­end should be equivalent to the existing server side validation.
* Add standard styling to the pages using a modern CSS3/HTML5 framework like Twitter Bootstrap or Foundation (or similar).
