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
 status          VARCHAR(100),
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


ALTER TABLE medical_histories ADD CONSTRAINT 
fk_patient_id FOREIGN KEY (patient_id)
REFERENCES patients(id);
CREATE INDEX idx_patient_id ON medical_histories(patient_id)

ALTER TABLE invoices ADD CONSTRAINT 
fk_medical_history_id FOREIGN KEY (medical_history_id)
REFERENCES medical_histories(id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id)

ALTER TABLE invoice_items ADD CONSTRAINT 
fk_invoice_id FOREIGN KEY (invoice_id)
REFERENCES invoices(id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id)

ALTER TABLE invoice_items ADD CONSTRAINT 
fk_treatment_id FOREIGN KEY (treatment_id)
REFERENCES treatments(id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id)

CREATE TABLE IF NOT EXISTS medical_treatments (
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (medical_history_id,treatment_id)
)