-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_settings`
--

DROP TABLE IF EXISTS `admin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_settings`
--

LOCK TABLES `admin_settings` WRITE;
/*!40000 ALTER TABLE `admin_settings` DISABLE KEYS */;
INSERT INTO `admin_settings` VALUES (1,'EduCore','/img/1517090012_educoreLogo.png','Lorem ipsum ipsum','/img/1517090017_favicon.png','UA-111998266-1x','USD','$','front','Udemy clone, Video lessons,',1,'#','#','#','10,20,30,40,50,60,70,80,90,100',0,0,0,1,1,0,'local',120,1,1,0,30.00,75.00,50.00,25.00,1440,'123 Some Street<br />\nCalgary, AB','2018-01-21 19:38:42','2018-01-27 21:53:37');
/*!40000 ALTER TABLE `admin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_course`
--

DROP TABLE IF EXISTS `announcement_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcement_course_announcement_id_foreign` (`announcement_id`),
  KEY `announcement_course_course_id_foreign` (`course_id`),
  CONSTRAINT `announcement_course_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcement_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_course`
--

LOCK TABLES `announcement_course` WRITE;
/*!40000 ALTER TABLE `announcement_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `announcements_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approvable_id` int(10) unsigned NOT NULL,
  `approvable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decision` enum('approved','disapproved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvals`
--

LOCK TABLES `approvals` WRITE;
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
INSERT INTO `approvals` VALUES (4,9,'App\\Models\\Course','disapproved','We advise that you set at least one video lesson as \"Free Preview\" so that potential students can see how you teach before they enroll.','2018-01-28 01:17:19','2018-01-28 01:17:19'),(5,9,'App\\Models\\Course','approved','Kudos! You\'re good to go.','2018-01-28 01:38:26','2018-01-28 01:38:26'),(6,10,'App\\Models\\Course','approved','Good to go!','2018-01-28 04:01:39','2018-01-28 04:01:39'),(7,11,'App\\Models\\Course','disapproved','No quite ready','2018-01-28 04:18:17','2018-01-28 04:18:17'),(8,11,'App\\Models\\Course','approved','Good to go','2018-01-28 04:18:35','2018-01-28 04:18:35'),(9,12,'App\\Models\\Course','approved','You\'re good to go. Your course is now public','2018-01-28 04:29:38','2018-01-28 04:29:38'),(10,13,'App\\Models\\Course','approved','The content is great and good to go. approved!','2018-01-28 04:37:07','2018-01-28 04:37:07'),(11,14,'App\\Models\\Course','approved','Great course. Approved!','2018-01-28 04:46:04','2018-01-28 04:46:04'),(12,15,'App\\Models\\Course','approved','Great course. Good luck with sales.','2018-01-28 04:53:50','2018-01-28 04:53:50'),(13,16,'App\\Models\\Course','approved','Approved. GLWS','2018-01-28 05:02:43','2018-01-28 05:02:43'),(14,17,'App\\Models\\Course','disapproved','Not quite perfect yet. Please add more videos','2018-01-28 05:11:02','2018-01-28 05:11:02'),(15,17,'App\\Models\\Course','approved','Ok this is great!','2018-01-28 05:11:19','2018-01-28 05:11:19'),(16,18,'App\\Models\\Course','approved','Great course. approved','2018-01-28 05:18:52','2018-01-28 05:18:52'),(17,19,'App\\Models\\Course','approved','Great quality. Approved','2018-01-28 05:40:30','2018-01-28 05:40:30'),(18,20,'App\\Models\\Course','approved','Nice course','2018-01-28 05:47:20','2018-01-28 05:47:20'),(19,21,'App\\Models\\Course','approved','Nice one!','2018-01-28 05:55:03','2018-01-28 05:55:03'),(20,22,'App\\Models\\Course','disapproved','Please fix the image','2018-01-28 06:02:42','2018-01-28 06:02:42'),(21,22,'App\\Models\\Course','approved','Ok great!','2018-01-28 06:02:52','2018-01-28 06:02:52');
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filetype` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(10) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(92) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `preview_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(10) unsigned DEFAULT NULL,
  `model_type` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_uuid_index` (`uuid`),
  KEY `attachments_model_id_index` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_user_id_foreign` (`user_id`),
  KEY `bookmarks_course_id_foreign` (`course_id`),
  CONSTRAINT `bookmarks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Web Development','web-development','App\\Models\\Course','#0000ff','2017-11-30 23:37:47','2018-01-30 20:54:05'),(3,1,2,'Ruby on Rails','ruby-on-rails','App\\Models\\Course','#000000','2017-11-30 23:38:07','2018-01-30 20:54:05'),(5,NULL,11,'Mobile Development','mobile-development','App\\Models\\Course','#000000','2017-11-30 23:38:31','2018-01-30 20:54:06'),(6,5,12,'Android','android','App\\Models\\Course','#000000','2017-11-30 23:38:39','2018-01-30 20:54:06'),(7,5,14,'iOS Development','ios-development','App\\Models\\Course','#000000','2017-11-30 23:38:52','2018-01-30 20:54:06'),(9,NULL,3,'Author Help Guides','author-help-guides','App\\Models\\Post','#000000','2017-12-15 21:32:01','2018-01-27 02:57:06'),(10,NULL,1,'Student Help Guides','student-help-guides','App\\Models\\Post','#000000','2017-12-15 21:50:12','2018-01-27 02:56:44'),(11,NULL,2,'Site Pages','site-pages','App\\Models\\Post','#000000','2017-12-15 23:16:23','2018-01-27 02:57:06'),(12,1,3,'Wordpress Development','wordpress-development','App\\Models\\Course','#000000','2017-12-19 21:52:16','2018-01-30 20:54:05'),(13,1,4,'Joomla Development','joomla-development','App\\Models\\Course','#000000','2017-12-19 21:52:29','2018-01-30 20:54:05'),(14,NULL,7,'eCommerce','ecommerce','App\\Models\\Course','#000000','2017-12-19 21:52:48','2018-01-30 20:54:06'),(15,14,10,'Shopify','shopify','App\\Models\\Course','#000000','2017-12-19 21:53:08','2018-01-30 20:54:06'),(16,14,9,'OpenCart','opencart','App\\Models\\Course','#000000','2017-12-19 21:53:20','2018-01-30 20:54:06'),(17,14,8,'Magento','magento','App\\Models\\Course','#000000','2017-12-19 21:53:32','2018-01-30 20:54:06'),(22,1,5,'Laravel','laravel','App\\Models\\Course','#000000','2017-12-19 21:57:32','2018-01-30 20:54:05'),(23,1,6,'Drupal','drupal','App\\Models\\Course','#000000','2017-12-19 21:57:42','2018-01-30 20:54:05'),(26,5,13,'Native Web','native-web','App\\Models\\Course','#000000','2017-12-19 22:01:59','2018-01-30 20:54:06');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `certificate_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_hours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_articles` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_quizzes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificate_no_unique` (`certificate_no`),
  KEY `certificates_user_id_foreign` (`user_id`),
  KEY `certificates_course_id_foreign` (`course_id`),
  CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` int(10) unsigned NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `marked_as_answer` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completions`
--

DROP TABLE IF EXISTS `completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `completions_lesson_id_foreign` (`lesson_id`),
  KEY `completions_user_id_foreign` (`user_id`),
  CONSTRAINT `completions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `completions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completions`
--

LOCK TABLES `completions` WRITE;
/*!40000 ALTER TABLE `completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `content_type` enum('video','article') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'video',
  `video_provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_duration` int(11) DEFAULT NULL,
  `video_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_storage` enum('s3','local') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_src` enum('upload','embed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_body` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `contents_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (54,29,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=3mQjtk2YDkM',NULL,'embed',NULL,'2018-01-28 00:52:13','2018-01-28 00:52:13'),(56,31,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 01:02:34','2018-01-28 01:02:34'),(57,32,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">$(document).ready(function(){\n   console.log(\'Hello World\');\n});\n</pre><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 01:06:13','2018-01-28 01:06:13'),(58,34,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',440,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 01:10:12','2018-01-28 01:10:12'),(59,35,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=1Kt3qjpPdiA',NULL,'embed',NULL,'2018-01-28 01:45:56','2018-01-28 01:45:56'),(60,36,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 01:47:00','2018-01-28 01:47:00'),(62,39,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 01:48:27','2018-01-28 01:48:27'),(63,37,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 01:48:51','2018-01-28 01:48:51'),(64,40,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=1Kt3qjpPdiA',NULL,'embed',NULL,'2018-01-28 04:11:04','2018-01-28 04:11:04'),(65,41,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:12:29','2018-01-28 04:12:29'),(66,42,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:12:40','2018-01-28 04:12:40'),(67,43,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=fgVrevsmLQI',NULL,'embed',NULL,'2018-01-28 04:13:49','2018-01-28 04:13:49'),(68,45,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',440,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:16:58','2018-01-28 04:16:58'),(69,46,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:23:19','2018-01-28 04:23:19'),(70,47,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=-MF-epBurAE',NULL,'embed',NULL,'2018-01-28 04:25:52','2018-01-28 04:25:52'),(71,48,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:26:46','2018-01-28 04:26:46'),(72,49,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:27:55','2018-01-28 04:27:55'),(73,50,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:33:38','2018-01-28 04:33:38'),(74,51,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=-MF-epBurAE',NULL,'embed',NULL,'2018-01-28 04:33:54','2018-01-28 04:33:54'),(75,52,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:35:02','2018-01-28 04:35:02'),(76,53,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:36:04','2018-01-28 04:36:04'),(77,54,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:41:53','2018-01-28 04:41:53'),(78,55,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=haJ9Y_GAivo',NULL,'embed',NULL,'2018-01-28 04:42:36','2018-01-28 04:42:36'),(79,56,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:44:06','2018-01-28 04:44:06'),(80,57,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:44:59','2018-01-28 04:44:59'),(81,58,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:49:15','2018-01-28 04:49:15'),(82,59,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=haJ9Y_GAivo',NULL,'embed',NULL,'2018-01-28 04:50:19','2018-01-28 04:50:19'),(83,60,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=haJ9Y_GAivo',NULL,'embed',NULL,'2018-01-28 04:50:58','2018-01-28 04:50:58'),(84,61,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:51:23','2018-01-28 04:51:23'),(85,62,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:52:17','2018-01-28 04:52:17'),(86,63,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:57:35','2018-01-28 04:57:35'),(87,64,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=JLHH0zGGszE',NULL,'embed',NULL,'2018-01-28 04:57:50','2018-01-28 04:57:50'),(88,65,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 04:58:32','2018-01-28 04:58:32'),(89,66,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 04:59:43','2018-01-28 04:59:43'),(90,67,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=k6T7L-k_xew',NULL,'embed',NULL,'2018-01-28 05:01:38','2018-01-28 05:01:38'),(91,68,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:06:39','2018-01-28 05:06:39'),(92,69,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=k6T7L-k_xew',NULL,'embed',NULL,'2018-01-28 05:07:07','2018-01-28 05:07:07'),(93,70,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:08:32','2018-01-28 05:08:32'),(94,71,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 05:09:10','2018-01-28 05:09:10'),(95,72,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:10:05','2018-01-28 05:10:05'),(96,73,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:15:49','2018-01-28 05:15:49'),(97,74,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=jexxwU0Zh24',NULL,'embed',NULL,'2018-01-28 05:16:45','2018-01-28 05:16:45'),(98,75,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 05:17:30','2018-01-28 05:17:30'),(99,76,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=jexxwU0Zh24',NULL,'embed',NULL,'2018-01-28 05:18:11','2018-01-28 05:18:11'),(100,77,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:35:42','2018-01-28 05:35:42'),(101,78,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=rubREehi7qY',NULL,'embed',NULL,'2018-01-28 05:36:12','2018-01-28 05:36:12'),(102,79,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 05:37:40','2018-01-28 05:37:40'),(103,80,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:38:34','2018-01-28 05:38:34'),(104,81,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=rubREehi7qY',NULL,'embed',NULL,'2018-01-28 05:39:10','2018-01-28 05:39:10'),(105,82,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:43:29','2018-01-28 05:43:29'),(106,83,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 05:43:50','2018-01-28 05:43:50'),(107,84,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=rubREehi7qY',NULL,'embed',NULL,'2018-01-28 05:45:07','2018-01-28 05:45:07'),(108,85,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:46:12','2018-01-28 05:46:12'),(109,86,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=L24YXFbob8s',NULL,'embed',NULL,'2018-01-28 05:50:32','2018-01-28 05:50:32'),(110,87,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:52:19','2018-01-28 05:52:19'),(111,88,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:53:53','2018-01-28 05:53:53'),(112,89,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 05:59:41','2018-01-28 05:59:41'),(113,90,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=L24YXFbob8s',NULL,'embed',NULL,'2018-01-28 06:00:00','2018-01-28 06:00:00'),(114,91,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','2018-01-28 06:01:05','2018-01-28 06:01:05'),(115,92,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=L24YXFbob8s',NULL,'embed',NULL,'2018-01-28 06:01:58','2018-01-28 06:01:58'),(116,93,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 07:11:10','2018-01-28 07:11:10'),(117,94,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=t3GW44edE_8',NULL,'embed',NULL,'2018-01-28 07:12:53','2018-01-28 07:12:53'),(118,95,'article',NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam hendrerit risus quis aliquam ornare. Ut auctor orci enim, non tempus mauris varius vel. Sed facilisis sem vitae libero posuere tincidunt. Curabitur vulputate nibh egestas risus commodo, ac maximus quam suscipit. Mauris vulputate vitae eros in dignissim. Quisque gravida metus nisi, sed porta velit ultrices ut. Ut volutpat euismod mollis. Donec rutrum nunc vitae erat consequat, in vehicula odio finibus. Vivamus ligula mauris, accumsan sit amet volutpat a, maximus at arcu. Mauris id quam rhoncus, eleifend tortor quis, luctus mi. Nulla mi nulla, laoreet vel odio et, commodo mattis ex. Praesent vel leo lectus. Aliquam mollis leo nec consectetur egestas. Phasellus bibendum dignissim augue tempor elementum. Nunc ut purus eget nisi rutrum eleifend. Aliquam erat volutpat.</p><p>In malesuada eros et pellentesque efficitur. Duis fringilla elementum sapien ac finibus. Integer feugiat metus a metus finibus, et ullamcorper justo pharetra. Quisque id pulvinar eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus egestas eros non imperdiet. Ut cursus urna eget tempus efficitur.</p>','2018-01-28 07:13:28','2018-01-28 07:13:28'),(119,96,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 07:14:24','2018-01-28 07:14:24'),(120,97,'video',NULL,'38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4',345,'/uploads/videos/38-ruby-on-rails-how-to-embed-ruby-code-lyndacom-tutorial.mp4','local','upload',NULL,'2018-01-28 07:23:50','2018-01-28 07:23:50'),(121,98,'video','youtube',NULL,1,'https://www.youtube.com/watch?v=UipQKDw2F3A',NULL,'embed',NULL,'2018-01-28 07:24:46','2018-01-28 07:24:46'),(122,99,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=QjeSTK4CXlI',NULL,'embed',NULL,'2018-01-28 07:25:45','2018-01-28 07:25:45'),(123,100,'video','youtube',NULL,0,'https://www.youtube.com/watch?v=Gpf0HyhQpKE',NULL,'embed',NULL,'2018-01-28 07:26:35','2018-01-28 07:26:35');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expires` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sitewide` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_course_id_foreign` (`course_id`),
  CONSTRAINT `coupons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (14,NULL,'CODECODE',70,10,'2018-03-31',1,1,'2017-12-15 07:46:16','2017-12-31 08:09:55');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('all','beginner','intermediate','advanced') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_id_foreign` (`user_id`),
  KEY `courses_category_id_foreign` (`category_id`),
  CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (9,10,3,'Ruby on Rails essential training','Learn the basics of Ruby on Rails','ruby-on-rails-essential-training','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. </p><p><br></p><p><strong>Suspendisse</strong> tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. </p><p><br></p><p><strong>Donec purus est,</strong> imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p>','English','15a6d4b7d34135.png','beginner',0,100,1,1,'2018-01-28 00:48:31','2018-01-30 20:57:23'),(10,10,3,'Ruby on Rails advanced training','Learnadvanced Ruby on Rails concepts','ruby-on-rails-advanced-training','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. </p><p><br></p><p><strong>Suspendisse</strong> tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. </p><p><br></p><p><strong>Donec purus est,</strong> imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p>','English','15a6d2a83c690d.png','advanced',0,100,1,1,'2018-01-28 00:48:31','2018-01-28 04:02:03'),(11,10,15,'Shopify theme development','Learn how to develop themes for Shopify','shopify-theme-development','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. </p><p><br></p><p>Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','Spanish','15a6d4ccf1a95e.png','intermediate',0,0,1,1,'2018-01-28 04:07:01','2018-01-28 04:18:35'),(12,10,12,'Wordpress plugin development','Learn how to develop wordpress plugins','wordpress-plugin-development','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. </p><p><br></p><p>Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d4fdb6615f.png','intermediate',0,80,1,1,'2018-01-28 04:20:08','2018-01-28 04:30:42'),(13,10,12,'Wordpress for absolute beginners','Build a wordpress site from scratch','wordpress-for-absolute-beginners','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin.</p><p><br></p><p>Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','French','15a6d5254bcd75.png','beginner',0,80,1,1,'2018-01-28 04:31:19','2018-01-28 04:37:08'),(14,3,16,'OpenCart essential training','Learn the basics of OpenCart','opencart-essential-training','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p><br></p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d543c5b7b8.png','beginner',0,70,1,1,'2018-01-28 04:39:28','2018-01-28 04:46:05'),(15,3,16,'OpenCart advanced plugin development','Start developing enterprise-scale plugins for OpenCart','opencart-advanced-plugin-development','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d7561dc6b6.png','advanced',0,0,1,1,'2018-01-28 04:47:21','2018-01-28 07:01:54'),(16,3,17,'Magento essential training','Magento from start to finish for absolute beginners','magento-essential-training','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d57c049765.png','intermediate',0,100,1,1,'2018-01-28 04:55:09','2018-01-28 05:02:43'),(17,3,17,'Magento theme development','Theme development for Magento','magento-theme-development','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d5a18a3b51.png','intermediate',0,50,1,1,'2018-01-28 05:04:43','2018-01-28 05:11:19'),(18,3,22,'RESTFul APIs with Laravel and Vuejs','Build RESTFul applications with Vuejs and Laravel','restful-apis-with-laravel-and-vuejs',NULL,NULL,'15a6d5c31381ba.png','all',0,30,1,1,'2018-01-28 05:13:39','2018-01-28 05:18:52'),(19,2,23,'Drupal for Government projects','Built government websites with Drupal','drupal-for-government-projects','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d5e70d48b7.png','advanced',0,50,1,1,'2018-01-28 05:23:22','2018-01-28 05:41:00'),(20,2,23,'Drupal advanced concepts','Advanced web development concepts in Drupal','drupal-advanced-concepts','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d62c341c22.png','intermediate',0,50,1,1,'2018-01-28 05:41:41','2018-01-28 05:47:20'),(21,2,13,'Joomla for non-programmers','Learn how to build sites with Joomla without coding','joomla-for-nonprogrammers','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','English','15a6d647a7de90.png','intermediate',0,90,1,1,'2018-01-28 05:49:03','2018-01-28 05:55:03'),(22,2,13,'Joomla component development','Learn how to develop joomla components','joomla-component-development','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p><p>Vestibulum finibus efficitur scelerisque. Vestibulum placerat purus sem, vel cursus ipsum auctor quis. Nulla facilisi. Vestibulum gravida magna tellus, ac vulputate justo sodales a. Praesent finibus eros ac magna bibendum, ac pulvinar purus ornare. Sed semper tristique neque quis hendrerit. Ut fringilla at lacus eu tincidunt. Aenean magna diam, porttitor vel mollis ut, tempor et lorem. Vivamus ac magna at lacus pellentesque dignissim. Praesent arcu libero, bibendum a scelerisque id, sagittis tincidunt mauris. Sed tempus erat id viverra imperdiet. Morbi placerat facilisis vehicula. Aliquam sollicitudin dictum ex, efficitur ullamcorper lacus ullamcorper ut. Donec quis purus vestibulum, bibendum sem non, scelerisque diam. Donec non congue massa. Duis vel accumsan erat.</p>','French','15a6d669091064.png','advanced',0,80,1,1,'2018-01-28 05:57:33','2018-01-28 06:02:52'),(23,10,16,'Implementing taxes in Opencard','How to implement tax regions in Opencart','implementing-taxes-in-opencard','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam hendrerit risus quis aliquam ornare. Ut auctor orci enim, non tempus mauris varius vel. Sed facilisis sem vitae libero posuere tincidunt. Curabitur vulputate nibh egestas risus commodo, ac maximus quam suscipit. Mauris vulputate vitae eros in dignissim. Quisque gravida metus nisi, sed porta velit ultrices ut. Ut volutpat euismod mollis. Donec rutrum nunc vitae erat consequat, in vehicula odio finibus. Vivamus ligula mauris, accumsan sit amet volutpat a, maximus at arcu. Mauris id quam rhoncus, eleifend tortor quis, luctus mi. Nulla mi nulla, laoreet vel odio et, commodo mattis ex. Praesent vel leo lectus. Aliquam mollis leo nec consectetur egestas. Phasellus bibendum dignissim augue tempor elementum. Nunc ut purus eget nisi rutrum eleifend. Aliquam erat volutpat.</p><p>In malesuada eros et pellentesque efficitur. Duis fringilla elementum sapien ac finibus. Integer feugiat metus a metus finibus, et ullamcorper justo pharetra. Quisque id pulvinar eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus egestas eros non imperdiet. Ut cursus urna eget tempus efficitur.</p>','English','15a6d775701cd6.png','intermediate',0,80,1,1,'2018-01-28 07:08:59','2018-01-28 07:15:45'),(24,2,15,'Shopify advertisement on Facebook','Learn how to advertise your Shopify store on Facebook','shopify-advertisement-on-facebook','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam hendrerit risus quis aliquam ornare. Ut auctor orci enim, non tempus mauris varius vel. Sed facilisis sem vitae libero posuere tincidunt. Curabitur vulputate nibh egestas risus commodo, ac maximus quam suscipit. Mauris vulputate vitae eros in dignissim. Quisque gravida metus nisi, sed porta velit ultrices ut. Ut volutpat euismod mollis. Donec rutrum nunc vitae erat consequat, in vehicula odio finibus. Vivamus ligula mauris, accumsan sit amet volutpat a, maximus at arcu. Mauris id quam rhoncus, eleifend tortor quis, luctus mi. Nulla mi nulla, laoreet vel odio et, commodo mattis ex. Praesent vel leo lectus. Aliquam mollis leo nec consectetur egestas. Phasellus bibendum dignissim augue tempor elementum. Nunc ut purus eget nisi rutrum eleifend. Aliquam erat volutpat.</p><p>In malesuada eros et pellentesque efficitur. Duis fringilla elementum sapien ac finibus. Integer feugiat metus a metus finibus, et ullamcorper justo pharetra. Quisque id pulvinar eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus egestas eros non imperdiet. Ut cursus urna eget tempus efficitur.</p>','English','15a6d7a13278f1.png','intermediate',0,60,1,1,'2018-01-28 07:19:39','2018-01-28 07:26:57');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollments_course_id_foreign` (`course_id`),
  KEY `enrollments_user_id_foreign` (`user_id`),
  CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `followable_id` int(10) unsigned NOT NULL,
  `followable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follows_user_id_foreign` (`user_id`),
  CONSTRAINT `follows_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `preview` tinyint(1) NOT NULL DEFAULT '0',
  `lesson_type` enum('lecture','quiz') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lecture',
  `sortOrder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_section_id_foreign` (`section_id`),
  CONSTRAINT `lessons_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (29,20,'Introduction YouTube video','21578','This is an example YouTube video',1,'lecture',1,'2018-01-28 00:48:31','2018-01-28 00:50:57'),(31,20,'Example uploaded videp','16835','Explore Ruby on Rails',0,'lecture',2,'2018-01-28 01:01:37','2018-01-28 01:01:37'),(32,21,'Sample text lesson','13367','This is a text lesson',0,'lecture',1,'2018-01-28 01:04:55','2018-01-30 20:12:41'),(33,21,'Sample quiz','2699',NULL,0,'quiz',3,'2018-01-28 01:07:06','2018-01-30 20:57:08'),(34,50,'Video with attachment','16191','This is another uploaded video',1,'lecture',1,'2018-01-28 01:09:10','2018-01-30 20:57:08'),(35,22,'YouTube video','19323',NULL,1,'lecture',1,'2018-01-28 01:43:29','2018-01-28 01:43:29'),(36,23,'Video with attachment','2177',NULL,1,'lecture',1,'2018-01-28 01:43:48','2018-01-28 01:45:30'),(37,22,'Sample Article','11633',NULL,0,'lecture',2,'2018-01-28 01:44:05','2018-01-28 01:45:30'),(38,23,'Sample Quiz','10853',NULL,0,'quiz',2,'2018-01-28 01:44:46','2018-01-28 01:45:30'),(39,23,'Uploaded video','4292',NULL,0,'lecture',3,'2018-01-28 01:45:16','2018-01-28 01:45:30'),(40,24,'Youtube video','8122',NULL,0,'lecture',1,'2018-01-28 04:07:01','2018-01-28 04:09:35'),(41,24,'Uploaded Video','6321',NULL,1,'lecture',2,'2018-01-28 04:11:18','2018-01-28 04:11:18'),(42,24,'Example Article','11021',NULL,0,'lecture',3,'2018-01-28 04:11:51','2018-01-28 04:11:51'),(43,25,'Another YouTube video','5993',NULL,1,'lecture',1,'2018-01-28 04:13:14','2018-01-28 04:13:14'),(44,25,'Example quiz','14712',NULL,0,'quiz',2,'2018-01-28 04:14:05','2018-01-28 04:14:05'),(45,25,'Another upload','1255',NULL,1,'lecture',3,'2018-01-28 04:16:10','2018-01-28 04:16:10'),(46,26,'Example uploaded video','14829',NULL,1,'lecture',1,'2018-01-28 04:20:08','2018-01-28 04:28:46'),(47,26,'Youtube video lesson','3494',NULL,1,'lecture',2,'2018-01-28 04:25:07','2018-01-28 04:25:07'),(48,27,'Article example','15394',NULL,0,'lecture',1,'2018-01-28 04:26:20','2018-01-28 04:28:14'),(49,27,'Video with attachment','16844',NULL,1,'lecture',2,'2018-01-28 04:27:17','2018-01-28 04:28:14'),(50,28,'Uploaded video','2645',NULL,1,'lecture',1,'2018-01-28 04:31:19','2018-01-28 04:34:38'),(51,28,'Youtube example','17563',NULL,1,'lecture',2,'2018-01-28 04:33:25','2018-01-28 04:34:29'),(52,29,'Article lesson','7819',NULL,0,'lecture',1,'2018-01-28 04:34:21','2018-01-28 04:34:21'),(53,29,'Uploaded lesson','19623',NULL,0,'lecture',2,'2018-01-28 04:35:26','2018-01-28 04:35:26'),(54,30,'Uploaded video','12165',NULL,1,'lecture',1,'2018-01-28 04:39:29','2018-01-28 04:41:12'),(55,30,'Youtube video','11833',NULL,1,'lecture',2,'2018-01-28 04:41:38','2018-01-28 04:41:38'),(56,31,'Article example','21152',NULL,0,'lecture',1,'2018-01-28 04:43:45','2018-01-28 04:43:45'),(57,31,'Uploaded video','3648',NULL,1,'lecture',2,'2018-01-28 04:44:20','2018-01-28 04:44:20'),(58,32,'Uploaded video','16739',NULL,1,'lecture',1,'2018-01-28 04:47:21','2018-01-28 04:48:32'),(59,32,'Youtube Video','11521',NULL,1,'lecture',2,'2018-01-28 04:50:02','2018-01-28 04:50:02'),(60,33,'Youtube lesson','3710',NULL,0,'lecture',1,'2018-01-28 04:50:47','2018-01-28 04:50:47'),(61,33,'Article example','21083',NULL,0,'lecture',2,'2018-01-28 04:51:11','2018-01-28 04:51:11'),(62,33,'Another upload','2008',NULL,1,'lecture',3,'2018-01-28 04:51:40','2018-01-28 04:51:40'),(63,34,'Uploaded video','4669',NULL,1,'lecture',1,'2018-01-28 04:55:09','2018-01-28 04:56:21'),(64,34,'New Youtube video','14390',NULL,1,'lecture',2,'2018-01-28 04:57:05','2018-01-28 04:57:05'),(65,35,'Article Lesson','16254',NULL,0,'lecture',2,'2018-01-28 04:58:15','2018-01-28 05:01:53'),(66,35,'Another video course','4572',NULL,1,'lecture',1,'2018-01-28 04:58:52','2018-01-28 05:01:53'),(67,35,'YouTube video','2610',NULL,1,'lecture',3,'2018-01-28 05:00:57','2018-01-28 05:00:57'),(68,36,'Video uploaded','8847',NULL,1,'lecture',1,'2018-01-28 05:04:43','2018-01-28 05:06:00'),(69,36,'Youtube video','8961',NULL,1,'lecture',2,'2018-01-28 05:06:52','2018-01-28 05:06:52'),(70,37,'System requirements','16274',NULL,1,'lecture',1,'2018-01-28 05:07:53','2018-01-28 05:07:53'),(71,37,'Text instructions','19758',NULL,0,'lecture',2,'2018-01-28 05:08:55','2018-01-28 05:08:55'),(72,37,'Conclusion','6046',NULL,1,'lecture',3,'2018-01-28 05:09:28','2018-01-28 05:09:28'),(73,38,'Introduction','3659',NULL,1,'lecture',1,'2018-01-28 05:13:39','2018-01-28 05:15:06'),(74,38,'YouTube video example','15224',NULL,1,'lecture',2,'2018-01-28 05:16:12','2018-01-28 05:16:12'),(75,39,'Installation instructions','16103',NULL,0,'lecture',1,'2018-01-28 05:17:16','2018-01-28 05:17:16'),(76,39,'Using Laravel  Lumen','14932',NULL,1,'lecture',2,'2018-01-28 05:17:55','2018-01-28 05:17:55'),(77,40,'Introduction','14376',NULL,0,'lecture',1,'2018-01-28 05:23:22','2018-01-28 05:23:22'),(78,40,'Sample Drupal sites','6688',NULL,1,'lecture',2,'2018-01-28 05:35:35','2018-01-28 05:35:35'),(79,41,'System requirements','4797',NULL,0,'lecture',1,'2018-01-28 05:37:28','2018-01-28 05:37:28'),(80,41,'Downloading Drupal','16480',NULL,1,'lecture',2,'2018-01-28 05:37:57','2018-01-28 05:37:57'),(81,41,'Another Video','5480',NULL,0,'lecture',3,'2018-01-28 05:38:55','2018-01-28 05:38:55'),(82,42,'Introduction','19767',NULL,1,'lecture',1,'2018-01-28 05:41:41','2018-01-28 05:44:29'),(83,42,'Article example','14513',NULL,0,'lecture',3,'2018-01-28 05:43:19','2018-01-28 05:46:39'),(84,42,'YouTube','4185',NULL,1,'lecture',2,'2018-01-28 05:44:22','2018-01-28 05:46:39'),(85,43,'Uploaded video','2192',NULL,0,'lecture',1,'2018-01-28 05:45:34','2018-01-28 05:45:34'),(86,44,'Introduction','6292',NULL,1,'lecture',1,'2018-01-28 05:49:03','2018-01-28 05:51:13'),(87,44,'What is Joomla?','18725',NULL,1,'lecture',2,'2018-01-28 05:51:38','2018-01-28 05:51:38'),(88,44,'Getting help','12346',NULL,0,'lecture',3,'2018-01-28 05:53:15','2018-01-28 05:53:15'),(89,46,'Get started','4457',NULL,1,'lecture',1,'2018-01-28 05:57:33','2018-01-28 05:59:00'),(90,46,'What are components?','2462',NULL,1,'lecture',2,'2018-01-28 05:59:35','2018-01-28 05:59:35'),(91,46,'Read this first','14526',NULL,0,'lecture',3,'2018-01-28 06:00:53','2018-01-28 06:00:53'),(92,46,'How components work','15647',NULL,0,'lecture',4,'2018-01-28 06:01:29','2018-01-28 06:01:29'),(93,47,'Introduction','1360',NULL,0,'lecture',1,'2018-01-28 07:08:59','2018-01-28 07:08:59'),(94,47,'Why OpenCart','10939',NULL,1,'lecture',2,'2018-01-28 07:12:36','2018-01-28 07:12:36'),(95,48,'New Article','17365',NULL,0,'lecture',1,'2018-01-28 07:13:14','2018-01-28 07:15:26'),(96,48,'Conclusion','12814',NULL,0,'lecture',2,'2018-01-28 07:13:45','2018-01-28 07:15:26'),(97,49,'Introduction','13603',NULL,1,'lecture',1,'2018-01-28 07:19:39','2018-01-28 07:24:08'),(98,49,'Why Facebook marketing?','9858',NULL,1,'lecture',2,'2018-01-28 07:23:42','2018-01-28 07:23:55'),(99,49,'Linking Shopify with Facebook','7787',NULL,0,'lecture',3,'2018-01-28 07:25:29','2018-01-28 07:25:29'),(100,49,'Social marketing','21157',NULL,0,'lecture',4,'2018-01-28 07:26:25','2018-01-28 07:26:25'),(102,21,'Test lesson upload','7439',NULL,0,'lecture',2,'2018-01-30 20:56:48','2018-01-30 20:57:08');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ltm_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`),
  KEY `messages_thread_id_foreign` (`thread_id`),
  CONSTRAINT `messages_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_09_03_144628_create_permission_tables',1),(4,'2017_09_11_174816_create_social_accounts_table',1),(5,'2017_09_26_140332_create_cache_table',1),(6,'2017_09_26_140528_create_sessions_table',1),(7,'2017_09_26_140609_create_jobs_table',1),(8,'2017_11_27_043256_create_categories_table',1),(9,'2017_11_27_065628_create_courses_table',1),(10,'2017_11_28_223027_create_sections_table',1),(11,'2017_11_28_223328_create_lessons_table',1),(12,'2017_11_28_224531_create_contents_table',1),(13,'2017_11_28_225901_create_approvals_table',1),(14,'2017_11_28_232322_create_enrollments_table',1),(15,'2017_11_29_021639_create_coupons_table',1),(17,'2017_11_29_023026_create_comments_table',1),(18,'2017_11_29_051206_create_questions_table',1),(19,'2017_11_29_055132_create_reviews_table',1),(20,'2016_06_01_000001_create_oauth_auth_codes_table',2),(21,'2016_06_01_000002_create_oauth_access_tokens_table',2),(22,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),(23,'2016_06_01_000004_create_oauth_clients_table',2),(24,'2016_06_01_000005_create_oauth_personal_access_clients_table',2),(25,'2017_02_21_070324_create_attachments_table',3),(26,'2017_03_17_070324_alter_attachments_table_extend_filetype',3),(27,'2017_08_21_201100_alter_attachments_table_add_group_column',3),(28,'2017_12_01_213655_create_quiz_questions_table',4),(29,'2017_12_01_213715_create_quiz_answers_table',4),(30,'2017_12_01_213726_create_quiz_attempts_table',4),(31,'2017_12_01_213735_create_quiz_attempt_details_table',4),(32,'2017_12_02_205727_create_notifications_table',5),(33,'2017_12_06_232206_create_completions_table',6),(35,'2017_12_07_052401_create_transactions_table',7),(36,'2017_12_07_052402_create_payments_table',7),(37,'2014_10_28_175635_create_threads_table',8),(38,'2014_10_28_175710_create_messages_table',8),(39,'2014_10_28_180224_create_participants_table',8),(40,'2017_12_08_210243_create_withdrawals_table',9),(41,'2017_12_09_043931_create_bookmarks_table',10),(42,'2017_12_09_212253_create_follows_table',11),(45,'2017_12_09_222725_create_announcements_table',12),(46,'2017_12_09_224323_create_announcement_course_table',12),(51,'2018_01_07_202252_add_settings_column_to_users',15),(59,'2014_04_02_193005_create_translations_table',18),(60,'2018_01_12_023954_create_posts_table',18),(61,'2018_01_12_023955_create_post_translations_table',18),(63,'2018_01_12_201956_create_admin_settings_table',19),(64,'2018_01_11_103647_create_certificates_table',20),(67,'2018_01_23_194030_add_country_to_users',21),(72,'2018_02_05_224608_create_packages_table',22),(73,'2018_02_05_224804_create_package_users_table',22);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,1,'App\\Models\\Auth\\User'),(3,2,'App\\Models\\Auth\\User'),(3,3,'App\\Models\\Auth\\User'),(3,10,'App\\Models\\Auth\\User'),(3,12,'App\\Models\\Auth\\User'),(3,13,'App\\Models\\Auth\\User');
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('066a3525-0532-465c-9060-07960fd3ea37','App\\Notifications\\Frontend\\CourseReviewed',2,'App\\Models\\Auth\\User','{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}',NULL,'2018-01-28 06:02:43','2018-01-28 06:02:43'),('0936edb5-d836-44d0-a52d-20918a82f646','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":10,\"course_title\":\"Ruby on Rails advanced training\",\"course_slug\":\"ruby-on-rails-advanced-training\"}','2018-01-30 20:58:21','2018-01-28 04:01:39','2018-01-30 20:58:21'),('094eb4e2-41cf-43de-a8e8-31b029ddc0de','App\\Notifications\\Frontend\\CourseReviewed',2,'App\\Models\\Auth\\User','{\"course_id\":21,\"course_title\":\"Joomla for non-programmers\",\"course_slug\":\"joomla-for-nonprogrammers\"}',NULL,'2018-01-28 05:55:04','2018-01-28 05:55:04'),('107d1448-0af6-4402-aadf-204f7e4e7ccd','App\\Notifications\\Frontend\\CourseReviewed',2,'App\\Models\\Auth\\User','{\"course_id\":20,\"course_title\":\"Drupal advanced concepts\",\"course_slug\":\"drupal-advanced-concepts\"}',NULL,'2018-01-28 05:47:21','2018-01-28 05:47:21'),('181c4ccc-8e1e-4fd8-b50b-22ffe831641d','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":13,\"course_title\":\"Wordpress for absolute beginners\",\"course_slug\":\"wordpress-for-absolute-beginners\"}','2018-01-30 20:58:18','2018-01-28 04:37:08','2018-01-30 20:58:18'),('19cf4d52-288c-43ef-bfa4-9b56ccd79760','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":18,\"course_title\":\"RESTFul APIs with Laravel and Vuejs\",\"course_slug\":\"restful-apis-with-laravel-and-vuejs\"}',NULL,'2018-01-28 05:18:52','2018-01-28 05:18:52'),('213de70a-7794-4cd3-ba76-49b6ad45a605','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":21,\"course_title\":\"Joomla for non-programmers\",\"course_slug\":\"joomla-for-nonprogrammers\"}',NULL,'2018-01-28 05:54:17','2018-01-28 05:54:17'),('2529f8c2-adcd-4c69-8bfc-45e1e52b46a6','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}',NULL,'2018-01-28 05:11:02','2018-01-28 05:11:02'),('26890d1f-2b1b-4d3b-868c-268a714cc6c0','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":19,\"course_title\":\"Drupal for Government projects\",\"course_slug\":\"drupal-for-government-projects\"}',NULL,'2018-01-28 05:39:48','2018-01-28 05:39:48'),('273e4b0e-590a-4ba7-aa8e-0703ff41162c','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":7,\"course_title\":\"Facebook clone with Swift ed\",\"course_slug\":\"facebook-clone\"}',NULL,'2018-01-27 06:47:35','2018-01-27 06:47:35'),('27e363ba-0436-4cb3-9945-bff316c199d9','App\\Notifications\\Frontend\\AnswerNotificationToQuestionAuthor',2,'App\\Models\\Auth\\User','{\"question_id\":3,\"question_title\":\"I have another question\",\"question_slug\":\"403649\",\"course_slug\":\"twitter-clone-with-swift-ed\"}',NULL,'2018-01-27 19:31:43','2018-01-27 19:31:43'),('2898b604-48f0-4d9b-b9b7-790de646c65d','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":12,\"course_title\":\"Wordpress plugin development\",\"course_slug\":\"wordpress-plugin-development\"}',NULL,'2018-01-28 04:28:59','2018-01-28 04:28:59'),('2f0ca086-aa58-45d6-a677-256af6c2c36f','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}',NULL,'2018-01-28 05:10:24','2018-01-28 05:10:24'),('2fe6238a-3ffe-4146-9014-78b5b10ef2b1','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}',NULL,'2018-01-28 01:13:03','2018-01-28 01:13:03'),('34f6646f-fc51-465d-af2c-4c20db4221fb','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}',NULL,'2018-01-28 06:02:14','2018-01-28 06:02:14'),('3b221c9b-5319-4533-bfe9-b55058cb3ff8','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":15,\"course_title\":\"OpenCart advanced plugin development\",\"course_slug\":\"opencart-advanced-plugin-development\"}',NULL,'2018-01-28 04:53:06','2018-01-28 04:53:06'),('3d640e3a-80a9-4e28-a464-c3695beba13d','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":14,\"course_title\":\"OpenCart essential training\",\"course_slug\":\"opencart-essential-training\"}',NULL,'2018-01-28 04:46:05','2018-01-28 04:46:05'),('49dd85b0-c676-41bb-bb1d-ddb39a26741b','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":24,\"course_title\":\"Shopify advertisement on Facebook\",\"course_slug\":\"shopify-advertisement-on-facebook\"}',NULL,'2018-01-28 07:26:58','2018-01-28 07:26:58'),('4e501f03-fca3-4529-ad14-285eaadf0efc','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":17,\"course_title\":\"Magento theme development\",\"course_slug\":\"magento-theme-development\"}',NULL,'2018-01-28 05:11:19','2018-01-28 05:11:19'),('57e09dab-6837-4b65-adae-e468f107b669','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":16,\"course_title\":\"Magento essential training\",\"course_slug\":\"magento-essential-training\"}',NULL,'2018-01-28 05:02:43','2018-01-28 05:02:43'),('59cf7e79-23c9-426a-8a0b-c4317e7e2e35','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}','2018-01-30 20:58:22','2018-01-28 01:17:19','2018-01-30 20:58:22'),('8d9e30d3-a69b-4c71-976d-4df74e04661c','App\\Notifications\\Frontend\\CourseReviewed',2,'App\\Models\\Auth\\User','{\"course_id\":22,\"course_title\":\"Joomla component development\",\"course_slug\":\"joomla-component-development\"}',NULL,'2018-01-28 06:02:52','2018-01-28 06:02:52'),('94265916-2152-46e6-9ba1-a3eb9f4da7b5','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":14,\"course_title\":\"OpenCart essential training\",\"course_slug\":\"opencart-essential-training\"}',NULL,'2018-01-28 04:45:34','2018-01-28 04:45:34'),('969f71d2-0e52-448b-b4cd-67f376e4e2b7','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":18,\"course_title\":\"RESTFul APIs with Laravel and Vuejs\",\"course_slug\":\"restful-apis-with-laravel-and-vuejs\"}',NULL,'2018-01-28 05:18:28','2018-01-28 05:18:28'),('a5abfdcb-29f7-4af3-a3e6-2e4b2a3e1fe9','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":13,\"course_title\":\"Wordpress for absolute beginners\",\"course_slug\":\"wordpress-for-absolute-beginners\"}',NULL,'2018-01-28 04:36:31','2018-01-28 04:36:31'),('aab47fab-643c-485f-838e-a042216e179f','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":20,\"course_title\":\"Drupal advanced concepts\",\"course_slug\":\"drupal-advanced-concepts\"}',NULL,'2018-01-28 05:46:55','2018-01-28 05:46:55'),('af121bce-32e1-485f-bf0a-bd604349d735','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":10,\"course_title\":\"Ruby on Rails advanced training\",\"course_slug\":\"ruby-on-rails-advanced-training\"}',NULL,'2018-01-28 04:00:39','2018-01-28 04:00:39'),('b26ab75b-8f57-401c-a85c-ca903cd7193f','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}','2018-01-30 20:58:21','2018-01-28 04:18:18','2018-01-30 20:58:21'),('b78359d3-64b0-4878-b77f-9c334d31a1cf','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":12,\"course_title\":\"Wordpress plugin development\",\"course_slug\":\"wordpress-plugin-development\"}','2018-01-30 20:58:20','2018-01-28 04:29:39','2018-01-30 20:58:20'),('bb76b918-e8dc-4544-9f15-a96fb274b71c','App\\Notifications\\Frontend\\CourseReviewed',2,'App\\Models\\Auth\\User','{\"course_id\":19,\"course_title\":\"Drupal for Government projects\",\"course_slug\":\"drupal-for-government-projects\"}',NULL,'2018-01-28 05:40:30','2018-01-28 05:40:30'),('e3ae3bfa-e109-4ca1-bab2-e8c09f93fea3','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}',NULL,'2018-01-28 01:19:29','2018-01-28 01:19:29'),('e854cd83-9ef2-45ab-89e9-e352eb75d1d9','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":23,\"course_title\":\"Implementing taxes in Opencard\",\"course_slug\":\"implementing-taxes-in-opencard\"}',NULL,'2018-01-28 07:15:45','2018-01-28 07:15:45'),('eaae47ac-9e3d-4edf-9b97-20f7243cd739','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":16,\"course_title\":\"Magento essential training\",\"course_slug\":\"magento-essential-training\"}',NULL,'2018-01-28 05:02:07','2018-01-28 05:02:07'),('f5d98c27-2f2b-4a27-b99b-728815b864cc','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}','2018-01-30 20:58:21','2018-01-28 04:18:36','2018-01-30 20:58:21'),('f82ac07b-f5e8-4fb2-97e3-ef1c469fd901','App\\Notifications\\Frontend\\CourseReviewed',3,'App\\Models\\Auth\\User','{\"course_id\":15,\"course_title\":\"OpenCart advanced plugin development\",\"course_slug\":\"opencart-advanced-plugin-development\"}',NULL,'2018-01-28 04:53:50','2018-01-28 04:53:50'),('fa4e5745-638d-4506-bc70-009444522269','App\\Notifications\\Frontend\\CourseReviewed',10,'App\\Models\\Auth\\User','{\"course_id\":9,\"course_title\":\"Ruby on Rails essential training\",\"course_slug\":\"ruby-on-rails-essential-training\"}','2018-01-30 20:58:22','2018-01-28 01:38:26','2018-01-30 20:58:22'),('ff966e7f-d7d9-4f49-ad61-d036e4b92f76','App\\Notifications\\Backend\\AdminCourseSubmittedForReview',1,'App\\Models\\Auth\\User','{\"course_id\":11,\"course_title\":\"Shopify theme development\",\"course_slug\":\"shopify-theme-development\"}',NULL,'2018-01-28 04:17:29','2018-01-28 04:17:29');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('31a5b6a48f4856d7a57290a6688af8ea023510b1ac6256258a9ea59ae3097da9299db48583f48051',3,1,'MyApp','[]',1,'2017-12-15 18:22:39','2017-12-15 18:22:39','2018-12-15 18:22:39'),('3f2ad85f3d274a2f57434d5f2779d0ec40a4035a1b7e0b7505b67490c8627a0b5741a9cfbfedd556',3,1,'MyApp','[]',1,'2017-12-15 18:13:09','2017-12-15 18:13:09','2018-12-15 18:13:09'),('4877d004f955db3612f87165a7b34a14b768a2ab7be313b63c4868f61f7c04348bba5ea422ed5b44',3,1,'MyApp','[]',1,'2017-12-15 18:00:37','2017-12-15 18:00:37','2018-12-15 18:00:37'),('87ec9a7b1fab7ff0ca4b58f5696c13cce47a8276664e50a9be77f95b674cd0a5602851a520faa95d',3,1,'MyApp','[]',1,'2017-12-15 18:10:45','2017-12-15 18:10:45','2018-12-15 18:10:45'),('8bb644a991be45efd7a0d67db4109f3c2a7dcc8e7f0fdb1e96bdb28a644c589705065f78ddbc02d4',3,1,'MyApp','[]',1,'2017-12-15 18:21:01','2017-12-15 18:21:01','2018-12-15 18:21:01'),('908f78d4364136dee28dfb23c0f53353c72013d8e021ca41ad9ad685daf120d103f5eff628cf0f7b',3,1,'MyApp','[]',0,'2017-12-15 18:22:22','2017-12-15 18:22:22','2018-12-15 18:22:22'),('a35f53ba003fe18caa187fbb5a1dde94c0147ceb07ad978855ab67f9eab7eeb086c397652a2b72e1',3,1,'MyApp','[]',1,'2017-12-15 18:30:37','2017-12-15 18:30:37','2018-12-15 18:30:37'),('b7fdf8996d5d08f1f802d4e3891d4e759cc15b752f8e2e21a86b4be25eff2ef4a546ba4071c8719a',3,1,'MyApp','[]',1,'2017-12-15 18:27:13','2017-12-15 18:27:13','2018-12-15 18:27:13'),('c00d0b7562a3d1cf0db7e57ab67d81f38f9fd83cbc607309c733b5885e72cd49230089fac3ccd3fc',3,1,'MyApp','[]',1,'2017-12-15 18:29:22','2017-12-15 18:29:22','2018-12-15 18:29:22'),('cbf9eae03bf9df8a49cdd9551976a9052fb88d17e7ffc5b7f04957cf6d91f888edc75a88567f3000',3,1,'MyApp','[]',1,'2017-12-15 18:28:34','2017-12-15 18:28:34','2018-12-15 18:28:34'),('ec6e968d14fe8cc1d025f3b69aff5f9eddf9aec8f63e53d122ffd148f0fc5453e671dbb19fb8eab3',3,1,'MyApp','[]',1,'2017-12-15 18:17:48','2017-12-15 18:17:48','2018-12-15 18:17:48');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel 5.5 Boilerplate Personal Access Client','jvXvYiHN2nnUsgWcHANtYpfcBWrFvCPKZkdIrLG1','http://localhost',1,0,0,'2017-11-30 23:31:38','2017-11-30 23:31:38'),(2,NULL,'Laravel 5.5 Boilerplate Password Grant Client','XVIwfE0rlNDEL0fIBGYKVXoxbuSl6xy04p4sXttj','http://localhost',0,1,0,'2017-11-30 23:31:38','2017-11-30 23:31:38');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2017-11-30 23:31:38','2017-11-30 23:31:38');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_users`
--

DROP TABLE IF EXISTS `package_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned NOT NULL,
  `amount_paid` decimal(8,2) NOT NULL,
  `number_of_courses` int(11) NOT NULL,
  `number_used` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_users_user_id_foreign` (`user_id`),
  KEY `package_users_package_id_foreign` (`package_id`),
  CONSTRAINT `package_users_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `package_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_users`
--

LOCK TABLES `package_users` WRITE;
/*!40000 ALTER TABLE `package_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `number_of_courses` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'3-Course Package','Get any 3 courses for only $100 edited','3-course-package',100.00,3,'2018-02-06 02:32:58','2018-02-06 02:53:06'),(2,'5-Course Package','Get any 5 courses for $200','5-course-package',200.00,5,'2018-02-06 02:52:19','2018-02-06 02:52:19'),(3,'8-Course Package','Get any 8 courses for $200','8-course-package',600.00,8,'2018-02-06 02:52:19','2018-02-06 02:52:19');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `participants_thread_id_foreign` (`thread_id`),
  KEY `participants_user_id_foreign` (`user_id`),
  CONSTRAINT `participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned DEFAULT NULL,
  `payer_id` int(10) unsigned NOT NULL,
  `coupon_id` int(10) unsigned DEFAULT NULL,
  `user_package_id` int(11) DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_earning` decimal(10,2) DEFAULT NULL,
  `affiliate_earning` decimal(10,2) DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `transaction_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_course_id_foreign` (`course_id`),
  KEY `payments_payer_id_foreign` (`payer_id`),
  KEY `payments_coupon_id_foreign` (`coupon_id`),
  KEY `payments_transaction_id_foreign` (`transaction_id`),
  CONSTRAINT `payments_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  CONSTRAINT `payments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `payments_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view backend','web','2017-11-30 06:37:00','2017-11-30 06:37:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_translations`
--

DROP TABLE IF EXISTS `post_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_translations_post_id_locale_unique` (`post_id`,`locale`),
  UNIQUE KEY `post_translations_slug_unique` (`slug`),
  KEY `post_translations_locale_index` (`locale`),
  CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_translations`
--

LOCK TABLES `post_translations` WRITE;
/*!40000 ALTER TABLE `post_translations` DISABLE KEYS */;
INSERT INTO `post_translations` VALUES (3,3,'en','This is an english post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.','this-is-an-english-post','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>','Edited meta description for this post',NULL,NULL),(4,3,'fr','This is a french post also','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.','this-is-a-french-post-also','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>','This is the French edited version','2018-01-12 00:00:00','2018-01-12 00:00:00'),(5,3,'es','Version Espanol','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.','version-espanol','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci.<br />\r\n&nbsp;</p>','This is the page meta description',NULL,NULL),(8,5,'en','This is an english post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend.','this-is-a-second-english-post','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut nisl nec justo porta feugiat. Pellentesque sit amet mollis tortor. Proin sem arcu, aliquet ut nunc eget, elementum faucibus orci. Curabitur vulputate dolor vel egestas eleifend. Fusce varius ipsum eget felis bibendum, a tempor libero suscipit. Etiam pretium consequat magna, at auctor mauris elementum nec. Mauris aliquam hendrerit egestas. Suspendisse a luctus orci. Mauris et justo ac turpis gravida hendrerit. Aenean iaculis lacinia odio. Pellentesque maximus enim vitae velit pellentesque tincidunt. Vivamus venenatis, mauris a ultricies bibendum, ligula ex auctor nunc, non hendrerit nisi turpis nec dui. Duis dictum eget felis sed feugiat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus efficitur, arcu eget varius vestibulum, purus tellus rhoncus libero, eu dignissim ligula dui id risus. Aenean pellentesque magna sed elit faucibus, ac venenatis neque egestas.</p>\r\n\r\n<p>Ut sed eros quis dolor facilisis cursus in eget ligula. Sed magna urna, egestas quis enim vitae, auctor consequat dolor. Cras imperdiet aliquam lorem, id sagittis purus semper at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sit amet urna ut nunc varius pharetra id quis quam. Etiam quis tempor purus, a tristique ex. Sed mi nisi, pharetra in purus dapibus, lacinia ultricies leo. Aliquam rhoncus fringilla nisi ac tincidunt. In semper ligula sed fermentum feugiat. Morbi fringilla nunc dolor, eu egestas massa cursus sed. In suscipit, dui eget imperdiet feugiat, ante sapien hendrerit erat, et finibus eros nibh a nisl. Vivamus id massa vel turpis porttitor ultricies eget et elit. Nullam ac nunc vehicula, aliquam ante vitae, aliquet lacus. Nulla dapibus ullamcorper nulla, eu interdum lorem viverra ac.</p>','Edited meta description for this post',NULL,NULL),(9,6,'en','Terms of Service','These are our terms of service.','terms-of-service','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>','Our terms of service',NULL,NULL),(10,7,'en','About','This is the About us page','about','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>','This is the about us page',NULL,NULL),(11,8,'en','Advertise with us','This is our advertise with us page for potential promotions','advertise-with-us','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>',NULL,NULL,NULL),(12,9,'en','Privacy','Your privacy matters to us. This is our privacy page','privacy','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>',NULL,NULL,NULL),(13,7,'es','Sobre nosotros','This is the About us page','sobre-nosotros','<p>Spanish Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam metus elit, euismod id urna tristique, facilisis vehicula ex. Proin tincidunt, purus non gravida aliquam, sapien nisl congue velit, condimentum efficitur mauris est ac mi. In volutpat eu eros at ultrices. Integer maximus metus quam, a condimentum dolor luctus non. Vivamus ac tincidunt urna, non vestibulum diam. Phasellus aliquam diam et condimentum blandit. Maecenas vitae risus nunc. Fusce luctus metus at leo blandit, ut tincidunt nunc pretium. Phasellus dictum risus at consequat hendrerit. Sed purus nisl, aliquet non ornare in, consectetur vitae ante.</p>\r\n\r\n<p>Morbi finibus dui arcu, eget luctus neque malesuada nec. Quisque vitae neque ut nisl viverra aliquam. Ut hendrerit nec metus ac euismod. In ut erat dolor. Proin dictum tempus efficitur. Pellentesque viverra nulla ut tellus maximus lacinia. Maecenas dui odio, dapibus quis porttitor viverra, varius non leo. Phasellus at erat id nisi pharetra sagittis in sit amet dui. Nunc vitae libero congue, dictum magna eget, consectetur quam. Mauris lectus felis, feugiat et tincidunt ut, congue sed orci.</p>\r\n\r\n<p>Nam aliquet pellentesque tortor, eu cursus sapien ullamcorper sit amet. Mauris fermentum tempus pellentesque. Maecenas non sapien imperdiet, vehicula nisl a, congue lacus. Mauris ornare id lectus eu congue. Vestibulum accumsan auctor eleifend. Aliquam tempus lorem blandit pretium vehicula. Mauris tempus scelerisque gravida. Duis sit amet purus ipsum. Suspendisse ut volutpat ligula. Donec fringilla ante felis, eu rutrum massa bibendum sodales. Quisque id lacinia ex, id placerat mi. Proin facilisis purus ac leo porttitor suscipit. Donec sodales, felis at porttitor semper, justo dui vestibulum metus, aliquam condimentum urna enim sit amet elit. In tellus justo, vehicula at dapibus eget, feugiat sit amet dolor. Morbi tincidunt metus vitae justo vulputate, et ornare risus varius. Vestibulum ornare sapien eros.</p>\r\n\r\n<p>Pellentesque vel eleifend leo. Mauris vel fermentum ante, vitae ultrices eros. Sed et pulvinar quam, sit amet facilisis erat. Pellentesque laoreet urna quis lorem ornare placerat. Duis dictum suscipit odio a mollis. Fusce rhoncus dignissim rhoncus. Duis malesuada velit urna, ut commodo ipsum mollis in. Praesent leo quam, convallis eget efficitur non, aliquam at sapien. Cras nulla libero, feugiat eu egestas vel, vestibulum ac ligula. Donec feugiat turpis est, ut consectetur massa sagittis nec. Aliquam cursus purus ac placerat ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque ut arcu eget lectus lacinia cursus ut id nisl. In nisi mauris, condimentum vehicula orci eu, congue volutpat arcu.</p>','This is the about us page','2018-01-13 00:00:00','2018-01-13 00:00:00');
/*!40000 ALTER TABLE `post_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (3,'15a59c025e19be.png',9,1,1,1,'2018-01-13 02:30:25','2018-01-12 22:41:02','2018-01-13 08:15:34',NULL),(5,'15a59c025e19be.png',10,1,1,1,'2018-01-13 02:30:25','2018-01-12 22:41:02','2018-01-13 08:15:34',NULL),(6,NULL,11,1,0,1,'2018-01-13 21:00:30','2018-01-13 20:50:26','2018-01-13 21:00:30',NULL),(7,NULL,11,1,0,1,'2018-01-22 04:50:48','2018-01-13 20:58:08','2018-01-22 04:50:48',NULL),(8,NULL,11,1,0,1,'2018-01-13 21:01:02','2018-01-13 21:00:06','2018-01-13 21:01:02',NULL),(9,NULL,11,1,0,1,'2018-01-13 21:01:51','2018-01-13 21:01:47','2018-01-13 21:01:51',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_course_id_foreign` (`course_id`),
  KEY `questions_user_id_foreign` (`user_id`),
  CONSTRAINT `questions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answers_question_id_foreign` (`question_id`),
  CONSTRAINT `quiz_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
INSERT INTO `quiz_answers` VALUES (17,7,'A web framework based on Java',0,NULL,'2018-01-28 01:07:43','2018-01-28 01:07:43'),(18,7,'A web framework based on the Ruby language',1,'This is correct. This is a framework based on the Ruby Language','2018-01-28 01:08:13','2018-01-28 01:08:13'),(19,7,'A mobile app framework',0,NULL,'2018-01-28 01:08:35','2018-01-28 01:08:35'),(20,8,'A Java framework',0,NULL,'2018-01-28 01:50:13','2018-01-28 01:50:13'),(21,8,'A Ruby framework',1,NULL,'2018-01-28 01:50:23','2018-01-28 01:50:23'),(22,8,'A C# Framework',0,NULL,'2018-01-28 01:50:37','2018-01-28 01:50:37'),(23,9,'Model View Controller',1,NULL,'2018-01-28 01:51:27','2018-01-28 01:51:27'),(24,9,'Mode Visitor Controller',0,NULL,'2018-01-28 01:52:01','2018-01-28 01:52:01'),(25,9,'Man Visited Convent',0,NULL,'2018-01-28 01:52:12','2018-01-28 01:52:12'),(26,11,'Yes',1,NULL,'2018-01-28 01:52:45','2018-01-28 01:52:45'),(27,11,'No',0,NULL,'2018-01-28 01:52:54','2018-01-28 01:52:54');
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempt_details`
--

DROP TABLE IF EXISTS `quiz_attempt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_attempt_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attempt_id` int(10) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chosen_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_attempt_details_attempt_id_foreign` (`attempt_id`),
  CONSTRAINT `quiz_attempt_details_attempt_id_foreign` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempt_details`
--

LOCK TABLES `quiz_attempt_details` WRITE;
/*!40000 ALTER TABLE `quiz_attempt_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_attempt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `lesson_id` int(10) unsigned NOT NULL,
  `total_attempted` int(11) NOT NULL,
  `total_correct` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_attempts_user_id_foreign` (`user_id`),
  KEY `quiz_attempts_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `quiz_attempts_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_lesson` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_questions_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `quiz_questions_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (7,33,'<p>What is Ruby on Rails?</p>',NULL,'2018-01-28 01:07:22','2018-01-28 01:07:22'),(8,38,'<p>What is Ruby on Rails?</p>',NULL,'2018-01-28 01:49:32','2018-01-28 01:49:32'),(9,38,'<p>What is MVC?</p>',NULL,'2018-01-28 01:51:16','2018-01-28 01:51:16'),(11,38,'<p>Can JQuery be used with Ruby on rails?</p>',NULL,'2018-01-28 01:52:38','2018-01-28 01:52:38');
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating` decimal(4,1) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_course_id_foreign` (`course_id`),
  CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator','web','2017-11-30 06:37:00','2017-11-30 06:37:00'),(2,'author','web','2017-11-30 06:37:00','2017-11-30 06:37:00'),(3,'user','web','2017-11-30 06:37:00','2017-11-30 06:37:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objective` text COLLATE utf8mb4_unicode_ci,
  `sortOrder` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_course_id_foreign` (`course_id`),
  CONSTRAINT `sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (20,9,'Course Introduction','Setting the stage',1,'2018-01-28 00:48:31','2018-01-30 20:57:16'),(21,9,'Section two','This is a second section',2,'2018-01-28 01:04:29','2018-01-30 20:57:16'),(22,10,'Introduction',NULL,1,'2018-01-28 01:43:07','2018-01-28 01:43:07'),(23,10,'Section two',NULL,2,'2018-01-28 01:44:17','2018-01-28 01:44:17'),(24,11,'Introduction','Short course objective',1,'2018-01-28 04:07:01','2018-01-28 04:09:15'),(25,11,'Section two','This is a second section',2,'2018-01-28 04:12:57','2018-01-28 04:12:57'),(26,12,'Introduction','Short course objective',1,'2018-01-28 04:20:08','2018-01-28 04:22:14'),(27,12,'Second Section',NULL,2,'2018-01-28 04:26:58','2018-01-28 04:26:58'),(28,13,'Section one','Short course objective',1,'2018-01-28 04:31:19','2018-01-28 04:32:42'),(29,13,'Section two',NULL,2,'2018-01-28 04:34:04','2018-01-28 04:34:04'),(30,14,'Introduction','Short course objective',1,'2018-01-28 04:39:29','2018-01-28 04:40:53'),(31,14,'Section two',NULL,2,'2018-01-28 04:42:49','2018-01-28 04:43:09'),(32,15,'Start here','Short course objective',1,'2018-01-28 04:47:21','2018-01-28 04:47:21'),(33,15,'Section two',NULL,2,'2018-01-28 04:50:29','2018-01-28 04:50:29'),(34,16,'Section one','Short course objective',1,'2018-01-28 04:55:09','2018-01-28 04:56:12'),(35,16,'Section two',NULL,2,'2018-01-28 04:58:01','2018-01-28 04:58:01'),(36,17,'Introduction','Short course objective',1,'2018-01-28 05:04:43','2018-01-28 05:05:49'),(37,17,'Installing Magento',NULL,2,'2018-01-28 05:07:30','2018-01-28 05:07:30'),(38,18,'Basics first','Short course objective',1,'2018-01-28 05:13:39','2018-01-28 05:14:58'),(39,18,'Section two',NULL,2,'2018-01-28 05:16:55','2018-01-28 05:16:55'),(40,19,'About Drupal','Short course objective',1,'2018-01-28 05:23:22','2018-01-28 05:35:01'),(41,19,'Installing Drupal',NULL,2,'2018-01-28 05:36:34','2018-01-28 05:36:34'),(42,20,'The beginning','Short course objective',1,'2018-01-28 05:41:41','2018-01-28 05:42:50'),(43,20,'Another section',NULL,2,'2018-01-28 05:45:20','2018-01-28 05:45:20'),(44,21,'Start here','Short course objective',1,'2018-01-28 05:49:03','2018-01-28 05:49:03'),(46,22,'Start here','Short course objective',1,'2018-01-28 05:57:33','2018-01-28 05:57:33'),(47,23,'Start here','Short course objective',1,'2018-01-28 07:08:59','2018-01-28 07:08:59'),(48,23,'Second section',NULL,2,'2018-01-28 07:15:16','2018-01-28 07:15:16'),(49,24,'Start here','Short course objective',1,'2018-01-28 07:19:39','2018-01-28 07:19:39'),(50,9,'Another new section','This is a concluding section',3,'2018-01-30 20:56:32','2018-01-30 20:56:32');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`),
  KEY `sessions_user_id_foreign` (`user_id`),
  CONSTRAINT `sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_affiliate_id_unique` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'0c994bc6-7f56-4046-8271-7f18c0b341aa','Admin','Istrator','admin@educore.io','gravatar',NULL,'admin','DE','Germany','988768',NULL,'Mobile Developer','Sed mollis rutrum elementum. Etiam facilisis erat ultricies arcu bibendum, non ullamcorper lacus porttitor. Ut vel leo risus. Nullam augue lectus, fermentum ultricies sodales et, feugiat imperdiet lectus. Morbi et metus eu nisi accumsan porta in et sapien. Nam sit amet consequat elit, eu volutpat ipsum. Sed id ante malesuada, hendrerit tellus non, sagittis lectus. Duis porta enim eget neque sodales, sed efficitur justo sollicitudin. Nam suscipit commodo dolor non luctus. Suspendisse at dictum velit. Sed efficitur est ut massa feugiat euismod. Nullam eu dui iaculis, malesuada enim quis, ornare felis. Nunc mattis eros vitae felis aliquet imperdiet. Nulla ac turpis nisl. Quisque tortor elit, blandit vitae velit ut, tincidunt lobortis arcu.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$OBHgSZVvmmhwnoigp9ISIOUJokqmfAKZ9iZBsBobIUdlaWQyHER12',NULL,1,'986da86b276843fa2190b55a0521dcbe',1,'UTC','iNIhbDytgLL26UtwKi8xQPsnNiVHSICs9f5j71RyAL4BOSg0dXhG9fZXUnoy','2017-11-30 06:37:00','2017-11-30 06:37:00',NULL,'{\"show_profile_in_search\":\"true\",\"notify_when_mentioned\":\"false\",\"notify_when_question_responded\":\"false\",\"notify_when_new_announcement\":\"true\",\"notify_when_answer_marked_as_correct\":\"true\",\"notify_when_followed_question_is_answered\":\"true\",\"notify_when_my_question_is_marked_as_answered\":\"true\",\"notify_when_course_is_reviewed\":\"true\",\"send_me_helpful_resources\":\"true\",\"notify_when_new_question_in_my_course\":\"true\",\"notify_when_question_i_am_following_responded\":\"false\"}'),(2,'43ab7f54-e30b-4d4f-a4f1-45f4de7c46c5','John','Doe','john@educore.io','storage','/uploads/images/avatar/15a6d5dbb5c584.png','johndoe','CA','Canada','455657',NULL,'Database Developer','<p>Sed mollis rutrum elementum. Etiam facilisis erat ultricies arcu bibendum, non ullamcorper lacus porttitor. Ut vel leo risus. Nullam augue lectus, fermentum ultricies sodales et, feugiat imperdiet lectus. Morbi et metus eu nisi accumsan porta in et sapien. Nam sit amet consequat elit, eu volutpat ipsum. Sed id ante malesuada, hendrerit tellus non, sagittis lectus. Duis porta enim eget neque sodales, sed efficitur justo sollicitudin. Nam suscipit commodo dolor non luctus. Suspendisse at dictum velit. Sed efficitur est ut massa feugiat euismod. Nullam eu dui iaculis, malesuada enim quis, ornare felis. Nunc mattis eros vitae felis aliquet imperdiet. Nulla ac turpis nisl. Quisque tortor elit, blandit vitae velit ut, tincidunt lobortis arcu.</p>','15a6d5dbb5c584.png','#','#','#','#',NULL,NULL,'$2y$10$mhlw9aXZItlngA6ryTVACuoO.VR3UWx4E2er6o1ksOcgy0.qIh6X6','2017-12-30 07:13:09',1,'dd088c5c6c009854a2c55cc245ee4530',1,'UTC','hahtel46O8ja5t07QE3dkqX3sb6hPvneRUF8aWx2D28tH4fVHVb7mKOXpP3U','2017-11-30 06:37:00','2018-01-28 05:21:10',NULL,'{\"show_profile_in_search\":\"true\",\"notify_when_mentioned\":\"false\",\"notify_when_question_responded\":\"true\",\"notify_when_new_announcement\":\"true\",\"notify_when_answer_marked_as_correct\":\"true\",\"notify_when_followed_question_is_answered\":\"true\",\"notify_when_my_question_is_marked_as_answered\":\"true\",\"notify_when_course_is_reviewed\":\"true\",\"send_me_helpful_resources\":\"true\",\"notify_when_new_question_in_my_course\":\"true\",\"notify_when_question_i_am_following_responded\":\"false\"}'),(3,'d35f7161-f9fe-4475-aedb-41c6b050d119','Mary','Jane','mary@educore.io','storage','/uploads/images/avatar/15a6d53dbb14d9.png','mary','US','United States','987749',NULL,'Web Developer','<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum tristique velit, eu iaculis arcu interdum ac. Curabitur sit amet urna faucibus, porta purus tincidunt, semper lorem. Sed consequat, libero nec gravida sollicitudin, odio ipsum rhoncus elit, a luctus elit quam non quam. In non mattis dolor. Morbi nec accumsan enim. Curabitur egestas, velit ac pellentesque malesuada, quam magna tincidunt elit, id bibendum velit lorem vitae est. Sed vel sapien purus. Nam et leo sit amet nunc vehicula luctus nec auctor sapien. Mauris vel nunc facilisis, tincidunt urna quis, iaculis mi. Morbi commodo ipsum id turpis consectetur, sit amet facilisis lectus suscipit. Sed purus sem, pretium ac velit ac, congue mattis felis. Aenean nec est urna. Sed eleifend urna nisl, vel auctor sapien iaculis eget. Nulla at lobortis leo, porta tempus massa.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">﻿Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum tristique velit, eu iaculis arcu interdum ac. Curabitur sit amet urna faucibus, porta purus tincidunt, semper lorem. Sed consequat, libero nec gravida sollicitudin, odio ipsum rhoncus elit, a luctus elit quam non quam. In non mattis dolor. Morbi nec accumsan enim. Curabitur egestas, velit ac pellentesque malesuada, quam magna tincidunt elit, id bibendum velit lorem vitae est. Sed vel sapien purus. Nam et leo sit amet nunc vehicula luctus nec auctor sapien. Mauris vel nunc facilisis, tincidunt urna quis, iaculis mi. Morbi commodo ipsum id turpis consectetur, sit amet facilisis lectus suscipit. Sed purus sem, pretium ac velit ac, congue mattis felis. Aenean nec est urna. Sed eleifend urna nisl, vel auctor sapien iaculis eget. Nulla at lobortis leo, porta tempus massa.﻿</span></p>','15a6d53dbb14d9.png','#','#','#','#','http://www.mysite.com',NULL,'$2y$10$d9tzMvymcrHAeBIYkVH1QuOJxh/Vj.uYMqocyv7xnnsJoVvWRra7e',NULL,1,'e41e69ef3937de3eb6d0b90dc12689b8',1,'UTC','tLvQHP7ZJHJtMTBGhiEzlF7WJpoYiw2NzgAp7EEfodj3XCi2V3l5jBgRwxg8','2017-11-30 06:37:00','2018-01-28 04:38:51',NULL,'{\"show_profile_in_search\":\"true\",\"notify_when_mentioned\":\"false\",\"notify_when_question_responded\":\"false\",\"notify_when_new_announcement\":\"true\",\"notify_when_answer_marked_as_correct\":\"true\",\"notify_when_followed_question_is_answered\":\"true\",\"notify_when_my_question_is_marked_as_answered\":\"true\",\"notify_when_course_is_reviewed\":\"true\",\"send_me_helpful_resources\":\"true\",\"notify_when_new_question_in_my_course\":\"true\",\"notify_when_question_i_am_following_responded\":\"true\"}'),(10,'c882e2bf-624d-4502-8c60-c2e1cabd18f6','Lucy','Swindol','lucy@educore.io','storage','/uploads/images/avatar/15a6d1d8354cd8.png','lucy_swindol','CH','Switzerland','877676',NULL,'Senior Web Developer','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ullamcorper risus sem, quis iaculis nisi fringilla et. Nullam vitae scelerisque odio. Pellentesque vulputate nisi at consequat iaculis. In eu urna eu dolor dignissim tristique. Mauris molestie placerat lorem, nec sodales ipsum vestibulum eu. </p><p><br></p><p>Etiam in nibh ut ante imperdiet mattis ac ac enim. Nulla facilisi. Phasellus tincidunt sit amet libero nec lobortis. In vel erat neque. Mauris venenatis arcu sed lacus vulputate, suscipit ultricies ligula vestibulum. Nulla vulputate nec elit non consequat. Praesent vulputate sagittis massa at sollicitudin. Suspendisse tincidunt, nisi at pharetra dapibus, urna lorem rhoncus neque, quis dignissim erat ex at nulla. Pellentesque hendrerit sapien eu scelerisque gravida. In hac habitasse platea dictumst. Phasellus tincidunt erat et ultrices sagittis.</p><p><br></p><p>Vivamus vel elementum odio, eu placerat ipsum. Praesent et cursus enim. Donec purus est, imperdiet id aliquet et, placerat imperdiet lectus. Nulla eu imperdiet quam. Cras at lectus sed eros pellentesque lacinia nec eu tortor. Vestibulum enim leo, vestibulum vel accumsan at, laoreet et odio. Quisque dui purus, lobortis ac molestie sit amet, luctus in nunc. Phasellus rhoncus lectus id nulla vehicula finibus. Nulla facilisi. Curabitur ultrices mi id finibus hendrerit.</p>','15a6d1d8354cd8.png','myfb','mylinkedin',NULL,NULL,NULL,NULL,'$2y$10$BATNzUFBbr2HB/PSiJfPoOmVEdp3BClEH0htKUpKtvlEfCu.Syogi',NULL,1,'0a3d22a73e872a6ce5ac8c55f407170d',1,'UTC','50iEL9ioCYuoi7zUt4PWigznRjhLecZVzwX7sdXlqMAZiXaMH4KtGra68YkW','2018-01-28 00:12:39','2018-01-28 00:47:20',NULL,'{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}'),(12,'4026e533-6b9f-42f7-a89b-d33a6553459a','Neba','Gabs','gabs@educore.io','gravatar',NULL,'gabs','AR','Argentina','2778536',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$Pm0Me.hX7gxEpGfgqAs3VuVYth4g5fqiGeyWmgVtOQvrJQ/u2qeRy',NULL,1,'6ae711b8f2b14772b92149cf7839b5fd',1,'UTC',NULL,'2018-02-08 16:59:40','2018-02-08 17:03:31',NULL,'{\"show_profile_in_search\":true,\"notify_when_mentioned\":true,\"notify_when_question_responded\":true,\"notify_when_new_announcement\":true,\"notify_when_answer_marked_as_correct\":true,\"notify_when_followed_question_is_answered\":true,\"notify_when_question_i_am_following_responded\":true,\"notify_when_my_question_is_marked_as_answered\":true,\"notify_when_course_is_reviewed\":true,\"send_me_helpful_resources\":true,\"notify_when_new_question_in_my_course\":true}'),(13,'caf07456-c8f9-489b-b3d5-1f23084eae3b','Jessie','J','jessie@educore.io','gravatar',NULL,'jessica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$Uz4jwOvdWSZwXPXmwd141er.betCiSBfWQmFEBHM2i8PDJ87E1XEy',NULL,1,'11c269c8ba3f5a28ad16349f53182338',1,'UTC',NULL,'2018-02-08 17:10:55','2018-02-08 17:10:55',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdrawals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','processed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `withdrawals_uuid_unique` (`uuid`),
  KEY `withdrawals_user_id_foreign` (`user_id`),
  KEY `withdrawals_transaction_id_foreign` (`transaction_id`),
  CONSTRAINT `withdrawals_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawals`
--

LOCK TABLES `withdrawals` WRITE;
/*!40000 ALTER TABLE `withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-09 21:29:09
