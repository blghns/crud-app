package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.ContactLookup;
import com.aquent.crudapp.domain.Person;
import java.util.List;

/**
 * Operations on the "person" table.
 */
public interface PersonDao {

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
}
