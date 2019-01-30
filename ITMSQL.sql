-- MySQL Script generated by MySQL Workbench
-- Wed Jan 30 20:28:35 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ITM_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ITM_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ITM_DB` DEFAULT CHARACTER SET utf8 ;
USE `ITM_DB` ;

-- -----------------------------------------------------
-- Table `ITM_DB`.`University`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`University` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`University` (
  `University_ID` INT NOT NULL,
  `University_Name` VARCHAR(60) NULL,
  PRIMARY KEY (`University_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`Year`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`Year` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`Year` (
  `Year` INT NOT NULL,
  PRIMARY KEY (`Year`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`challenge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`challenge` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`challenge` (
  `University_ID` INT NOT NULL,
  `Year` INT NOT NULL,
  PRIMARY KEY (`University_ID`, `Year`),
  INDEX `fk_University_has_Year_Year1_idx` (`Year` ASC) VISIBLE,
  INDEX `fk_University_has_Year_University_idx` (`University_ID` ASC) VISIBLE,
  CONSTRAINT `fk_University_has_Year_University`
    FOREIGN KEY (`University_ID`)
    REFERENCES `ITM_DB`.`University` (`University_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_has_Year_Year1`
    FOREIGN KEY (`Year`)
    REFERENCES `ITM_DB`.`Year` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`Activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`Activity` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`Activity` (
  `Ativity_ID` INT NOT NULL,
  `Activity_Name` VARCHAR(45) NULL,
  `Activity_Type` VARCHAR(45) NULL,
  `Activity_date` VARCHAR(45) NULL,
  `Activitycol_Time` VARCHAR(45) NULL,
  PRIMARY KEY (`Ativity_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`Students` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`Students` (
  `challenge_University_ID` INT NOT NULL,
  `challenge_Year` INT NOT NULL,
  `Ativity_Ativity_ID` INT NOT NULL,
  `Students_ID` INT(10) NOT NULL,
  `Students_Name` VARCHAR(100) NULL,
  `Students_Phon` VARCHAR(45) NULL,
  `Students_year` VARCHAR(2) NULL,
  INDEX `fk_Students_challenge1_idx` (`challenge_University_ID` ASC, `challenge_Year` ASC) VISIBLE,
  INDEX `fk_Students_Ativity1_idx` (`Ativity_Ativity_ID` ASC) VISIBLE,
  PRIMARY KEY (`Students_ID`),
  CONSTRAINT `fk_Students_challenge1`
    FOREIGN KEY (`challenge_University_ID` , `challenge_Year`)
    REFERENCES `ITM_DB`.`challenge` (`University_ID` , `Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Ativity1`
    FOREIGN KEY (`Ativity_Ativity_ID`)
    REFERENCES `ITM_DB`.`Activity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`Teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`Teachers` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`Teachers` (
  `Teachers_ID` INT NOT NULL,
  `Teachers_Name` VARCHAR(100) NULL,
  `Teachers_Phon` VARCHAR(45) NULL,
  `challenge_University_ID` INT NOT NULL,
  `challenge_Year` INT NOT NULL,
  PRIMARY KEY (`Teachers_ID`),
  INDEX `fk_Teachers_challenge1_idx` (`challenge_University_ID` ASC, `challenge_Year` ASC) VISIBLE,
  CONSTRAINT `fk_Teachers_challenge1`
    FOREIGN KEY (`challenge_University_ID` , `challenge_Year`)
    REFERENCES `ITM_DB`.`challenge` (`University_ID` , `Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`Responsibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`Responsibility` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`Responsibility` (
  `Teachers_Teachers_ID` INT NOT NULL,
  `Ativity_Ativity_ID` INT NOT NULL,
  `Responsibility_status` VARCHAR(20) NULL,
  PRIMARY KEY (`Teachers_Teachers_ID`, `Ativity_Ativity_ID`),
  INDEX `fk_Teachers_has_Ativity_Ativity1_idx` (`Ativity_Ativity_ID` ASC) VISIBLE,
  INDEX `fk_Teachers_has_Ativity_Teachers1_idx` (`Teachers_Teachers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Teachers_has_Ativity_Teachers1`
    FOREIGN KEY (`Teachers_Teachers_ID`)
    REFERENCES `ITM_DB`.`Teachers` (`Teachers_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers_has_Ativity_Ativity1`
    FOREIGN KEY (`Ativity_Ativity_ID`)
    REFERENCES `ITM_DB`.`Activity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM_DB`.`joinAtivity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM_DB`.`joinAtivity` ;

CREATE TABLE IF NOT EXISTS `ITM_DB`.`joinAtivity` (
  `Students_ID` INT(10) NOT NULL,
  `Ativity_ID` INT NOT NULL,
  `joinAtivity_Results` VARCHAR(10) NULL,
  PRIMARY KEY (`Students_ID`, `Ativity_ID`),
  INDEX `fk_Students_has_Ativity_Ativity1_idx` (`Ativity_ID` ASC) VISIBLE,
  INDEX `fk_Students_has_Ativity_Students1_idx` (`Students_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Students_has_Ativity_Students1`
    FOREIGN KEY (`Students_ID`)
    REFERENCES `ITM_DB`.`Students` (`Students_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Ativity_Ativity1`
    FOREIGN KEY (`Ativity_ID`)
    REFERENCES `ITM_DB`.`Activity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
