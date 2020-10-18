-- MySQL Script generated by MySQL Workbench
-- Sun Oct 18 21:05:18 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema willywangky
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema willywangky
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `willywangky` DEFAULT CHARACTER SET utf8 ;
USE `willywangky` ;

-- -----------------------------------------------------
-- Table `willywangky`.`chocolate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willywangky`.`chocolate` ;

CREATE TABLE IF NOT EXISTS `willywangky`.`chocolate` (
  `id` INT NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `price` INT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `image` VARCHAR(80) NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willywangky`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willywangky`.`user` ;

CREATE TABLE IF NOT EXISTS `willywangky`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `superuser` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willywangky`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willywangky`.`transaction` ;

CREATE TABLE IF NOT EXISTS `willywangky`.`transaction` (
  `id` INT NOT NULL,
  `chocolate_id` INT NOT NULL,
  `chocolate_name` VARCHAR(45) NULL,
  `amount` INT NULL,
  `total_price` INT NULL,
  `time` DATETIME NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `chocolate_transaction_idx` (`chocolate_id` ASC) VISIBLE,
  CONSTRAINT `chocolate_transaction`
    FOREIGN KEY (`chocolate_id`)
    REFERENCES `willywangky`.`chocolate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
