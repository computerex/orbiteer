CREATE DATABASE `orbiteer`;

CREATE TABLE `orbiteer`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(75) NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `location` INT NULL DEFAULT NULL,
  `home` INT NULL DEFAULT NULL,
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
  `rented_date` TIMESTAMP NULL,
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
  `food_amount` DOUBLE NOT NULL DEFAULT 0,
  `oxygen_amount` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));


CREATE TABLE `orbiteer`.`hangars` (
  `id` INT NOT NULL,
  `base_id` INT NOT NULL,
  `occupant_spacecraft` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `orbiteer`.`assignments` (
`id` INT NOT NULL AUTO_INCREMENT,
`type` ENUM('cargo', 'tourism', 'transportation') NOT NULL,
`departure` INT NOT NULL,
`arrival` INT NOT NULL,
`max_time_to_complete_hours` INT NOT NULL DEFAULT 6,
`status` ENUM('pending', 'active', 'done') NOT NULL DEFAULT 'pending',
`start_time` TIMESTAMP NULL,
PRIMARY KEY (`id`));

CREATE TABLE `orbiteer`.`user_assignments` (
  `assignment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `outcome` ENUM('success', 'fail', 'pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`assignment_id`, `user_id`));



INSERT INTO `orbiteer`.`users` (`username`, `name`, `balance`) VALUES ('computerex', 'Orbiteer Corp', 0.00);