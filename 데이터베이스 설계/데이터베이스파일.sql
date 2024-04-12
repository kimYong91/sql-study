-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MODEL_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MODEL_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MODEL_db` DEFAULT CHARACTER SET utf8 ;
USE `MODEL_db` ;

-- -----------------------------------------------------
-- Table `MODEL_db`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODEL_db`.`publisher` (
  `publisher_id` INT NOT NULL,
  `staff_name` VARCHAR(45) NULL,
  `phon_number` VARCHAR(45) NULL,
  `publisher_name` VARCHAR(45) NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MODEL_db`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODEL_db`.`book` (
  `book_id` INT NOT NULL,
  `book_name` VARCHAR(45) NULL,
  `price` INT NULL,
  `publisher_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_book_publisher_idx` (`publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_publisher`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `MODEL_db`.`publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MODEL_db`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODEL_db`.`Customer` (
  `Customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `Phonenumber` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MODEL_db`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODEL_db`.`Order` (
  `idOrder` INT NOT NULL,
  `Order_date` DATE NULL,
  `Order_price` INT NULL,
  `Customer_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Customer1_idx` (`Customer_id` ASC) VISIBLE,
  INDEX `fk_Order_book1_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `MODEL_db`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `MODEL_db`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
