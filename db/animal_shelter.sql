DROP TABLE animals;
DROP TABLE customers;

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  address VARCHAR(255),
  phone_number VARCHAR(255)
);


CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE,
  adoptable BOOLEAN,
  image VARCHAR(255),
  owner_id INT8 references customers(id) ON DELETE CASCADE
);
