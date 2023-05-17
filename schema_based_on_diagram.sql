CREATE DATABASE vet_clinic;

CREATE TABLE patients(
 id              INT GENERATED ALWAYS AS IDENTITY,
 name            VARCHAR(100),
 date_of_birth   DATE,
 PRIMARY KEY (id)
 );

 CREATE TABLE medical_histories(
 id              INT GENERATED ALWAYS AS IDENTITY,
 admitted_at     TIMESTAMP,
 patient_id      INT,
 status          VARCHAR(100)
 PRIMARY KEY (id)
 );

 CREATE TABLE invoices(
 id              INT GENERATED ALWAYS AS IDENTITY,
 total_amount    DECIMAL(10,2),
 generated_at    TIMESTAMP,
 payed_at        TIMESTAMP,
 medical_history_id INT, 
 PRIMARY KEY (id)
 );

 CREATE TABLE invoice_items(
 id              INT GENERATED ALWAYS AS IDENTITY,
 unit_price    DECIMAL(10,2),
 quantity      INT,
 total_price   DECIMAL(10,2),
 invoice_id    INT, 
 treatment_id  INT,
 PRIMARY KEY (id)
 );

CREATE TABLE treatments(
 id              INT GENERATED ALWAYS AS IDENTITY,
 type            VARCHAR(50),
 name            VARCHAR(50),
 PRIMARY KEY (id)
 );
