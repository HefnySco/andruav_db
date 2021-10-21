-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: local_mysql
-- Generation Time: Oct 21, 2021 at 08:46 AM
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
-- Database: `andruav`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_SID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(200) NOT NULL,
  `PWD` varchar(200) NOT NULL DEFAULT '',
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `account_hw_info`
--

CREATE TABLE `account_hw_info` (
  `SID` bigint(20) NOT NULL,
  `Account_SID` bigint(20) NOT NULL,
  `HW_ID` varchar(256) NOT NULL,
  `HW_Type` int(11) NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `registeredparty`
--

CREATE TABLE `registeredparty` (
  `SID` bigint(20) NOT NULL,
  `partyID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `SID` bigint(20) NOT NULL,
  `accountID` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `party_sid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `groupName` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `receiver` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `messageType` int(20) NOT NULL,
  `task` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `isPermanent` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Lastprocessed_Time` datetime DEFAULT NULL,
  `Creation_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_SID`),
  ADD UNIQUE KEY `Account_SID` (`Account_SID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD UNIQUE KEY `PWD` (`PWD`);

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`SID`),
  ADD UNIQUE KEY `business_rule1` (`Account_SID`,`Permission`) COMMENT 'only one type of password per account',
  ADD KEY `Account_SID` (`Account_SID`);

--
-- Indexes for table `account_hw_info`
--
ALTER TABLE `account_hw_info`
  ADD UNIQUE KEY `IDX_U1` (`SID`),
  ADD KEY `IDX_HW_ID` (`HW_ID`),
  ADD KEY `HW_Type` (`HW_Type`),
  ADD KEY `IDX_ACCOUNT_SID` (`Account_SID`);

--
-- Indexes for table `registeredparty`
--
ALTER TABLE `registeredparty`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `partyID` (`partyID`,`account`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`SID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Account_SID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4153;

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `SID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4139;

--
-- AUTO_INCREMENT for table `account_hw_info`
--
ALTER TABLE `account_hw_info`
  MODIFY `SID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `registeredparty`
--
ALTER TABLE `registeredparty`
  MODIFY `SID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `SID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
