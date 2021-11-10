CREATE DATABASE user_database;
CREATE TABLE users_table(id SERIAL PRIMARY KEY, email  VARCHAR(60), password VARCHAR(60), name VARCHAR(60));

CREATE DATABASE user_database_test;
CREATE TABLE users_table_test(id SERIAL PRIMARY KEY, email  VARCHAR(60), password VARCHAR(60), name VARCHAR(60));