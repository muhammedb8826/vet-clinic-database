/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals(
 id              INT GENERATED ALWAYS AS IDENTITY,
 name            VARCHAR(100),
 date_of_birth   DATE,
 escape_attempts INT,
 neutered        BOOLEAN,
 weight_kg       DECIMAL(5,2),
 PRIMARY KEY (id)
 );
 
/* Project 2 */

 ALTER TABLE animals ADD species varchar(255);

 /* Project 3 */

 DROP TABLE IF EXISTS owners;

 CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY (id)
 );

DROP TABLE IF EXISTS species;

 CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY (id)
 );

 ALTER TABLE animals DROP COLUMN species;

 ALTER TABLE animals ADD species_id INT;

 ALTER TABLE animals ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);

 ALTER TABLE animals ADD owner_id INT;

 ALTER TABLE animals ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

 /* project 4 */

 CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
 );

 CREATE TABLE specializations(
	species_id INT NOT NULL,
	vets_id INT NOT NULL,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	PRIMARY KEY (species_id, vets_id)
);
 