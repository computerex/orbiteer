CREATE DATABASE `orbiteer`;

CREATE TABLE `orbiteer`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(75) NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `orbiteer`.`spacecraft_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

CREATE TABLE `orbiteer`.`spacecrafts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `type` INT NOT NULL,
  `fuel_mass` DOUBLE NOT NULL DEFAULT 0,
  `tanks` VARCHAR(512) NULL DEFAULT '0',
  `owner_id` INT NOT NULL,
  `renter_id` INT NULL DEFAULT NULL,
  `rented_date` TIMESTAMP NULL DEFAULT '1970-01-01 00:00:01',
  `rent_duration_hours` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));


CREATE TABLE `orbiteer`.`bases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `body` VARCHAR(45) NOT NULL,
  `lon` DOUBLE NOT NULL,
  `lat` DOUBLE NOT NULL,
  `owner_id` INT NOT NULL,
  `fuel_amount` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));


CREATE TABLE `orbiteer`.`hangars` (
  `id` INT NOT NULL,
  `base_id` INT NOT NULL,
  `occupant_spacecraft` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


INSERT INTO `orbiteer`.`users` (`username`, `name`, `balance`) VALUES ('computerex', 'Mohd Ali', 0.00);