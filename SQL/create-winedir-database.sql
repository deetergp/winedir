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

CREATE TABLE `varietal`
(
  `vid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45),
  `type` varchar(45),
  `description` varchar(255),
  PRIMARY KEY (`vid`)
) ENGINE = InnoDB COMMENT='The base table for varietals.';

INSERT INTO `varietal` VALUES
  (null, 'Bordeaux Blend', 'red', null),
  (null, 'Cabernet Sauvignon', 'red', null),
  (null, 'Champagne', 'sparkling', null),
  (null, 'Chardonnay', 'white', null),
  (null, 'Malbec', 'red', null),
  (null, 'Merlot', 'red', null),
  (null, 'Pinot Grigio', 'white', null),
  (null, 'Pinot Noir', 'red', null),
  (null, 'Red Blend', 'red', null),
  (null, 'Sauvignon Blanc', 'white', null),
  (null, 'Syrah/Shiraz', 'red', null),
  (null, 'Zinfandel', 'red', null);
