-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 07:52 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sibook`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reserveId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `restoId` int(11) NOT NULL,
  `reserveDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reserveId`, `userId`, `restoId`, `reserveDate`, `startTime`, `endTime`, `quantity`) VALUES
(1, 1, 1, '2022-06-01', '12:00:00', '14:00:00', 5),
(2, 1, 2, '2022-06-16', '13:00:00', '14:00:00', 7),
(3, 2, 3, '2022-05-16', '13:00:00', '14:00:00', 2),
(4, 3, 4, '2022-12-12', '15:00:00', '18:00:00', 3),
(10, 1, 7, '2022-06-20', '14:00:00', '16:00:00', 6),
(11, 6, 1, '2022-05-01', '14:00:00', '15:00:00', 6),
(12, 6, 8, '2022-06-14', '17:00:00', '19:00:00', 4),
(13, 3, 1, '2022-06-20', '13:00:00', '17:00:00', 16),
(14, 3, 3, '2022-06-10', '18:00:00', '18:30:00', 1),
(15, 3, 9, '2022-06-30', '16:00:00', '18:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restoId` int(11) NOT NULL,
  `restoName` varchar(255) NOT NULL,
  `restoAddress` varchar(255) NOT NULL,
  `restoDescr` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `openTime` time NOT NULL,
  `closeTime` time NOT NULL,
  `urlImage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restoId`, `restoName`, `restoAddress`, `restoDescr`, `capacity`, `openTime`, `closeTime`, `urlImage`) VALUES
(1, 'KFC', 'Sunter', 'Jagonya Ayam', 100, '10:00:00', '21:00:00', 'assets/kfc.jpg'),
(2, 'MCD', 'Kemanggisan', 'I\'m Lovin it', 150, '10:00:00', '22:00:00', 'assets/mcd.jpg'),
(3, 'Janji Jiwa', 'Kebon Jeruk', 'Kopi dari Hati', 80, '11:00:00', '23:00:00', 'assets/janjijiwa.jpg'),
(4, 'Mujigae', 'Senopati', 'restoran Korea pertama di Indonesia yang mendapatkan sertifikasi halal MUI', 50, '10:00:00', '22:00:00', 'assets/mujigae.jpg'),
(5, 'Mixue', 'Rawamangun', 'Share sweetness Spread happiness', 20, '10:00:00', '22:00:00', 'assets/mixue.jpg'),
(6, 'Hokben', 'Kalideres', 'Share To Love, Love To Share', 110, '10:00:00', '22:00:00', 'assets/hokben.jpg'),
(7, 'Marugame Udon', 'Pantai Indah Kapuk', 'Freshly Cooked Udon & Tempura', 100, '10:00:00', '22:00:00', 'assets/marugame.jpg'),
(8, 'Burger King', 'Cipayung', 'It just tastes better', 125, '10:00:00', '22:00:00', 'assets/burgerking.jpg'),
(9, 'Wingstop', 'Cibubur', 'Where Flavor Gets Its Wings', 100, '10:00:00', '22:00:00', 'assets/wingstop.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `email`, `name`, `dateOfBirth`, `gender`, `phone`, `password`) VALUES
(1, 'Alvin@email.com', 'Alvin Matthew', '2000-06-01', 'M', '081234567', 'password'),
(2, 'Merlyn@email.com', 'Merlyn Gracia', '2000-04-01', 'F', '123456789', 'pass'),
(3, 'Najam@email.com', 'Ihsan Najam', '2000-03-01', 'M', '0823456789', 'bambang'),
(4, 'Eloise@email.com', 'Eloise Yemima', '2000-01-01', 'F', '0813456789', 'password'),
(5, 'Clarissa@email.com', 'Clarissa Jocelyn', '2000-09-01', 'F', '0856789012', 'password'),
(6, 'nicole@gmail.com', 'Nicole Zefanya', '1999-02-02', 'F', '08234567890', 'password1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reserveId`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restoId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reserveId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
