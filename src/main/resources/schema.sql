CREATE TABLE person (
    person_id integer IDENTITY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email_address varchar(50) NOT NULL,
    street_address varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    state varchar(2) NOT NULL,
    zip_code varchar(5) NOT NULL,
    is_client bit NOT NULL
);

CREATE TABLE person_contact_lookup (
    pcl_id integer IDENTITY,
    person_id integer NOT NULL,
    contact_id integer NOT NULL,
    FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE CASCADE,
    FOREIGN KEY (contact_id) REFERENCES person (person_id) ON DELETE CASCADE
);