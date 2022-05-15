-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 06:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogiddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `paymenttb`
--

CREATE TABLE `paymenttb` (
  `PaymentID` int(10) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `ContactNumber` int(10) NOT NULL,
  `CardName` varchar(10) NOT NULL,
  `CreditCardNumber` bigint(12) NOT NULL,
  `ExpiryDate` varchar(10) NOT NULL,
  `CVV` int(3) NOT NULL,
  `Amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymenttb`
--

INSERT INTO `paymenttb` (`PaymentID`, `Name`, `Email`, `Address`, `ContactNumber`, `CardName`, `CreditCardNumber`, `ExpiryDate`, `CVV`, `Amount`) VALUES
(7, 'Yehan', 'yehangunarathne@gmail.com', 'Yakkala', 112456982, 'Gunarathne', 145236987456, '02/25', 687, 5000),
(8, 'Amantha', 'amantha@gmailcom', 'Nittambuwa', 715369854, 'Jayasuriya', 452369857451, '15/28', 169, 6000),
(9, 'Shehan', 'shehan@gmail.com', 'Rathnapura', 718652546, 'Shehan', 78965412348, '05/24', 458, 8000),
(10, 'Nuwan', 'nuwan@gmail.com', 'Kaluthara', 768531459, 'Nuwan', 754865214, '06/22', 896, 7000),
(11, 'Dinusha', 'dinusha@gmail.com', 'Kandy', 745689452, 'Dayan', 189652347856, '09/27', 848, 6500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `paymenttb`
--
ALTER TABLE `paymenttb`
  ADD PRIMARY KEY (`PaymentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paymenttb`
--
ALTER TABLE `paymenttb`
  MODIFY `PaymentID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
