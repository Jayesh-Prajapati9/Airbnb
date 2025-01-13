-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2024 at 10:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airbnb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `book_airbnb` (IN `username` VARCHAR(20), IN `airbnbid` INT(10), IN `totaldays` INT(10), IN `totalpeople` INT(10), IN `userid` INT(10), IN `checkin` DATE, IN `checkout` DATE, IN `user_status` VARCHAR(20))   BEGIN
	INSERT INTO user_booking_details VALUES (username,userid,airbnbid,totaldays,totalpeople,checkin,checkout,user_status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAirbnb` (IN `delete_id` INT(10))   BEGIN
	DELETE FROM airbnb_details WHERE Airbnb_id=delete_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsername_Host` (IN `user` VARCHAR(20), OUT `user_name` VARCHAR(20), OUT `user_password` VARCHAR(20), IN `password_1` VARCHAR(20))   BEGIN
	SELECT hostname,password INTO user_name,user_password FROM host_login_details where hostname=user AND password=password_1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsername_User` (IN `user` VARCHAR(20), IN `password` VARCHAR(20), OUT `user_name1` VARCHAR(20), OUT `password_1` VARCHAR(20), OUT `userid` INT(10))   BEGIN

SELECT user_name,user_password,User_id INTO user_name1,password_1,userid FROM user_login_details where user_name=user AND user_password=password;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDetails` (IN `id` INT(10), IN `name` VARCHAR(20), IN `location` VARCHAR(20), IN `owner` VARCHAR(20), IN `price` INT(10), IN `bhk` INT(10), IN `capacity` INT(10), IN `rating` INT(10), IN `hostname` VARCHAR(20), IN `type` VARCHAR(20))   BEGIN
INSERT INTO airbnb_details(Airbnb_id, Airbnb_name, Airbnb_location,Airbnb_type, Airbnb_Owner, Airbnb_price,Airbnb_bhk,Airbnb_capacity,Airbnb_rating) VALUES (id,name,location,type,owner,price,bhk,capacity,rating);
INSERT INTO host_airbnb_details(host_username,Airbnb_id) VALUES (hostname,id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDetails` (IN `id` INT(10), IN `new_name` VARCHAR(20), IN `new_location` VARCHAR(20), IN `new_owner` VARCHAR(20), IN `new_price` INT(10), IN `new_bhk` INT(10), IN `new_capacity` INT(10), IN `new_rating` INT(10), IN `new_type` VARCHAR(20))   BEGIN

	UPDATE airbnb_details SET Airbnb_id=id,Airbnb_name=new_name , Airbnb_location=new_location , Airbnb_Owner=new_owner,Airbnb_price=new_price,Airbnb_bhk=new_bhk,Airbnb_capacity=new_capacity,Airbnb_rating=new_rating,Airbnb_type=new_type WHERE Airbnb_id=id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAirbnb` ()   BEGIN
	SELECT * FROM airbnb_details;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAirbnbBhk` ()   BEGIN 
SELECT * FROM airbnb_details ORDER BY Airbnb_bhk;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAirbnbRating` ()   BEGIN

SELECT * FROM airbnb_details ORDER BY Airbnb_rating DESC;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `viewAirbnbwithWifi` ()   BEGIN
	SELECT * FROM airbnb_details WHERE Airbnb_wifi=true;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_details`
--

CREATE TABLE `admin_login_details` (
  `Admin_username` varchar(50) NOT NULL,
  `Admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_login_details`
--

INSERT INTO `admin_login_details` (`Admin_username`, `Admin_password`) VALUES
('Demo', 'demo');

-- --------------------------------------------------------

--
-- Table structure for table `airbnb_details`
--

CREATE TABLE `airbnb_details` (
  `Airbnb_id` int(10) NOT NULL,
  `Airbnb_name` varchar(20) NOT NULL,
  `Airbnb_location` varchar(20) NOT NULL,
  `Airbnb_type` varchar(20) NOT NULL,
  `Airbnb_Owner` varchar(20) NOT NULL,
  `Airbnb_price` int(10) NOT NULL,
  `Airbnb_availability` tinyint(1) NOT NULL DEFAULT 1,
  `Airbnb_wifi` tinyint(1) NOT NULL DEFAULT 1,
  `Airbnb_bhk` int(10) NOT NULL,
  `Airbnb_capacity` int(10) NOT NULL,
  `Airbnb_rating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airbnb_details`
--

INSERT INTO `airbnb_details` (`Airbnb_id`, `Airbnb_name`, `Airbnb_location`, `Airbnb_type`, `Airbnb_Owner`, `Airbnb_price`, `Airbnb_availability`, `Airbnb_wifi`, `Airbnb_bhk`, `Airbnb_capacity`, `Airbnb_rating`) VALUES
(2, 'Demo', 'New York,USA', 'Beach', 'ABC', 12000, 1, 1, 5, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `host_airbnb_details`
--

CREATE TABLE `host_airbnb_details` (
  `Host_username` varchar(20) NOT NULL,
  `Airbnb_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `host_airbnb_details`
--

INSERT INTO `host_airbnb_details` (`Host_username`, `Airbnb_id`) VALUES
('ABC', 2),
('Demo', 3);

-- --------------------------------------------------------

--
-- Table structure for table `host_details`
--

CREATE TABLE `host_details` (
  `Host_id` int(20) NOT NULL,
  `Host_name` varchar(20) NOT NULL,
  `Host_age` varchar(20) NOT NULL,
  `Host_mail` varchar(20) NOT NULL,
  `Host_phn` varchar(20) NOT NULL,
  `Host_govid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `host_login_details`
--

CREATE TABLE `host_login_details` (
  `Host_id` int(10) NOT NULL,
  `Hostname` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `host_login_details`
--

INSERT INTO `host_login_details` (`Host_id`, `Hostname`, `Password`) VALUES
(1, 'ABC', 'Abcd@1234'),
(3, 'Demo', 'demo');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `User_booking_id` int(10) NOT NULL,
  `Airbnb_id` int(10) NOT NULL,
  `Airbnb_price` int(10) NOT NULL,
  `Total_days` int(20) NOT NULL,
  `Payment_amount` int(10) NOT NULL,
  `Payment_mode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_booking_details`
--

CREATE TABLE `user_booking_details` (
  `User_booking_id` int(10) NOT NULL,
  `User_name` varchar(20) NOT NULL,
  `User_Id` int(10) NOT NULL,
  `Airbnb_id` int(10) NOT NULL,
  `No_of_days` int(10) NOT NULL,
  `No_of_people` int(10) NOT NULL,
  `Check_In` date DEFAULT NULL,
  `Check_Out` date NOT NULL,
  `User_status` varchar(50) NOT NULL,
  `User_payment_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_creditcard_details`
--

CREATE TABLE `user_creditcard_details` (
  `Credit_No` int(20) NOT NULL,
  `Credit_Expiry` date NOT NULL,
  `Credit_Cvv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_id` int(10) NOT NULL,
  `User_name` varchar(20) NOT NULL,
  `User_gender` varchar(20) NOT NULL,
  `User_mail` varchar(20) NOT NULL,
  `User_phnno` varchar(20) NOT NULL,
  `User_govid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_id`, `User_name`, `User_gender`, `User_mail`, `User_phnno`, `User_govid`) VALUES
(7, 'demo1', 'male', 'dsgas@mail.com', '1234567890', 'g5rg');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_details`
--

CREATE TABLE `user_login_details` (
  `User_Id` int(10) NOT NULL,
  `User_name` varchar(20) NOT NULL,
  `User_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login_details`
--

INSERT INTO `user_login_details` (`User_Id`, `User_name`, `User_password`) VALUES
(14, 'demo', 'demo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airbnb_details`
--
ALTER TABLE `airbnb_details`
  ADD PRIMARY KEY (`Airbnb_id`);

--
-- Indexes for table `host_details`
--
ALTER TABLE `host_details`
  ADD PRIMARY KEY (`Host_id`);

--
-- Indexes for table `host_login_details`
--
ALTER TABLE `host_login_details`
  ADD PRIMARY KEY (`Host_id`),
  ADD UNIQUE KEY `Hostname` (`Hostname`);

--
-- Indexes for table `user_booking_details`
--
ALTER TABLE `user_booking_details`
  ADD PRIMARY KEY (`User_booking_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `user_login_details`
--
ALTER TABLE `user_login_details`
  ADD PRIMARY KEY (`User_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `host_details`
--
ALTER TABLE `host_details`
  MODIFY `Host_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `host_login_details`
--
ALTER TABLE `host_login_details`
  MODIFY `Host_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_booking_details`
--
ALTER TABLE `user_booking_details`
  MODIFY `User_booking_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `User_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_login_details`
--
ALTER TABLE `user_login_details`
  MODIFY `User_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
