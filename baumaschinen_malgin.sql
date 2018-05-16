-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2018 at 12:41 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baumaschinen_malgin`
--
CREATE DATABASE IF NOT EXISTS `baumaschinen_malgin` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `baumaschinen_malgin`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auftrag`
--

CREATE TABLE `tbl_auftrag` (
  `AuftrNr` int(5) NOT NULL,
  `AuftrDat` date DEFAULT NULL,
  `Mietbeginn` date DEFAULT NULL,
  `Mietende` date DEFAULT NULL,
  `KdNr` varchar(5) DEFAULT NULL,
  `MaschinenNr` varchar(4) DEFAULT NULL,
  `MitArb-ID` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_auftrag`
--

INSERT INTO `tbl_auftrag` (`AuftrNr`, `AuftrDat`, `Mietbeginn`, `Mietende`, `KdNr`, `MaschinenNr`, `MitArb-ID`) VALUES
(10001, '2013-04-02', '2013-04-14', '2013-04-21', 'K2112', 'B233', 1),
(10002, '2013-04-03', '2013-04-12', '2013-04-13', 'K3302', 'A312', 2),
(10005, '2013-04-10', '2013-05-02', '2013-05-13', 'K3302', 'B233', 2),
(10006, '2013-04-10', '2013-05-02', '2013-05-13', 'K3302', 'F100', 1),
(11003, '2013-04-12', '2013-04-25', '2013-04-27', 'K3244', 'R222', 1),
(11004, '2013-04-12', '2013-04-25', '2013-04-27', 'K3244', 'A312', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kunden`
--

CREATE TABLE `tbl_kunden` (
  `KdNr` varchar(5) NOT NULL,
  `Name` varchar(19) DEFAULT NULL,
  `Straße` varchar(16) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL,
  `Telefon` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kunden`
--

INSERT INTO `tbl_kunden` (`KdNr`, `Name`, `Straße`, `PLZ`, `Telefon`) VALUES
('K2112', 'Peter Sandmann KG', 'Alter Winkel 11', 31061, '05181-85574'),
('K2122', 'Willi Stein Ag', 'Neuer Weg 4', 30123, '0511-775544'),
('K3244', 'Oskar Muell GBR', 'Drecksweg 99', 20020, '040-5533553'),
('K3301', 'Gerd Gartenbauer', 'Waldwiese 3', 10332, '010-1020010'),
('K3302', 'Bernd Bauleitner', 'Umbruch 67', 31061, '05182-8787'),
('K3303', 'Kai Kieserling GmbH', 'Kiesgrubenweg 77', 31061, '05181-29876'),
('K3304', 'Lisa Tonscherbe', 'Lehmschicht 34', 30123, '0511-886655'),
('K3408', 'Anton Schuster', 'Am Bahnhof 5', 10332, '010-223344');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_maschinen`
--

CREATE TABLE `tbl_maschinen` (
  `MaschinenNr` varchar(4) NOT NULL,
  `Bezeichnung` varchar(31) DEFAULT NULL,
  `Mietpreis` double DEFAULT NULL,
  `Foederleistung` varchar(2) DEFAULT NULL,
  `Spritverbrauch` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_maschinen`
--

INSERT INTO `tbl_maschinen` (`MaschinenNr`, `Bezeichnung`, `Mietpreis`, `Foederleistung`, `Spritverbrauch`) VALUES
('A312', 'Bagger 2m3', 180, '2', '12'),
('A313', 'Bagger  5m3', 230, '5', '17'),
('B233', 'Betonpumpe Seiler TS 821 10m3/h', 170, '10', ''),
('B244', 'Betonpumpe Seiler TS 977 20m3/h', 210, '20', ''),
('F100', 'Frontlader 1001', 260, '', '15'),
('F103', 'Frontlader 1003', 300, '', '22'),
('M039', 'Stand Mischmaschine', 40, '', ''),
('R222', 'Einmannruettler', 60, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mitarbeiter`
--

CREATE TABLE `tbl_mitarbeiter` (
  `MitArb-ID` int(1) NOT NULL,
  `Name` varchar(12) DEFAULT NULL,
  `Vorname` varchar(6) DEFAULT NULL,
  `Gehalt` varchar(9) DEFAULT NULL,
  `PLZ` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mitarbeiter`
--

INSERT INTO `tbl_mitarbeiter` (`MitArb-ID`, `Name`, `Vorname`, `Gehalt`, `PLZ`) VALUES
(1, 'Maschinowski', 'Walter', '2000.00 €', 31061),
(2, 'Helferlein', 'Klaus', '1500.00 €', 31061);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rechnung`
--

CREATE TABLE `tbl_rechnung` (
  `RechNr` int(1) NOT NULL,
  `RechDat` varchar(18) DEFAULT NULL,
  `AuftrNr` int(5) DEFAULT NULL,
  `bezahlt` int(1) DEFAULT NULL,
  `Betrag` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rechnung`
--

INSERT INTO `tbl_rechnung` (`RechNr`, `RechDat`, `AuftrNr`, `bezahlt`, `Betrag`) VALUES
(1, '2013-4-22 00:00:00', 10001, 1, 1190),
(2, '2013-4-14 00:00:00', 10002, 0, 180),
(3, '2013-4-14 00:00:00', 10005, 1, 1870);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wohnort`
--

CREATE TABLE `tbl_wohnort` (
  `PLZ` int(5) NOT NULL,
  `Ort` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_wohnort`
--

INSERT INTO `tbl_wohnort` (`PLZ`, `Ort`) VALUES
(10332, 'Berlin'),
(20020, 'Hamburg'),
(30123, 'Hannover'),
(31061, 'Alfeld');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_auftrag`
--
ALTER TABLE `tbl_auftrag`
  ADD PRIMARY KEY (`AuftrNr`),
  ADD KEY `KdNr` (`KdNr`),
  ADD KEY `MaschinenNr` (`MaschinenNr`),
  ADD KEY `MitArb-ID` (`MitArb-ID`);

--
-- Indexes for table `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
  ADD PRIMARY KEY (`KdNr`),
  ADD KEY `PLZ` (`PLZ`);

--
-- Indexes for table `tbl_maschinen`
--
ALTER TABLE `tbl_maschinen`
  ADD PRIMARY KEY (`MaschinenNr`);

--
-- Indexes for table `tbl_mitarbeiter`
--
ALTER TABLE `tbl_mitarbeiter`
  ADD PRIMARY KEY (`MitArb-ID`),
  ADD KEY `Wohnort-PLZ` (`PLZ`);

--
-- Indexes for table `tbl_rechnung`
--
ALTER TABLE `tbl_rechnung`
  ADD PRIMARY KEY (`RechNr`),
  ADD KEY `AuftrNr` (`AuftrNr`);

--
-- Indexes for table `tbl_wohnort`
--
ALTER TABLE `tbl_wohnort`
  ADD PRIMARY KEY (`PLZ`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_auftrag`
--
ALTER TABLE `tbl_auftrag`
  ADD CONSTRAINT `tbl_auftrag_ibfk_1` FOREIGN KEY (`KdNr`) REFERENCES `tbl_kunden` (`KdNr`),
  ADD CONSTRAINT `tbl_auftrag_ibfk_2` FOREIGN KEY (`MitArb-ID`) REFERENCES `tbl_mitarbeiter` (`MitArb-ID`),
  ADD CONSTRAINT `tbl_auftrag_ibfk_3` FOREIGN KEY (`MaschinenNr`) REFERENCES `tbl_maschinen` (`MaschinenNr`);

--
-- Constraints for table `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
  ADD CONSTRAINT `tbl_kunden_ibfk_1` FOREIGN KEY (`PLZ`) REFERENCES `tbl_wohnort` (`PLZ`);

--
-- Constraints for table `tbl_mitarbeiter`
--
ALTER TABLE `tbl_mitarbeiter`
  ADD CONSTRAINT `tbl_mitarbeiter_ibfk_1` FOREIGN KEY (`PLZ`) REFERENCES `tbl_wohnort` (`PLZ`);

--
-- Constraints for table `tbl_rechnung`
--
ALTER TABLE `tbl_rechnung`
  ADD CONSTRAINT `tbl_rechnung_ibfk_1` FOREIGN KEY (`AuftrNr`) REFERENCES `tbl_auftrag` (`AuftrNr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
