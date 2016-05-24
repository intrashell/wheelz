
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE SCHEMA IF NOT EXISTS `wheelz` CHARSET=utf8;

USE `wheelz`;

--
-- Database: `wheelz`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `suite` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zip` int(11) NOT NULL,
  `state` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `lastDate` date NOT NULL,
  `LastTime` time NOT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `AddressID` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE IF NOT EXISTS `commands` (
  `CommandID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `function` text COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`CommandID`),
  UNIQUE KEY `CommandID` (`CommandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE IF NOT EXISTS `drivers` (
  `DriverID` int(11) NOT NULL AUTO_INCREMENT,
  `smsNumber` int(11) NOT NULL,
  `firstName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AddressID` int(11) NOT NULL,
  `user` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `pseudo` tinyint(1) NOT NULL,
  `preferred` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `driverPic` blob NOT NULL,
  `carPic` blob NOT NULL,
  `MemberID` int(11) NOT NULL,
  `BackgroundID` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`DriverID`),
  UNIQUE KEY `DriverID` (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `FavoriteID` int(11) NOT NULL AUTO_INCREMENT,
  `RiderID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`FavoriteID`),
  UNIQUE KEY `FavoriteID` (`FavoriteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `FeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `ReceiverID` int(11) NOT NULL,
  `ProviderID` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `rating` int(11) NOT NULL,
  `sentDate` date NOT NULL,
  `sentTime` time NOT NULL,
  `readDate` date DEFAULT NULL,
  `readTime` time DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  UNIQUE KEY `FeedbackID` (`FeedbackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `RiderID` int(11) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SMSID` int(11) DEFAULT NULL,
  `CommandID` int(11) DEFAULT NULL,
  `QueueID` int(11) DEFAULT NULL,
  `MessageID` int(11) DEFAULT NULL,
  `FeedbackID` int(11) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `file` text NOT NULL,
  `class` text NOT NULL,
  `method` text NOT NULL,
  `line` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`LogID`),
  UNIQUE KEY `LogID` (`LogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL,
  `ReceiverID` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `sentDate` date NOT NULL,
  `sentTime` time NOT NULL,
  `readDate` date DEFAULT NULL,
  `readTime` time DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  UNIQUE KEY `MessageID` (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE IF NOT EXISTS `queue` (
  `QueueID` int(11) NOT NULL AUTO_INCREMENT,
  `type` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `RiderID` int(11) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`QueueID`),
  UNIQUE KEY `QueueID` (`QueueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riders`
--

CREATE TABLE IF NOT EXISTS `riders` (
  `RiderID` int(11) NOT NULL AUTO_INCREMENT,
  `smsNumber` int(11) NOT NULL,
  `firstName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AddressID` int(11) NOT NULL,
  `picture` blob NOT NULL,
  `MemberID` int(11) NOT NULL,
  `userName` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pass` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pseudo` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`RiderID`),
  UNIQUE KEY `RiderID` (`RiderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `SMSID` int(11) NOT NULL AUTO_INCREMENT,
  `CommandID` int(11) NOT NULL,
  `RiderID` int(11) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `website` text CHARACTER SET utf8 COLLATE utf8_bin,
  `messageSent` text CHARACTER SET utf8 COLLATE utf8_bin,
  `messageReceived` text CHARACTER SET utf8 COLLATE utf8_bin,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`SMSID`),
  UNIQUE KEY `SMSID` (`SMSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `RiderID` int(11) NOT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `charged` decimal(3,2) DEFAULT NULL,
  `paid` decimal(3,2) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  UNIQUE KEY `TransactionID` (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `pass` char(32) NOT NULL,
  `first` text NOT NULL,
  `last` text NOT NULL,
  `permissions` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `lastDate` date NOT NULL,
  `lastTime` time NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

