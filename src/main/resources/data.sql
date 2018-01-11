INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code,
    is_client
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    true
), (
    'Jane',
    'Smith',
    'fake2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    false
);

INSERT INTO person_contact_lookup (
    person_id,
    contact_id
) VALUES (
    0,
    1
)