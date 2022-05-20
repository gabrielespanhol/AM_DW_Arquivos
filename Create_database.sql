-- MySQL Script generated by MySQL Workbench
-- Fri May 20 15:05:22 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cargo` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Colaborador` (
  `ID` INT NOT NULL,
  `CPF` VARCHAR(11) NULL DEFAULT NULL,
  `RG` VARCHAR(9) NULL DEFAULT NULL,
  `Nome Completo` VARCHAR(150) NULL DEFAULT NULL,
  `Data Nascimento` DATE NULL DEFAULT NULL,
  `Data Contratacao` DATE NOT NULL,
  `Endereço` VARCHAR(150) NULL DEFAULT NULL,
  `Salario Atual` DECIMAL(18,2) NULL DEFAULT NULL,
  `Cargo Atual` VARCHAR(60) NULL DEFAULT NULL,
  `Status` VARCHAR(15) NOT NULL,
  `Data Saida` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Data` (
  `ID` INT NOT NULL,
  `Data` DATE NULL DEFAULT NULL,
  `Dia Semana` VARCHAR(10) NULL DEFAULT NULL,
  `Dia` VARCHAR(2) NULL DEFAULT NULL,
  `Mes` VARCHAR(3) NULL DEFAULT NULL,
  `Ano` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filial` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Regiao` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gestor` (
  `ID` INT NOT NULL,
  `CPF` VARCHAR(11) NULL,
  `Nome` VARCHAR(150) NULL,
  `Cargo Atual` VARCHAR(60) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`FatoOcorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FatoOcorrencia` (
  `ID` INT NOT NULL,
  `CARGO_ID` INT NOT NULL,
  `DATA_ID` INT NOT NULL,
  `GESTORES_ID` INT NOT NULL,
  `FILIAL_ID` INT NOT NULL,
  `COLABORADOR_ID` INT NOT NULL,
  `Tipo Ocorrencia` VARCHAR(45) NULL DEFAULT NULL,
  `Descricao Ocorrencia` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`, `CARGO_ID`, `DATA_ID`, `GESTORES_ID`, `FILIAL_ID`, `COLABORADOR_ID`),
  INDEX `fk_OCORRENCIA_CARGO_idx` (`CARGO_ID` ASC) VISIBLE,
  INDEX `fk_OCORRENCIA_DATA1_idx` (`DATA_ID` ASC) VISIBLE,
  INDEX `fk_OCORRENCIA_GESTORES1_idx` (`GESTORES_ID` ASC) VISIBLE,
  INDEX `fk_OCORRENCIA_FILIAL1_idx` (`FILIAL_ID` ASC) VISIBLE,
  INDEX `fk_OCORRENCIA_COLABORADOR1_idx` (`COLABORADOR_ID` ASC) VISIBLE,
  CONSTRAINT `fk_OCORRENCIA_CARGO`
    FOREIGN KEY (`CARGO_ID`)
    REFERENCES `mydb`.`Cargo` (`ID`),
  CONSTRAINT `fk_OCORRENCIA_COLABORADOR1`
    FOREIGN KEY (`COLABORADOR_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`),
  CONSTRAINT `fk_OCORRENCIA_DATA1`
    FOREIGN KEY (`DATA_ID`)
    REFERENCES `mydb`.`Data` (`ID`),
  CONSTRAINT `fk_OCORRENCIA_FILIAL1`
    FOREIGN KEY (`FILIAL_ID`)
    REFERENCES `mydb`.`Filial` (`ID`),
  CONSTRAINT `fk_OCORRENCIA_GESTORES1`
    FOREIGN KEY (`GESTORES_ID`)
    REFERENCES `mydb`.`Gestor` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;