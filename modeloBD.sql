-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TiendaBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TiendaBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TiendaBD` DEFAULT CHARACTER SET utf8 ;
USE `TiendaBD` ;

-- -----------------------------------------------------
-- Table `TiendaBD`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TiendaBD`.`Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `cedula` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TiendaBD`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TiendaBD`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombreCliente` VARCHAR(45) NULL,
  `cedulaCliente` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TiendaBD`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TiendaBD`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TiendaBD`.`SubVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TiendaBD`.`SubVenta` (
  `idSubVenta` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  `SubImporte` FLOAT NULL,
  PRIMARY KEY (`idSubVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TiendaBD`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TiendaBD`.`Venta` (
  `idVenta` INT NOT NULL,
  `Vendedor_idVendedor` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `SubVenta_idSubVenta` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Venta_Vendedor_idx` (`Vendedor_idVendedor` ASC),
  INDEX `fk_Venta_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Venta_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_Venta_SubVenta1_idx` (`SubVenta_idSubVenta` ASC),
  CONSTRAINT `fk_Venta_Vendedor`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `TiendaBD`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `TiendaBD`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `TiendaBD`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_SubVenta1`
    FOREIGN KEY (`SubVenta_idSubVenta`)
    REFERENCES `TiendaBD`.`SubVenta` (`idSubVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
