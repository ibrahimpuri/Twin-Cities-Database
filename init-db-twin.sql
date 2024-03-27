-- Create Cities table
CREATE TABLE `Cities` (
  `CityID` int AUTO_INCREMENT,
  `CurrencyID` varchar(3),
  `Name` varchar(100),
  `Population` int,
  `CountryID` varchar(3),
  `Mayor` varchar(100),
  `YearFounded` varchar(20),
  `Latitude` decimal(9,6),
  `Longitude` decimal(9,6),
  PRIMARY KEY (`CityID`)
);

-- Create Category table
CREATE TABLE `Category` (
  `CategoryID` int AUTO_INCREMENT,
  `CategoryName` varchar(50),
  `IconURL` varchar(255),
  PRIMARY KEY (`CategoryID`)
);

-- Create Places of Interest table
CREATE TABLE `Places_of_Interest` (
  `PlaceID` int AUTO_INCREMENT,
  `CityID` int,
  `Name` varchar(100),
  `Type` varchar(50),
  `Capacity` int,
  `Photos_Flickr_API` varchar(255),
  `OpeningHours` varchar(50),
  `Description` text,
  `Latitude` decimal(9,6),
  `Longitude` decimal(9,6),
  PRIMARY KEY (`PlaceID`),
  FOREIGN KEY (`CityID`) REFERENCES `Cities`(`CityID`)
);

-- Create Weather table
CREATE TABLE `Weather` (
  `WeatherID` int AUTO_INCREMENT,
  `CityID` int,
  `Temperature` decimal(10,2),
  `Humidity` decimal(10,2),
  `WindSpeed` decimal(10,2),
  `WindDirection` varchar(20),
  `Condition` varchar(100),
  PRIMARY KEY (`WeatherID`),
  FOREIGN KEY (`CityID`) REFERENCES `Cities`(`CityID`)
);