package com.aquent.crudapp.service;

import java.util.List;

import com.aquent.crudapp.domain.ContactLookup;
import com.aquent.crudapp.domain.Person;

/**
 * Person operations.
 */
public interface PersonService {

    /**
     * Creates a new contact record.
     *
     * @param contactLookup the person associated with the contact
     * @return the new association id
     */
    Integer createContact(ContactLookup contactLookup);

    /**
     * Retrieves all of a person's contacts.
     *
     * @param personId the person to retrieve all the contacts for
     * @return read a person's contacts
     */
    List<Person> readContacts(Integer personId);

    /**
     * Updates an existing person contact
     * @param contactLookup new values to save
     */
    void removeContact(ContactLookup contactLookup);

    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Person> listPeople();

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createPerson(Person person);

    /**
     * Retrieves a person record by ID.
     *
     * @param id the person ID
     * @return the person record
     */
    Person readPerson(Integer id);

    /**
     * Updates an existing person record.
     *
     * @param person the new values to save
     */
    void updatePerson(Person person);

    /**
     * Deletes a person record by ID.
     *
     * @param id the person ID
     */
    void deletePerson(Integer id);

    /**
     * Validates populated person data.
     *
     * @param person the values to validate
     * @return list of error messages
     */
    List<String> validatePerson(Person person);
}
