package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import com.aquent.crudapp.domain.ContactLookup;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.PersonDao;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link PersonDao}.
 */
public class PersonJdbcDao implements PersonDao {

    private static final String SQL_LIST_PEOPLE = "SELECT * FROM person ORDER BY first_name, last_name, person_id";
    private static final String SQL_READ_PERSON = "SELECT * FROM person WHERE person_id = :personId";
    private static final String SQL_DELETE_PERSON = "DELETE FROM person WHERE person_id = :personId";
    private static final String SQL_UPDATE_PERSON = "UPDATE person SET (first_name, last_name, email_address, street_address, city, state, zip_code, is_client)"
                                                  + " = (:firstName, :lastName, :emailAddress, :streetAddress, :city, :state, :zipCode, :isClient)"
                                                  + " WHERE person_id = :personId";
    private static final String SQL_CREATE_PERSON = "INSERT INTO person (first_name, last_name, email_address, street_address, city, state, zip_code, is_client)"
                                                  + " VALUES (:firstName, :lastName, :emailAddress, :streetAddress, :city, :state, :zipCode, :isClient)";

    private static final String SQL_CREATE_CONTACT = "INSERT INTO person_contact_lookup (person_id, contact_id)"
                                                   + "VALUES (:personId, :contactId)";

    private static final String SQL_READ_CONTACTS = "SELECT DISTINCT p.* FROM person p"
                                                  + " INNER JOIN person_contact_lookup pcl"
                                                  + " ON (p.person_id = pcl.person_id OR p.person_id = pcl.contact_id)"
                                                  + " WHERE (pcl.person_id = :personId OR pcl.contact_id = :personId)"
                                                  + " AND p.person_id != :personId";

    private static final String SQL_UPDATE_CONTACT = "UPDATE person_contact_lookup SET (person_id, contact_id)"
                                                        + " = (:personId, :contactId)"
                                                        + " WHERE lookup_id = :lookupId";
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createContact(ContactLookup contactLookup) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CONTACT, new BeanPropertySqlParameterSource(contactLookup), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> readContacts(Integer personId) {
        return namedParameterJdbcTemplate.query(SQL_READ_CONTACTS, Collections.singletonMap("personId", personId), new PersonRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateContact(ContactLookup contactLookup) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CONTACT, new BeanPropertySqlParameterSource(contactLookup));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeople() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_PEOPLE, new PersonRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Person readPerson(Integer personId) {
        return namedParameterJdbcTemplate.queryForObject(SQL_READ_PERSON, Collections.singletonMap("personId", personId), new PersonRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deletePerson(Integer personId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_PERSON, Collections.singletonMap("personId", personId));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updatePerson(Person person) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_PERSON, new BeanPropertySqlParameterSource(person));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createPerson(Person person) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_PERSON, new BeanPropertySqlParameterSource(person), keyHolder);
        return keyHolder.getKey().intValue();
    }

    /**
     * Row mapper for person records.
     */
    private static final class PersonRowMapper implements RowMapper<Person> {

        @Override
        public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
            Person person = new Person();
            person.setPersonId(rs.getInt("person_id"));
            person.setFirstName(rs.getString("first_name"));
            person.setLastName(rs.getString("last_name"));
            person.setEmailAddress(rs.getString("email_address"));
            person.setStreetAddress(rs.getString("street_address"));
            person.setCity(rs.getString("city"));
            person.setState(rs.getString("state"));
            person.setZipCode(rs.getString("zip_code"));
            person.setIsClient(rs.getBoolean("is_client"));
            return person;
        }
    }
}
