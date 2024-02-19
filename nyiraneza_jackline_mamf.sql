-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 09:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nyiraneza_jackline_mamf`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteOrdersByStatus` (IN `p_OrderStatus` VARCHAR(20))   BEGIN
    DELETE FROM Orders
    WHERE OrderStatus = p_OrderStatus;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayAllFarmersInfo` ()   BEGIN
    SELECT * FROM Farmers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FarmersWithHighestFarmSizes` ()   BEGIN
    SELECT FarmerID, FirstName, LastName, FarmSize
    FROM Farmers
    WHERE FarmSize = (SELECT MAX(FarmSize) FROM Farmers);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFarmer` (IN `p_FirstName` VARCHAR(50), IN `p_LastName` VARCHAR(50), IN `p_ContactNumber` VARCHAR(20), IN `p_Email` VARCHAR(100), IN `p_FarmLocation` VARCHAR(255), IN `p_FarmSize` DECIMAL(10,2), IN `p_MembershipStatus` VARCHAR(20))   BEGIN
    INSERT INTO Farmers (FirstName, LastName, ContactNumber, Email, FarmLocation, FarmSize, MembershipStatus)
    VALUES (p_FirstName, p_LastName, p_ContactNumber, p_Email, p_FarmLocation, p_FarmSize, p_MembershipStatus);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFarmerEmail` (IN `p_FarmerID` INT, IN `p_NewEmail` VARCHAR(100))   BEGIN
    UPDATE Farmers
    SET Email = p_NewEmail
    WHERE FarmerID = p_FarmerID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('admin@gmail.com', '000');

-- --------------------------------------------------------

--
-- Table structure for table `analyticsusagedata`
--

CREATE TABLE `analyticsusagedata` (
  `AnalyticsID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `ProductsViewed` int(11) DEFAULT NULL,
  `ProductsPurchased` int(11) DEFAULT NULL,
  `SearchQueries` int(11) DEFAULT NULL,
  `AppUsageStatistics` text DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `deleteordersbystatus`
-- (See below for the actual view)
--
CREATE TABLE `deleteordersbystatus` (
`OrderID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `farmers1`
--

CREATE TABLE `farmers1` (
  `FormerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmers1`
--

INSERT INTO `farmers1` (`FormerID`, `FirstName`, `LastName`, `Email`, `password`) VALUES
(1, 'Nepo', 'HabyaraMana', 'nepo@gmail.com', '1234'),
(2, 'danny', 'byungura', 'byungura@gmail.com', '1234'),
(3, 'derik', 'umwiza', 'umwiza@gmail.com', '1234'),
(4, 'yvette', 'isimbi', 'isimbi10@gmail.com', '1234'),
(9, 'jacky', 'ineza', 'jackynezaa@gmail.com', '1234'),
(10, 'diane', 'hagena', 'diane10@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `farmersassociations`
--

CREATE TABLE `farmersassociations` (
  `AssociationID` int(11) NOT NULL,
  `AssociationName` varchar(100) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `ContactEmail` varchar(100) DEFAULT NULL,
  `ContactPhone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmersassociations`
--

INSERT INTO `farmersassociations` (`AssociationID`, `AssociationName`, `Location`, `ContactPerson`, `ContactEmail`, `ContactPhone`) VALUES
(1, 'Farmers United', '456 Oak St', 'Jane Smith', 'jane@example.com', '987-654-3210');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacksupport`
--

CREATE TABLE `feedbacksupport` (
  `FeedbackID` int(11) NOT NULL,
  `FeedbackType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `geolocationdata`
--

CREATE TABLE `geolocationdata` (
  `LocationID` int(11) NOT NULL,
  `Latitude` decimal(9,6) DEFAULT NULL,
  `Longitude` decimal(9,6) DEFAULT NULL,
  `LocationName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(20) DEFAULT NULL,
  `FarmerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `Quantity`, `TotalPrice`, `OrderDate`, `OrderStatus`, `FarmerID`) VALUES
(1, 100, '1099.00', '2023-09-15', 'Completed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders1`
--

CREATE TABLE `orders1` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `OrderDate` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders1`
--

INSERT INTO `orders1` (`OrderID`, `CustomerID`, `ProductID`, `OrderDate`, `status`) VALUES
(1, 1, 1, 1, 'approved'),
(2, 1, 1, 1, 'approved'),
(3, 3, 2, 23, 'approved'),
(9, 10, 3, 23, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttransactions`
--

CREATE TABLE `paymenttransactions` (
  `TransactionID` int(11) NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `FarmerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymenttransactions`
--

INSERT INTO `paymenttransactions` (`TransactionID`, `PaymentMethod`, `Amount`, `PaymentStatus`, `PaymentDate`, `OrderID`, `FarmerID`) VALUES
(1, 'Credit Card', '1099.00', 'Paid', '2023-09-15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Name`, `Price`, `Quantity`) VALUES
(1, 'umurama', '100.00', 12),
(2, 'amashaza', '1000.00', 5),
(3, 'ibigori', '1500.00', 10),
(4, 'ibirayi', '6000.00', 10),
(5, 'umuceri', '20000.00', 11);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `UnitOfMeasurement` varchar(20) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `FarmerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Description`, `Price`, `UnitOfMeasurement`, `Availability`, `FarmerID`) VALUES
(1, 'Wheat', 'Crops', 'High-quality wheat grains', '10.99', 'kg', 1, 1);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `AfterDeleteProduct` AFTER DELETE ON `products` FOR EACH ROW BEGIN
    UPDATE Farmers
    SET ProductCount = ProductCount - 1
    WHERE FarmerID = OLD.FarmerID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterInsertProduct` AFTER INSERT ON `products` FOR EACH ROW BEGIN
    UPDATE Farmers
    SET ProductCount = ProductCount + 1
    WHERE FarmerID = NEW.FarmerID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `promotionsdiscounts`
--

CREATE TABLE `promotionsdiscounts` (
  `PromotionID` int(11) NOT NULL,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `FarmerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `Rating`, `Comment`, `ProductID`, `FarmerID`) VALUES
(1, 5, 'Excellent product!', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `AccountType` varchar(20) DEFAULT NULL,
  `ProfilePictureURL` varchar(255) DEFAULT NULL,
  `LastLoginDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `deleteordersbystatus`
--
DROP TABLE IF EXISTS `deleteordersbystatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `deleteordersbystatus`  AS SELECT `orders`.`OrderID` AS `OrderID` FROM `orders` WHERE `orders`.`OrderStatus` = 'Cancelled\'Cancelled''Cancelled\'Cancelled'  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
