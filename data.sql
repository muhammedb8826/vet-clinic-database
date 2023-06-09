/* Populate database with sample data. */

INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_att
empts) VALUES ('Agumon','Feb-3-2020',10.23,TRUE,0);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Gabumon','Nov-15-2018',8,TRUE,2);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Pikachu','Jan-7-2021',15.04,FALSE,1);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Devimon','May-12-2017',11,TRUE,5);
/* Project 2 */
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Charmander','Feb-8-2020',11,FALSE,0);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Plantmon','Nov-15-2021',5.7,TRUE,2);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Squirtle','Apr-2-1993',12.13,FALSE,3);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Angemon','Jun-12-2005',45,TRUE,1);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Boarmon','Jun-7-2005',20.4,TRUE,7);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Blossom','Oct-13-1998',17,TRUE,3);
INSERT INTO animals(name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Ditto','May-14-2022',22,TRUE,4);

/* Project 3 */

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name,age) VALUES ('Bob', 45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle', 'Blossom');
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');

/* Project 4 */

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr-23-2000');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan-17-2019');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May-04-1981');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun-08-2008');

INSERT INTO specializations (species_id, vets_id) VALUES (1, 2);
INSERT INTO specializations (species_id, vets_id) VALUES (1, 4);
INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);

BEGIN;

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, 'May-24-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 3, 'Jul-22-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (2, 4, 'Feb-02-2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'Jan-05-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'Mar-08-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, 'May-14-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 3, 'May-04-2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 4, 'Feb-24-2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, 'Dec-21-2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 1, 'Aug-10-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, 'Apr-07-2021');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 3, 'Sep-29-2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, 'Oct-03-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, 'Nov-04-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Jan-24-2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'May-15-2019');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Feb-27-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, 'Aug-03-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 3, 'May-24-2020');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 1, 'Jan-11-2021');

COMMIT;