-- MySQL Script generated by MySQL Workbench
-- Mon Jan 28 19:11:12 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ITM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ITM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ITM` DEFAULT CHARACTER SET utf8 ;
USE `ITM` ;

-- -----------------------------------------------------
-- Table `ITM`.`University`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`University` ;

CREATE TABLE IF NOT EXISTS `ITM`.`University` (
  `University_ID` INT NOT NULL,
  `University_Name` VARCHAR(60) NULL,
  PRIMARY KEY (`University_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`Year`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`Year` ;

CREATE TABLE IF NOT EXISTS `ITM`.`Year` (
  `Year` INT NOT NULL,
  PRIMARY KEY (`Year`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`challenge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`challenge` ;

CREATE TABLE IF NOT EXISTS `ITM`.`challenge` (
  `University_ID` INT NOT NULL,
  `Year` INT NOT NULL,
  PRIMARY KEY (`University_ID`, `Year`),
  CONSTRAINT `fk_University_has_Year_University`
    FOREIGN KEY (`University_ID`)
    REFERENCES `ITM`.`University` (`University_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_University_has_Year_Year1`
    FOREIGN KEY (`Year`)
    REFERENCES `ITM`.`Year` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`Ativity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`Ativity` ;

CREATE TABLE IF NOT EXISTS `ITM`.`Ativity` (
  `Ativity_ID` INT NOT NULL,
  `Ativity_Name` VARCHAR(45) NULL,
  `Ativitycol_Time` VARCHAR(45) NULL,
  PRIMARY KEY (`Ativity_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`Students` ;

CREATE TABLE IF NOT EXISTS `ITM`.`Students` (
  `challenge_University_ID` INT NOT NULL,
  `challenge_Year` INT NOT NULL,
  `Ativity_Ativity_ID` INT NOT NULL,
  `Students_ID` INT(10) NOT NULL,
  `Students_Name` VARCHAR(100) NULL,
  `Students_year` VARCHAR(2) NULL,
  `Students_Phon` VARCHAR(45) NULL,
  PRIMARY KEY (`Students_ID`),
  CONSTRAINT `fk_Students_challenge1`
    FOREIGN KEY (`challenge_University_ID` , `challenge_Year`)
    REFERENCES `ITM`.`challenge` (`University_ID` , `Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Ativity1`
    FOREIGN KEY (`Ativity_Ativity_ID`)
    REFERENCES `ITM`.`Ativity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`Teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`Teachers` ;

CREATE TABLE IF NOT EXISTS `ITM`.`Teachers` (
  `Teachers_ID` INT NOT NULL,
  `Teachers_Name` VARCHAR(100) NULL,
  `Teachers_Phon` VARCHAR(45) NULL,
  `challenge_University_ID` INT NOT NULL,
  `challenge_Year` INT NOT NULL,
  PRIMARY KEY (`Teachers_ID`),
  CONSTRAINT `fk_Teachers_challenge1`
    FOREIGN KEY (`challenge_University_ID` , `challenge_Year`)
    REFERENCES `ITM`.`challenge` (`University_ID` , `Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`Responsibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`Responsibility` ;

CREATE TABLE IF NOT EXISTS `ITM`.`Responsibility` (
  `Teachers_Teachers_ID` INT NOT NULL,
  `Ativity_Ativity_ID` INT NOT NULL,
  `Responsibility_status` VARCHAR(20) NULL,
  PRIMARY KEY (`Teachers_Teachers_ID`, `Ativity_Ativity_ID`),
  CONSTRAINT `fk_Teachers_has_Ativity_Teachers1`
    FOREIGN KEY (`Teachers_Teachers_ID`)
    REFERENCES `ITM`.`Teachers` (`Teachers_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers_has_Ativity_Ativity1`
    FOREIGN KEY (`Ativity_Ativity_ID`)
    REFERENCES `ITM`.`Ativity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ITM`.`joinAtivity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ITM`.`joinAtivity` ;

CREATE TABLE IF NOT EXISTS `ITM`.`joinAtivity` (
  `Students_ID` INT(10) NOT NULL,
  `Ativity_ID` INT NOT NULL,
  `joinAtivity_Results` VARCHAR(10) NULL,
  PRIMARY KEY (`Students_ID`, `Ativity_ID`),
  CONSTRAINT `fk_Students_has_Ativity_Students1`
    FOREIGN KEY (`Students_ID`)
    REFERENCES `ITM`.`Students` (`Students_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_has_Ativity_Ativity1`
    FOREIGN KEY (`Ativity_ID`)
    REFERENCES `ITM`.`Ativity` (`Ativity_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
