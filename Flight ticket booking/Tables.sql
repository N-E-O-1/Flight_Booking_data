-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Flight_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Flight_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Flight_booking` DEFAULT CHARACTER SET utf8 ;
USE `Flight_booking` ;

-- -----------------------------------------------------
-- Table `Flight_booking`.`traveller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`traveller` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`Airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`Airline` (
  `Airline_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`flights` (
  `flight_id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(50) NOT NULL,
  `departure_time` DATETIME NOT NULL,
  `arrival_time` DATETIME NOT NULL,
  `duration_in_minute` SMALLINT NOT NULL,
  `distance_in_miles` INT NOT NULL,
  `Airline_Airline_id` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `fk_flights_Airline1_idx` (`Airline_Airline_id` ASC) VISIBLE,
  CONSTRAINT `fk_flights_Airline1`
    FOREIGN KEY (`Airline_Airline_id`)
    REFERENCES `Flight_booking`.`Airline` (`Airline_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`flight_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`flight_class` (
  `flight_class_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`flight_class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`tickets` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `ticket_number` VARCHAR(50) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `confirmation_number` VARCHAR(45) NOT NULL,
  `traveller_customer_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  `flight_class_flight_class_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_tickets_traveller_idx` (`traveller_customer_id` ASC) VISIBLE,
  INDEX `fk_tickets_flights1_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_tickets_flight_class1_idx` (`flight_class_flight_class_id` ASC) VISIBLE,
  CONSTRAINT `fk_tickets_traveller`
    FOREIGN KEY (`traveller_customer_id`)
    REFERENCES `Flight_booking`.`traveller` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_flights1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `Flight_booking`.`flights` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_flight_class1`
    FOREIGN KEY (`flight_class_flight_class_id`)
    REFERENCES `Flight_booking`.`flight_class` (`flight_class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`Airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`Airport` (
  `Airport_id` INT NOT NULL AUTO_INCREMENT,
  `IATA Code` VARCHAR(50) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Airport_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Flight_booking`.`Airport_has_flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Flight_booking`.`Airport_has_flights` (
  `Airport_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  PRIMARY KEY (`Airport_id`, `flight_id`),
  INDEX `fk_Airport_has_flights_flights1_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_Airport_has_flights_Airport1_idx` (`Airport_id` ASC) VISIBLE,
  CONSTRAINT `fk_Airport_has_flights_Airport1`
    FOREIGN KEY (`Airport_id`)
    REFERENCES `Flight_booking`.`Airport` (`Airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airport_has_flights_flights1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `Flight_booking`.`flights` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
