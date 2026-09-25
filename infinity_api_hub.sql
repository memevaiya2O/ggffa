/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: app1_laravel
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `key_id` bigint(20) unsigned DEFAULT NULL,
  `service_id` bigint(20) unsigned DEFAULT NULL,
  `param_summary` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `status` enum('success','error') NOT NULL DEFAULT 'success',
  `response_code` int(11) NOT NULL DEFAULT 0,
  `latency_ms` int(11) NOT NULL DEFAULT 0,
  `credits_used` int(11) NOT NULL DEFAULT 0,
  `response_snippet` text DEFAULT NULL,
  `source` enum('api','panel') NOT NULL DEFAULT 'api',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `api_logs_user_id_foreign` (`user_id`),
  KEY `api_logs_key_id_foreign` (`key_id`),
  KEY `api_logs_service_id_foreign` (`service_id`),
  KEY `api_logs_created_at_index` (`created_at`),
  CONSTRAINT `api_logs_key_id_foreign` FOREIGN KEY (`key_id`) REFERENCES `service_keys` (`id`) ON DELETE CASCADE,
  CONSTRAINT `api_logs_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `api_services` (`id`) ON DELETE SET NULL,
  CONSTRAINT `api_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_logs`
--

LOCK TABLES `api_logs` WRITE;
/*!40000 ALTER TABLE `api_logs` DISABLE KEYS */;
INSERT INTO `api_logs` VALUES
(1,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:21:38'),
(2,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:22:18'),
(3,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:22:44'),
(4,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:22:44'),
(5,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:22:44'),
(6,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:26:21'),
(7,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:28:05'),
(8,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:28:05'),
(9,NULL,NULL,1,'ff-uid','10.89.4.1','error',0,0,0,'Invalid API key.','api','2026-09-24 01:28:05'),
(10,5,3,1,'uid=1704140050','10.89.4.1','success',200,3177,1,'{\n    \"status\": false,\n    \"message\": \"Missing UID or API Key\"\n}','panel','2026-09-24 01:32:46'),
(11,5,8,5,'uid=2535040417','10.126.92.1','success',200,11522,1,'{\"error\":false,\"status\":200,\"msg\":\"id_found\",\"version\":\"V7X\",\"data\":{\"identity\":{\"record_id\":null,\"uid\":\"2535040417\",\"username\":\"☯ᎶᘻㅤJꫝꪀꪀꫝ丅☃࿐\",\"region\":\"BD\"},\"profile\":{\"level\":55,\"likes\":3860,\"prime_level\":4,\"bio\":\"\\\"i am happy man \\\"\\\"\",\"created_at\":\"2020-11-15 16:01:41\",\"account_age\":{\"years\":5,\"months\":10,\"label\":\"5 years and 10 months\"},\"last_login\":\"2026-09-23 23:06:53\",\"last_updated\":null,\"banner_image\":\"/api/banner/banner_2535040417.webp\"},\"account_info\":{\"exp\":496169,\"season_id\":53,\"cre','api','2026-09-24 03:42:10');
/*!40000 ALTER TABLE `api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_services`
--

DROP TABLE IF EXISTS `api_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `docs_use_cases` text DEFAULT NULL,
  `icon` varchar(60) NOT NULL DEFAULT 'fa-plug',
  `provider_url` text NOT NULL,
  `provider_source` varchar(30) NOT NULL DEFAULT 'external_api',
  `method` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `headers` text DEFAULT NULL,
  `provider_key` varchar(255) NOT NULL DEFAULT '',
  `params` text DEFAULT NULL,
  `credits_per_hit` int(11) NOT NULL DEFAULT 1,
  `credit_price` decimal(10,2) NOT NULL DEFAULT 1.00,
  `free_quota` int(11) NOT NULL DEFAULT 25,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `show_on_home` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `docs_text` text DEFAULT NULL,
  `docs_markdown` text DEFAULT NULL,
  `docs_error_codes` text DEFAULT NULL,
  `docs_rate_limit` varchar(100) NOT NULL DEFAULT '',
  `docs_example_params` text DEFAULT NULL,
  `sample_response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_services_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_services`
--

