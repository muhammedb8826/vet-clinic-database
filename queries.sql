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
ROLLBACK TO SAVEPOINTP1;
UPDATE animals SET weight_kg = weight_kg * '-1' WHERE id IN (5,6,7,8);
COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
 SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;
 SELECT AVG(escape_attempts) FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000;

/*Project 3*/

-- What animals belong to Melody Pond?
SELECT animals.name, animals.owner_id, owners.id, owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name, animals.species_id, species.id, species.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name, animals.owner_id, owners.id, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT COUNT(A.species_id), S.id FROM animals A INNER JOIN species S ON A.species_id = S.id GROUP BY S.id;

-- List all Digimon owned by Jennifer Orwell.
SELECT A.id, A.name FROM animals A INNER JOIN owners O ON A.owner_id = O.id INNER JOIN species S ON A.species_id = S.id WHERE O.id = 1 AND S.id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT A.name as pokemon, full_name as owner, escape_attempts FROM animals A JOIN owners O ON A.owner_id = O.id WHERE A.escape_attempts = 0 AND O.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT COUNT(A.owner_id), O.full_name FROM animals A INNER JOIN owners O ON A.owner_id = O.id GROUP BY O.id;