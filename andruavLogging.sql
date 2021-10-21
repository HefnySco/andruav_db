-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: local_mysql
-- Generation Time: Oct 21, 2021 at 08:47 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `andruavLogging`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `accesscode_count`
-- (See below for the actual view)
--
CREATE TABLE `accesscode_count` (
`AccessCode` varchar(200)
,`count(AccessCode)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ip_count`
-- (See below for the actual view)
--
CREATE TABLE `ip_count` (
`IP` varchar(50)
,`count(IP)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `SID` bigint(20) UNSIGNED NOT NULL,
  `AccessCode` varchar(200) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `tag` varchar(200) DEFAULT NULL,
  `Message` text NOT NULL,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tag_count`
-- (See below for the actual view)
--
CREATE TABLE `tag_count` (
`tag` varchar(200)
,`count(tag)` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `accesscode_count`
--
DROP TABLE IF EXISTS `accesscode_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`andruav`@`localhost` SQL SECURITY DEFINER VIEW `accesscode_count`  AS  select `log`.`AccessCode` AS `AccessCode`,count(`log`.`AccessCode`) AS `count(AccessCode)` from `log` group by `log`.`AccessCode` ;

-- --------------------------------------------------------

--
-- Structure for view `ip_count`
--
DROP TABLE IF EXISTS `ip_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`andruav`@`localhost` SQL SECURITY DEFINER VIEW `ip_count`  AS  select `log`.`IP` AS `IP`,count(`log`.`IP`) AS `count(IP)` from `log` group by `log`.`IP` ;

-- --------------------------------------------------------

--
-- Structure for view `tag_count`
--
DROP TABLE IF EXISTS `tag_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`andruav`@`localhost` SQL SECURITY DEFINER VIEW `tag_count`  AS  select `log`.`tag` AS `tag`,count(`log`.`tag`) AS `count(tag)` from `log` group by `log`.`tag` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD UNIQUE KEY `SID` (`SID`),
  ADD KEY `AccessCode_2` (`AccessCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `SID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
