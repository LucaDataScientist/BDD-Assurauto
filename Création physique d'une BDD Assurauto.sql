-- MySQL Script generated by MySQL Workbench
-- jeu. 09 juil. 2020 10:29:37 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ASSURAUTO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ASSURAUTO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ASSURAUTO` DEFAULT CHARACTER SET latin1 ;
USE `ASSURAUTO` ;

-- -----------------------------------------------------
-- Table `ASSURAUTO`.`AGENCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`AGENCE` (
  `AG_ID` INT(11) NOT NULL,
  `AG_NOM` VARCHAR(30) NOT NULL,
  `AG_ADRESSE` VARCHAR(45) NOT NULL,
  `AG_CODEPOSTAL` INT(5) NOT NULL,
  `AG_VILLE` VARCHAR(45) NOT NULL,
  `AG_TELEPHONE` VARCHAR(45) NOT NULL,
  `AG_FAX` VARCHAR(45) NOT NULL,
  `AG_EMAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AG_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`CLIENT` (
  `CL_ID` INT(11) NOT NULL,
  `CL_NOM` VARCHAR(45) NOT NULL,
  `CL_PRENOM` VARCHAR(45) NOT NULL,
  `CL_ADRESSE` VARCHAR(45) NOT NULL,
  `CL_CODEPOSTAL` CHAR(45) NOT NULL,
  `CL_VILLE` VARCHAR(45) NOT NULL,
  `CL_TELEPHONE` VARCHAR(45) NOT NULL,
  `CL_FAX` VARCHAR(45) NOT NULL,
  `CL_MAIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CL_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`VT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`VT` (
  `VT_ID` INT(11) NOT NULL,
  `VT_NOMBREPORTE` CHAR(10) NOT NULL,
  `VT_MARQUE` VARCHAR(20) NOT NULL,
  `VT_PUISSANCE` VARCHAR(45) NOT NULL,
  `VT_TYPE` VARCHAR(45) NOT NULL,
  `VT_IMMATRICULATION` VARCHAR(30) NOT NULL,
  `VT_CARTEGRISE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VT_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`VU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`VU` (
  `VU_ID` INT(11) NOT NULL,
  `VU_POIDS` CHAR(15) NOT NULL,
  `VU_LARGEUR` CHAR(15) NOT NULL,
  `VU_LONGUEUR` CHAR(15) NOT NULL,
  `VU_POIDSCHARGE` CHAR(20) NOT NULL,
  `VU_MARQUE` VARCHAR(20) NOT NULL,
  `VU_PUISSANCE` VARCHAR(30) NOT NULL,
  `VU_TYPE` VARCHAR(45) NOT NULL,
  `VU_IMMATRICULATION` VARCHAR(30) NOT NULL,
  `VU_CARTEGRISE` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`VU_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`CONTRAT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`CONTRAT` (
  `CO_ID` INT(11) NOT NULL,
  `CO_NUMERO` CHAR(20) NOT NULL,
  `CO_DATE` DATE NULL DEFAULT NULL,
  `CO_CATEGORIE` VARCHAR(45) NOT NULL,
  `CO_BONUS` DECIMAL(5,0) NOT NULL,
  `CO_MALUS` DECIMAL(5,0) NOT NULL,
  `CO_AG_ID_FK` INT(11) NULL DEFAULT NULL,
  `CO_CL_ID_FK` INT(11) NULL DEFAULT NULL,
  `CO_VT_ID_FK` INT(11) NULL DEFAULT NULL,
  `CO_VU_ID_FK` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CO_ID`),
  INDEX `fk_CONTRAT_4_idx` (`CO_VU_ID_FK` ASC),
  INDEX `CO_AG_ID_FK_idx` (`CO_AG_ID_FK` ASC),
  INDEX `CO_CL_ID_FK_idx` (`CO_CL_ID_FK` ASC),
  INDEX `CO_VT_ID_FK_idx` (`CO_VT_ID_FK` ASC),
  CONSTRAINT `CO_AG_ID_FK`
    FOREIGN KEY (`CO_AG_ID_FK`)
    REFERENCES `ASSURAUTO`.`AGENCE` (`AG_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CO_CL_ID_FK`
    FOREIGN KEY (`CO_CL_ID_FK`)
    REFERENCES `ASSURAUTO`.`CLIENT` (`CL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CO_VT_ID_FK`
    FOREIGN KEY (`CO_VT_ID_FK`)
    REFERENCES `ASSURAUTO`.`VT` (`VT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CO_VU_ID_FK`
    FOREIGN KEY (`CO_VU_ID_FK`)
    REFERENCES `ASSURAUTO`.`VU` (`VU_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`AVENANT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`AVENANT` (
  `AV_ID` INT(11) NOT NULL,
  `AV_DATE` VARCHAR(45) NOT NULL,
  `AV_TARIF` VARCHAR(45) NOT NULL,
  `AV_BONUS` VARCHAR(45) NOT NULL,
  `AV_MALUS` VARCHAR(45) NOT NULL,
  `AV_CO_ID_FK` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`AV_ID`),
  INDEX `fk_AVENANT_1_idx` (`AV_CO_ID_FK` ASC),
  CONSTRAINT `fk_AVENANT_1`
    FOREIGN KEY (`AV_CO_ID_FK`)
    REFERENCES `ASSURAUTO`.`CONTRAT` (`CO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ASSURAUTO`.`EMPLOYE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ASSURAUTO`.`EMPLOYE` (
  `EM_ID` INT(11) NOT NULL,
  `EM_NOM` VARCHAR(45) NOT NULL,
  `EM_PRENOM` VARCHAR(45) NOT NULL,
  `EM_TELEPHONE` VARCHAR(45) NOT NULL,
  `EM_FAX` VARCHAR(45) NOT NULL,
  `EM_MAIL` VARCHAR(45) NOT NULL,
  `EM_AG_ID_FK` INT(11) NOT NULL,
  PRIMARY KEY (`EM_ID`),
  INDEX `fk_EMPLOYE_1_idx` (`EM_AG_ID_FK` ASC),
  CONSTRAINT `fk_EMPLOYE_1`
    FOREIGN KEY (`EM_AG_ID_FK`)
    REFERENCES `ASSURAUTO`.`AGENCE` (`AG_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
