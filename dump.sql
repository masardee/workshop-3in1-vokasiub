-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ws_foodreview
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ws_foodreview
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ws_foodreview` DEFAULT CHARACTER SET utf8 ;
USE `ws_foodreview` ;

-- -----------------------------------------------------
-- Table `ws_foodreview`.`restos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ws_foodreview`.`restos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `website` VARCHAR(255) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ws_foodreview`.`foods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ws_foodreview`.`foods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `pic` VARCHAR(255) NULL,
  `price` DOUBLE NULL,
  `restos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_foods_restos_idx` (`restos_id` ASC) VISIBLE,
  CONSTRAINT `fk_foods_restos`
    FOREIGN KEY (`restos_id`)
    REFERENCES `ws_foodreview`.`restos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ws_foodreview`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ws_foodreview`.`reviews` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `comment` TEXT NULL,
  `rating` INT NULL,
  `foods_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reviews_foods1_idx` (`foods_id` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_foods1`
    FOREIGN KEY (`foods_id`)
    REFERENCES `ws_foodreview`.`foods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
