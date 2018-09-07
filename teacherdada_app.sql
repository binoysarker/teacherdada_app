-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2018 at 02:01 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teacherdada_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'My Site',
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_google_analytics` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `site_currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `site_currency_format` enum('front','back') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'front',
  `site_keywords` text COLLATE utf8mb4_unicode_ci,
  `site_enable_affiliate` tinyint(1) NOT NULL DEFAULT '1',
  `footer_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricelist` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10,20,30,40,50,60,70,80,90,100',
  `payment_enable_paypal` tinyint(1) NOT NULL DEFAULT '1',
  `payment_enable_stripe` tinyint(1) NOT NULL DEFAULT '1',
  `payment_enable_braintree` tinyint(1) NOT NULL DEFAULT '0',
  `payment_enable_pay_with_razorpay` tinyint(4) NOT NULL DEFAULT '0',
  `payment_enable_pay_with_account_balance` tinyint(1) NOT NULL DEFAULT '1',
  `payment_enable_omise` tinyint(1) NOT NULL DEFAULT '0',
  `video_upload_location` enum('s3','local') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `video_max_size` int(11) NOT NULL DEFAULT '100',
  `video_allow_upload` tinyint(1) NOT NULL DEFAULT '1',
  `video_allow_youtube` tinyint(1) NOT NULL DEFAULT '0',
  `video_allow_vimeo` tinyint(1) NOT NULL DEFAULT '0',
  `earning_organic_sales_percentage` decimal(8,2) NOT NULL DEFAULT '40.00',
  `earning_promo_sales_percentage` decimal(8,2) NOT NULL DEFAULT '75.00',
  `earning_minimum_payout_amount` decimal(8,2) NOT NULL DEFAULT '50.00',
  `earning_affiliate_sales_percentage` decimal(8,2) NOT NULL DEFAULT '30.00',
  `earning_affiliate_cookie_lifetime` int(11) NOT NULL DEFAULT '1440',
  `receipt_address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `site_name`, `site_logo`, `site_description`, `site_favicon`, `site_google_analytics`, `site_currency_code`, `site_currency_symbol`, `site_currency_format`, `site_keywords`, `site_enable_affiliate`, `footer_facebook`, `footer_twitter`, `footer_instagram`, `pricelist`, `payment_enable_paypal`, `payment_enable_stripe`, `payment_enable_braintree`, `payment_enable_pay_with_razorpay`, `payment_enable_pay_with_account_balance`, `payment_enable_omise`, `video_upload_location`, `video_max_size`, `video_allow_upload`, `video_allow_youtube`, `video_allow_vimeo`, `earning_organic_sales_percentage`, `earning_promo_sales_percentage`, `earning_minimum_payout_amount`, `earning_affiliate_sales_percentage`, `earning_affiliate_cookie_lifetime`, `receipt_address`, `created_at`, `updated_at`, `site_tax`) VALUES
(1, 'TeacherDada', '/img/1522755531_1520439759_teacherdada2.png', 'Online Learning Management System', '/img/1518788803_favicon_57x57--2017_09_20__06_12_22.png', NULL, 'USD', '₹', 'front', 'online, education, learning, teachers, tutors, dada, study', 0, 'S3India', 'S3India', 'S3India', '10,20,30,40,50,60,70,80,90,100', 0, 0, 0, 1, 1, 0, 'local', 1200, 1, 0, 0, '70.00', '75.00', '50.00', '25.00', 1440, 'A/501, Maitri Residency,<br />\nLiberty Garden Road No.1,<br />\nMalad West, Mumbai-400064', '2018-01-21 19:38:42', '2018-04-03 11:38:51', '10');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_course`
--

