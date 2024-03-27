INSERT INTO `Cities` (`CurrencyID`, `Name`, `Population`, `CountryID`, `Mayor`, `YearFounded`, `Latitude`, `Longitude`) VALUES
('GBP', 'Leeds', 793139, 'GBR', 'James Lewis', '1207', 53.800755, -1.549077),
('EUR', 'Lille', 232440, 'FRA', 'Martine Aubry', '1066', 50.629250, 3.057256);

INSERT INTO `Weather` (`CityID`, `Temperature`, `Humidity`, `WindSpeed`, `WindDirection`, `Condition`) VALUES
(1, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Category` (`CategoryName`, `IconURL`) VALUES
('Botanical Garden', './icons/botanicalGarden.png'),
('Park', './icons/park.png'),
('Entertainment', './icons/entertainment.png'),
('Museum', './icons/museum.png'),
('Popular', './icons/popular.png'),
('Bridge', './icons/bridge.png'),
('Shopping', './icons/shopping.png'),
('Zoo', './icons/zoo.png');

INSERT INTO `Places_of_Interest` (`CityID`, `Name`, `Type`, `Capacity`, `Photos_Flickr_API`, `OpeningHours`, `Description`, `Latitude`, `Longitude`) VALUES
(1, 'Leeds Cathedral', 'Popular', NULL, NULL, '0745-1815', 'A historical cathedral in Leeds', 53.8008, 1.5467),
(1, 'Elland Road', 'Popular', NULL, NULL, '1030-1715', 'Famous football stadium, home of Leeds United FC', 53.7778, 1.5721),
(1, 'Trinity Leeds', 'Shopping', NULL, NULL, '0900-2000', 'Major retail and leisure complex', 53.7966, 1.5445),
(1, 'Royal Amouries Museum', 'Museum', NULL, NULL, '1000-1700', 'Modern building for displays including Henry VIII''s armour, war histories and experimental weaponry', 53.7918, 1.5322),
(1, 'Roundhay Park', 'Park', NULL, NULL, '1200-2400', 'One of the biggest parks in Europe', 53.8351, 1.4969),
(1, 'Thackaray Museum of Medicine', 'Museum', NULL, NULL, '1000-1700', 'Museum dedicated to the history of medicine', 53.8082, 1.5186),
(1, 'First Direct Arena', 'Entertainment', NULL, NULL, '0900-1800', 'Popular arena in Leeds', 53.8035, 1.5421),
(2, 'Notre-Dame-de-la-Treille Cathedral', 'Popular', NULL, NULL, '1030-1815', 'A famous Roman Catholic cathedral in Lille', 54.6402, 3.0627),
(2, 'Musée d''Histoire Naturelle de Lille', 'Museum', NULL, NULL, '0930-1700', 'Museum in Lille which houses zoological and geological collections', 50.6262, 3.0669),
(2, 'Palais des Beaux-Arts de Lille', 'Museum', NULL, NULL, '1000-1800', 'Museum dedicated to fine arts, modern arts and antiquities in lille', 50.6305, 3.0628),
(2, 'Zoo de Lille', 'Zoo', NULL, NULL, '1000-1700', 'Zoological garden with a large variety of species', 50.6382, 3.0479),
(2, 'Lille Grand Palais', 'Entertainment', NULL, NULL, '1000-1700', 'Lille Grand Palais is renowned for its innovative architectural design by Rem Koolhaas, serving as a versatile venue for a wide range of events including trade fairs, conferences, concerts, and exhibitions', 50.6327, 3.0781),
(2, 'Parc de la Citadelle', 'Park', NULL, NULL, '1000-1800', 'Park surrounding a 17th-century fortress, with grassy picnic areas, bicycle paths & a small zoo', 50.6383, 3.0480),
(2, 'Pont Napoleon', 'Bridge', NULL, NULL, '1000-1700', 'Famous bridge in Lille, known for its historical significance and architectural beauty', 42.8585, 0.0057);