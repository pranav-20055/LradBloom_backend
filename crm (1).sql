-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2025 at 05:39 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `average_interest_score` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`lead_id`, `customer_name`, `average_interest_score`, `created_at`) VALUES
(31, 'user1', '7.75', '2025-05-14 04:29:40'),
(32, 'user10', '8.25', '2025-05-14 04:29:40'),
(33, 'user11', '8.25', '2025-05-14 04:29:40'),
(34, 'user12', '8.50', '2025-05-14 04:29:40'),
(35, 'user13', '9.00', '2025-05-14 04:29:40'),
(36, 'user14', '8.50', '2025-05-14 04:29:40'),
(37, 'user15', '8.25', '2025-05-14 04:29:40'),
(38, 'user16', '9.50', '2025-05-14 04:29:40'),
(39, 'user17', '8.50', '2025-05-14 04:29:40'),
(40, 'user18', '8.67', '2025-05-14 04:29:40'),
(41, 'user19', '8.50', '2025-05-14 04:29:40'),
(42, 'user2', '8.75', '2025-05-14 04:29:40'),
(43, 'user20', '9.00', '2025-05-14 04:29:40'),
(44, 'user21', '8.20', '2025-05-14 04:29:40'),
(45, 'user22', '8.00', '2025-05-14 04:29:40'),
(46, 'user23', '8.80', '2025-05-14 04:29:40'),
(47, 'user24', '8.60', '2025-05-14 04:29:40'),
(48, 'user25', '8.00', '2025-05-14 04:29:40'),
(49, 'user26', '9.17', '2025-05-14 04:29:40'),
(50, 'user27', '8.20', '2025-05-14 04:29:40'),
(51, 'user28', '8.40', '2025-05-14 04:29:40'),
(52, 'user29', '8.50', '2025-05-14 04:29:40'),
(53, 'user3', '8.00', '2025-05-14 04:29:40'),
(54, 'user30', '8.67', '2025-05-14 04:29:40'),
(55, 'user4', '8.50', '2025-05-14 04:29:40'),
(56, 'user5', '8.50', '2025-05-14 04:29:40'),
(57, 'user6', '9.25', '2025-05-14 04:29:40'),
(58, 'user7', '8.50', '2025-05-14 04:29:40'),
(59, 'user8', '9.50', '2025-05-14 04:29:40'),
(60, 'user9', '7.75', '2025-05-14 04:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`org_id`, `org_name`, `email`, `contact_number`, `created_at`) VALUES
(9, 'APPLE', 'service@apple.com', '9855566677', '2025-05-12 14:32:22'),
(11, 'HP', 'support@hp.com', '9876543210', '2025-05-12 14:32:22'),
(13, 'SKAAR', 'hello@skaar.com', '9911122233', '2025-05-12 14:32:22'),
(22, 'LENOVO', 'info@lenovo.com', '9811122233', '2025-05-12 14:32:22'),
(23, 'LENSKART', 'care@lenskart.com', '9900011122', '2025-05-12 14:32:22'),
(27, 'CROCODILE', 'info@crocodile.com', '9944455566', '2025-05-12 14:32:22'),
(34, 'ZEBRONICS', 'contact@zebronics.com', '9822233344', '2025-05-12 14:32:22'),
(35, 'FIBERNET', 'help@fibernet.com', '9833344455', '2025-05-12 14:32:22'),
(56, 'ADIDAS', 'contact@adidas.com', '9888899900', '2025-05-12 14:32:22'),
(67, 'SONY', 'care@sony.com', '9844455566', '2025-05-12 14:32:22'),
(76, 'CANON', 'support@canon.com', '9899900011', '2025-05-12 14:32:22'),
(78, 'REDMI', 'info@redmi.com', '9877788899', '2025-05-12 14:32:22'),
(82, 'PHILIPS', 'service@philips.com', '9933344455', '2025-05-12 14:32:22'),
(90, 'TITAN', 'support@titan.com', '9922233344', '2025-05-12 14:32:22'),
(98, 'LG', 'lg@support.com', '9866677788', '2025-05-12 14:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `organization_sales`
--

CREATE TABLE `organization_sales` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `units_sold` int(11) DEFAULT 0,
  `income` decimal(15,2) DEFAULT 0.00,
  `report_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization_sales`
--

INSERT INTO `organization_sales` (`id`, `org_id`, `org_name`, `product_id`, `product_name`, `units_sold`, `income`, `report_date`) VALUES
(1, 9, 'APPLE', 'PRD0150', 'IPHONE 15 PROMAX', 20, '2000000.00', '2025-05-13'),
(2, 11, 'HP', 'PRD0170', 'HP VICTUS GAMING LAPTOP', 10, '89990.00', '2025-05-13'),
(3, 13, 'SKAAR', 'PRD0200', 'SKAAR SILVER CHAIN/RINGS', 10, '2000.00', '2025-05-13'),
(4, 22, 'LENOVO', 'PRD0020', 'LENOVO LAPTOP', 10, '650000.00', '2025-05-13'),
(5, 23, 'LENSKART', 'PRD0190', 'SUNGLASSES', 10, '4990.00', '2025-05-13'),
(6, 27, 'CROCODILE', 'PRD0290', 'CROCODILE FORMAL SHIRTS', 10, '35990.00', '2025-05-13'),
(7, 34, 'ZEBRONICS', 'PRD0090', 'ZEBRONIC MOUSE/KEYBOARD', 10, '24990.00', '2025-05-13'),
(8, 35, 'FIBERNET', 'PRD0040', 'FIBERNET ROUTER', 10, '45990.00', '2025-05-13'),
(9, 56, 'ADIDAS', 'PRD0140', 'ADIDAS SHOES', 10, '69990.00', '2025-05-13'),
(10, 67, 'SONY', 'PRD0060', 'SONY HEADPHONES', 10, '59990.00', '2025-05-13'),
(11, 76, 'CANON', 'PRD0160', 'CANON DSLR', 10, '5000000.00', '2025-05-13'),
(12, 78, 'REDMI', 'PRD0240', 'REDMI NOTE 13', 10, '250000.00', '2025-05-13'),
(13, 82, 'PHILIPS', 'PRD0280', 'PHILIPS LED LIGHTS', 10, '990.00', '2025-05-13'),
(14, 90, 'TITAN', 'PRD0260', 'TITAN GOLDEN WATCHES', 10, '20000.00', '2025-05-13'),
(15, 98, 'LG', 'PRD0100', 'LG WASHING MACHINE', 10, '100000.00', '2025-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `org_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `product_name`, `price`, `org_id`, `created_at`) VALUES
(1, 'PRD0010', 'HP PRINTER', '15000.00', 11, '2025-05-12 14:39:55'),
(2, 'PRD0020', 'LENOVO LAPTOP', '65000.00', 22, '2025-05-12 14:39:55'),
(3, 'PRD0030', 'ZEBRONICS WIRELESS MOUSE', '1200.00', 34, '2025-05-12 14:39:55'),
(4, 'PRD0040', 'FIBERNET ROUTER', '4599.00', 35, '2025-05-12 14:39:55'),
(5, 'PRD0060', 'SONY HEADPHONES', '5999.00', 67, '2025-05-12 14:39:55'),
(6, 'PRD0070', 'AIR3 IPAD', '75000.00', 9, '2025-05-12 14:39:55'),
(7, 'PRD0080', '24INCH TELIVISION HP MONITOR', '85000.00', 11, '2025-05-12 14:39:55'),
(8, 'PRD0090', 'ZEBRONIC MOUSE/KEYBOARD', '2499.00', 34, '2025-05-12 14:39:55'),
(9, 'PRD0100', 'LG WASHING MACHINE', '10000.00', 98, '2025-05-12 14:39:55'),
(10, 'PRD0110', 'LG FRIDGE', '25999.00', 98, '2025-05-12 14:39:55'),
(11, 'PRD0120', 'REDMI NOTE 11', '30000.00', 78, '2025-05-12 14:39:55'),
(12, 'PRD0130', 'APPLE AIRPODS', '4999.00', 9, '2025-05-12 14:39:55'),
(13, 'PRD0140', 'ADIDAS SHOES', '6999.00', 56, '2025-05-12 14:39:55'),
(14, 'PRD0150', 'IPHONE 15 PROMAX', '100000.00', 9, '2025-05-12 14:39:55'),
(15, 'PRD0160', 'CANON DSLR', '500000.00', 76, '2025-05-12 14:39:55'),
(16, 'PRD0170', 'HP VICTUS GAMING LAPTOP', '8999.00', 11, '2025-05-12 14:39:55'),
(17, 'PRD0180', 'LG AIR CONDITIONER', '17000.00', 98, '2025-05-12 14:39:55'),
(18, 'PRD0190', 'SUNGLASSES', '499.00', 23, '2025-05-12 14:39:55'),
(19, 'PRD0200', 'SKAAR SILVER CHAIN/RINGS', '200.00', 13, '2025-05-12 14:39:55'),
(20, 'PRD0210', 'TITAN SILVER WATCH', '1999.00', 90, '2025-05-12 14:39:55'),
(21, 'PRD0220', 'SONY BRAVIA TV 44.5 INCH', '34999.00', 67, '2025-05-12 14:39:55'),
(22, 'PRD0230', 'IPHONE 16 PRO/PRO MAX', '140000.00', 9, '2025-05-12 14:39:55'),
(23, 'PRD0240', 'REDMI NOTE 13', '25000.00', 78, '2025-05-12 14:39:55'),
(24, 'PRD0250', 'HP PAVILION GAMING LAPTOP', '65000.00', 11, '2025-05-12 14:39:55'),
(25, 'PRD0260', 'TITAN GOLDEN WATCHES', '2000.00', 90, '2025-05-12 14:39:55'),
(26, 'PRD0270', 'REDMI EARBUDS PRO', '1500.00', 78, '2025-05-12 14:39:55'),
(27, 'PRD0280', 'PHILIPS LED LIGHTS', '99.00', 82, '2025-05-12 14:39:55'),
(28, 'PRD0290', 'CROCODILE FORMAL SHIRTS', '3599.00', 27, '2025-05-12 14:39:55'),
(29, 'PRD0300', 'PHILIPS REMOTE FANS/AIR COOLERS', '3599.00', 82, '2025-05-12 14:39:55'),
(30, 'PRD0310', 'SKAAR WOMEN WEARINGS', '299.00', 13, '2025-05-12 14:39:55'),
(31, 'PRD0330', 'GO PRO CAM V2.0', '100000.00', 76, '2025-05-12 14:39:55'),
(32, 'PRD0001', 'CROCODILE PANTS', '2000.00', 27, '2025-05-12 14:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_engagement`
--

CREATE TABLE `product_engagement` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `liked` tinyint(1) DEFAULT 0,
  `interest_score` int(11) DEFAULT NULL CHECK (`interest_score` between 1 and 10),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_engagement`
--

INSERT INTO `product_engagement` (`id`, `user_id`, `product_id`, `liked`, `interest_score`, `created_at`) VALUES
(1, 1, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(2, 2, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(3, 3, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(4, 4, 'PRD0150', 1, 8, '2025-05-13 04:33:15'),
(5, 5, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(6, 6, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(7, 7, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(8, 8, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(9, 9, 'PRD0150', 1, 8, '2025-05-13 04:33:15'),
(10, 10, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(11, 11, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(12, 12, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(13, 13, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(14, 14, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(15, 15, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(16, 16, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(17, 17, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(18, 18, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(19, 19, 'PRD0150', 1, 10, '2025-05-13 04:33:15'),
(20, 20, 'PRD0150', 1, 9, '2025-05-13 04:33:15'),
(21, 21, 'PRD0240', 1, 7, '2025-05-13 04:34:07'),
(22, 22, 'PRD0240', 1, 8, '2025-05-13 04:34:07'),
(23, 23, 'PRD0240', 1, 7, '2025-05-13 04:34:07'),
(24, 24, 'PRD0240', 1, 8, '2025-05-13 04:34:07'),
(25, 25, 'PRD0240', 1, 7, '2025-05-13 04:34:07'),
(26, 26, 'PRD0170', 1, 8, '2025-05-13 04:34:07'),
(27, 27, 'PRD0170', 1, 9, '2025-05-13 04:34:07'),
(28, 28, 'PRD0170', 1, 8, '2025-05-13 04:34:07'),
(29, 29, 'PRD0160', 1, 9, '2025-05-13 04:34:07'),
(30, 30, 'PRD0160', 1, 8, '2025-05-13 04:34:07'),
(31, 1, 'PRD0170', 1, 8, '2025-05-13 07:02:33'),
(32, 2, 'PRD0170', 1, 9, '2025-05-13 07:02:33'),
(33, 3, 'PRD0170', 1, 7, '2025-05-13 07:02:33'),
(34, 4, 'PRD0170', 1, 8, '2025-05-13 07:02:33'),
(35, 5, 'PRD0170', 1, 9, '2025-05-13 07:02:33'),
(36, 6, 'PRD0170', 1, 8, '2025-05-13 07:02:33'),
(37, 7, 'PRD0170', 1, 9, '2025-05-13 07:02:33'),
(38, 8, 'PRD0170', 1, 10, '2025-05-13 07:02:33'),
(39, 9, 'PRD0170', 1, 7, '2025-05-13 07:02:33'),
(40, 10, 'PRD0170', 1, 8, '2025-05-13 07:02:33'),
(41, 11, 'PRD0020', 1, 8, '2025-05-13 07:02:33'),
(42, 12, 'PRD0020', 1, 9, '2025-05-13 07:02:33'),
(43, 13, 'PRD0020', 1, 9, '2025-05-13 07:02:33'),
(44, 14, 'PRD0020', 1, 7, '2025-05-13 07:02:33'),
(45, 15, 'PRD0020', 1, 8, '2025-05-13 07:02:33'),
(46, 16, 'PRD0020', 1, 10, '2025-05-13 07:02:33'),
(47, 17, 'PRD0020', 1, 7, '2025-05-13 07:02:33'),
(48, 18, 'PRD0020', 1, 9, '2025-05-13 07:02:33'),
(49, 19, 'PRD0020', 1, 8, '2025-05-13 07:02:33'),
(50, 20, 'PRD0020', 1, 8, '2025-05-13 07:02:33'),
(51, 21, 'PRD0030', 1, 8, '2025-05-13 07:02:33'),
(52, 22, 'PRD0030', 1, 7, '2025-05-13 07:02:33'),
(53, 23, 'PRD0030', 1, 9, '2025-05-13 07:02:33'),
(54, 24, 'PRD0030', 1, 9, '2025-05-13 07:02:33'),
(55, 25, 'PRD0030', 1, 8, '2025-05-13 07:02:33'),
(56, 26, 'PRD0030', 1, 9, '2025-05-13 07:02:33'),
(57, 27, 'PRD0030', 1, 8, '2025-05-13 07:02:33'),
(58, 28, 'PRD0030', 1, 7, '2025-05-13 07:02:33'),
(59, 29, 'PRD0030', 1, 9, '2025-05-13 07:02:33'),
(60, 30, 'PRD0030', 1, 8, '2025-05-13 07:02:33'),
(61, 1, 'PRD0040', 1, 7, '2025-05-13 07:02:33'),
(62, 2, 'PRD0040', 1, 8, '2025-05-13 07:02:33'),
(63, 3, 'PRD0040', 1, 8, '2025-05-13 07:02:33'),
(64, 4, 'PRD0040', 1, 9, '2025-05-13 07:02:33'),
(65, 5, 'PRD0040', 1, 9, '2025-05-13 07:02:33'),
(66, 6, 'PRD0040', 1, 10, '2025-05-13 07:02:33'),
(67, 7, 'PRD0040', 1, 8, '2025-05-13 07:02:33'),
(68, 8, 'PRD0040', 1, 9, '2025-05-13 07:02:33'),
(69, 9, 'PRD0040', 1, 7, '2025-05-13 07:02:33'),
(70, 10, 'PRD0040', 1, 8, '2025-05-13 07:02:33'),
(71, 11, 'PRD0060', 1, 8, '2025-05-13 07:02:33'),
(72, 12, 'PRD0060', 1, 7, '2025-05-13 07:02:33'),
(73, 13, 'PRD0060', 1, 9, '2025-05-13 07:02:33'),
(74, 14, 'PRD0060', 1, 10, '2025-05-13 07:02:33'),
(75, 15, 'PRD0060', 1, 8, '2025-05-13 07:02:33'),
(76, 16, 'PRD0060', 1, 9, '2025-05-13 07:02:33'),
(77, 17, 'PRD0060', 1, 8, '2025-05-13 07:02:33'),
(78, 18, 'PRD0060', 1, 9, '2025-05-13 07:02:33'),
(79, 19, 'PRD0060', 1, 7, '2025-05-13 07:02:33'),
(80, 20, 'PRD0060', 1, 8, '2025-05-13 07:02:33'),
(81, 21, 'PRD0100', 1, 9, '2025-05-13 07:02:33'),
(82, 22, 'PRD0100', 1, 8, '2025-05-13 07:02:33'),
(83, 23, 'PRD0100', 1, 9, '2025-05-13 07:02:33'),
(84, 24, 'PRD0100', 1, 8, '2025-05-13 07:02:33'),
(85, 25, 'PRD0100', 1, 8, '2025-05-13 07:02:33'),
(86, 26, 'PRD0100', 1, 9, '2025-05-13 07:02:33'),
(87, 27, 'PRD0100', 1, 7, '2025-05-13 07:02:33'),
(88, 28, 'PRD0100', 1, 9, '2025-05-13 07:02:33'),
(89, 29, 'PRD0100', 1, 8, '2025-05-13 07:02:33'),
(90, 30, 'PRD0100', 1, 9, '2025-05-13 07:02:33'),
(91, 1, 'PRD0240', 1, 7, '2025-05-13 07:02:33'),
(92, 2, 'PRD0240', 1, 8, '2025-05-13 07:02:33'),
(93, 3, 'PRD0240', 1, 8, '2025-05-13 07:02:33'),
(94, 4, 'PRD0240', 1, 9, '2025-05-13 07:02:33'),
(95, 5, 'PRD0240', 1, 7, '2025-05-13 07:02:33'),
(96, 6, 'PRD0240', 1, 9, '2025-05-13 07:02:33'),
(97, 7, 'PRD0240', 1, 8, '2025-05-13 07:02:33'),
(98, 8, 'PRD0240', 1, 9, '2025-05-13 07:02:33'),
(99, 9, 'PRD0240', 1, 9, '2025-05-13 07:02:33'),
(100, 10, 'PRD0240', 1, 8, '2025-05-13 07:02:33'),
(101, 11, 'PRD0140', 1, 7, '2025-05-13 07:02:33'),
(102, 12, 'PRD0140', 1, 8, '2025-05-13 07:02:33'),
(103, 13, 'PRD0140', 1, 9, '2025-05-13 07:02:33'),
(104, 14, 'PRD0140', 1, 7, '2025-05-13 07:02:33'),
(105, 15, 'PRD0140', 1, 8, '2025-05-13 07:02:33'),
(106, 16, 'PRD0140', 1, 9, '2025-05-13 07:02:33'),
(107, 17, 'PRD0140', 1, 8, '2025-05-13 07:02:33'),
(108, 18, 'PRD0140', 1, 7, '2025-05-13 07:02:33'),
(109, 19, 'PRD0140', 1, 9, '2025-05-13 07:02:33'),
(110, 20, 'PRD0140', 1, 9, '2025-05-13 07:02:33'),
(141, 26, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(142, 27, 'PRD0150', 1, 9, '2025-05-13 07:17:10'),
(143, 28, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(144, 29, 'PRD0150', 1, 9, '2025-05-13 07:17:10'),
(145, 30, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(146, 31, 'PRD0150', 1, 9, '2025-05-13 07:17:10'),
(147, 32, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(148, 33, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(149, 34, 'PRD0150', 1, 9, '2025-05-13 07:17:10'),
(150, 35, 'PRD0150', 1, 10, '2025-05-13 07:17:10'),
(151, 36, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(152, 37, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(153, 38, 'PRD0010', 1, 8, '2025-05-13 07:17:10'),
(154, 39, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(155, 40, 'PRD0010', 1, 10, '2025-05-13 07:17:10'),
(156, 41, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(157, 42, 'PRD0010', 1, 10, '2025-05-13 07:17:10'),
(158, 43, 'PRD0010', 1, 8, '2025-05-13 07:17:10'),
(159, 44, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(160, 45, 'PRD0010', 1, 9, '2025-05-13 07:17:10'),
(521, 29, 'PRD0170', 1, 9, '2025-05-13 07:36:44'),
(522, 30, 'PRD0170', 1, 8, '2025-05-13 07:36:44'),
(523, 31, 'PRD0170', 1, 7, '2025-05-13 07:36:44'),
(524, 32, 'PRD0170', 1, 10, '2025-05-13 07:36:44'),
(525, 33, 'PRD0170', 1, 9, '2025-05-13 07:36:44'),
(526, 34, 'PRD0170', 1, 8, '2025-05-13 07:36:44'),
(527, 35, 'PRD0170', 1, 9, '2025-05-13 07:36:44'),
(528, 36, 'PRD0170', 1, 9, '2025-05-13 07:36:44'),
(529, 37, 'PRD0200', 1, 9, '2025-05-13 07:36:44'),
(530, 38, 'PRD0200', 1, 10, '2025-05-13 07:36:44'),
(531, 39, 'PRD0200', 1, 8, '2025-05-13 07:36:44'),
(532, 40, 'PRD0200', 1, 9, '2025-05-13 07:36:44'),
(533, 41, 'PRD0200', 1, 10, '2025-05-13 07:36:44'),
(534, 42, 'PRD0200', 1, 8, '2025-05-13 07:36:44'),
(535, 43, 'PRD0200', 1, 7, '2025-05-13 07:36:44'),
(536, 44, 'PRD0200', 1, 9, '2025-05-13 07:36:44'),
(537, 45, 'PRD0200', 1, 8, '2025-05-13 07:36:44'),
(538, 46, 'PRD0200', 1, 10, '2025-05-13 07:36:44'),
(539, 18, 'PRD0300', 1, 9, '2025-05-13 07:36:44'),
(540, 20, 'PRD0300', 1, 10, '2025-05-13 07:36:44'),
(541, 22, 'PRD0300', 1, 8, '2025-05-13 07:36:44'),
(542, 24, 'PRD0300', 1, 9, '2025-05-13 07:36:44'),
(543, 26, 'PRD0300', 1, 10, '2025-05-13 07:36:44'),
(544, 28, 'PRD0300', 1, 8, '2025-05-13 07:36:44'),
(545, 30, 'PRD0300', 1, 9, '2025-05-13 07:36:44'),
(546, 32, 'PRD0300', 1, 9, '2025-05-13 07:36:44'),
(547, 34, 'PRD0300', 1, 7, '2025-05-13 07:36:44'),
(548, 36, 'PRD0300', 1, 9, '2025-05-13 07:36:44'),
(549, 17, 'PRD0310', 1, 10, '2025-05-13 07:36:44'),
(550, 19, 'PRD0310', 1, 8, '2025-05-13 07:36:44'),
(551, 21, 'PRD0310', 1, 9, '2025-05-13 07:36:44'),
(552, 23, 'PRD0310', 1, 9, '2025-05-13 07:36:44'),
(553, 25, 'PRD0310', 1, 10, '2025-05-13 07:36:44'),
(554, 27, 'PRD0310', 1, 8, '2025-05-13 07:36:44'),
(555, 29, 'PRD0310', 1, 7, '2025-05-13 07:36:44'),
(556, 31, 'PRD0310', 1, 10, '2025-05-13 07:36:44'),
(557, 33, 'PRD0310', 1, 9, '2025-05-13 07:36:44'),
(558, 35, 'PRD0310', 1, 8, '2025-05-13 07:36:44'),
(559, 17, 'PRD0330', 1, 9, '2025-05-13 07:36:44'),
(560, 18, 'PRD0330', 1, 8, '2025-05-13 07:36:44'),
(561, 19, 'PRD0330', 1, 9, '2025-05-13 07:36:44'),
(562, 20, 'PRD0330', 1, 10, '2025-05-13 07:36:44'),
(563, 21, 'PRD0330', 1, 8, '2025-05-13 07:36:44'),
(564, 22, 'PRD0330', 1, 9, '2025-05-13 07:36:44'),
(565, 23, 'PRD0330', 1, 10, '2025-05-13 07:36:44'),
(566, 24, 'PRD0330', 1, 9, '2025-05-13 07:36:44'),
(567, 25, 'PRD0330', 1, 7, '2025-05-13 07:36:44'),
(568, 26, 'PRD0330', 1, 9, '2025-05-13 07:36:44'),
(613, 3, 'PRD0010', 1, NULL, '2025-05-13 08:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','organization','user') DEFAULT 'user',
  `org_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `org_id`, `created_at`) VALUES
(1, 'admin1', 'admin@123', 'admin', NULL, '2025-05-13 03:11:49'),
(2, 'org_hp', 'org@123', 'organization', 11, '2025-05-13 03:12:04'),
(3, 'org_lenovo', 'org@123', 'organization', 22, '2025-05-13 03:12:04'),
(4, 'org_zebronics', 'org@123', 'organization', 34, '2025-05-13 03:12:04'),
(5, 'org_fibernet', 'org@123', 'organization', 35, '2025-05-13 03:12:04'),
(6, 'org_sony', 'org@123', 'organization', 67, '2025-05-13 03:12:04'),
(7, 'org_apple', 'org@123', 'organization', 9, '2025-05-13 03:12:04'),
(8, 'org_lg', 'org@123', 'organization', 98, '2025-05-13 03:12:04'),
(9, 'org_redmi', 'org@123', 'organization', 78, '2025-05-13 03:12:04'),
(10, 'org_adidas', 'org@123', 'organization', 56, '2025-05-13 03:12:04'),
(11, 'org_canon', 'org@123', 'organization', 76, '2025-05-13 03:12:04'),
(12, 'org_lenskart', 'org@123', 'organization', 23, '2025-05-13 03:12:04'),
(13, 'org_skaar', 'org@123', 'organization', 13, '2025-05-13 03:12:04'),
(14, 'org_titan', 'org@123', 'organization', 90, '2025-05-13 03:12:04'),
(15, 'org_philips', 'org@123', 'organization', 82, '2025-05-13 03:12:04'),
(16, 'org_crocodile', 'org@123', 'organization', 27, '2025-05-13 03:12:04'),
(17, 'user1', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(18, 'user2', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(19, 'user3', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(20, 'user4', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(21, 'user5', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(22, 'user6', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(23, 'user7', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(24, 'user8', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(25, 'user9', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(26, 'user10', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(27, 'user11', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(28, 'user12', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(29, 'user13', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(30, 'user14', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(31, 'user15', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(32, 'user16', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(33, 'user17', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(34, 'user18', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(35, 'user19', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(36, 'user20', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(37, 'user21', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(38, 'user22', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(39, 'user23', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(40, 'user24', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(41, 'user25', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(42, 'user26', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(43, 'user27', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(44, 'user28', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(45, 'user29', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(46, 'user30', 'welcome', 'user', NULL, '2025-05-13 03:12:26'),
(48, 'org_iqoo', 'org@123', 'organization', NULL, '2025-05-13 03:32:32'),
(49, 'org@dell', 'org@123', 'organization', NULL, '2025-05-13 03:49:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`lead_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`org_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `organization_sales`
--
ALTER TABLE `organization_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`),
  ADD KEY `org_id` (`org_id`);

--
-- Indexes for table `product_engagement`
--
ALTER TABLE `product_engagement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `lead_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `organization_sales`
--
ALTER TABLE `organization_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_engagement`
--
ALTER TABLE `product_engagement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=618;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `organization_sales`
--
ALTER TABLE `organization_sales`
  ADD CONSTRAINT `organization_sales_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`org_id`),
  ADD CONSTRAINT `organization_sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`org_id`);

--
-- Constraints for table `product_engagement`
--
ALTER TABLE `product_engagement`
  ADD CONSTRAINT `product_engagement_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_engagement_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