CREATE TABLE `announcement_course` (
  `id` int(10) UNSIGNED NOT NULL,
  `announcement_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approvals`
--

CREATE TABLE `approvals` (
  `id` int(10) UNSIGNED NOT NULL,
  `approvable_id` int(10) UNSIGNED NOT NULL,
  `approvable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decision` enum('approved','disapproved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `approvals`
--

INSERT INTO `approvals` (`id`, `approvable_id`, `approvable_type`, `decision`, `comment`, `created_at`, `updated_at`) VALUES
(4, 9, 'App\\Models\\Course', 'disapproved', 'We advise that you set at least one video lesson as \"Free Preview\" so that potential students can see how you teach before they enroll.', '2018-01-28 01:17:19', '2018-01-28 01:17:19'),
(5, 9, 'App\\Models\\Course', 'approved', 'Kudos! You\'re good to go.', '2018-01-28 01:38:26', '2018-01-28 01:38:26'),
(6, 10, 'App\\Models\\Course', 'approved', 'Good to go!', '2018-01-28 04:01:39', '2018-01-28 04:01:39'),
(7, 11, 'App\\Models\\Course', 'disapproved', 'No quite ready', '2018-01-28 04:18:17', '2018-01-28 04:18:17'),
(8, 11, 'App\\Models\\Course', 'approved', 'Good to go', '2018-01-28 04:18:35', '2018-01-28 04:18:35'),
(9, 12, 'App\\Models\\Course', 'approved', 'You\'re good to go. Your course is now public', '2018-01-28 04:29:38', '2018-01-28 04:29:38'),
(10, 13, 'App\\Models\\Course', 'approved', 'The content is great and good to go. approved!', '2018-01-28 04:37:07', '2018-01-28 04:37:07'),
(11, 14, 'App\\Models\\Course', 'approved', 'Great course. Approved!', '2018-01-28 04:46:04', '2018-01-28 04:46:04'),
(12, 15, 'App\\Models\\Course', 'approved', 'Great course. Good luck with sales.', '2018-01-28 04:53:50', '2018-01-28 04:53:50'),
(13, 16, 'App\\Models\\Course', 'approved', 'Approved. GLWS', '2018-01-28 05:02:43', '2018-01-28 05:02:43'),
(14, 17, 'App\\Models\\Course', 'disapproved', 'Not quite perfect yet. Please add more videos', '2018-01-28 05:11:02', '2018-01-28 05:11:02'),
(15, 17, 'App\\Models\\Course', 'approved', 'Ok this is great!', '2018-01-28 05:11:19', '2018-01-28 05:11:19'),
(16, 18, 'App\\Models\\Course', 'approved', 'Great course. approved', '2018-01-28 05:18:52', '2018-01-28 05:18:52'),
(17, 19, 'App\\Models\\Course', 'approved', 'Great quality. Approved', '2018-01-28 05:40:30', '2018-01-28 05:40:30'),
(18, 20, 'App\\Models\\Course', 'approved', 'Nice course', '2018-01-28 05:47:20', '2018-01-28 05:47:20'),
(19, 21, 'App\\Models\\Course', 'approved', 'Nice one!', '2018-01-28 05:55:03', '2018-01-28 05:55:03'),
(20, 22, 'App\\Models\\Course', 'disapproved', 'Please fix the image', '2018-01-28 06:02:42', '2018-01-28 06:02:42'),
(21, 22, 'App\\Models\\Course', 'approved', 'Ok great!', '2018-01-28 06:02:52', '2018-01-28 06:02:52'),
(22, 11, 'App\\Models\\Course', 'disapproved', 'l;;', '2018-04-03 12:36:06', '2018-04-03 12:36:06'),
(23, 11, 'App\\Models\\Course', 'approved', 'jkjk', '2018-04-03 12:54:03', '2018-04-03 12:54:03'),
(24, 26, 'App\\Models\\Course', 'disapproved', 'for testing', '2018-04-06 06:27:07', '2018-04-06 06:27:07'),
(25, 26, 'App\\Models\\Course', 'disapproved', 'again test', '2018-04-06 06:35:58', '2018-04-06 06:35:58'),
(26, 26, 'App\\Models\\Course', 'disapproved', 'once again test', '2018-04-06 06:44:18', '2018-04-06 06:44:18'),
(27, 26, 'App\\Models\\Course', 'approved', 'okkk', '2018-04-06 07:40:30', '2018-04-06 07:40:30'),
(28, 25, 'App\\Models\\Course', 'approved', 'xcvcxvcx', '2018-05-08 05:40:09', '2018-05-08 05:40:09'),
(29, 29, 'App\\Models\\Course', 'approved', 'approve', '2018-05-10 09:06:23', '2018-05-10 09:06:23'),
(30, 30, 'App\\Models\\Course', 'approved', 'approved', '2018-06-08 10:50:01', '2018-06-08 10:50:01'),
(31, 31, 'App\\Models\\Course', 'approved', 'test', '2018-07-13 08:03:02', '2018-07-13 08:03:02'),
(32, 29, 'App\\Models\\Course', 'disapproved', 'add', '2018-08-03 07:12:07', '2018-08-03 07:12:07'),
(33, 29, 'App\\Models\\Course', 'approved', 'saad', '2018-08-03 07:12:48', '2018-08-03 07:12:48'),
(34, 31, 'App\\Models\\Course', 'disapproved', 'image not found', '2018-08-03 07:13:20', '2018-08-03 07:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(10) UNSIGNED NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(92) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `preview_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(10) UNSIGNED DEFAULT NULL,
  `model_type` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `uuid`, `disk`, `filepath`, `filename`, `filetype`, `filesize`, `key`, `group`, `title`, `description`, `preview_url`, `model_id`, `model_type`, `metadata`, `created_at`, `updated_at`) VALUES
(1, '95bbxpv4yrzw2ei8vlhyw2uu7', 'local', 'attachments/95b/bxp/v4y/95bbxpv4yrzw2ei8vlhyw2uu7.jpeg', '1528883538_drawing.jpeg', 'image/jpeg', 90429, 'W6Qt517040jKYtb5QGozY1loKchy4k', NULL, 'drawing.jpeg', '34', NULL, 1, 'App\\MyThread', NULL, '2018-06-13 09:52:19', '2018-06-13 09:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`id`, `name`, `created_at`, `updated_at`) VALUES
(6, 'CBSE', '2018-02-16 08:51:10', '2018-02-16 08:51:10'),
(7, 'ICSE', '2018-02-16 08:51:18', '2018-02-16 08:51:18'),
(8, 'MAHARASHTRA', '2018-02-16 08:51:32', '2018-02-16 08:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_parent_id` int(11) DEFAULT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `sub_parent_id`, `sortOrder`, `name`, `slug`, `model`, `color`, `created_at`, `updated_at`) VALUES
(9, NULL, NULL, 3, 'Author Help Guides', 'author-help-guides', 'App\\Models\\Post', '#000000', '2017-12-15 21:32:01', '2018-01-27 02:57:06'),
(10, NULL, NULL, 1, 'Student Help Guides', 'student-help-guides', 'App\\Models\\Post', '#000000', '2017-12-15 21:50:12', '2018-01-27 02:56:44'),
(11, NULL, NULL, 2, 'Site Pages', 'site-pages', 'App\\Models\\Post', '#000000', '2017-12-15 23:16:23', '2018-01-27 02:57:06'),
(27, NULL, NULL, 1, 'Class 7', 'class-7', 'App\\Models\\Course', '#000000', '2018-04-03 13:12:07', '2018-04-03 13:23:56'),
(28, NULL, NULL, 6, 'Class 8', 'class-8', 'App\\Models\\Course', '#000000', '2018-04-03 13:12:20', '2018-06-08 10:46:19'),
(29, NULL, NULL, 11, 'Class 9', 'class-9', 'App\\Models\\Course', '#000000', '2018-04-03 13:12:32', '2018-08-29 02:39:34'),
(30, NULL, NULL, 13, 'Class 10', 'class-10', 'App\\Models\\Course', '#000000', '2018-04-03 13:12:44', '2018-08-29 02:39:34'),
(31, NULL, NULL, 14, 'Class 11', 'class-11', 'App\\Models\\Course', '#000000', '2018-04-03 13:12:57', '2018-08-29 02:39:34'),
(32, NULL, NULL, 15, 'Class 12', 'class-12', 'App\\Models\\Course', '#000000', '2018-04-03 13:13:08', '2018-08-29 02:39:34'),
(33, NULL, NULL, 18, 'Competitive Exams (10+2)', 'competitive-exams-102', 'App\\Models\\Course', '#000000', '2018-04-03 13:14:14', '2018-08-29 02:39:34'),
(34, NULL, NULL, 19, 'Vocational Courses', 'vocational-courses', 'App\\Models\\Course', '#000000', '2018-04-03 13:14:34', '2018-08-29 02:39:34'),
(35, 27, NULL, 2, 'CBSE', 'cbse', 'App\\Models\\Course', '#000000', '2018-04-03 13:18:43', '2018-04-11 06:00:23'),
(36, 27, NULL, 3, 'IB', 'ib', 'App\\Models\\Course', '#000000', '2018-04-03 13:19:15', '2018-04-11 06:00:23'),
(37, 27, NULL, 4, 'ISCE', 'isce', 'App\\Models\\Course', '#000000', '2018-04-03 13:23:31', '2018-04-11 06:00:23'),
(38, 27, NULL, 5, 'STATE BOARDS', 'state-boards', 'App\\Models\\Course', '#000000', '2018-04-03 13:23:50', '2018-04-11 06:00:23'),
(42, 28, NULL, 7, 'CBSE', 'cbse', 'App\\Models\\Course', '#000000', '2018-04-11 05:04:37', '2018-06-08 10:46:19'),
(46, 28, NULL, 8, 'IB', 'ib', 'App\\Models\\Course', '#000000', '2018-04-11 06:45:36', '2018-06-08 10:46:19'),
(47, 28, NULL, 9, 'ISCE', 'isce', 'App\\Models\\Course', '#000000', '2018-04-11 06:46:15', '2018-08-29 02:37:45'),
(48, 28, NULL, 10, 'STATE BOARDS', 'state-boards', 'App\\Models\\Course', '#000000', '2018-04-11 06:46:30', '2018-08-29 02:39:34'),
(55, 32, 32, 16, 'CBSE', 'cbse', 'App\\Models\\Course', '#000000', '2018-04-11 09:39:20', '2018-08-29 02:39:34'),
(56, 32, 32, 17, 'IB', 'ib', 'App\\Models\\Course', '#000000', '2018-04-11 09:41:15', '2018-08-29 02:39:34'),
(57, 35, 27, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 10:36:49', '2018-06-08 10:36:49'),
(59, 35, 27, 0, 'Mathematics', 'mathematics', 'App\\Models\\Course', '#000000', '2018-06-08 10:42:37', '2018-06-08 10:42:37'),
(60, 35, 27, 0, 'Science', 'science', 'App\\Models\\Course', '#000000', '2018-06-08 10:42:58', '2018-06-08 10:42:58'),
(61, 35, 27, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 10:43:11', '2018-06-08 10:43:11'),
(62, 36, 27, 0, 'Computer Science', 'computer-science', 'App\\Models\\Course', '#000000', '2018-06-08 10:43:42', '2018-06-08 10:43:42'),
(63, 36, 27, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 10:44:02', '2018-06-08 10:44:02'),
(64, 36, 27, 0, 'Mathematics', 'mathematics', 'App\\Models\\Course', '#000000', '2018-06-08 10:44:19', '2018-06-08 10:44:19'),
(65, 36, 27, 0, 'Science', 'science', 'App\\Models\\Course', '#000000', '2018-06-08 10:44:36', '2018-06-08 10:44:36'),
(66, 35, 27, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 10:44:52', '2018-06-08 10:44:52'),
(67, 36, 27, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 10:47:49', '2018-06-08 10:47:49'),
(68, 37, 27, 0, 'Biology', 'biology', 'App\\Models\\Course', '#000000', '2018-06-08 10:48:41', '2018-06-08 10:48:41'),
(69, 37, 27, 0, 'Chemistry', 'chemistry', 'App\\Models\\Course', '#000000', '2018-06-08 10:49:01', '2018-06-08 10:49:01'),
(70, 37, 27, 0, 'Computer Applications', 'computer-applications', 'App\\Models\\Course', '#000000', '2018-06-08 10:49:16', '2018-06-08 10:49:16'),
(71, 37, 27, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 10:49:34', '2018-06-08 10:49:34'),
(72, 37, 27, 0, 'Mathematics', 'mathematics', 'App\\Models\\Course', '#000000', '2018-06-08 10:49:51', '2018-06-08 10:49:51'),
(73, 37, 27, 0, 'Physics', 'physics', 'App\\Models\\Course', '#000000', '2018-06-08 10:50:13', '2018-06-08 10:50:13'),
(74, 37, 27, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 10:50:28', '2018-06-08 10:50:28'),
(75, 38, 27, 0, 'Computer Science/IT', 'computer-scienceit', 'App\\Models\\Course', '#000000', '2018-06-08 10:51:34', '2018-06-08 10:51:34'),
(76, 38, 27, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 10:52:17', '2018-06-08 10:52:17'),
(77, 38, 27, 0, 'Mathematics', 'mathematics', 'App\\Models\\Course', '#000000', '2018-06-08 10:52:36', '2018-06-08 10:52:36'),
(78, 38, 27, 0, 'Science', 'science', 'App\\Models\\Course', '#000000', '2018-06-08 10:52:50', '2018-06-08 10:52:50'),
(79, 38, 27, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 10:53:09', '2018-06-08 10:53:09'),
(80, 35, 28, 0, 'Computer Science', 'computer-science', 'App\\Models\\Course', '#000000', '2018-06-08 10:59:43', '2018-06-08 10:59:43'),
(81, 35, 28, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 11:00:02', '2018-06-08 11:00:02'),
(82, 35, 28, 0, 'Mathematics', 'mathematics', 'App\\Models\\Course', '#000000', '2018-06-08 11:00:22', '2018-06-08 11:00:22'),
(83, 35, 28, 0, 'Science', 'science', 'App\\Models\\Course', '#000000', '2018-06-08 11:00:42', '2018-06-08 11:00:42'),
(84, 35, 28, 0, 'Others', 'others', 'App\\Models\\Course', '#000000', '2018-06-08 11:00:55', '2018-06-08 11:00:55'),
(85, 36, 28, 0, 'Computer Science', 'computer-science', 'App\\Models\\Course', '#000000', '2018-06-08 11:01:29', '2018-06-08 11:01:29'),
(87, 36, 28, 0, 'English', 'english', 'App\\Models\\Course', '#000000', '2018-06-08 11:01:59', '2018-06-08 11:01:59'),
(88, 29, 29, 12, 'CBSE', 'cbse', 'App\\Models\\Course', '#000000', '2018-08-24 06:30:56', '2018-08-29 02:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `certificate_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_articles` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_quizzes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `course_id`, `certificate_no`, `course_title`, `course_subtitle`, `video_hours`, `total_articles`, `total_quizzes`, `created_at`, `updated_at`) VALUES
(1, 27, 26, 'C00LD35-2787453', 'NUMBER SYSTEMS', 'REAL NUMBERS', '0', '0', '1', '2018-04-10 05:46:09', '2018-04-10 05:46:09'),
(2, 34, 26, 'C00MQ35-3454013', 'NUMBER SYSTEMS', 'REAL NUMBERS 1', '0', '0', '1', '2018-06-08 10:09:12', '2018-06-08 10:09:12'),
(3, 13, 30, 'C006635-1391470', 'Math example', 'test online', '0', '0', '0', '2018-06-08 10:45:01', '2018-06-08 10:45:01'),
(4, 32, 26, 'C00YR35-3267780', 'NUMBER SYSTEMS', 'REAL NUMBERS 1', '0', '0', '1', '2018-07-13 07:25:41', '2018-07-13 07:25:41'),
(5, 32, 31, 'C00MM35-3299523', 'Maths Essentials', 'For MBA Success', '0', '0', '1', '2018-07-13 08:04:32', '2018-07-13 08:04:32'),
(6, 13, 26, 'C00FN35-1366240', 'NUMBER SYSTEMS', 'REAL NUMBERS 1', '0', '0', '1', '2018-07-14 05:44:34', '2018-07-14 05:44:34'),
(7, 13, 31, 'C00OU35-1372675', 'Maths Essentials', 'For MBA Success', '0', '0', '1', '2018-07-14 05:47:53', '2018-07-14 05:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `marked_as_answer` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `completions`
--

CREATE TABLE `completions` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `completions`
--

INSERT INTO `completions` (`id`, `lesson_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 105, 27, '2018-04-10 05:46:08', '2018-04-10 05:46:08'),
(2, 106, 27, '2018-04-10 05:46:13', '2018-04-10 05:46:13'),
(3, 105, 34, '2018-06-08 10:09:12', '2018-06-08 10:09:12'),
(4, 106, 34, '2018-06-08 10:09:30', '2018-06-08 10:09:30'),
(5, 112, 13, '2018-06-08 10:45:01', '2018-06-08 10:45:01'),
(6, 105, 32, '2018-07-13 07:25:41', '2018-07-13 07:25:41'),
(7, 116, 32, '2018-07-13 08:04:27', '2018-07-13 08:04:27'),
(8, 117, 32, '2018-07-13 08:04:32', '2018-07-13 08:04:32'),
(9, 118, 32, '2018-07-13 08:04:36', '2018-07-13 08:04:36'),
(10, 105, 13, '2018-07-14 05:44:34', '2018-07-14 05:44:34'),
(11, 106, 13, '2018-07-14 05:44:37', '2018-07-14 05:44:37'),
(12, 116, 13, '2018-07-14 05:47:43', '2018-07-14 05:47:43'),
(13, 117, 13, '2018-07-14 05:47:53', '2018-07-14 05:47:53'),
(14, 118, 13, '2018-07-14 05:48:03', '2018-07-14 05:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `content_type` enum('video','article') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'video',
  `video_provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_duration` int(11) DEFAULT NULL,
  `video_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_storage` enum('s3','local') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_src` enum('upload','embed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_body` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `lesson_id`, `content_type`, `video_provider`, `video_filename`, `video_duration`, `video_path`, `video_storage`, `video_src`, `article_body`, `created_at`, `updated_at`) VALUES
(120, 105, 'video', NULL, 'ow-understanding-square-roots-pre-algebra-khan-academy.mp4', 81, '/uploads/videos/ow-understanding-square-roots-pre-algebra-khan-academy.mp4', 'local', 'upload', NULL, '2018-04-06 04:38:54', '2018-04-06 04:38:54'),
(121, 109, 'article', NULL, NULL, NULL, NULL, NULL, NULL, '<p>rtejuitreuhtrehtrr</p>', '2018-05-10 08:58:08', '2018-05-10 08:58:08'),
(122, 113, 'video', NULL, 'Ow-videoplayback.mp4', 1305, '/uploads/videos/Ow-videoplayback.mp4', 'local', 'upload', NULL, '2018-06-04 05:09:54', '2018-06-04 05:09:54'),
(123, 112, 'video', NULL, 'eC-happy-birthday-youtube.mp4', 74, '/uploads/videos/eC-happy-birthday-youtube.mp4', 'local', 'upload', NULL, '2018-06-08 10:44:57', '2018-06-08 10:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expires` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sitewide` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `course_id`, `code`, `percent`, `quantity`, `expires`, `active`, `sitewide`, `created_at`, `updated_at`) VALUES
(66, 25, '25 ', 100, 51, '2018-12-05', 1, 0, '2018-06-05 10:12:42', '2018-06-05 10:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('all','beginner','intermediate','advanced') COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `category_id`, `title`, `subtitle`, `slug`, `description`, `language`, `image`, `level`, `duration`, `featured`, `price`, `published`, `approved`, `created_at`, `updated_at`, `subject_id`) VALUES
(25, 13, 35, 'ghghgh', 'jhjh', 'ghghgh', NULL, NULL, NULL, 'beginner', '2', 0, 196, 1, 1, '2018-04-04 08:18:12', '2018-05-08 05:40:09', 0),
(26, 13, 35, 'NUMBER SYSTEMS', 'REAL NUMBERS 1', 'number-systems', '<p><span style=\"color: rgb(68, 68, 68);\">Euclid\'s division lemma, Fundamental Theorem of Arithmetic - statements after reviewing work done earlier and after illustrating&nbsp;and motivating through examples, Proofs of results - irrationality of √2, √3, √5, decimal expansions of rational numbers in&nbsp;terms of terminating/non-terminating recurring decimals.</span></p>', 'English', '15ac7462739834.png', 'advanced', '4', 0, 458, 1, 1, '2018-04-06 04:32:18', '2018-06-05 01:10:18', 0),
(27, 13, 35, 'hfdhfg', 'gfhgfh', 'hfdhfg', '<p>xcczx xzxczxc zxcxzcczx czzxczxcfdgfdgdfg</p>', 'Hindi', '15af2c5b0943b8.png', 'beginner', '2', 0, 196, 0, 0, '2018-05-08 09:31:44', '2018-05-10 04:06:44', 50),
(28, 13, 35, 'dsgsfddd', 'dsfdfs', 'dsgsfddd', NULL, NULL, NULL, 'all', '0', 0, 0, 0, 0, '2018-05-09 11:19:14', '2018-05-09 11:19:14', 51),
(29, 13, 35, 'Math Courses', 'bdsavgd', 'math-courses', '<p>jjhfhjf hfdshjbhjdfs</p>', 'Hindi', '15b153ac582ca6.png', 'beginner', '4', 0, 328, 1, 1, '2018-05-10 08:56:55', '2018-08-03 07:12:48', 51),
(30, 13, 35, 'Math example', 'test online', 'math-example', '<p>Math example <span style=\"color: rgb(85, 85, 85);\">Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example Math example </span></p>', 'English', '15b0d2eaea7827.png', 'beginner', '2', 0, 196, 0, 1, '2018-05-29 05:11:11', '2018-06-08 10:53:36', 51),
(31, 13, 35, 'Maths Essentials', 'For MBA Success', 'maths-essentials', '<ul><li>Learn about three key&nbsp;<strong>characteristics of test questions</strong>&nbsp;and how we can represent these mathematically</li><li>Learn about item response curves, curves which model the probability of getting a question right as a function of ability, and their&nbsp;<strong>parameters</strong></li><li>Use dynamic graphs to explore&nbsp;<strong>the relationship between the parameters and question characteristics</strong></li><li>Use limits, derivatives, and function properties to establish&nbsp;<strong>the relationship between the parameters and question characteristics</strong></li></ul>', 'English', '15b7e67883748a.png', 'beginner', '1', 0, 131, 0, 0, '2018-07-13 07:50:02', '2018-08-23 07:51:36', 59),
(32, 13, 35, 'math Xn', 'Learn Math', 'math-xn', NULL, NULL, NULL, 'all', '0', 0, 0, 0, 0, '2018-08-23 07:10:09', '2018-08-23 07:10:09', 57),
(33, 13, 35, 'Chapter 1 Three Questions', 'Class 7th English Chapter 1 Three Questions', 'chapter-1-three-questions', NULL, NULL, NULL, 'all', '0', 0, 0, 0, 0, '2018-08-28 09:11:11', '2018-08-28 09:11:11', 57);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `course_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 26, 27, '2018-04-06 09:48:52', '2018-04-06 09:48:52'),
(2, 25, 27, '2018-05-08 06:28:52', '2018-05-08 06:28:52'),
(3, 26, 28, '2018-05-08 06:46:34', '2018-05-08 06:46:34'),
(4, 25, 28, '2018-05-09 04:45:58', '2018-05-09 04:45:58'),
(5, 29, 28, '2018-05-10 09:23:45', '2018-05-10 09:23:45'),
(6, 26, 34, '2018-06-08 10:08:38', '2018-06-08 10:08:38'),
(7, 26, 32, '2018-07-13 07:25:31', '2018-07-13 07:25:31'),
(8, 31, 32, '2018-07-13 08:04:13', '2018-07-13 08:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `followable_id` int(10) UNSIGNED NOT NULL,
  `followable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `preview` tinyint(1) NOT NULL DEFAULT '0',
  `lesson_type` enum('lecture','quiz') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lecture',
  `sortOrder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `section_id`, `title`, `uid`, `description`, `preview`, `lesson_type`, `sortOrder`, `created_at`, `updated_at`) VALUES
(104, 52, 'Introduction', '6893', NULL, 0, 'lecture', 1, '2018-04-04 08:18:12', '2018-04-04 08:18:12'),
(105, 53, 'Introduction', '15845', NULL, 0, 'lecture', 1, '2018-04-06 04:32:18', '2018-04-06 04:32:18'),
(106, 53, 'Test', '9042', NULL, 0, 'quiz', 2, '2018-04-06 04:41:46', '2018-04-06 04:41:46'),
(107, 54, 'Introduction', '5666', NULL, 0, 'lecture', 1, '2018-05-08 09:31:44', '2018-05-08 09:31:44'),
(108, 55, 'Introduction', '5453', NULL, 0, 'lecture', 1, '2018-05-09 11:19:14', '2018-05-09 11:19:14'),
(109, 56, 'Introduction', '20851', NULL, 0, 'lecture', 1, '2018-05-10 08:56:55', '2018-05-10 08:56:55'),
(110, 56, 'gdghdsghasd', '10151', 'asduasdjkjasdd', 0, 'lecture', 2, '2018-05-10 08:59:39', '2018-05-10 08:59:39'),
(111, 57, 'quiz', '2617', NULL, 0, 'quiz', 1, '2018-05-10 09:01:06', '2018-05-10 09:01:06'),
(112, 58, 'Introduction', '4659', 'Math example', 0, 'lecture', 1, '2018-05-29 05:11:12', '2018-06-08 10:45:22'),
(113, 60, 'cvcvb', '6099', 'cvvcb', 1, 'lecture', 1, '2018-06-04 05:08:13', '2018-06-04 05:08:13'),
(115, 58, 'lesson3', '8182', NULL, 0, 'quiz', 3, '2018-06-08 10:46:42', '2018-06-08 10:47:33'),
(116, 61, 'Introduction', '3973', 'Introduction: Item Response Theory', 0, 'lecture', 1, '2018-07-13 07:50:02', '2018-07-13 07:55:12'),
(117, 61, 'Item Response Theory', '19509', 'Learn about three key characteristics of test questions and how we can represent these mathematically', 0, 'lecture', 2, '2018-07-13 07:56:39', '2018-07-13 07:56:39'),
(118, 61, 'Quiz', '18438', NULL, 0, 'quiz', 3, '2018-07-13 07:56:55', '2018-07-13 07:56:55'),
(119, 62, 'Introduction', '16401', NULL, 0, 'lecture', 1, '2018-08-23 07:10:09', '2018-08-23 07:10:09'),
(120, 63, 'Introduction', '5720', NULL, 0, 'lecture', 1, '2018-08-28 09:11:11', '2018-08-28 09:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `thread_id`, `user_id`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 34, 'sdvaddvbS', '2018-06-13 09:50:03', '2018-06-13 09:50:03', NULL),
(2, 1, 34, 'csadvDV', '2018-06-13 09:50:49', '2018-06-13 09:50:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_09_03_144628_create_permission_tables', 1),
(4, '2017_09_11_174816_create_social_accounts_table', 1),
(5, '2017_09_26_140332_create_cache_table', 1),
(6, '2017_09_26_140528_create_sessions_table', 1),
(7, '2017_09_26_140609_create_jobs_table', 1),
(8, '2017_11_27_043256_create_categories_table', 1),
(9, '2017_11_27_065628_create_courses_table', 1),
(10, '2017_11_28_223027_create_sections_table', 1),
(11, '2017_11_28_223328_create_lessons_table', 1),
(12, '2017_11_28_224531_create_contents_table', 1),
(13, '2017_11_28_225901_create_approvals_table', 1),
(14, '2017_11_28_232322_create_enrollments_table', 1),
(15, '2017_11_29_021639_create_coupons_table', 1),
(17, '2017_11_29_023026_create_comments_table', 1),
(18, '2017_11_29_051206_create_questions_table', 1),
(19, '2017_11_29_055132_create_reviews_table', 1),
(20, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(21, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(22, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(23, '2016_06_01_000004_create_oauth_clients_table', 2),
(24, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(25, '2017_02_21_070324_create_attachments_table', 3),
(26, '2017_03_17_070324_alter_attachments_table_extend_filetype', 3),
(27, '2017_08_21_201100_alter_attachments_table_add_group_column', 3),
(28, '2017_12_01_213655_create_quiz_questions_table', 4),
(29, '2017_12_01_213715_create_quiz_answers_table', 4),
(30, '2017_12_01_213726_create_quiz_attempts_table', 4),
(31, '2017_12_01_213735_create_quiz_attempt_details_table', 4),
(32, '2017_12_02_205727_create_notifications_table', 5),
(33, '2017_12_06_232206_create_completions_table', 6),
(35, '2017_12_07_052401_create_transactions_table', 7),
(36, '2017_12_07_052402_create_payments_table', 7),
(37, '2014_10_28_175635_create_threads_table', 8),
(38, '2014_10_28_175710_create_messages_table', 8),
(39, '2014_10_28_180224_create_participants_table', 8),
(40, '2017_12_08_210243_create_withdrawals_table', 9),
(41, '2017_12_09_043931_create_bookmarks_table', 10),
(42, '2017_12_09_212253_create_follows_table', 11),
(45, '2017_12_09_222725_create_announcements_table', 12),
(46, '2017_12_09_224323_create_announcement_course_table', 12),
(51, '2018_01_07_202252_add_settings_column_to_users', 15),
(59, '2014_04_02_193005_create_translations_table', 18),
(60, '2018_01_12_023954_create_posts_table', 18),
(61, '2018_01_12_023955_create_post_translations_table', 18),
(63, '2018_01_12_201956_create_admin_settings_table', 19),
(64, '2018_01_11_103647_create_certificates_table', 20),
(67, '2018_01_23_194030_add_country_to_users', 21),
(72, '2018_02_05_224608_create_packages_table', 22),
(73, '2018_02_05_224804_create_package_users_table', 22),
(74, '2018_02_15_143058_create_board_table', 23),
(75, '2018_02_16_043507_create_boards_table', 24),
(76, '2018_03_01_122112_add_board_to_users_table', 24),
(77, '2018_03_07_144514_add_qualification_users_table', 25),
(78, '2018_03_09_072531_add_board_spe_qua_colums_to_users_table', 26),
(79, '2018_03_14_135219_add_course_board', 26),
(80, '2018_04_09_074133_add_sub_parent_id_to_categories', 26),
(81, '2018_04_09_131757_add_site_tax_to_admin_setting', 27),
(82, '2018_05_07_133336_add_validity_to_packages', 28),
(83, '2018_05_08_090940_add_discount_to_package_users_table', 29),
(84, '2018_05_09_163411_add_subject_id_to_courses_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_id`, `model_type`) VALUES
(1, 26, 'App\\Models\\Auth\\User');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\Models\\Auth\\User'),
(1, 26, 'App\\Models\\Auth\\User'),
(2, 10, 'App\\Models\\Auth\\User'),
(2, 12, 'App\\Models\\Auth\\User'),
(2, 13, 'App\\Models\\Auth\\User'),
(2, 14, 'App\\Models\\Auth\\User'),
(2, 15, 'App\\Models\\Auth\\User'),
(2, 16, 'App\\Models\\Auth\\User'),
(3, 10, 'App\\Models\\Auth\\User'),
(3, 12, 'App\\Models\\Auth\\User'),
(3, 17, 'App\\Models\\Auth\\User'),
(3, 18, 'App\\Models\\Auth\\User'),
(3, 19, 'App\\Models\\Auth\\User'),
(3, 20, 'App\\Models\\Auth\\User'),
(3, 21, 'App\\Models\\Auth\\User'),
(3, 22, 'App\\Models\\Auth\\User'),
(3, 24, 'App\\Models\\Auth\\User'),
(3, 27, 'App\\Models\\Auth\\User'),
(3, 28, 'App\\Models\\Auth\\User'),
(3, 29, 'App\\Models\\Auth\\User'),
(3, 30, 'App\\Models\\Auth\\User'),
(3, 31, 'App\\Models\\Auth\\User'),
(3, 32, 'App\\Models\\Auth\\User'),
(3, 34, 'App\\Models\\Auth\\User'),
(3, 35, 'App\\Models\\Auth\\User'),
(3, 36, 'App\\Models\\Auth\\User'),
(3, 37, 'App\\Models\\Auth\\User'),
(3, 38, 'App\\Models\\Auth\\User'),
(3, 39, 'App\\Models\\Auth\\User'),
(3, 40, 'App\\Models\\Auth\\User'),
(3, 41, 'App\\Models\\Auth\\User');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('066a3525-0532-465c-9060-07960fd3ea37', 'App\\Notifications\\Frontend\\CourseReviewed', 2, 'App\\Models\\Auth\\User', '{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}', NULL, '2018-01-28 06:02:43', '2018-01-28 06:02:43'),
('08754f8f-ec04-4c3a-a362-65f905209b2d', 'App\\Notifications\\Backend\\WithdrawalRequestUpdated', 26, 'App\\Models\\Auth\\User', '{\"withdrawal_id\":1,\"amount\":\"500.00\",\"status\":\"processed\",\"comment\":\"We have received your request. It will be processed on Jun 22, 2018\"}', NULL, '2018-06-08 10:56:38', '2018-06-08 10:56:38'),
('0936edb5-d836-44d0-a52d-20918a82f646', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":10,\"course_title\":\"Ruby on Rails advanced training\",\"course_slug\":\"ruby-on-rails-advanced-training\"}', '2018-01-30 20:58:21', '2018-01-28 04:01:39', '2018-01-30 20:58:21'),
('094eb4e2-41cf-43de-a8e8-31b029ddc0de', 'App\\Notifications\\Frontend\\CourseReviewed', 2, 'App\\Models\\Auth\\User', '{\"course_id\":21,\"course_title\":\"Joomla for non-programmers\",\"course_slug\":\"joomla-for-nonprogrammers\"}', NULL, '2018-01-28 05:55:04', '2018-01-28 05:55:04'),
('107d1448-0af6-4402-aadf-204f7e4e7ccd', 'App\\Notifications\\Frontend\\CourseReviewed', 2, 'App\\Models\\Auth\\User', '{\"course_id\":20,\"course_title\":\"Drupal advanced concepts\",\"course_slug\":\"drupal-advanced-concepts\"}', NULL, '2018-01-28 05:47:21', '2018-01-28 05:47:21'),
('11759e4f-08af-428f-bbb0-370affd82247', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', NULL, '2018-04-03 12:53:15', '2018-04-03 12:53:15'),
('14a18cf7-5986-4838-9d33-ad24dbeb07f5', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":31,\"course_title\":\"Maths Essentials\",\"course_slug\":\"maths-essentials\"}', NULL, '2018-07-13 08:03:03', '2018-07-13 08:03:03'),
('181c4ccc-8e1e-4fd8-b50b-22ffe831641d', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":13,\"course_title\":\"Wordpress for absolute beginners\",\"course_slug\":\"wordpress-for-absolute-beginners\"}', '2018-01-30 20:58:18', '2018-01-28 04:37:08', '2018-01-30 20:58:18'),
('19cf4d52-288c-43ef-bfa4-9b56ccd79760', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":18,\"course_title\":\"RESTFul APIs with Laravel and Vuejs\",\"course_slug\":\"restful-apis-with-laravel-and-vuejs\"}', NULL, '2018-01-28 05:18:52', '2018-01-28 05:18:52'),
('213de70a-7794-4cd3-ba76-49b6ad45a605', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":21,\"course_title\":\"Joomla for non-programmers\",\"course_slug\":\"joomla-for-nonprogrammers\"}', NULL, '2018-01-28 05:54:17', '2018-01-28 05:54:17'),
('2529f8c2-adcd-4c69-8bfc-45e1e52b46a6', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}', NULL, '2018-01-28 05:11:02', '2018-01-28 05:11:02'),
('26890d1f-2b1b-4d3b-868c-268a714cc6c0', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":19,\"course_title\":\"Drupal for Government projects\",\"course_slug\":\"drupal-for-government-projects\"}', NULL, '2018-01-28 05:39:48', '2018-01-28 05:39:48'),
('273e4b0e-590a-4ba7-aa8e-0703ff41162c', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":7,\"course_title\":\"Facebook clone with Swift ed\",\"course_slug\":\"facebook-clone\"}', NULL, '2018-01-27 06:47:35', '2018-01-27 06:47:35'),
('27e363ba-0436-4cb3-9945-bff316c199d9', 'App\\Notifications\\Frontend\\AnswerNotificationToQuestionAuthor', 2, 'App\\Models\\Auth\\User', '{\"question_id\":3,\"question_title\":\"I have another question\",\"question_slug\":\"403649\",\"course_slug\":\"twitter-clone-with-swift-ed\"}', NULL, '2018-01-27 19:31:43', '2018-01-27 19:31:43'),
('2898b604-48f0-4d9b-b9b7-790de646c65d', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":12,\"course_title\":\"Wordpress plugin development\",\"course_slug\":\"wordpress-plugin-development\"}', NULL, '2018-01-28 04:28:59', '2018-01-28 04:28:59'),
('2e0bd26e-a4e3-410b-a495-648c813c9245', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":30,\"course_title\":\"Math example\",\"course_slug\":\"math-example\"}', NULL, '2018-06-08 10:49:18', '2018-06-08 10:49:18'),
('2e6cd4aa-d28f-4aa7-a017-e136bd4ebc57', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', NULL, '2018-04-03 12:54:04', '2018-04-03 12:54:04'),
('2f0ca086-aa58-45d6-a677-256af6c2c36f', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}', NULL, '2018-01-28 05:10:24', '2018-01-28 05:10:24'),
('2fe6238a-3ffe-4146-9014-78b5b10ef2b1', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}', NULL, '2018-01-28 01:13:03', '2018-01-28 01:13:03'),
('34f6646f-fc51-465d-af2c-4c20db4221fb', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}', NULL, '2018-01-28 06:02:14', '2018-01-28 06:02:14'),
('3544340a-af6d-4908-86ec-f5314d40cffa', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', NULL, '2018-04-03 12:36:08', '2018-04-03 12:36:08'),
('36419794-12c9-459f-a168-ecdc88236c58', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":29,\"course_title\":\"Math Courses\",\"course_slug\":\"math-courses\"}', NULL, '2018-08-03 07:12:09', '2018-08-03 07:12:09'),
('36ac525d-ad47-4b4a-955e-218e135ea55f', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:50:49', '2018-04-06 06:50:49'),
('3b221c9b-5319-4533-bfe9-b55058cb3ff8', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":15,\"course_title\":\"OpenCart advanced plugin development\",\"course_slug\":\"opencart-advanced-plugin-development\"}', NULL, '2018-01-28 04:53:06', '2018-01-28 04:53:06'),
('3b7dfc55-2f74-47c9-ba3d-a591f7d60508', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":29,\"course_title\":\"Math Courses\",\"course_slug\":\"math-courses\"}', NULL, '2018-05-10 09:05:50', '2018-05-10 09:05:50'),
('3d640e3a-80a9-4e28-a464-c3695beba13d', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":14,\"course_title\":\"OpenCart essential training\",\"course_slug\":\"opencart-essential-training\"}', NULL, '2018-01-28 04:46:05', '2018-01-28 04:46:05'),
('3e06dc77-03da-4a64-9069-c137047949b6', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:36:01', '2018-04-06 06:36:01'),
('49dd85b0-c676-41bb-bb1d-ddb39a26741b', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":24,\"course_title\":\"Shopify advertisement on Facebook\",\"course_slug\":\"shopify-advertisement-on-facebook\"}', NULL, '2018-01-28 07:26:58', '2018-01-28 07:26:58'),
('4b7b5f2b-0b8a-47e1-8eb5-b86d33e4dc10', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:44:22', '2018-04-06 06:44:22'),
('4e501f03-fca3-4529-ad14-285eaadf0efc', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}', NULL, '2018-01-28 05:11:19', '2018-01-28 05:11:19'),
('57e09dab-6837-4b65-adae-e468f107b669', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":16,\"course_title\":\"Magento essential training\",\"course_slug\":\"magento-essential-training\"}', NULL, '2018-01-28 05:02:43', '2018-01-28 05:02:43'),
('57e95fb8-015b-4b98-bf6b-899e75712b3b', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":25,\"course_title\":\"ghghgh\",\"course_slug\":\"ghghgh\"}', NULL, '2018-05-08 05:40:13', '2018-05-08 05:40:13'),
('59cf7e79-23c9-426a-8a0b-c4317e7e2e35', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}', '2018-01-30 20:58:22', '2018-01-28 01:17:19', '2018-01-30 20:58:22'),
('60e03b01-2258-4607-bbc9-c96d8f439b72', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":30,\"course_title\":\"Math example\",\"course_slug\":\"math-example\"}', NULL, '2018-06-08 10:50:01', '2018-06-08 10:50:01'),
('6235bb55-4790-4460-b503-59fffe83d30e', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":29,\"course_title\":\"Math Courses\",\"course_slug\":\"math-courses\"}', NULL, '2018-08-03 07:12:50', '2018-08-03 07:12:50'),
('73a3912d-c5f4-4663-8db4-c56602648dd4', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":25,\"course_title\":\"ghghgh\",\"course_slug\":\"ghghgh\"}', NULL, '2018-05-08 05:39:33', '2018-05-08 05:39:33'),
('762d9cb5-d00a-483a-b928-490db1bae4e5', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":30,\"course_title\":\"Math example\",\"course_slug\":\"math-example\"}', NULL, '2018-06-08 10:49:17', '2018-06-08 10:49:17'),
('8d9e30d3-a69b-4c71-976d-4df74e04661c', 'App\\Notifications\\Frontend\\CourseReviewed', 2, 'App\\Models\\Auth\\User', '{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}', NULL, '2018-01-28 06:02:52', '2018-01-28 06:02:52'),
('9007f90e-3f8f-41ce-a0fc-abb4b492f1b7', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":29,\"course_title\":\"Math Courses\",\"course_slug\":\"math-courses\"}', NULL, '2018-05-10 09:05:41', '2018-05-10 09:05:41'),
('94265916-2152-46e6-9ba1-a3eb9f4da7b5', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":14,\"course_title\":\"OpenCart essential training\",\"course_slug\":\"opencart-essential-training\"}', NULL, '2018-01-28 04:45:34', '2018-01-28 04:45:34'),
('969f71d2-0e52-448b-b4cd-67f376e4e2b7', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":18,\"course_title\":\"RESTFul APIs with Laravel and Vuejs\",\"course_slug\":\"restful-apis-with-laravel-and-vuejs\"}', NULL, '2018-01-28 05:18:28', '2018-01-28 05:18:28'),
('970a8cd9-fcc8-4c4c-b526-549a64f50d4e', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":31,\"course_title\":\"Maths Essentials\",\"course_slug\":\"maths-essentials\"}', NULL, '2018-07-13 08:01:31', '2018-07-13 08:01:31'),
('9c87a15e-df55-430a-baaf-0f2e21531b4a', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:27:11', '2018-04-06 06:27:11'),
('9d486a75-e0e9-4e70-84db-7abacd8563ec', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":31,\"course_title\":\"Maths Essentials\",\"course_slug\":\"maths-essentials\"}', NULL, '2018-07-13 08:01:30', '2018-07-13 08:01:30'),
('a5abfdcb-29f7-4af3-a3e6-2e4b2a3e1fe9', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":13,\"course_title\":\"Wordpress for absolute beginners\",\"course_slug\":\"wordpress-for-absolute-beginners\"}', NULL, '2018-01-28 04:36:31', '2018-01-28 04:36:31'),
('aab47fab-643c-485f-838e-a042216e179f', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":20,\"course_title\":\"Drupal advanced concepts\",\"course_slug\":\"drupal-advanced-concepts\"}', NULL, '2018-01-28 05:46:55', '2018-01-28 05:46:55'),
('af121bce-32e1-485f-bf0a-bd604349d735', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":10,\"course_title\":\"Ruby on Rails advanced training\",\"course_slug\":\"ruby-on-rails-advanced-training\"}', NULL, '2018-01-28 04:00:39', '2018-01-28 04:00:39'),
('b26ab75b-8f57-401c-a85c-ca903cd7193f', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', '2018-01-30 20:58:21', '2018-01-28 04:18:18', '2018-01-30 20:58:21'),
('b3872ae8-4654-416d-b2b9-1ef6d4ccf80d', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":29,\"course_title\":\"Math Courses\",\"course_slug\":\"math-courses\"}', '2018-06-07 05:38:34', '2018-05-10 09:06:32', '2018-06-07 05:38:34'),
('b78359d3-64b0-4878-b77f-9c334d31a1cf', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":12,\"course_title\":\"Wordpress plugin development\",\"course_slug\":\"wordpress-plugin-development\"}', '2018-01-30 20:58:20', '2018-01-28 04:29:39', '2018-01-30 20:58:20'),
('bb76b918-e8dc-4544-9f15-a96fb274b71c', 'App\\Notifications\\Frontend\\CourseReviewed', 2, 'App\\Models\\Auth\\User', '{\"course_id\":19,\"course_title\":\"Drupal for Government projects\",\"course_slug\":\"drupal-for-government-projects\"}', NULL, '2018-01-28 05:40:30', '2018-01-28 05:40:30'),
('bbb7b7e1-7ad9-4702-88a8-94f60638d39c', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:26:04', '2018-04-06 06:26:04'),
('bea97052-d947-43fb-9587-b4f3c68f30a0', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:31:05', '2018-04-06 06:31:05'),
('ca07b96e-9b3e-475d-afb5-f15a43ef7ebb', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:26:00', '2018-04-06 06:26:00'),
('d4478a38-5a2a-4923-b087-76cccf5bc04f', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:50:54', '2018-04-06 06:50:54'),
('d4d2ad4e-e0cd-4441-815b-be938b4aa8e6', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:37:08', '2018-04-06 06:37:08'),
('d6bbb2c6-2787-43f2-b8f0-4132ba57fb27', 'App\\Notifications\\Frontend\\WithdrawalRequestReceived', 13, 'App\\Models\\Auth\\User', '{\"withdrawal_id\":1,\"amount\":\"500\",\"status\":\"pending\",\"comment\":\"We have received your request. It will be processed on Jun 22, 2018\"}', NULL, '2018-06-08 10:55:18', '2018-06-08 10:55:18'),
('dd5f8d5f-b93d-4e18-89fd-b15aa8b36862', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:31:01', '2018-04-06 06:31:01'),
('e3ae3bfa-e109-4ca1-bab2-e8c09f93fea3', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}', NULL, '2018-01-28 01:19:29', '2018-01-28 01:19:29'),
('e40ba10d-5aea-4650-92f1-39e10f49316f', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":31,\"course_title\":\"Maths Essentials\",\"course_slug\":\"maths-essentials\"}', NULL, '2018-08-03 07:13:20', '2018-08-03 07:13:20'),
('e854cd83-9ef2-45ab-89e9-e352eb75d1d9', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":23,\"course_title\":\"Implementing taxes in Opencard\",\"course_slug\":\"implementing-taxes-in-opencard\"}', NULL, '2018-01-28 07:15:45', '2018-01-28 07:15:45'),
('eaae47ac-9e3d-4edf-9b97-20f7243cd739', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":16,\"course_title\":\"Magento essential training\",\"course_slug\":\"magento-essential-training\"}', NULL, '2018-01-28 05:02:07', '2018-01-28 05:02:07'),
('f5d98c27-2f2b-4a27-b99b-728815b864cc', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', '2018-01-30 20:58:21', '2018-01-28 04:18:36', '2018-01-30 20:58:21'),
('f82ac07b-f5e8-4fb2-97e3-ef1c469fd901', 'App\\Notifications\\Frontend\\CourseReviewed', 3, 'App\\Models\\Auth\\User', '{\"course_id\":15,\"course_title\":\"OpenCart advanced plugin development\",\"course_slug\":\"opencart-advanced-plugin-development\"}', NULL, '2018-01-28 04:53:50', '2018-01-28 04:53:50'),
('fa4e5745-638d-4506-bc70-009444522269', 'App\\Notifications\\Frontend\\CourseReviewed', 10, 'App\\Models\\Auth\\User', '{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}', '2018-01-30 20:58:22', '2018-01-28 01:38:26', '2018-01-30 20:58:22'),
('fb627004-0660-487d-9abc-4ee2382f1f7b', 'App\\Notifications\\Frontend\\CourseReviewed', 13, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 07:40:34', '2018-04-06 07:40:34'),
('fcbe61f7-cdc3-401f-b41a-c33c664cdf7b', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":25,\"course_title\":\"ghghgh\",\"course_slug\":\"ghghgh\"}', NULL, '2018-05-08 05:39:29', '2018-05-08 05:39:29'),
('ff966e7f-d7d9-4f49-ad61-d036e4b92f76', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 1, 'App\\Models\\Auth\\User', '{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}', NULL, '2018-01-28 04:17:29', '2018-01-28 04:17:29'),
('ffbfd669-a91a-4f82-80ac-70d701fa3074', 'App\\Notifications\\Backend\\AdminCourseSubmittedForReview', 26, 'App\\Models\\Auth\\User', '{\"course_id\":26,\"course_title\":\"NUMBER SYSTEMS\",\"course_slug\":\"number-systems\"}', NULL, '2018-04-06 06:37:12', '2018-04-06 06:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('31a5b6a48f4856d7a57290a6688af8ea023510b1ac6256258a9ea59ae3097da9299db48583f48051', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:22:39', '2017-12-15 18:22:39', '2018-12-15 18:22:39'),
('3f2ad85f3d274a2f57434d5f2779d0ec40a4035a1b7e0b7505b67490c8627a0b5741a9cfbfedd556', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:13:09', '2017-12-15 18:13:09', '2018-12-15 18:13:09'),
('4877d004f955db3612f87165a7b34a14b768a2ab7be313b63c4868f61f7c04348bba5ea422ed5b44', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:00:37', '2017-12-15 18:00:37', '2018-12-15 18:00:37'),
('87ec9a7b1fab7ff0ca4b58f5696c13cce47a8276664e50a9be77f95b674cd0a5602851a520faa95d', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:10:45', '2017-12-15 18:10:45', '2018-12-15 18:10:45'),
('8bb644a991be45efd7a0d67db4109f3c2a7dcc8e7f0fdb1e96bdb28a644c589705065f78ddbc02d4', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:21:01', '2017-12-15 18:21:01', '2018-12-15 18:21:01'),
('908f78d4364136dee28dfb23c0f53353c72013d8e021ca41ad9ad685daf120d103f5eff628cf0f7b', 3, 1, 'MyApp', '[]', 0, '2017-12-15 18:22:22', '2017-12-15 18:22:22', '2018-12-15 18:22:22'),
('a35f53ba003fe18caa187fbb5a1dde94c0147ceb07ad978855ab67f9eab7eeb086c397652a2b72e1', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:30:37', '2017-12-15 18:30:37', '2018-12-15 18:30:37'),
('b7fdf8996d5d08f1f802d4e3891d4e759cc15b752f8e2e21a86b4be25eff2ef4a546ba4071c8719a', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:27:13', '2017-12-15 18:27:13', '2018-12-15 18:27:13'),
('c00d0b7562a3d1cf0db7e57ab67d81f38f9fd83cbc607309c733b5885e72cd49230089fac3ccd3fc', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:29:22', '2017-12-15 18:29:22', '2018-12-15 18:29:22'),
('cbf9eae03bf9df8a49cdd9551976a9052fb88d17e7ffc5b7f04957cf6d91f888edc75a88567f3000', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:28:34', '2017-12-15 18:28:34', '2018-12-15 18:28:34'),
('ec6e968d14fe8cc1d025f3b69aff5f9eddf9aec8f63e53d122ffd148f0fc5453e671dbb19fb8eab3', 3, 1, 'MyApp', '[]', 1, '2017-12-15 18:17:48', '2017-12-15 18:17:48', '2018-12-15 18:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel 5.5 Boilerplate Personal Access Client', 'jvXvYiHN2nnUsgWcHANtYpfcBWrFvCPKZkdIrLG1', 'http://localhost', 1, 0, 0, '2017-11-30 23:31:38', '2017-11-30 23:31:38'),
(2, NULL, 'Laravel 5.5 Boilerplate Password Grant Client', 'XVIwfE0rlNDEL0fIBGYKVXoxbuSl6xy04p4sXttj', 'http://localhost', 0, 1, 0, '2017-11-30 23:31:38', '2017-11-30 23:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-11-30 23:31:38', '2017-11-30 23:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `validity` date NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `slug`, `price`, `created_at`, `updated_at`, `validity`, `discount`) VALUES
(5, 'Bonus', 'Get 5% Extra Value on this Package', 'bonus', '2500.00', '2018-05-07 09:54:16', '2018-06-08 10:30:06', '2018-05-08', '5'),
(6, 'Dhamaka', 'Get 10% extra value on this Package', 'dhamaka', '5000.00', '2018-05-07 09:55:14', '2018-06-08 10:31:32', '2018-05-09', '10');

-- --------------------------------------------------------

--
-- Table structure for table `package_users`
--

CREATE TABLE `package_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `amount_paid` decimal(8,2) NOT NULL,
  `number_used` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `validity` date NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_users`
--

INSERT INTO `package_users` (`id`, `user_id`, `package_id`, `payment_id`, `amount_paid`, `number_used`, `created_at`, `updated_at`, `validity`, `discount`) VALUES
(1, 27, 6, 7, '5000.00', 5554, '2018-05-08 04:07:49', '2018-05-08 06:28:52', '2018-05-09', '15'),
(2, 28, 6, 9, '5000.00', 5554, '2018-05-08 06:46:01', '2018-05-08 06:46:34', '2018-05-09', '15'),
(3, 28, 5, 12, '2500.00', 2167, '2018-05-10 09:21:14', '2018-05-10 09:23:45', '2018-05-08', '5'),
(4, 29, 6, 14, '5000.00', 0, '2018-06-05 00:26:28', '2018-06-05 00:26:28', '2018-05-09', '15'),
(5, 32, 5, 15, '2500.00', 0, '2018-06-08 10:04:54', '2018-06-08 10:04:54', '2018-05-08', '5'),
(6, 32, 6, 16, '5000.00', 0, '2018-06-08 10:06:06', '2018-06-08 10:06:06', '2018-05-09', '10'),
(7, 27, 6, 18, '5000.00', 0, '2018-06-13 13:27:37', '2018-06-13 13:27:37', '2018-05-09', '10'),
(8, 32, 6, 19, '5000.00', 0, '2018-07-13 07:23:55', '2018-07-13 07:23:55', '2018-05-09', '10');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `thread_id`, `user_id`, `last_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 34, '2018-06-13 09:52:20', '2018-06-13 09:50:03', '2018-06-13 09:52:20', NULL),
(2, 1, 13, NULL, '2018-06-13 09:50:03', '2018-06-13 09:50:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('kushal@smarts3.in', '$2y$10$mI5bhiRP4Wp3unMJlPVbQORtHhTE7KbjfJ0wD9NXyBkbbtVM4h806', '2018-06-08 10:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `payer_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED DEFAULT NULL,
  `user_package_id` int(11) DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_earning` decimal(10,2) DEFAULT NULL,
  `affiliate_earning` decimal(10,2) DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `course_id`, `payer_id`, `coupon_id`, `user_package_id`, `payment_method`, `amount`, `description`, `author_earning`, `affiliate_earning`, `payment_id`, `referred_by`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 26, 27, NULL, NULL, 'razorpay', '30.00', 'sale', '22.50', '0.00', 'RazorPay ID: pay_9vys3nGEuDVyD2', NULL, 1, '2018-04-06 09:48:51', '2018-04-06 09:48:52'),
(2, NULL, 27, NULL, NULL, 'razorpay', '600.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A7Jz2j5jC3RNsj', NULL, NULL, '2018-05-05 01:37:03', '2018-05-05 01:37:03'),
(3, NULL, 27, NULL, NULL, 'razorpay', '2500.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8GEx9kVRLLmRG', NULL, NULL, '2018-05-07 10:36:16', '2018-05-07 10:36:16'),
(4, NULL, 27, NULL, NULL, 'razorpay', '2500.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8Y5361UeveV1v', NULL, NULL, '2018-05-08 04:03:22', '2018-05-08 04:03:22'),
(5, NULL, 27, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8Y6swhbReCCwl', NULL, NULL, '2018-05-08 04:05:07', '2018-05-08 04:05:07'),
(6, NULL, 27, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8Y849Ih1zQlAB', NULL, NULL, '2018-05-08 04:06:13', '2018-05-08 04:06:13'),
(7, NULL, 27, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8Y9l93VbU2owR', NULL, NULL, '2018-05-08 04:07:49', '2018-05-08 04:07:49'),
(8, 25, 27, NULL, 1, 'subscription package', '196.00', 'sale', '58.80', '0.00', 'Course purchased with subscription package Subscription 2', NULL, 2, '2018-05-08 06:28:52', '2018-05-08 06:28:52'),
(9, NULL, 28, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A8aqtRuKbng73U', NULL, NULL, '2018-05-08 06:46:01', '2018-05-08 06:46:01'),
(10, 26, 28, NULL, 2, 'subscription package', '196.00', 'sale', '58.80', '0.00', 'Course purchased with subscription package Subscription 2', NULL, 3, '2018-05-08 06:46:34', '2018-05-08 06:46:34'),
(11, 25, 28, NULL, 2, 'subscription package', '196.00', 'sale', '58.80', '0.00', 'Course purchased with subscription package Subscription 2', NULL, 4, '2018-05-09 04:45:58', '2018-05-09 04:45:58'),
(12, NULL, 28, NULL, NULL, 'razorpay', '2500.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_A9QYwOtIu6JIF4', NULL, NULL, '2018-05-10 09:21:14', '2018-05-10 09:21:14'),
(13, 29, 28, NULL, 3, 'subscription package', '458.00', 'sale', '137.40', '0.00', 'Course purchased with subscription package Subscription 1', NULL, 5, '2018-05-10 09:23:45', '2018-05-10 09:23:45'),
(14, NULL, 29, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_AJZLHqW5mZmhNO', NULL, NULL, '2018-06-05 00:26:28', '2018-06-05 00:26:28'),
(15, NULL, 32, NULL, NULL, 'razorpay', '2500.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_AKpAohS5WymX58', NULL, NULL, '2018-06-08 10:04:54', '2018-06-08 10:04:54'),
(16, NULL, 32, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_AKpC8ym3s1vK1n', NULL, NULL, '2018-06-08 10:06:06', '2018-06-08 10:06:06'),
(17, 26, 34, NULL, NULL, 'razorpay', '458.00', 'sale', '343.50', '0.00', 'RazorPay ID: pay_AKpEj9oaIAXJrh', NULL, 6, '2018-06-08 10:08:38', '2018-06-08 10:08:38'),
(18, NULL, 27, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_AMrHyjQzHfOFDm', NULL, NULL, '2018-06-13 13:27:37', '2018-06-13 13:27:37'),
(19, NULL, 32, NULL, NULL, 'razorpay', '5000.00', 'sale', '0.00', '0.00', 'Package Sale RazorPay ID: pay_AYd81NvpAEge1Z', NULL, NULL, '2018-07-13 07:23:55', '2018-07-13 07:23:55'),
(20, 26, 32, NULL, NULL, 'razorpay', '458.00', 'sale', '343.50', '0.00', 'RazorPay ID: pay_AYd9jQqi3o5v9A', NULL, 8, '2018-07-13 07:25:31', '2018-07-13 07:25:31'),
(21, 31, 32, NULL, NULL, 'razorpay', '131.00', 'sale', '98.25', '0.00', 'RazorPay ID: pay_AYdoc4BjE8ipmR', NULL, 9, '2018-07-13 08:04:13', '2018-07-13 08:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view backend', 'web', '2017-11-30 06:37:00', '2017-11-30 06:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `featured_image`, `category_id`, `user_id`, `featured`, `published`, `published_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, '15a59c025e19be.png', 9, 1, 1, 1, '2018-01-13 02:30:25', '2018-01-12 22:41:02', '2018-01-13 08:15:34', NULL),
(5, '15a59c025e19be.png', 10, 1, 1, 1, '2018-01-13 02:30:25', '2018-01-12 22:41:02', '2018-01-13 08:15:34', NULL),
(6, NULL, 11, 1, 0, 1, '2018-01-13 21:00:30', '2018-01-13 20:50:26', '2018-01-13 21:00:30', NULL),
(7, NULL, 11, 1, 0, 1, '2018-01-22 04:50:48', '2018-01-13 20:58:08', '2018-01-22 04:50:48', NULL),
(8, NULL, 11, 1, 0, 0, NULL, '2018-01-13 21:00:06', '2018-02-16 08:01:25', NULL),
(9, NULL, 11, 1, 0, 1, '2018-01-13 21:01:51', '2018-01-13 21:01:47', '2018-01-13 21:01:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_translations`
--

CREATE TABLE `post_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_translations`
--

INSERT INTO `post_translations` (`id`, `post_id`, `locale`, `title`, `intro`, `slug`, `body`, `meta_description`, `created_at`, `updated_at`) VALUES
(3, 3, 'en', 'This is an english post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.', 'this-is-an-english-post', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>', 'Edited meta description for this post', NULL, NULL),
(4, 3, 'fr', 'This is a french post also', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.', 'this-is-a-french-post-also', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>', 'This is the French edited version', '2018-01-12 00:00:00', '2018-01-12 00:00:00'),
(5, 3, 'es', 'Version Espanol', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.', 'version-espanol', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci.<br />\r\n&nbsp;</p>', 'This is the page meta description', NULL, NULL),
(8, 5, 'en', 'This is an english post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.', 'this-is-a-second-english-post', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>', 'Edited meta description for this post', NULL, NULL),
(9, 6, 'en', 'Terms of Service', 'These are our terms of service.', 'terms-of-service', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>', 'Our terms of service', NULL, NULL),
(10, 7, 'en', 'About', 'This is the About us page', 'about', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>', 'This is the about us page', NULL, NULL),
(11, 8, 'en', 'Advertise with us', 'This is our advertise with us page for potential promotions', 'advertise-with-us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>', NULL, NULL, NULL),
(12, 9, 'en', 'Privacy', 'Your privacy matters to us. This is our privacy page', 'privacy', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>', NULL, NULL, NULL),
(13, 7, 'es', 'Sobre nosotros', 'This is the About us page', 'sobre-nosotros', '<p>Spanish Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>', 'This is the about us page', '2018-01-13 00:00:00', '2018-01-13 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `question_id`, `answer`, `correct`, `explanation`, `created_at`, `updated_at`) VALUES
(28, 12, '3', 0, NULL, '2018-04-06 04:42:58', '2018-04-06 04:42:58'),
(29, 12, '4', 1, NULL, '2018-04-06 04:43:07', '2018-04-06 04:43:07'),
(30, 12, '16', 0, NULL, '2018-04-06 04:43:23', '2018-04-06 04:43:23'),
(31, 12, '4', 0, NULL, '2018-04-06 04:43:32', '2018-04-06 04:43:32'),
(32, 13, 'hdfh', 1, 'dsadsa', '2018-05-10 09:01:40', '2018-05-10 09:01:40'),
(33, 13, 'rewrew', 0, 'erwrew', '2018-05-10 09:01:47', '2018-05-10 09:01:47'),
(34, 13, 'ewrerw', 0, 'erwrew', '2018-05-10 09:01:55', '2018-05-10 09:01:55'),
(35, 13, 'hdf', 0, 'dsadsa', '2018-05-10 09:02:07', '2018-05-10 09:02:07'),
(36, 14, 'maths', 1, NULL, '2018-06-08 10:47:55', '2018-06-08 10:47:55'),
(42, 15, '150 metres', 1, 'rignt', '2018-07-13 07:37:14', '2018-07-13 07:37:14'),
(43, 15, '120', 0, NULL, '2018-07-13 07:37:31', '2018-07-13 07:37:31'),
(45, 16, 'Hot, dry weather in the region, combined with the presence of desert or ocean, causes conditions for earthquakes.', 1, NULL, '2018-07-13 07:59:47', '2018-07-13 07:59:47'),
(46, 16, 'The presence of a fault, a meeting of two different tectonic plates of the earth, causes conditions for earthquakes.', 0, NULL, '2018-07-13 08:00:03', '2018-07-13 08:00:03'),
(47, 16, 'It’s a matter of chance; earthquakes occur at random in all geographic regions.', 0, NULL, '2018-07-13 08:00:15', '2018-07-13 08:00:15'),
(49, 17, '3', 0, NULL, '2018-07-13 08:00:58', '2018-07-13 08:00:58'),
(50, 17, '4', 1, NULL, '2018-07-13 08:01:05', '2018-07-13 08:01:05'),
(51, 17, '5', 0, NULL, '2018-07-13 08:01:12', '2018-07-13 08:01:12'),
(52, 17, '6', 0, NULL, '2018-07-13 08:01:19', '2018-07-13 08:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `total_attempted` int(11) NOT NULL,
  `total_correct` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `user_id`, `lesson_id`, `total_attempted`, `total_correct`, `created_at`, `updated_at`) VALUES
(1, 27, 106, 1, 0, '2018-04-10 05:46:18', '2018-04-10 05:46:18'),
(2, 32, 118, 2, 1, '2018-07-13 08:04:44', '2018-07-13 08:04:44'),
(3, 13, 106, 2, 1, '2018-07-14 05:44:46', '2018-07-14 05:44:46'),
(4, 13, 118, 2, 0, '2018-07-14 05:48:12', '2018-07-14 05:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempt_details`
--

CREATE TABLE `quiz_attempt_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `attempt_id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chosen_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_attempt_details`
--

INSERT INTO `quiz_attempt_details` (`id`, `attempt_id`, `question`, `chosen_answer`, `correct_answer`, `created_at`, `updated_at`) VALUES
(1, 1, '<p>What is Square root of 4?</p>', '3', '4', '2018-04-10 05:46:18', '2018-04-10 05:46:18'),
(2, 2, '<p><span style=\"color: rgb(34, 34, 34);\">Why do certain regions experience more earthquakes?</span></p>', 'The presence of a fault, a meeting of two different tectonic plates of the earth, causes conditions for earthquakes.', 'Hot, dry weather in the region, combined with the presence of desert or ocean, causes conditions for earthquakes.', '2018-07-13 08:04:44', '2018-07-13 08:04:44'),
(3, 2, '<p><span style=\"color: rgb(34, 34, 34);\">According to modern convention, how many oceans are there in the world?</span></p>', '4', '4', '2018-07-13 08:04:44', '2018-07-13 08:04:44'),
(4, 3, '<p>What is Square root of 4?</p>', '3', '4', '2018-07-14 05:44:46', '2018-07-14 05:44:46'),
(5, 3, '<p>&nbsp;A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?</p>', '150 metres', '150 metres', '2018-07-14 05:44:46', '2018-07-14 05:44:46'),
(6, 4, '<p><span style=\"color: rgb(34, 34, 34);\">Why do certain regions experience more earthquakes?</span></p>', 'The presence of a fault, a meeting of two different tectonic plates of the earth, causes conditions for earthquakes.', 'Hot, dry weather in the region, combined with the presence of desert or ocean, causes conditions for earthquakes.', '2018-07-14 05:48:12', '2018-07-14 05:48:12'),
(7, 4, '<p><span style=\"color: rgb(34, 34, 34);\">According to modern convention, how many oceans are there in the world?</span></p>', '5', '4', '2018-07-14 05:48:12', '2018-07-14 05:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_lesson` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `lesson_id`, `question`, `reference_lesson`, `created_at`, `updated_at`) VALUES
(12, 106, '<p>What is Square root of 4?</p>', NULL, '2018-04-06 04:42:26', '2018-04-06 04:42:35'),
(13, 111, '<p>what is mvc?</p>', NULL, '2018-05-10 09:01:23', '2018-05-10 09:01:23'),
(14, 115, '<p>Whats this quiz about ?</p>', NULL, '2018-06-08 10:47:45', '2018-06-08 10:47:45'),
(15, 106, '<p>&nbsp;A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?</p>', NULL, '2018-07-13 07:34:48', '2018-07-13 07:34:48'),
(16, 118, '<p><span style=\"color: rgb(34, 34, 34);\">Why do certain regions experience more earthquakes?</span></p>', NULL, '2018-07-13 07:58:43', '2018-07-13 07:58:43'),
(17, 118, '<p><span style=\"color: rgb(34, 34, 34);\">According to modern convention, how many oceans are there in the world?</span></p>', NULL, '2018-07-13 08:00:36', '2018-07-13 08:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` decimal(4,1) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2017-11-30 06:37:00', '2017-11-30 06:37:00'),
(2, 'author', 'web', '2017-11-30 06:37:00', '2017-11-30 06:37:00'),
(3, 'user', 'web', '2017-11-30 06:37:00', '2017-11-30 06:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` text COLLATE utf8mb4_unicode_ci,
  `sortOrder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course_id`, `title`, `objective`, `sortOrder`, `created_at`, `updated_at`) VALUES
(52, 25, 'Start here', 'Short course objective', 1, '2018-04-04 08:18:12', '2018-04-04 08:18:12'),
(53, 26, 'Understanding square root', 'Short course objective', 1, '2018-04-06 04:32:18', '2018-04-06 04:39:44'),
(54, 27, 'Start here', 'Short course objective', 1, '2018-05-08 09:31:44', '2018-05-08 09:31:44'),
(55, 28, 'Start here', 'Short course objective', 1, '2018-05-09 11:19:14', '2018-05-09 11:19:14'),
(56, 29, 'Start here', 'Short course objective', 1, '2018-05-10 08:56:55', '2018-05-10 08:56:55'),
(57, 29, 'section 2', 'fdshhgjdfsjhgfds', 2, '2018-05-10 09:00:53', '2018-05-10 09:00:53'),
(58, 30, 'Start here', 'Short course objective', 1, '2018-05-29 05:11:11', '2018-05-29 05:11:11'),
(60, 27, 'bcvb', 'cvbbcv', 2, '2018-06-04 05:07:58', '2018-06-04 05:07:58'),
(61, 31, 'Start here', 'Short course objective', 1, '2018-07-13 07:50:02', '2018-07-13 07:50:02'),
(62, 32, 'Start here', 'Short course objective', 1, '2018-08-23 07:10:09', '2018-08-23 07:10:09'),
(63, 33, 'Start here', 'Short course objective', 1, '2018-08-28 09:11:11', '2018-08-28 09:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'New Message from Kushal Dubal', '2018-06-13 09:50:03', '2018-06-13 09:50:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `uuid`, `user_id`, `type`, `description`, `long_description`, `amount`, `created_at`, `updated_at`) VALUES
(1, '1525460752', 13, 'credit', 'Sale', 'Sale of NUMBER SYSTEMS', '22.50', '2018-04-06 09:48:52', '2018-04-06 09:48:52'),
(2, '1528212272', 13, 'credit', 'Sale', 'Sale of ghghgh', '58.80', '2018-05-08 06:28:52', '2018-05-08 06:28:52'),
(3, '1528213359', 13, 'credit', 'Sale', 'Sale of NUMBER SYSTEMS', '58.80', '2018-05-08 06:46:34', '2018-05-08 06:46:34'),
(4, '1528292477', 13, 'credit', 'Sale', 'Sale of ghghgh', '58.80', '2018-05-09 04:45:58', '2018-05-09 04:45:58'),
(5, '1528396012', 13, 'credit', 'Sale', 'Sale of Math Courses', '137.40', '2018-05-10 09:23:45', '2018-05-10 09:23:45'),
(6, '1530885006', 13, 'credit', 'Sale', 'Sale of NUMBER SYSTEMS', '343.50', '2018-06-08 10:08:38', '2018-06-08 10:08:38'),
(7, '1530886584', 13, 'debit', 'Withdrawal request', 'Withdrawal to kushaldubals3@gmail.com via PayPal', '-500.00', '2018-06-08 10:55:18', '2018-06-08 10:55:18'),
(8, '1533899393', 13, 'credit', 'Sale', 'Sale of NUMBER SYSTEMS', '343.50', '2018-07-13 07:25:31', '2018-07-13 07:25:31'),
(9, '1533900581', 13, 'credit', 'Sale', 'Sale of Maths Essentials', '98.25', '2018-07-13 08:04:13', '2018-07-13 08:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_pct` decimal(5,2) DEFAULT NULL,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `qualification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `avatar_type`, `avatar_location`, `username`, `specialization`, `board`, `country_code`, `country`, `affiliate_id`, `commission_pct`, `tagline`, `bio`, `avatar`, `facebook`, `linkedin`, `github`, `twitter`, `web`, `youtube`, `password`, `password_changed_at`, `active`, `confirmation_code`, `confirmed`, `timezone`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `settings`, `qualification`) VALUES
(1, '0c994bc6-7f56-4046-8271-7f18c0b341aa', 'Admin', 'Istrator', 'yogesh@smarts3.in', 'gravatar', NULL, 'admin', NULL, NULL, 'DE', 'Germany', '988768', NULL, 'Mobile Developer', 'Sed mollis rutrum elementum. Etiam facilisis erat ultricies arcu bibendum, non ullamcorper lacus porttitor. Ut vel leo risus. Nullam augue lectus, fermentum ultricies sodales et, feugiat imperdiet lectus. Morbi et metus eu nisi accumsan porta in et sapien. Nam sit amet consequat elit, eu volutpat ipsum. Sed id ante malesuada, hendrerit tellus non, sagittis lectus. Duis porta enim eget neque sodales, sed efficitur justo sollicitudin. Nam suscipit commodo dolor non luctus. Suspendisse at dictum velit. Sed efficitur est ut massa feugiat euismod. Nullam eu dui iaculis, malesuada enim quis, ornare felis. Nunc mattis eros vitae felis aliquet imperdiet. Nulla ac turpis nisl. Quisque tortor elit, blandit vitae velit ut, tincidunt lobortis arcu.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OBHgSZVvmmhwnoigp9ISIOUJokqmfAKZ9iZBsBobIUdlaWQyHER12', NULL, 0, '986da86b276843fa2190b55a0521dcbe', 1, 'UTC', 'sSB6s251QaOD85ImxBsRgStnX9AEWfxsDtDZ1yO9EdSx133um4XwoJ5VBW29', '2017-11-30 06:37:00', '2018-04-03 13:09:32', NULL, '{\"show_profile_in_search\":\"true\",\"notify_when_mentioned\":\"false\",\"notify_when_question_responded\":\"false\",\"notify_when_new_announcement\":\"true\",\"notify_when_answer_marked_as_correct\":\"true\",\"notify_when_followed_question_is_answered\":\"true\",\"notify_when_my_question_is_marked_as_answered\":\"true\",\"notify_when_course_is_reviewed\":\"true\",\"send_me_helpful_resources\":\"true\",\"notify_when_new_question_in_my_course\":\"true\",\"notify_when_question_i_am_following_responded\":\"false\"}', NULL),
(10, 'c882e2bf-624d-4502-8c60-c2e1cabd18f6', 'Lucy', 'Swindol', 'lucy@educore.io', 'storage', '/uploads/images/avatar/15a6d1d8354cd8.png', 'lucy_swindol', NULL, NULL, 'CH', 'Switzerland', '877676', NULL, 'Senior Web Developer', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. </p><p><br></p><p>Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p>', '15a6d1d8354cd8.png', 'myfb', 'mylinkedin', NULL, NULL, NULL, NULL, '$2y$10$BATNzUFBbr2HB/PSiJfPoOmVEdp3BClEH0htKUpKtvlEfCu.Syogi', NULL, 0, '0a3d22a73e872a6ce5ac8c55f407170d', 1, 'UTC', 'IFWQAUKdpO96MZ4v3VjFoIGZZxNk5P5AewIatyKVTBgUDzaPeuAXHBxBzAze', '2018-01-28 00:12:39', '2018-04-03 13:09:41', '2018-04-03 13:09:41', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(12, '4026e533-6b9f-42f7-a89b-d33a6553459a', 'Neba', 'Gabs', 'gabs@educore.io', 'gravatar', NULL, 'gabs', NULL, NULL, 'AR', 'Argentina', '2778536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Pm0Me.hX7gxEpGfgqAs3VuVYth4g5fqiGeyWmgVtOQvrJQ/u2qeRy', NULL, 1, '6ae711b8f2b14772b92149cf7839b5fd', 1, 'UTC', NULL, '2018-02-08 16:59:40', '2018-04-03 12:56:58', '2018-04-03 12:56:58', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(13, 'caf07456-c8f9-489b-b3d5-1f23084eae3b', 'Kushal', 'Dubal', 'kushaldubals3@gmail.com', 'storage', '/uploads/images/avatar/15b0c0d70132a7.png', 'jessica', NULL, NULL, 'IN', 'India', NULL, NULL, 'Founder & CEO', '<p>fvhgbdvc</p>', '15b0c0d70132a7.png', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$McvIMNrADP/ws8Kvgf4SGuFVHOdlSanfCKrloaczSq54nLdUUm.1e', NULL, 1, '11c269c8ba3f5a28ad16349f53182338', 1, 'UTC', 'z3d8zQtF2TisFbsnkV49VQ164iaB9BgE7w315YkemjLFFvVQmCnTNjf49x8i', '2018-02-08 17:10:55', '2018-08-28 09:04:19', NULL, NULL, NULL),
(14, '31c677d1-0e6c-4b3b-b096-bda15cf927f1', 'yogs', 'singh', 'yogs@gmail.com', 'gravatar', NULL, 'yogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rMzOSSAP/YY5sxzCK8sO8OMsXfIvNUuUJVSZPJfoChH8gl2Dz3m7.', NULL, 1, 'd2e8b69fc09758bd75b0b8f2ff9d204d', 1, 'UTC', NULL, '2018-03-03 03:32:35', '2018-04-03 12:56:23', '2018-04-03 12:56:23', NULL, NULL),
(15, 'e2bde571-e3d4-4995-a3f2-d9ff78400e09', 'sfdsdf', 'sdfdfs', 'dsffds@gmail.com', 'gravatar', NULL, 'dsfdsf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$FLavE3o3gmppsPrqO4v8fe1PM.XeneuxqlfeghvFhocK1mnihToly', NULL, 1, '5d7b73ca4fa2fd3b7f008b84046d1753', 1, 'UTC', NULL, '2018-03-03 03:33:18', '2018-04-03 12:55:48', '2018-04-03 12:55:48', NULL, NULL),
(16, '94f20957-2600-40c7-bc5f-34bd62c7cc18', 'fghfgh', 'fghfghfgh', 'gfhfgh@gmai.com', 'gravatar', NULL, 'superadmin', NULL, NULL, 'AT', 'Austria', '9310881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$fX/07a8Dfh2W51a1gZ.sZudBwLUdRW9kka9Dz5.RxUzs3nIWZ/brK', NULL, 1, '43064a32f0623762f2572d59ef1dd15f', 1, 'UTC', NULL, '2018-03-03 08:43:24', '2018-04-03 12:55:33', '2018-04-03 12:55:33', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(17, '9c665493-fd81-4a04-8174-083b16728e94', 'Dinesh', 'Yadav', 'Dinesh@gmail.com', 'gravatar', NULL, 'diny', NULL, NULL, NULL, NULL, '2471193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$KRDl.TOcBW6dhaBNr/RwvOhsxhkqKIcV0znRjpZ0MIimCTSsIjvJK', NULL, 1, 'ccc47c041ec336e333a3d6e33a613935', 0, 'UTC', NULL, '2018-03-07 10:01:31', '2018-04-03 12:55:13', '2018-04-03 12:55:13', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(18, '8fe3a7df-0bab-49e9-93f5-1a125a0c1565', 'gfdgfd', 'fdggdf', 'fdgdgf@gmail.com', 'gravatar', NULL, 'jgfd', NULL, NULL, NULL, NULL, '5308341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$7/j5DSHSmG.f.wmFyDebguBLLTSpV.QlrdO3y.HKgyn1KcBqJfG.O', NULL, 1, 'd59c5d3a63b4ceb7716d2757e751d38e', 0, 'UTC', NULL, '2018-03-07 10:06:09', '2018-04-03 12:54:50', '2018-04-03 12:54:50', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(19, 'e3309d28-3e9c-4b30-8c10-2b58e6da8b4c', 'fdsfds', 'sfdfds', 'fsddfsfds@gmail.com', 'gravatar', NULL, 'fsdfds', NULL, NULL, NULL, NULL, '3268518', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$YrgRpPdSvSQv0g0ZDMX1TOiIk/JPGOmwPPwIHZMtJZDFncgER9LJO', NULL, 1, '312c33ce251d8c2bff0070dc6bd12063', 0, 'UTC', NULL, '2018-03-07 10:21:48', '2018-04-03 12:54:39', '2018-04-03 12:54:39', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(20, '2a302e58-1ae1-4127-9730-4a3ed4d6c8e1', 'dsdsfsdf', 'dsfsdffds', 'dfssdf@gmail.com', 'gravatar', NULL, 'dfdfdsdsf', NULL, NULL, NULL, NULL, '2042887', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZPybZyv8b2hgmK.zN04zOevMI6fdGw7FDOFw3LBNd9bEad.f.dsy.', NULL, 1, '8605f2374ce649e9bffda1a35339bd95', 0, 'UTC', NULL, '2018-03-07 10:28:33', '2018-04-03 12:54:25', '2018-04-03 12:54:25', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(21, 'a5f48896-3736-48af-b573-e1f545397115', 'trytry', 'ytrytr', 'ytrytrr@hgfh.com', 'gravatar', NULL, 'rtrty', NULL, NULL, NULL, NULL, '4834627', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IK3O9JbQVd8xMEPIAPWcDuvNS5NDoQPifMq.rAObfqmd/PWqc/oP.', NULL, 1, 'a43242907083246488547fe9acbb5548', 0, 'UTC', NULL, '2018-03-07 10:32:40', '2018-04-03 12:52:06', '2018-04-03 12:52:06', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', NULL),
(22, '3dcadfcd-14a2-4e50-8b6f-29c026cfb8f6', 'gdfgfd', 'dgfdfg', 'dfgdfdgf@gmail.com', 'gravatar', NULL, 'fdggdf', 'specialization', 'CBSE', NULL, NULL, '2830047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xuy2Lh.rj2FYM.GQz4Dk1.Lo/yhOIy1ozRGlak7yHKE/bwS0aij62', NULL, 1, '460c0b808816ed65cb21dffca99c2c9a', 0, 'UTC', NULL, '2018-03-07 10:38:59', '2018-04-03 12:51:56', '2018-04-03 12:51:56', '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'qualification'),
(26, 'd82c8d03-037d-4238-9510-1051d65f579d', 'Teacher', 'Dada', 'mail.teacherdada@gmail.com', 'gravatar', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$VhsTd4d58t6/lG6qZRoQpeUIMNsdGLURGo4.S1L0kL1EVfC3sw8/K', NULL, 1, '564cea5af2f55c3a28685db050e9760a', 1, 'UTC', 'jPPynkuAYrrU44zibWNISw5ChyyJJ04PKgZbFKlwEQF3FIFs8joQH0wxuLFb', '2018-04-03 13:03:46', '2018-04-03 13:03:46', NULL, '{\"show_profile_in_search\":\"true\",\"notify_when_mentioned\":\"false\",\"notify_when_question_responded\":\"false\",\"notify_when_new_announcement\":\"true\",\"notify_when_answer_marked_as_correct\":\"true\",\"notify_when_followed_question_is_answered\":\"true\",\"notify_when_my_question_is_marked_as_answered\":\"true\",\"notify_when_course_is_reviewed\":\"true\",\"send_me_helpful_resources\":\"true\",\"notify_when_new_question_in_my_course\":\"true\",\"notify_when_question_i_am_following_responded\":\"false\"}', NULL),
(27, 'f3a15a2f-f440-426c-8677-2e38573a3f75', 'Rupesh', 'Singh', 'yogi.scripts@gmail.com', 'gravatar', NULL, 'Rupesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$M5YD5NhUA/aiqZJwHbM5jO7FFtA7F9Km392rOd5.p4703..HKAMm.', NULL, 1, '85de0532fdde52fad4aa56b8364ac88a', 1, 'UTC', 'amHPKLCYjipB9EtaMgTVjq0nCukS89u9aR5RkuFCFDfTEMu45BLfF033vZMR', '2018-04-06 09:46:45', '2018-05-08 05:41:53', NULL, NULL, NULL),
(28, '8bf0e1e2-96cf-4bff-8249-d6539a85c1a0', 'abc', 'xyz', 'abc@smarts3.in', 'gravatar', NULL, 'abc123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IzLwe0hVglDyGu0NOTP.ue9BSV0YXLf8i1GKDhdnoi1SDJLdsZbLO', NULL, 1, '875e7b9368348beb25fc6469513489ef', 1, 'UTC', NULL, '2018-05-08 06:43:20', '2018-05-10 09:20:20', NULL, NULL, NULL),
(29, 'd347bd66-5d4b-4dca-b740-e369cd822a4c', 'Yogesh', 'Singh', 'webdeveloper.yogesh@gmail.com', 'gravatar', NULL, 'webdeveloper.yogesh', 'specialization', 'CBSE', '+91', 'India', '4531330', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IcnNlpGzfDabjUQuH1eRNuPhuFoNZvzTSfPlRGxCilctnqLcFCVN6', NULL, 1, '3fdc24df9f7311a1bf30137b0fd1ad91', 1, 'UTC', 'Pm3NJtDgZuDd3aD3UzKj0GY8W2ozeZ0thZvjfZEj6kziVepbLrpsOz6V0xc5', '2018-06-05 00:17:24', '2018-06-05 00:19:51', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'qualification'),
(30, '909c2b71-55d9-426e-8c90-4128dbaef425', 'dsfdfs', 'sdffsd', 'fdssdf@gmail.com', 'gravatar', NULL, 'dfsdsf', '15', 'board', '+91', 'India', '7658553', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$JTMl2YhmMVYitk17gz3zke4LmV72gVhEtPJfcI7MhMTpM6fipO3/G', NULL, 1, '3c02f5bac2bebf65ae267e6c38edbb3a', 0, 'UTC', NULL, '2018-06-06 05:14:56', '2018-06-06 05:15:02', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'Bsc'),
(31, 'c92a8c73-dd3b-40aa-b574-20327335d0d3', 'sdfdssfd', 'dfsdfs', 'sdffds@gmail.com', 'gravatar', NULL, 'sdfdfs', '15', 'board', '+91', 'India', '1929550', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2BeFW0kpWW38LKiohKxNKOWRnk1i1JAUn29kRKJkI5wdbRK6cXMra', NULL, 1, 'dc3af990e0ef0892d0a6ec7853c591a2', 0, 'UTC', NULL, '2018-06-06 05:41:45', '2018-06-06 05:41:48', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'Bsc'),
(32, '763a547f-5ee3-473c-b693-f484ab21ae2f', 'Kinjal', 'Gandhi', 'kinjal@smarts3.in', 'gravatar', NULL, 'kinjal', 'specialization', 'MAHARASHTRA', '+91', 'India', '4764304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$R8XRfv4E5MILwBBTOOwHd.g0Wa9nW0Ve2La/ausSYPabjUI5CsZHe', NULL, 1, '1ef6c3915f5ed283611f62520659dca3', 1, 'UTC', 'wwCDsObsdyIn3nZFwS7wTuyQMPdaTTIHBArZd6sC0DPKVw0PlPxkDLfe6y1d', '2018-06-08 09:48:07', '2018-07-13 07:08:17', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'qualification'),
(34, '95e4c024-0840-40cb-b5cb-0293e5865c0d', 'Kushal', 'Dubal', 'kushal@smarts3.in', 'storage', '/uploads/images/avatar/15b1a53e6a2889.png', 'kushal', 'specialization', 'CBSE', 'IN', 'India', '7494445', NULL, 'CBSE Student', '<p>Top karna hai</p>', '15b1a53e6a2889.png', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ka68hR31rUk4/kWQBEr2GeHSA1hxRDtShBsnDfak5clIdwanDOjGG', NULL, 1, '40ef2ef41fecac0d48aeeb32df026592', 1, 'UTC', 'ENW1gW2c9v9EpJiIXC9GuLjHXaf8voOPsy3efoPLjflrfdJlsj8PN4kRoamu', '2018-06-08 09:51:10', '2018-06-08 10:01:16', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'qualification'),
(35, 'd2f829b3-5ad1-4e75-849e-caf21fb8dcdd', 'Ankit', 'Shah', 'shah.ankit1992@gmail.com', 'gravatar', NULL, 'ankit', '5', 'board', '+91', 'India', '5390209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$2BVag6L0DQ0IARjQCCPaD.tZKUfwLENzhWx71Ds9jCM5DruSJ9RhC', NULL, 1, '9df5ed262fbefa732bdf6e5c2f419d7a', 0, 'UTC', NULL, '2018-06-08 11:13:22', '2018-06-08 11:13:23', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'BA'),
(36, 'b834f441-421d-478e-94dc-64fd4d53d804', 'jordy', 'php', 'jordyphilippaerts17@outlook.com', 'gravatar', NULL, 'jordy', '19', 'board', '+91', 'India', '1454752', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$iqUVMGn/LAdG8s9JT1Y2cuxfQJhPl3Ng5GGx/rXHio3XV.1Q6jg..', NULL, 1, '6565f2f8f09ee6bec8952761d635f66d', 1, 'UTC', NULL, '2018-06-20 16:01:24', '2018-06-20 16:03:14', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'Php'),
(37, 'c735e4b0-3d1f-49d0-8ab2-14b51962c548', 'sushruta', 'samanta', 'sushsam2002@gmail.com', 'gravatar', NULL, 'sushsam2002', 'specialization', 'CBSE', '+91', 'India', '449968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$986EO9aD3ENHJ0p26P96x.6ql3Lmygb7CZf9hr78v4w3DKeE8NLii', NULL, 1, '95862fb2698bc8ccdfb6ed24b9a53d31', 1, 'UTC', 'VBcFVcdZQwWHpWLOJufub8t3FhHtK5eYbAEZCj3FNlddVgHSIozD6J1Ex13Z', '2018-07-19 17:51:31', '2018-07-19 17:55:50', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'qualification'),
(38, '60403268-f3d1-465a-b5c0-ff1f710a74f2', 'sushruta', 'samanta', 'sushsam2002@yahoo.com', 'storage', '/uploads/images/avatar/15b50d51a95a94.png', 'sush', '20', 'board', '+91', 'India', '10078243', NULL, NULL, NULL, '15b50d51a95a94.png', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$u8uSH3COXMRGmWnZ/iUl/OXNaObcftEJhcCUjOTB68jOqpxdQXB2G', NULL, 1, '84a78d6b3a7247809a8ab944d0a9149f', 1, 'UTC', 'QX7oMC8wkgFO4Ujb7BMFAPigPDeq6Ct9FNL6PpbS7PMxACRSSRgz2peIXsmq', '2018-07-19 18:10:11', '2018-07-19 18:14:50', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'BE'),
(39, 'f45e09f9-d8b8-4d66-898c-d7e53b67fc98', 'kinjal', 'gandhi', 'kinjal1307@gmail.com', 'gravatar', NULL, 'kinjal1307', '7', 'board', '+91', 'India', '10406616', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$VyCvnD/eowJdXIPlw8x5XupMv9Q6dyMCT4xk4hUt97lPaMuOvRwy2', NULL, 1, '7ce87704ee958b0859c54033bc7ce0ca', 0, 'UTC', 'QVXZt4gkS9GAgINn0bX0uvCMe84O7GJwpqLMp3qORzXpameY6ZKOJGQKOVDl', '2018-07-27 12:38:28', '2018-07-27 12:38:30', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'B.Ed'),
(40, 'b349c386-cc67-4ea6-8c80-9cd71298db62', 'k', 'g', 'test@gmail.com', 'gravatar', NULL, 'kinjal13', '5', 'board', '+91', 'India', '579743', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$vccERQcdfoD8lHJhTcRvyeUqpI8c47oVvinA05j5TnnUlUjf5WUP2', NULL, 1, '836d117fdfa57ffb8e3a022370464608', 0, 'UTC', NULL, '2018-07-27 12:39:31', '2018-07-27 12:39:32', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'sdgv'),
(41, '8d8c6207-7647-46b6-a409-3ad25fb025b1', 'sid', 'dfs', 'test1@gmail.com', 'gravatar', NULL, 'sid', '8', 'board', '+91', 'India', '11190135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$fL0xUzLwgrTZTVYg7oa0puT.ZQNtXncqdh1mZIUOUWSGFM4Tr93/2', NULL, 1, '72887ec05a2a21addd7eaca047f7c61d', 0, 'UTC', NULL, '2018-07-27 12:41:19', '2018-07-27 12:41:20', NULL, '{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}', 'ghiojhdhs');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','processed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `transaction_id`, `uuid`, `amount`, `paypal_email`, `status`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 7, '5b1a60964b0fb', '500.00', 'kushaldubals3@gmail.com', 'processed', 'We have received your request. It will be processed on Jun 22, 2018', '2018-06-08 10:55:18', '2018-06-08 10:56:37', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `announcements_slug_unique` (`slug`);

--
-- Indexes for table `announcement_course`
--
ALTER TABLE `announcement_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_course_announcement_id_foreign` (`announcement_id`),
  ADD KEY `announcement_course_course_id_foreign` (`course_id`);

--
-- Indexes for table `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_uuid_index` (`uuid`),
  ADD KEY `attachments_model_id_index` (`model_id`);

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_course_id_foreign` (`course_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificates_certificate_no_unique` (`certificate_no`),
  ADD KEY `certificates_user_id_foreign` (`user_id`),
  ADD KEY `certificates_course_id_foreign` (`course_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `completions`
--
ALTER TABLE `completions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `completions_lesson_id_foreign` (`lesson_id`),
  ADD KEY `completions_user_id_foreign` (`user_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_course_id_foreign` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_section_id_foreign` (`section_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_thread_id_foreign` (`thread_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `packages_slug_unique` (`slug`);

--
-- Indexes for table `package_users`
--
ALTER TABLE `package_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_users_user_id_foreign` (`user_id`),
  ADD KEY `package_users_package_id_foreign` (`package_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participants_thread_id_foreign` (`thread_id`),
  ADD KEY `participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_course_id_foreign` (`course_id`),
  ADD KEY `payments_payer_id_foreign` (`payer_id`),
  ADD KEY `payments_coupon_id_foreign` (`coupon_id`),
  ADD KEY `payments_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_translations_post_id_locale_unique` (`post_id`,`locale`),
  ADD UNIQUE KEY `post_translations_slug_unique` (`slug`),
  ADD KEY `post_translations_locale_index` (`locale`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_course_id_foreign` (`course_id`),
  ADD KEY `questions_user_id_foreign` (`user_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_answers_question_id_foreign` (`question_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempts_user_id_foreign` (`user_id`),
  ADD KEY `quiz_attempts_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `quiz_attempt_details`
--
ALTER TABLE `quiz_attempt_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempt_details_attempt_id_foreign` (`attempt_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_course_id_foreign` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`),
  ADD KEY `sessions_user_id_foreign` (`user_id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_affiliate_id_unique` (`affiliate_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `withdrawals_uuid_unique` (`uuid`),
  ADD KEY `withdrawals_user_id_foreign` (`user_id`),
  ADD KEY `withdrawals_transaction_id_foreign` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_course`
--
ALTER TABLE `announcement_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `board`
--
ALTER TABLE `board`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `completions`
--
ALTER TABLE `completions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_users`
--
ALTER TABLE `package_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_translations`
--
ALTER TABLE `post_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quiz_attempt_details`
--
ALTER TABLE `quiz_attempt_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement_course`
--
ALTER TABLE `announcement_course`
  ADD CONSTRAINT `announcement_course_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `completions`
--
ALTER TABLE `completions`
  ADD CONSTRAINT `completions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `completions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_users`
--
ALTER TABLE `package_users`
  ADD CONSTRAINT `package_users_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `payments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `payments_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempt_details`
--
ALTER TABLE `quiz_attempt_details`
  ADD CONSTRAINT `quiz_attempt_details_attempt_id_foreign` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
