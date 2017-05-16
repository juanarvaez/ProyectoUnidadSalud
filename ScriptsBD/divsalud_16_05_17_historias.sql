-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: divsalud-bd
-- ------------------------------------------------------
-- Server version 5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--Borrar el UNIQUE de fecha programada
ALTER TABLE cita_medica_med DROP INDEX AK_FECHA_PROGRAMADA_UNIQUE;
ALTER TABLE cita_medica_med DROP INDEX FECHA_PROGRAMADA_2;

--Inserts a la tabla tipo cita medica
INSERT INTO `tipo_cita_med` (`ID`, `NOMBRE`) VALUES ('2', 'Control');
INSERT INTO `tipo_cita_med` (`ID`, `NOMBRE`) VALUES ('3', 'Revisión Exámenes');