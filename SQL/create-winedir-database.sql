-- Create the winedir database.

-- Start from Scratch
DROP DATABASE IF EXISTS winedir;
CREATE DATABASE winedir;
USE winedir;

-- Create the tables.
CREATE TABLE `winemaker`
(
  `mid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255),
  `website` varchar(100),
  `country` int NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE = InnoDB COMMENT='The base table for winemakers.';

CREATE TABLE `wine`
( 
  `wid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255),
  `winemaker` int NOT NULL,
  `varietal` int NOT NULL,
  `region` int,
  `upc` varchar(45),
  PRIMARY KEY (`wid`),
  FOREIGN KEY (`winemaker`) REFERENCES winemaker(`mid`)
) ENGINE = InnoDB COMMENT='The base table for wines.';