LOCK TABLES `api_services` WRITE;
/*!40000 ALTER TABLE `api_services` DISABLE KEYS */;
INSERT INTO `api_services` VALUES
(1,'Free Fire UID Check','ff-uid','Get Free Fire player nickname from UID instantly.',NULL,'fa-gamepad','https://nanobd.shop/ffnamecheck/api.php?uid={uid}&key={provider_key}&type=rs','external_api','GET','[]','','[{\"name\":\"uid\",\"label\":\"Player UID\",\"required\":1,\"placeholder\":\"2535040417\"}]',1,1.00,25,'active',1,1,'Enter the player UID to get the current nickname. Works for all regions.',NULL,NULL,'',NULL,'{\"status\": true, \"data\": {\"username\": \"Player Name Here\"}}','2026-09-24 00:57:59','2026-09-24 00:57:59'),
(2,'IP Information','ip-info','Get country, city and ISP info of any IP address.',NULL,'fa-location-dot','http://ip-api.com/json/{ip}?fields=status,country,city,isp,query','external_api','GET','[]','','[{\"name\":\"ip\",\"label\":\"IP Address\",\"required\":1,\"placeholder\":\"8.8.8.8\"}]',1,1.00,25,'active',1,2,'Pass any public IPv4 address to get geolocation details. No provider key needed.',NULL,NULL,'',NULL,'{\"status\": \"success\", \"country\": \"United States\", \"city\": \"Ashburn\", \"isp\": \"Google LLC\", \"query\": \"8.8.8.8\"}','2026-09-24 00:57:59','2026-09-24 00:57:59'),
(5,'Free Fire ID Info','ff-id-info','Get Free Fire player information by UID.','Player profile lookup\nFree Fire UID verification\nGame information display','fa-id-card','https://ffxinfo-ffx.ffxapis.workers.dev/ffinfo?uid={uid}','subdomain','GET','[]','','[{\"name\":\"uid\",\"label\":\"Free Fire UID\",\"required\":1,\"placeholder\":\"2535040417\"}]',1,1.00,25,'active',1,10,'Returns Free Fire player information for the supplied UID.','Use this API to retrieve Free Fire player information by UID.\\n\\n**Required parameter:** `uid`','\"400|Invalid UID\\n404|Player not found\\n429|Rate limited\"','60 requests/minute','{\"uid\":\"2535040417\"}','{\"status\":\"success\",\"uid\":\"2535040417\"}','2026-09-24 02:47:42','2026-09-24 02:47:42'),
(6,'Free Fire Name Check','ff-name-check','Check Free Fire player name by UID.','Player name lookup\nUID ownership check\nGaming profile tools','fa-user-check','http://ixbd.qd.je/ff.php?uid={uid}','subdomain','GET','[]','','[{\"name\":\"uid\",\"label\":\"Free Fire UID\",\"required\":1,\"placeholder\":\"2769409057\"}]',1,1.00,25,'active',1,11,'Checks the current Free Fire player name for a UID.','Check a Free Fire player name with a single UID parameter.\\n\\n**Required parameter:** `uid`','\"400|Invalid UID\\n404|Player not found\\n429|Rate limited\"','60 requests/minute','{\"uid\":\"2769409057\"}','{\"status\":\"success\",\"uid\":\"2769409057\"}','2026-09-24 02:47:42','2026-09-24 02:47:42'),
(7,'Free Fire ID Market Value','ff-id-market-value','Estimate Free Fire ID market value by UID.','Player ID valuation\nGaming marketplace tools\nAccount value display','fa-chart-line','http://market-value-api.ffxapis.workers.dev/market-value?uid={uid}','subdomain','GET','[]','','[{\"name\":\"uid\",\"label\":\"Free Fire UID\",\"required\":1,\"placeholder\":\"1704140050\"}]',1,1.00,25,'active',1,12,'Returns the estimated market value for a Free Fire ID.','Estimate a Free Fire ID market value by UID.\\n\\n**Required parameter:** `uid`','\"400|Invalid UID\\n404|Player not found\\n429|Rate limited\"','60 requests/minute','{\"uid\":\"1704140050\"}','{\"status\":\"success\",\"uid\":\"1704140050\"}','2026-09-24 02:47:42','2026-09-24 02:47:42');
/*!40000 ALTER TABLE `api_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `invoice_number` varchar(40) NOT NULL,
  `pdf_path` varchar(255) NOT NULL DEFAULT '',
  `emailed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  KEY `invoices_order_id_foreign` (`order_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2026_01_01_000001_create_users_table',1),
(2,'2026_01_01_000002_create_api_services_table',1),
(3,'2026_01_01_000003_create_service_keys_table',1),
(4,'2026_01_01_000004_create_packages_table',1),
(5,'2026_01_01_000005_create_orders_table',1),
(6,'2026_01_01_000006_create_api_logs_table',1),
(7,'2026_01_01_000007_create_notifications_table',1),
(8,'2026_01_01_000008_create_settings_table',1),
(9,'2026_01_01_000009_create_tickets_tables',1),
(10,'2026_09_21_110000_add_google_id_to_users',1),
(11,'2026_09_22_000001_add_nagorikpay_hardening',1),
(12,'2026_09_22_000002_create_wallets_and_credit_fields',1),
(13,'2026_09_24_000001_add_user_id_to_notifications_table',2),
(14,'2026_09_24_000002_add_use_cases_to_api_services_table',3),
(15,'2026_09_24_000003_add_provider_source_to_api_services_table',4),
(16,'2026_09_24_000004_add_nagorikpay_flow_settings',5),
(17,'2026_09_24_000005_add_gateway_payment_id_to_orders',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagorikpay_logs`
--

DROP TABLE IF EXISTS `nagorikpay_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nagorikpay_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'create',
  `url` varchar(500) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_id` varchar(120) NOT NULL DEFAULT '',
  `http_status` int(11) NOT NULL DEFAULT 0,
  `api_key_masked` varchar(60) NOT NULL DEFAULT '',
  `request_payload` text DEFAULT NULL,
  `response_payload` text DEFAULT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nagorikpay_logs_order_id_index` (`order_id`),
  KEY `nagorikpay_logs_transaction_id_index` (`transaction_id`),
  KEY `nagorikpay_logs_created_at_index` (`created_at`),
  CONSTRAINT `nagorikpay_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagorikpay_logs`
--

LOCK TABLES `nagorikpay_logs` WRITE;
/*!40000 ALTER TABLE `nagorikpay_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `nagorikpay_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','success','warning','error') NOT NULL DEFAULT 'info',
  `target` enum('all','users') NOT NULL DEFAULT 'all',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_status_index` (`user_id`,`status`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES
(1,NULL,'Welcome to INFINITY API HUB!','Create a free account and instantly get an API key for every service with bonus credits. Open any API page to start.','success','all','active','2026-09-24 00:57:58','2026-09-24 00:57:58');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned DEFAULT NULL,
  `package_id` bigint(20) unsigned DEFAULT NULL,
  `key_id` bigint(20) unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) NOT NULL DEFAULT '',
  `order_kind` varchar(30) NOT NULL DEFAULT 'credit_purchase',
  `credit_quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `wallet_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `sender_number` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(100) NOT NULL DEFAULT '',
  `nagorikpay_txn` varchar(120) NOT NULL DEFAULT '',
  `gateway_payment_id` varchar(120) DEFAULT NULL,
  `status` enum('pending','approved','rejected','expired','cancelled') NOT NULL DEFAULT 'pending',
  `admin_note` varchar(255) NOT NULL DEFAULT '',
  `attempts` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_payment_method_txn_unique` (`payment_method`,`txn_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_service_id_foreign` (`service_id`),
  KEY `orders_package_id_foreign` (`package_id`),
  KEY `orders_key_id_foreign` (`key_id`),
  KEY `orders_gateway_payment_id_index` (`gateway_payment_id`),
  CONSTRAINT `orders_key_id_foreign` FOREIGN KEY (`key_id`) REFERENCES `service_keys` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `api_services` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `requests` int(11) NOT NULL DEFAULT 100,
  `validity_days` int(11) NOT NULL DEFAULT 30,
  `features` text DEFAULT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `packages_service_id_foreign` (`service_id`),
  CONSTRAINT `packages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `api_services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES
(1,1,'Free Starter',0.00,10,7,'Instant activation\r\nCommunity support',0,'active',1,'2026-09-24 00:57:59','2026-09-24 02:01:37'),
(2,1,'Basic',100.00,1000,30,'Instant activation\nEmail support',0,'active',2,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(3,1,'Pro',400.00,5000,30,'Priority speed\nPriority support',1,'active',3,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(4,1,'Business',1200.00,20000,60,'Highest speed\nDedicated support',0,'active',4,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(5,2,'Free Starter',0.00,100,7,'Instant activation\nCommunity support',0,'active',1,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(6,2,'Basic',100.00,1000,30,'Instant activation\nEmail support',0,'active',2,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(7,2,'Pro',400.00,5000,30,'Priority speed\nPriority support',1,'active',3,'2026-09-24 00:57:59','2026-09-24 00:57:59'),
(8,2,'Business',1200.00,20000,60,'Highest speed\nDedicated support',0,'active',4,'2026-09-24 00:57:59','2026-09-24 00:57:59');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_keys`
--

DROP TABLE IF EXISTS `service_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_keys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `api_key` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL DEFAULT 'My API Key',
  `total_request` int(11) NOT NULL DEFAULT 0,
  `used_request` int(11) NOT NULL DEFAULT 0,
  `exp_date` date DEFAULT NULL,
  `status` enum('active','inactive','expired') NOT NULL DEFAULT 'active',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_keys_user_id_service_id_unique` (`user_id`,`service_id`),
  UNIQUE KEY `service_keys_api_key_unique` (`api_key`),
  KEY `service_keys_service_id_foreign` (`service_id`),
  CONSTRAINT `service_keys_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `api_services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_keys`
--

LOCK TABLES `service_keys` WRITE;
/*!40000 ALTER TABLE `service_keys` DISABLE KEYS */;
INSERT INTO `service_keys` VALUES
(3,5,1,'INF-FFUI-LAQN-MH2N-TPTP','My API Key',50,1,'2026-10-24','active','2026-09-24 01:32:46','2026-09-24 01:31:39','2026-09-24 01:32:46'),
(4,5,2,'INF-IPIN-XBDX-TLQL-RSSA','My API Key',50,0,'2026-10-24','active',NULL,'2026-09-24 01:31:39','2026-09-24 01:31:39'),
(5,1,1,'INF-FFUI-25PA-HTQF-N4LD','My API Key',25,0,'2026-10-24','active',NULL,'2026-09-24 01:41:42','2026-09-24 01:41:42'),
(7,12,1,'INF-FFUI-85JL-8PZ6-PV6Q','My API Key',25,0,'2026-10-24','inactive',NULL,'2026-09-24 02:05:33','2026-09-24 02:05:35'),
(8,5,5,'INF-FFID-4T4J-2L5E-Y9JL','My API Key',25,1,'2026-10-24','active','2026-09-24 03:42:10','2026-09-24 03:41:27','2026-09-24 03:42:10');
/*!40000 ALTER TABLE `service_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_setting_key_unique` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'nagorikpay_enabled','0'),
(2,'nagorikpay_mode','sandbox'),
(3,'nagorikpay_base_url','https://sandbox-api.nagorikpay.com/'),
(4,'nagorikpay_create_path','api/payment/create'),
(5,'nagorikpay_verify_path','api/payment/verify'),
(6,'nagorikpay_api_key',''),
(7,'nagorikpay_api_key_live',''),
(9,'nagorikpay_webhook_secret',''),
(10,'nagorikpay_webhook_secret_live',''),
(11,'nagorikpay_webhook_secret_sandbox',''),
(12,'nagorikpay_brand_id',''),
(13,'nagorikpay_expire_minutes','30'),
(14,'nagorikpay_recheck_minutes','5'),
(15,'nagorikpay_auto_verify','1'),
(16,'wallet_min_topup','10'),
(17,'wallet_max_topup','100000'),
(18,'credit_price_default','1'),
(19,'site_name','INFINITY API HUB'),
(20,'site_tagline','Premium API Platform'),
(21,'logo',''),
(22,'announcement',''),
(23,'registration_open','1'),
(24,'primary_color','#2563eb'),
(25,'hero_badge','Trusted API Platform'),
(26,'hero_title','Powerful APIs for {hl}Modern Apps{/hl}'),
(27,'hero_subtitle','One key per API. Blazing-fast gaming, verification and utility APIs with simple integration and instant delivery.'),
(28,'feat1_title','Lightning Fast'),
(29,'feat1_desc','Optimized gateway with millisecond response times.'),
(30,'feat2_title','Secure Keys'),
(31,'feat2_desc','Dedicated key per API with expiry and limits.'),
(32,'feat3_title','Easy Integration'),
(33,'feat3_desc','Copy-paste code samples for PHP, JS and Python.'),
(34,'feat4_title','24/7 Support'),
(35,'feat4_desc','Tickets plus Telegram and WhatsApp support.'),
(36,'footer_text','Fast, reliable and developer-friendly APIs with instant delivery, live monitoring and 24/7 support.'),
(37,'custom_css',''),
(38,'pay_bkash','01XXXXXXXXX'),
(39,'pay_nagad',''),
(40,'pay_rocket',''),
(41,'pay_instruction','Send Money to the number below, then submit the Transaction ID.'),
(42,'global_provider_key',''),
(43,'key_prefix','INF-'),
(44,'api_rate_limit','60'),
(45,'signup_bonus','50'),
(46,'signup_validity','30'),
(47,'service_free_quota','25'),
(48,'status_threshold','50'),
(49,'support_telegram',''),
(50,'support_whatsapp',''),
(51,'support_facebook',''),
(52,'support_youtube',''),
(53,'maintenance_mode','0'),
(54,'maintenance_msg','We are upgrading our systems. Please come back soon.'),
(55,'google_oauth_enabled','1'),
(56,'google_client_id','38363864880-g2p5ijbqc11o5uufhb8b7n3ale6n04pv.apps.googleusercontent.com'),
(57,'google_client_secret','eyJpdiI6ImNUVDRxNVRrajd4cGxXQmFua1cvQ1E9PSIsInZhbHVlIjoiSTV0aFU1MDRWNDgrcDRSQmZ2VlhCVnFaUDdtUEJ0M3ZrdHVvczZyOVdhT0Q0OWNTbjFCRXhmV0pGVzdIamxWaSIsIm1hYyI6IjBlNDQ4NmFmNjU2M2QwMmUzYzRiYTM2ZGI4ODM0Y2JkZmFiNTcyZjQ2Y2U0MDM4YWY3MjliZTgwMjk2ZGQyNDAiLCJ0YWciOiIifQ=='),
(58,'google_redirect_url','https://icxbd.fsbd.pro/auth/google/callback'),
(62,'nagorikpay_create_request_path','api/payment/create-request'),
(63,'nagorikpay_submit_transaction_path','api/payment-submit-transaction'),
(65,'nagorikpay_payment_flow','hosted'),
(66,'nagorikpay_payment_method','auto'),
(67,'nagorikpay_account_type','personal'),
(68,'nagorikpay_callback_base_url',''),
(69,'site_icon','');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('open','answered','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_service_id_foreign` (`service_id`),
  CONSTRAINT `tickets_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `api_services` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `phone` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `status` enum('active','suspended') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `password_changed_at` datetime DEFAULT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_google_id_unique` (`google_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Super Admin','admin@infinity.hub',NULL,'','$2y$12$CeChNflFYgFSgkjBqbPcfeWvnt7oqi6bQco.5k9fPK79CQelGeFh6','admin','active','4TXGheT1YCTIO1uvQCclLniA7uSd0Eei3ExPMoDoqDiLuShIQoWJRHebYr9A','2026-09-24 01:41:32',0,'2026-09-24 00:57:59','2026-09-24 01:41:32'),
(5,'riadalhasa','riadalhasan68@gmail.com',NULL,'01965064030','$2y$12$9DSPqR/DNbNUqHP4GnETV.tXbJAs1KTiRSIYZ2GtP4hJM2DbsnrI.','user','active',NULL,NULL,0,'2026-09-24 01:31:39','2026-09-24 01:31:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `reference` varchar(120) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallet_transactions_reference_unique` (`reference`),
  KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  KEY `wallet_transactions_user_id_foreign` (`user_id`),
  KEY `wallet_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `wallet_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallets_user_id_unique` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES
(1,3,0.00,'2026-09-24 01:17:04','2026-09-24 01:17:04'),
(2,4,0.00,'2026-09-24 01:17:15','2026-09-24 01:17:15'),
(3,7,0.00,'2026-09-24 01:36:25','2026-09-24 01:36:25'),
(4,5,0.00,'2026-09-24 01:39:24','2026-09-24 01:39:24');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'app1_laravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-25  1:27:13
