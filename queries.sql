/*Queries that provide answers to the questions from all projects.*/

SELECT *  FROM animals WHERE name LIKE '%mon%';
SELECT *  FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT *  FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*Project 2*/

BEGIN;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT * FROM animals ;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals ;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals ;
ROLLBACK;

SELECT * FROM animals ;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SAVEPOINT1;
UPDATE animals SET weight_kg = weight_kg * '-1' ;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * '-1' WHERE id IN (5,6,7,8);
COMMIT;


