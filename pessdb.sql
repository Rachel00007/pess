-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 07:40 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pessdb`
--
CREATE DATABASE IF NOT EXISTS `pessdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pessdb`;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch`
--

CREATE TABLE `dispatch` (
  `incident_id` int(11) NOT NULL,
  `patrolcar_id` varchar(10) NOT NULL,
  `time_dispatched` datetime NOT NULL,
  `time_arrived` datetime DEFAULT NULL,
  `time_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dispatch`
--

INSERT INTO `dispatch` (`incident_id`, `patrolcar_id`, `time_dispatched`, `time_arrived`, `time_completed`) VALUES
(12, 'QX2222G', '2022-03-02 04:37:20', '0000-00-00 00:00:00', '2022-03-02 04:37:20'),
(13, 'QX1234', '2022-05-10 19:51:40', NULL, '2022-05-10 23:33:32'),
(13, 'QX2222G', '2022-03-02 04:37:20', '2022-03-02 04:37:20', '2022-03-02 04:37:20'),
(14, 'QX4321R', '2022-05-10 19:55:45', NULL, NULL),
(14, 'QX4444P', '2022-03-02 04:37:20', '2022-03-02 04:37:20', '2022-03-02 04:37:20'),
(15, 'QX1234', '2022-03-10 13:46:00', NULL, '2022-05-10 23:33:32'),
(16, 'QX1234', '2022-05-11 22:20:02', NULL, '2022-05-11 22:22:09'),
(17, 'QX1234', '2022-05-11 22:22:24', NULL, '2022-05-11 22:39:58'),
(18, 'QX1234', '2022-05-11 22:40:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `caller_name` varchar(30) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `incident_type_id` varchar(3) NOT NULL,
  `incident_location` varchar(50) NOT NULL,
  `incident_desc` varchar(100) NOT NULL,
  `incident_status_id` varchar(1) NOT NULL,
  `time_called` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `caller_name`, `phone_number`, `incident_type_id`, `incident_location`, `incident_desc`, `incident_status_id`, `time_called`) VALUES
(6, 'PETER LEOW', '81234567', '010', 'Junction of North Bridge Rd and Middle Rd', 'A bus collided with a Taxi injuries', '1', '2022-03-01 19:36:49'),
(8, 'qwerty', '12345678', '030', 'cck', 'qwerty', '3', '2022-03-01 19:36:49'),
(9, 'Peter Leow', '81234567', '', 'Junction of North Bridge Road and Middle Road', 'A bus collided with a taxi, 2 injuries', '', '2022-03-28 10:44:53'),
(10, 'Rachel', '11112222', '010', 'cck street 52', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-10 19:37:27'),
(11, 'Rachel', '11112222', '010', 'cck street 52', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-10 19:44:46'),
(12, 'Rachel', '11112222', '010', 'cck street 52', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-10 19:50:37'),
(13, 'Rachel', '11112222', '010', 'cck street 52', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-10 19:51:40'),
(14, 'Marcus', '12345789', '060', 'Bedok street 27 ', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-10 19:55:45'),
(15, 'Rachel', '12345789', '030', 'nnnn', '<br />\r\n<b>Warning</b>:  Undefined variable $_Post in <b>C:xampphtdocspessdispatch.php</b> on line <', '2', '2022-05-11 22:12:41'),
(16, 'Rachel', '11112222', '010', 'ihf', 'eeee', '3', '2022-05-11 22:22:09'),
(17, 'Marcus', '12345789', '010', 'Bedok street 27 ', 'qqqqqqqqqqq', '3', '2022-05-11 22:39:58'),
(18, 'Rachel', '11112222', '010', 'ihf', 'ww', '2', '2022-05-11 22:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `incident_status`
--

CREATE TABLE `incident_status` (
  `incident_status_id` varchar(1) NOT NULL,
  `ident_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_status`
--

INSERT INTO `incident_status` (`incident_status_id`, `ident_status_desc`) VALUES
('1', 'Pending'),
('2', 'Dispatched'),
('3', 'Completed'),
('4', 'Duplicate');

-- --------------------------------------------------------

--
-- Table structure for table `incident_type`
--

CREATE TABLE `incident_type` (
  `incident_type_id` varchar(3) NOT NULL,
  `incident_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_type`
--

INSERT INTO `incident_type` (`incident_type_id`, `incident_type_desc`) VALUES
('010', 'Fire'),
('020', 'Riot'),
('030', 'Burglary'),
('040', 'Domestic Violent'),
('050', 'Fallen Tree'),
('060', 'Traffic Accident'),
('070', 'Loan Shark'),
('999', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar`
--

CREATE TABLE `patrolcar` (
  `patrolcar_id` varchar(10) NOT NULL,
  `patrolcar_status_id` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar`
--

INSERT INTO `patrolcar` (`patrolcar_id`, `patrolcar_status_id`) VALUES
('QX1234', '1'),
('QX4321R', '1'),
('QX4444P', '1'),
('QX45545', '1'),
('QX9999H', '1');

-- --------------------------------------------------------

--
-- Table structure for table `patrolcar_status`
--

CREATE TABLE `patrolcar_status` (
  `patrolcar_status_id` varchar(1) NOT NULL,
  `patrolcar_status_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patrolcar_status`
--

INSERT INTO `patrolcar_status` (`patrolcar_status_id`, `patrolcar_status_desc`) VALUES
('1', 'Dispatched'),
('2', 'Patrol'),
('3', 'Free'),
('4', 'On-site'),
('5', 'N/A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`incident_id`,`patrolcar_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `incident_status`
--
ALTER TABLE `incident_status`
  ADD PRIMARY KEY (`incident_status_id`);

--
-- Indexes for table `incident_type`
--
ALTER TABLE `incident_type`
  ADD PRIMARY KEY (`incident_type_id`);

--
-- Indexes for table `patrolcar`
--
ALTER TABLE `patrolcar`
  ADD PRIMARY KEY (`patrolcar_id`);

--
-- Indexes for table `patrolcar_status`
--
ALTER TABLE `patrolcar_status`
  ADD PRIMARY KEY (`patrolcar_status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
