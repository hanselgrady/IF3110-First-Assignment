-- MySQL Script generated by MySQL Workbench
-- Sat Oct 24 18:51:15 2020
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `price` INT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `image` VARCHAR(80) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `willywangky`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `willywangky`.`user` ;

CREATE TABLE IF NOT EXISTS `willywangky`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `chocolate_id` INT NOT NULL,
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

-- -----------------------------------------------------
-- Data for table `willywangky`.`chocolate`
-- -----------------------------------------------------
START TRANSACTION;
USE `willywangky`;
INSERT INTO `willywangky`.`chocolate` (`id`, `name`, `price`, `description`, `image`, `amount`) VALUES (1, 'choco', 10000, 'pure choco', NULL, 10);
INSERT INTO `willywangky`.`chocolate` (`id`, `name`, `price`, `description`, `image`, `amount`) VALUES (2, 'white choco', 15000, 'pure white choco', NULL, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `willywangky`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `willywangky`;
INSERT INTO `willywangky`.`user` (`id`, `email`, `password`, `description`, `superuser`) VALUES (1, 'willywangky@willywangky.com', 'willywangky', 'first super user', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `willywangky`.`transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `willywangky`;
INSERT INTO `willywangky`.`transaction` (`id`, `chocolate_id`, `amount`, `total_price`, `time`, `address`) VALUES (1, 1, 5, 50000, '2020-10-21 06:00:10', 'Bandung');

COMMIT;

