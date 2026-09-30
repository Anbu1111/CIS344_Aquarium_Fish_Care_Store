-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AquariumFishCareStore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AquariumFishCareStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AquariumFishCareStore` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `AquariumFishCareStore` ;

-- -----------------------------------------------------
-- Table `AquariumFishCareStore`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AquariumFishCareStore`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(40) NOT NULL,
  `last_name` VARCHAR(40) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  `phone` VARCHAR(15) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AquariumFishCareStore`.`Fish`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AquariumFishCareStore`.`Fish` (
  `fish_id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NOT NULL,
  `water_type` VARCHAR(15) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `stocky_qty` INT NOT NULL,
  PRIMARY KEY (`fish_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AquariumFishCareStore`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AquariumFishCareStore`.`Product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `prod_name` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `stocky_qty` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AquariumFishCareStore`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AquariumFishCareStore`.`Sale` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `Sale_date` DATE NOT NULL,
  `total_amt` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `Fk_sale_customer_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `Fk_sale_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `AquariumFishCareStore`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AquariumFishCareStore`.`Sale_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AquariumFishCareStore`.`Sale_item` (
  `sale_item_id` INT NOT NULL AUTO_INCREMENT,
  `sale_id` INT NOT NULL,
  `fish_id` INT NULL,
  `product_id` INT NULL,
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`sale_item_id`),
  INDEX `fk_sale_item_sale_idx` (`sale_id` ASC) VISIBLE,
  INDEX `fk_sale_item_fish_idx` (`fish_id` ASC) VISIBLE,
  INDEX `fk_sale_item_product _idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_item_sale`
    FOREIGN KEY (`sale_id`)
    REFERENCES `AquariumFishCareStore`.`Sale` (`sale_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_item_fish`
    FOREIGN KEY (`fish_id`)
    REFERENCES `AquariumFishCareStore`.`Fish` (`fish_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_item_product `
    FOREIGN KEY (`product_id`)
    REFERENCES `AquariumFishCareStore`.`Product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
