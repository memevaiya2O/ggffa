-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 24, 2026 at 04:16 AM
-- Server version: 10.11.17-MariaDB
-- PHP Version: 8.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icxbdfsb_earnbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-trophy',
  `condition_type` varchar(64) NOT NULL,
  `condition_value` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `name`, `description`, `icon`, `condition_type`, `condition_value`) VALUES
(1, 'First Task', 'Complete your first task', 'fa-star', 'tasks_completed', 1),
(2, 'Task Pro', 'Complete 10 tasks', 'fa-star-half-stroke', 'tasks_completed', 10),
(3, 'Task Master', 'Complete 50 tasks', 'fa-certificate', 'tasks_completed', 50),
(4, 'Task Legend', 'Complete 100 tasks', 'fa-crown', 'tasks_completed', 100),
(5, 'First Withdraw', 'Make your first withdrawal', 'fa-hand-holding-dollar', 'withdrawals', 1),
(6, 'Referral King', 'Refer 10 friends', 'fa-user-group', 'referrals', 10),
(7, 'Daily Streak 7', 'Login 7 days in a row', 'fa-fire', 'streak_days', 7),
(8, 'Diamond Member', 'Reach Diamond level', 'fa-gem', 'level_reached', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'raadbhai2O', '$2y$10$QvASEo8Ey1f3/rcwQBh8/u9amL4q6/IOzEmAOZu7XoN1q80Wr/2sa', '2026-09-24 04:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `color` varchar(32) NOT NULL DEFAULT '#00C896',
  `link` text DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_bonus`
--

CREATE TABLE `daily_bonus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `claimed_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_bonus`
--

INSERT INTO `daily_bonus` (`id`, `user_id`, `claimed_date`, `amount`) VALUES
(1, 1, '2026-09-24', 5.00);

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `sender_number` varchar(64) NOT NULL DEFAULT '',
  `transaction_id` varchar(128) NOT NULL DEFAULT '',
  `screenshot` varchar(255) DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-wallet',
  `account_number` varchar(255) NOT NULL DEFAULT '',
  `account_type` varchar(64) NOT NULL DEFAULT 'Personal',
  `instructions` text DEFAULT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_methods`
--

INSERT INTO `deposit_methods` (`id`, `name`, `icon`, `account_number`, `account_type`, `instructions`, `min_amount`, `status`) VALUES
(1, 'Bkash 🕊️', 'fa-wallet', '01965064030', 'Personal', '💳 ᴀᴄᴄᴏᴜɴᴛ ᴀᴄᴛɪᴠᴀᴛɪᴏɴ — ᴘᴀʏᴍᴇɴᴛ ɪɴsᴛʀᴜᴄᴛɪᴏɴ\r\n\r\nঅ্যাকাউন্ট অ্যাক্টিভ করতে নিচের ধাপগুলো অনুসরণ করুন 👇\r\n\r\n✅ ১. বিকাশ নাম্বারটি কপি করুন।\r\n\r\n💰 ২. বিকাশে গিয়ে নির্ধারিত অ্যামাউন্ট Send Money করুন।\r\n\r\n🧾 ৩. পেমেন্ট সফল হওয়ার পর আপনার Transaction ID / TrxID সংগ্রহ করুন।\r\n\r\n📸 ৪. পেমেন্টের একটি পরিষ্কার Screenshot নিন।\r\n\r\n📤 ৫. Screenshot এবং TrxID সাবমিট করুন।\r\n\r\n⏳ ৬. পেমেন্ট যাচাই হওয়ার পর আপনার অ্যাকাউন্টটি অ্যাক্টিভ করে দেওয়া হবে।\r\n\r\n⚠️ পেমেন্ট করার আগে বিকাশ নাম্বার ও অ্যামাউন্ট অবশ্যই ভালোভাবে যাচাই করুন। আর, এই নম্বরে শুধু সেন্ড মানি করা যাবে! ভুল নম্বরে সেন্ড মানি করলে, কর্তৃপক্ষ দায়ী নয় এবং আপনি রিফান্ড পাবেন না।', 0.00, 'active'),
(2, 'Nagad ✨', 'fa-wallet', '01965064030', 'Personal', '💳 ɴᴀɢᴀᴅ ᴘᴀʏᴍᴇɴᴛ — ᴀᴄᴄᴏᴜɴᴛ ᴀᴄᴛɪᴠᴀᴛɪᴏɴ\r\n\r\nঅ্যাকাউন্ট অ্যাক্টিভ করতে নিচের ধাপগুলো অনুসরণ করুন 👇\r\n\r\n✅ ১. নগদ নাম্বারটি কপি করুন।\r\n\r\n💰 ২. নগদে গিয়ে নির্ধারিত অ্যামাউন্ট Send Money করুন।\r\n\r\n🧾 ৩. পেমেন্ট সফল হওয়ার পর আপনার Transaction ID / TrxID সংগ্রহ করুন।\r\n\r\n📸 ৪. পেমেন্টের একটি পরিষ্কার Screenshot নিন।\r\n\r\n📤 ৫. Screenshot এবং TrxID সাবমিট করুন।\r\n\r\n⏳ ৬. পেমেন্ট যাচাই হওয়ার পর আপনার অ্যাকাউন্টটি অ্যাক্টিভ করে দেওয়া হবে।\r\n\r\n⚠️ পেমেন্ট করার আগে নগদ নাম্বার ও অ্যামাউন্ট অবশ্যই ভালোভাবে যাচাই করুন।\r\n\r\n🚫 এই নম্বরে শুধুমাত্র Send Money করা যাবে!\r\n\r\n❗ ভুল নম্বরে Send Money করলে তার জন্য কর্তৃপক্ষ দায়ী থাকবে না এবং কোনো Refund প্রদান করা হবে না।', 1.00, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-medal',
  `color` varchar(32) NOT NULL DEFAULT '#CD7F32',
  `required_points` int(11) NOT NULL DEFAULT 0,
  `levelup_bonus` decimal(12,2) NOT NULL DEFAULT 0.00,
  `daily_withdraw_limit` decimal(12,2) NOT NULL DEFAULT 100.00,
  `can_access_vip` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `icon`, `color`, `required_points`, `levelup_bonus`, `daily_withdraw_limit`, `can_access_vip`, `sort_order`) VALUES
(1, 'Bronze', 'fa-medal', '#CD7F32', 0, 0.00, 500.00, 0, 1),
(2, 'Silver', 'fa-medal', '#C0C0C0', 500, 10.00, 1000.00, 0, 2),
(3, 'Gold', 'fa-medal', '#FFD700', 2000, 25.00, 2000.00, 0, 3),
(4, 'Platinum', 'fa-gem', '#00B4D8', 5000, 50.00, 5000.00, 1, 4),
(5, 'Diamond', 'fa-gem', '#B9F2FF', 10000, 100.00, 10000.00, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_01_01_000101_create_levels_table', 1),
(4, '2024_01_01_000102_create_users_table', 1),
(5, '2024_01_01_000103_create_admin_users_table', 1),
(6, '2024_01_01_000104_create_settings_table', 1),
(7, '2024_01_01_000105_create_task_categories_table', 1),
(8, '2024_01_01_000106_create_tasks_table', 1),
(9, '2024_01_01_000107_create_submissions_table', 1),
(10, '2024_01_01_000108_create_transactions_table', 1),
(11, '2024_01_01_000109_create_withdraw_methods_table', 1),
(12, '2024_01_01_000110_create_withdrawal_methods_table', 1),
(13, '2024_01_01_000111_create_withdrawals_table', 1),
(14, '2024_01_01_000112_create_withdraw_proof_table', 1),
(15, '2024_01_01_000113_create_notifications_table', 1),
(16, '2024_01_01_000114_create_daily_bonus_table', 1),
(17, '2024_01_01_000115_create_spin_prizes_table', 1),
(18, '2024_01_01_000116_create_spin_segments_table', 1),
(19, '2024_01_01_000117_create_spin_history_table', 1),
(20, '2024_01_01_000118_create_referrals_table', 1),
(21, '2024_01_01_000119_create_achievements_table', 1),
(22, '2024_01_01_000120_create_user_achievements_table', 1),
(23, '2024_01_01_000121_create_custom_pages_table', 1),
(24, '2024_01_01_000122_create_pages_table', 1),
(25, '2024_01_01_000123_create_popups_table', 1),
(26, '2024_01_01_000124_create_announcements_table', 1),
(27, '2024_01_01_000125_create_reject_templates_table', 1),
(28, '2024_01_01_000126_create_sessions_table', 1),
(29, '2024_01_01_000127_create_wallet_activation', 1),
(30, '2024_01_01_000128_brand_tokens', 1),
(31, '2024_01_01_000129_deposit_screenshot_and_brand_assets', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, 1, 'bonus_credited', 'Welcome Bonus!', 'You received a welcome bonus of ৳10.00', 1, '2026-09-24 07:48:48'),
(2, 1, 'welcome', 'Welcome to EarnBD!', 'Your account has been created. Start completing tasks to earn money!', 1, '2026-09-24 07:48:48'),
(3, 1, 'bonus_credited', 'Daily Bonus!', 'You claimed your daily bonus of ৳5.00', 1, '2026-09-24 07:49:03'),
(4, 1, 'submission', 'Task Submitted', 'Your submission for \"Join Telegram Channel ✅\" is under review.', 1, '2026-09-24 08:11:28'),
(5, 1, 'badge_unlocked', 'Badge Unlocked!', 'You unlocked the \"First Task\" badge!', 1, '2026-09-24 08:14:13'),
(6, 1, 'task_approved', 'Task Approved! ✅', 'Your submission for \"Join Telegram Channel ✅\" was approved. Reward: ৳3.00', 1, '2026-09-24 08:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popups`
--

CREATE TABLE `popups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `show_on` varchar(32) NOT NULL DEFAULT 'all',
  `frequency` varchar(32) NOT NULL DEFAULT 'session',
  `status` varchar(32) NOT NULL DEFAULT 'active',
  `data` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referrer_id` bigint(20) UNSIGNED NOT NULL,
  `referred_id` bigint(20) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `bonus` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reject_templates`
--

CREATE TABLE `reject_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reject_templates`
--

INSERT INTO `reject_templates` (`id`, `reason`, `created_at`) VALUES
(1, 'Screenshot is blurry or unclear', '2026-09-24 04:40:43'),
(2, 'Task not completed as per instructions', '2026-09-24 04:40:43'),
(3, 'Fake account detected', '2026-09-24 04:40:43'),
(4, 'Duplicate submission', '2026-09-24 04:40:43'),
(5, 'Screenshot does not match requirements', '2026-09-24 04:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0gPk4XR6DQC3cosm7fxpAu6h8kK5EOHenNrEOBHt', NULL, '103.139.9.55', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSElFSWFCUUVKOVB0ZUU5UmhXaUtCSzZXczBRM2RFdFllZjdKd1laaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790237371),
('76z4kIUreOlrvCyqqR4YYlRcOAki9kc7YFa6s4e2', NULL, '103.139.9.54', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozOToiaHR0cHM6Ly9pY3hiZC5mc2JkLnByby9JY3hwYW5lbC9hY2NvdW50IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiMVBnaVhwQmFORHNhUE5ZN3NqWXFwdmhHSzJDN1VGSkxLT01KelozZyI7czo4OiJhZG1pbl9pZCI7aToxO3M6MTQ6ImFkbWluX3VzZXJuYW1lIjtzOjU6ImFkbWluIjt9', 1790236350),
('AHX6BcFhLrMPGsQCI4yUuuv0B5W9sM0PgVdYTcUH', NULL, '103.139.9.55', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjhJc2FRazlhUHI4Y2dGRE9FS1o4eThpbEVRM2FnaVJFZXdyUkx4UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790237368),
('ALae9NcBZbSjyXffIgPGk0Oa98fRICayN0G7ONlP', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnozVGxiNmdnbGZZaE5sM0lZY0plaE5XSlZBa0FMSW9GYk92R0o2UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvcG9wdXAtbWFuYWdlciI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1790236398),
('AlnRXwLgjSC4nZsWsqiWyYeSI2M77qsMmJf6upmu', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1hpNEhSWVczRG1OZUVYaFJkRnMzc3Q2M09QbnNoeTk1YXZIdmFLSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236390),
('CaErAl916ZdurmCFFMsykJBEtZaWpKRZahu52pqh', NULL, '103.139.9.55', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXgxdW1BeXRBNUNxcDZzWWZLRG5UUW9RSmY4TGJMZjJpU2tHSU9GQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvdGFza3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790237370),
('DIKVtaFkQXOF5S1jsEGVHCEbshZW2olrDMpoki4k', NULL, '149.154.161.221', 'TelegramBot (like TwitterBot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFNuTHlTazQ2bVVyT21TWUM3NmdIRlNtYXdIV2YyN1haWENTU3FCTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790237531),
('DX7iIf6NeOpWvAcp5lQL7A9LpOSwFmbL54dyYCFe', NULL, '104.28.229.154', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGYxMWVtMzBOMGY2Vk9MZHNVRWd5b2ZoZmR0YmlJZkZzNElacVBtViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236053),
('f7HdeHVsVskjDQMf42twvjZxZDgfHxBZgJrSytHM', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTo2OntzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMjoiaHR0cHM6Ly9pY3hiZC5mc2JkLnByby9kYXNoYm9hcmQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJMeFlNOVlzM0VncmJZbnJTbnBWYkhEQVBDV2JMYjlUbDg1NExGVVNJIjtzOjk6ImNhcHRjaGFfYSI7aTozO3M6OToiY2FwdGNoYV9iIjtpOjQ7czo3OiJ1c2VyX2lkIjtpOjE7fQ==', 1790237677),
('fRGI70eajzOIlvEbjngJty9vNIHL75j3n1zrKhSr', NULL, '104.28.229.154', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXBiR0trS0F3dnJYakxDTFR1S2RuM3B5QVZsZGo4ZHJ0aWxZTDdleCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236056),
('iG39vOSwIekXqaaOP9bcOT6RSlsEJaRrCbjxWtaq', NULL, '104.28.229.154', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU40VjRwbVZmZERFQmlXMzliaGlwZm5sc3hIc00zcHU5Rk1IQkNXNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236062),
('jVHKp00jtMIrKMdkvVATDKVrckDnLOjH1jSAt63b', NULL, '104.28.229.154', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDA4RGdVYzBJQ1NNbld6VVg3OWhRbWJIVjVKYmVyNmZpNTRIODEwYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236065),
('N2NaNG98i6R69vCDDoXpTu6Kafs2HE4RlVZmA93C', NULL, '103.139.9.55', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3FGMk9XUXg4UGdaQmRBWkN1b253eVlhSnExTHVSZThZT3pqSkVBciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790237365),
('oK0X7gf2cEksOMV5XB6QVuIWUes4HIh2TtT6Me93', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzBXQ3NubXBQYzhuRnlQekJjb0JNeW4wSUhLbmJKTGRtYUFxTjI1OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236328),
('uI099NUy0lensPaiOw39Bg19yPvWb0fMkgFtC43q', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjg0alJEY001RElYNUVldkdCVDdXRHdxekJ4ajBQZHdOS0pjZDNNZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvcG9wdXAtbWFuYWdlciI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1790236390),
('uIFerg0R6Q1HTDX9CQviM8MZj4bRkV2v4KFqbhaO', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3FVOTBNbjV2RFpDRFo1a0MzdHJIRlNiaVIzZWsxZDl4Y09ydlhZUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236328),
('W0ZvtDM8VAjgfPR6W8GxZALNwYms6RW09OPJU2Yp', NULL, '103.139.9.54', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/29.0 Chrome/136.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlNCT1Y1ZFRwNGdUNzZCUnlnb056cmRtdWF5a1FiNkI0VFdYeVNNayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvbG9naW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1790236399),
('y3FgvdjUA8polV07pjI0hXwf73Y2FmB7TAhxTJBP', NULL, '103.139.9.55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicUsxTXVKZzdDM2ZCVEJPNGJFWGRCZWtJSUJHdmVPenJQWXRVS0dWQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vaWN4YmQuZnNiZC5wcm8vSWN4cGFuZWwvc3VibWlzc2lvbnMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoiYWRtaW5faWQiO2k6MTtzOjE0OiJhZG1pbl91c2VybmFtZSI7czoxMDoicmFhZGJoYWkyTyI7fQ==', 1790237653);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `group_name` varchar(64) NOT NULL DEFAULT 'general',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `group_name`, `updated_at`) VALUES
(1, 'site_name', 'EarnBD', 'general', '2026-09-24 04:40:43'),
(2, 'site_tagline', 'Earn Real Money Online', 'general', '2026-09-24 04:40:43'),
(3, 'site_logo', '/assets/img/logo.svg', 'general', '2026-09-24 04:40:43'),
(4, 'favicon', '/assets/img/icon.png', 'general', '2026-09-24 04:40:43'),
(5, 'admin_email', 'admin@earnbd.com', 'general', '2026-09-24 04:40:43'),
(6, 'contact_email', 'support@earnbd.com', 'general', '2026-09-24 04:40:43'),
(7, 'currency_symbol', '৳', 'general', '2026-09-24 04:40:43'),
(8, 'currency_name', 'BDT', 'general', '2026-09-24 04:40:43'),
(9, 'daily_bonus_amount', '5', 'general', '2026-09-24 04:40:43'),
(10, 'welcome_bonus', '10', 'general', '2026-09-24 04:40:43'),
(11, 'referral_l1_bonus', '20', 'general', '2026-09-24 04:40:43'),
(12, 'referral_l2_bonus', '5', 'general', '2026-09-24 04:40:43'),
(13, 'min_withdraw', '50', 'general', '2026-09-24 04:40:43'),
(14, 'registration_open', '1', 'general', '2026-09-24 04:40:43'),
(15, 'maintenance_mode', '0', 'general', '2026-09-24 04:40:43'),
(16, 'maintenance_message', 'Site is under maintenance. Please check back soon.', 'general', '2026-09-24 04:40:43'),
(17, 'color_primary', '#00C896', 'general', '2026-09-24 04:40:43'),
(18, 'color_secondary', '#009688', 'general', '2026-09-24 04:40:43'),
(19, 'color_bg', '#FFFFFF', 'general', '2026-09-24 04:40:43'),
(20, 'color_card', '#F4FBF9', 'general', '2026-09-24 04:40:43'),
(21, 'color_text', '#1A1A2E', 'general', '2026-09-24 04:40:43'),
(22, 'color_accent', '#00E5B0', 'general', '2026-09-24 04:40:43'),
(23, 'color_danger', '#FF4757', 'general', '2026-09-24 04:40:43'),
(24, 'color_warning', '#FFA502', 'general', '2026-09-24 04:40:43'),
(25, 'font_family', 'Nunito', 'general', '2026-09-24 04:40:43'),
(26, 'border_radius', '12', 'general', '2026-09-24 04:40:43'),
(27, 'button_style', 'filled', 'general', '2026-09-24 04:40:43'),
(28, 'hero_headline', 'Earn Real Money Completing Simple Tasks', 'general', '2026-09-24 04:40:43'),
(29, 'hero_subtext', 'Join thousands of users earning daily rewards', 'general', '2026-09-24 04:40:43'),
(30, 'hero_cta', 'Start Earning Now', 'general', '2026-09-24 04:40:43'),
(31, 'spin_mode', 'wheel', 'general', '2026-09-24 04:40:43'),
(32, 'google_analytics', '', 'general', '2026-09-24 04:40:43'),
(33, 'meta_title', '{site_name} - Earn Real Money Online', 'general', '2026-09-24 04:40:43'),
(34, 'meta_description', 'Complete tasks and earn real money in Bangladesh', 'general', '2026-09-24 04:40:43'),
(35, 'meta_keywords', 'earn money online, tasks, rewards', 'general', '2026-09-24 04:40:43'),
(36, 'footer_description', 'The #1 earning platform in Bangladesh. Earn real money by completing simple tasks.', 'general', '2026-09-24 04:40:43'),
(37, 'footer_copyright', '© {year} {site_name}. All rights reserved.', 'general', '2026-09-24 04:40:43'),
(38, 'social_facebook', '#', 'general', '2026-09-24 04:40:43'),
(39, 'social_youtube', '#', 'general', '2026-09-24 04:40:43'),
(40, 'social_telegram', '#', 'general', '2026-09-24 04:40:43'),
(41, 'social_twitter', '#', 'general', '2026-09-24 04:40:43'),
(42, 'social_instagram', '#', 'general', '2026-09-24 04:40:43'),
(43, 'howit_1_icon', 'fa-user-plus', 'general', '2026-09-24 04:40:43'),
(44, 'howit_1_title', 'Register Free', 'general', '2026-09-24 04:40:43'),
(45, 'howit_1_desc', 'Create your free account in seconds', 'general', '2026-09-24 04:40:43'),
(46, 'howit_2_icon', 'fa-list-check', 'general', '2026-09-24 04:40:43'),
(47, 'howit_2_title', 'Complete Tasks', 'general', '2026-09-24 04:40:43'),
(48, 'howit_2_desc', 'Browse and complete available tasks', 'general', '2026-09-24 04:40:43'),
(49, 'howit_3_icon', 'fa-money-bill-transfer', 'general', '2026-09-24 04:40:43'),
(50, 'howit_3_title', 'Get Paid', 'general', '2026-09-24 04:40:43'),
(51, 'howit_3_desc', 'Withdraw earnings to bKash, Nagad & more', 'general', '2026-09-24 04:40:43'),
(52, 'custom_header_script', '', 'general', '2026-09-24 04:40:43'),
(53, 'custom_footer_script', '', 'general', '2026-09-24 04:40:43'),
(54, 'og_image', '', 'general', '2026-09-24 04:40:43'),
(55, 'section_stats', '1', 'general', '2026-09-24 04:40:43'),
(56, 'section_howit', '1', 'general', '2026-09-24 04:40:43'),
(57, 'section_tasks', '1', 'general', '2026-09-24 04:40:43'),
(58, 'section_earners', '1', 'general', '2026-09-24 04:40:43'),
(59, 'section_proof', '1', 'general', '2026-09-24 04:40:43'),
(60, 'section_testimonials', '0', 'general', '2026-09-24 04:40:43'),
(61, 'section_faq', '0', 'general', '2026-09-24 04:40:43'),
(62, 'spin_enabled', '1', 'spin', '2026-09-24 04:40:43'),
(63, 'spin_daily_limit', '1', 'spin', '2026-09-24 04:40:43'),
(64, 'spin_cooldown_hours', '24', 'spin', '2026-09-24 04:40:43'),
(65, 'referral_enabled', '1', 'referral', '2026-09-24 04:40:43'),
(66, 'referral_bonus_referrer', '5', 'referral', '2026-09-24 04:40:43'),
(67, 'referral_bonus_referee', '0', 'referral', '2026-09-24 04:40:43'),
(68, 'referral_max_per_user', '0', 'referral', '2026-09-24 04:40:43'),
(69, 'referral_bonus_on', 'first_task', 'referral', '2026-09-24 04:40:43'),
(70, 'referral_min_withdraw', '0', 'referral', '2026-09-24 04:40:43'),
(71, 'leaderboard_enabled', '1', 'leaderboard', '2026-09-24 04:40:43'),
(72, 'leaderboard_period', 'alltime', 'leaderboard', '2026-09-24 04:40:43'),
(73, 'leaderboard_top_n', '10', 'leaderboard', '2026-09-24 04:40:43'),
(74, 'leaderboard_prize_1', '500', 'leaderboard', '2026-09-24 04:40:43'),
(75, 'leaderboard_prize_2', '250', 'leaderboard', '2026-09-24 04:40:43'),
(76, 'leaderboard_prize_3', '100', 'leaderboard', '2026-09-24 04:40:43'),
(78, 'maintenance_title', 'We\'ll Be Back Soon!', 'maintenance', '2026-09-24 04:40:43'),
(80, 'maintenance_end_time', '', 'maintenance', '2026-09-24 04:40:43'),
(81, 'maintenance_allow_admin', '1', 'maintenance', '2026-09-24 04:40:43'),
(82, 'wallet_activation_required', '1', 'wallet', '2026-09-24 04:40:43'),
(83, 'wallet_activation_min', '100', 'wallet', '2026-09-24 04:40:43'),
(84, 'deposit_credit_balance', '1', 'wallet', '2026-09-24 04:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `spin_history`
--

CREATE TABLE `spin_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `prize_label` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `spin_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spin_prizes`
--

CREATE TABLE `spin_prizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `probability` decimal(5,2) NOT NULL DEFAULT 10.00,
  `color` varchar(32) NOT NULL DEFAULT '#00C896',
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spin_prizes`
--

INSERT INTO `spin_prizes` (`id`, `label`, `amount`, `probability`, `color`, `status`) VALUES
(1, 'BDT 5', 5.00, 30.00, '#00C896', 'active'),
(2, 'BDT 10', 10.00, 25.00, '#009688', 'active'),
(3, 'BDT 20', 20.00, 20.00, '#FFA502', 'active'),
(4, 'BDT 50', 50.00, 15.00, '#FF4757', 'active'),
(5, 'BDT 100', 100.00, 7.00, '#9C27B0', 'active'),
(6, 'BDT 200', 200.00, 2.50, '#FFD700', 'active'),
(7, 'BDT 500', 500.00, 0.50, '#00E5B0', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `spin_segments`
--

CREATE TABLE `spin_segments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `prize_type` varchar(32) NOT NULL DEFAULT 'coins',
  `prize_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `weight` int(11) NOT NULL DEFAULT 1,
  `color` varchar(32) NOT NULL DEFAULT '#4CAF50',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spin_segments`
--

INSERT INTO `spin_segments` (`id`, `label`, `prize_type`, `prize_value`, `weight`, `color`, `created_at`) VALUES
(1, 'Try Again', 'nothing', 0.00, 30, '#e2e8f0', '2026-09-24 04:40:43'),
(2, '৳1', 'bonus', 5.00, 25, '#4caf50', '2026-09-24 04:40:43'),
(3, '৳10', 'coins', 10.00, 20, '#2196F3', '2026-09-24 04:40:43'),
(4, '৳20', 'coins', 20.00, 13, '#FF9800', '2026-09-24 04:40:43'),
(5, '৳50', 'coins', 50.00, 7, '#E91E63', '2026-09-24 04:40:43'),
(6, '৳10', 'coins', 10.00, 3, '#9c27b0', '2026-09-24 04:40:43'),
(7, 'No Prize 😞', 'nothing', 0.00, 2, '#ffd700', '2026-09-24 04:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `screenshot` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'pending',
  `reject_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `user_id`, `task_id`, `screenshot`, `notes`, `status`, `reject_reason`, `created_at`, `reviewed_at`) VALUES
(1, 1, 5, '/assets/uploads/d22958c2d7619d9dda047a07b77b9009.png', 'Telegram username: @zerox6t9', 'approved', NULL, '2026-09-24 08:11:28', '2026-09-24 12:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'standard',
  `reward` decimal(10,2) NOT NULL DEFAULT 0.00,
  `thumbnail` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `rules` text DEFAULT NULL,
  `screenshot_required` tinyint(1) NOT NULL DEFAULT 1,
  `max_per_user` int(11) NOT NULL DEFAULT 1,
  `max_total` int(11) NOT NULL DEFAULT 1000,
  `is_vip` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_hot` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(32) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `category_id`, `title`, `type`, `reward`, `thumbnail`, `instructions`, `rules`, `screenshot_required`, `max_per_user`, `max_total`, `is_vip`, `is_featured`, `is_hot`, `is_new`, `sort_order`, `status`, `created_at`) VALUES
(1, 1, 'Follow us on Facebook', 'social', 5.00, NULL, '1. Go to our Facebook page\n2. Click Follow\n3. Take a screenshot showing you followed', 'Must use real account\nNo fake accounts', 1, 1, 500, 0, 0, 1, 1, 0, 'active', '2026-09-24 04:40:43'),
(2, 2, 'Install & Rate TaskApp', 'app', 15.00, NULL, '1. Download TaskApp from Play Store\n2. Install and open it\n3. Give 5-star rating\n4. Screenshot the rating screen', 'Must keep app installed for 7 days\nReal account only', 1, 1, 200, 0, 1, 0, 1, 0, 'active', '2026-09-24 04:40:43'),
(3, 3, 'Complete Survey #1', 'survey', 20.00, NULL, '1. Click the survey link\n2. Complete all questions honestly\n3. Screenshot completion page', 'Must complete in one session', 1, 1, 100, 0, 0, 1, 1, 0, 'active', '2026-09-24 04:40:43'),
(4, 4, 'Watch Promo Video', 'video', 8.00, NULL, '1. Watch the full 3-minute video\n2. Do not skip\n3. Screenshot end screen', 'Must watch completely', 1, 3, 1000, 0, 0, 0, 1, 0, 'active', '2026-09-24 04:40:43'),
(5, 1, 'Join Telegram Channel ✅', 'social', 3.00, '/assets/uploads/tasks/44b029bd75cf02f052c0630ff1a86ddb.jpg', '✅ নিচের লিংকে ক্লিক করে আমাদের টেলিগ্রাম চ্যানেল জয়েন করুন। \r\n\r\n📍 টেলিগ্রাম চ্যানেল: https://t.me/infinity_codex\r\n\r\n✅ জয়েন করার পরে একটি স্ক্রিনশট নিন। অবশ্যই আপনার টেলিগ্রাম ইউজার নেম স্ক্রিনশট এর সঙ্গে দিতে হবে না হলে টাস্ক কমপ্লিট হবে না।\r\n\r\n✅ এখন আপনার স্ক্রিনশট আপলোড করে, টাস্ক সাবমিট করুন।', '১. চ্যানেল থেকে লিভ নিলে আপনার অ্যাকাউন্ট বন্ধ করা হতে পারে। \r\n২. ভুয়া অ্যাকাউন্ট ব্যবহার করা যাবে না। \r\n৩. নিয়ম অমান্য করলে আপনার একাউন্ট অথবা উইন্ডো বন্ধ করা হতে পারে।', 1, 1, 1000, 0, 0, 0, 1, 0, 'active', '2026-09-24 08:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `task_categories`
--

CREATE TABLE `task_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-tag',
  `color` varchar(32) NOT NULL DEFAULT '#00C896',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_categories`
--

INSERT INTO `task_categories` (`id`, `name`, `icon`, `color`, `sort_order`, `status`) VALUES
(1, 'Social Media', 'fa-share-nodes', '#4267B2', 1, 'active'),
(2, 'App Install', 'fa-mobile-screen', '#00C896', 2, 'active'),
(3, 'Survey', 'fa-clipboard-list', '#FFA502', 3, 'active'),
(4, 'Video Watch', 'fa-play-circle', '#FF4757', 4, 'active'),
(5, 'Referral', 'fa-user-plus', '#9C27B0', 5, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(32) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` text NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `type`, `amount`, `description`, `reference_id`, `created_at`) VALUES
(1, 1, 'admin_credit', 10.00, 'Welcome bonus', NULL, '2026-09-24 07:48:48'),
(2, 1, 'daily_bonus', 5.00, 'Daily bonus claim', NULL, '2026-09-24 07:49:03'),
(3, 1, 'task_reward', 3.00, 'Task approved: Join Telegram Channel ✅', 5, '2026-09-24 08:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` text DEFAULT NULL,
  `referral_code` varchar(64) NOT NULL,
  `referred_by` bigint(20) UNSIGNED DEFAULT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 0,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_earned` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(12,2) NOT NULL DEFAULT 0.00,
  `streak_days` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active',
  `phone` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `wallet_active` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_activated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `referral_code`, `referred_by`, `level_id`, `points`, `balance`, `total_earned`, `total_withdrawn`, `streak_days`, `last_login`, `status`, `phone`, `created_at`, `wallet_active`, `wallet_activated_at`) VALUES
(1, 'Infinity Owner', 'infinitycodexbd@gmail.com', '$2y$10$8WW4typeagLiBoLX5dmL9u2y5VosD3GFEUFrxq9oi5MP1JP2sOm0K', '/assets/uploads/avatars/eb787a11dc82f4066d850c18928aba79.jpg', '5E005494', NULL, 1, 60, 18.00, 18.00, 0.00, 0, '2026-09-24 12:10:23', 'active', '01965064030', '2026-09-24 07:48:48', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_achievements`
--

CREATE TABLE `user_achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `achievement_id` bigint(20) UNSIGNED NOT NULL,
  `unlocked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_achievements`
--

INSERT INTO `user_achievements` (`id`, `user_id`, `achievement_id`, `unlocked_at`) VALUES
(1, 1, 1, '2026-09-24 08:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL,
  `method` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tx_reference` text DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT 200.00,
  `max_amount` decimal(10,2) NOT NULL DEFAULT 10000.00,
  `charge_pct` decimal(5,2) NOT NULL DEFAULT 0.00,
  `instructions` text NOT NULL,
  `required_fields` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawal_methods`
--

INSERT INTO `withdrawal_methods` (`id`, `name`, `min_amount`, `max_amount`, `charge_pct`, `instructions`, `required_fields`, `status`, `created_at`) VALUES
(1, 'bKash', 200.00, 10000.00, 0.00, 'Send to our bKash agent number', 'Account Number,Account Name', 'active', '2026-09-24 04:40:43'),
(2, 'Nagad', 200.00, 10000.00, 0.00, 'Send to our Nagad number', 'Account Number,Account Name', 'active', '2026-09-24 04:40:43'),
(3, 'Rocket', 200.00, 5000.00, 0.00, 'Send to our Rocket number', 'Account Number', 'active', '2026-09-24 04:40:43'),
(4, 'USDT TRC20', 1000.00, 50000.00, 1.00, 'Send to our USDT TRC20 wallet address', 'Wallet Address', 'active', '2026-09-24 04:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-wallet',
  `min_amount` decimal(10,2) NOT NULL DEFAULT 50.00,
  `processing_time` varchar(255) NOT NULL DEFAULT '24 hours',
  `instructions` text NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `icon`, `min_amount`, `processing_time`, `instructions`, `status`) VALUES
(1, 'bKash', 'fa-mobile-screen-button', 50.00, '1-24 hours', 'Enter your bKash number', 'active'),
(2, 'Nagad', 'fa-wallet', 50.00, '1-24 hours', 'Enter your Nagad number', 'active'),
(3, 'Rocket', 'fa-rocket', 50.00, '1-24 hours', 'Enter your Rocket number', 'active'),
(4, 'USDT (TRC20)', 'fa-coins', 100.00, '1-48 hours', 'Enter your TRC20 wallet address', 'active'),
(5, 'Bitcoin', 'fa-bitcoin-sign', 500.00, '24-72 hours', 'Enter your BTC wallet address', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_proof`
--

CREATE TABLE `withdraw_proof` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `caption` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_pages_slug_unique` (`slug`);

--
-- Indexes for table `daily_bonus`
--
ALTER TABLE `daily_bonus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_bonus_user_id_claimed_date_unique` (`user_id`,`claimed_date`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_index` (`user_id`),
  ADD KEY `deposits_status_index` (`status`);

--
-- Indexes for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `popups`
--
ALTER TABLE `popups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_referrer_id_foreign` (`referrer_id`),
  ADD KEY `referrals_referred_id_foreign` (`referred_id`);

--
-- Indexes for table `reject_templates`
--
ALTER TABLE `reject_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `spin_history`
--
ALTER TABLE `spin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spin_history_user_id_foreign` (`user_id`);

--
-- Indexes for table `spin_prizes`
--
ALTER TABLE `spin_prizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spin_segments`
--
ALTER TABLE `spin_segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submissions_user_id_foreign` (`user_id`),
  ADD KEY `submissions_task_id_foreign` (`task_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_category_id_foreign` (`category_id`);

--
-- Indexes for table `task_categories`
--
ALTER TABLE `task_categories`
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
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD KEY `users_referred_by_foreign` (`referred_by`),
  ADD KEY `users_level_id_foreign` (`level_id`);

--
-- Indexes for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_achievements_user_id_achievement_id_unique` (`user_id`,`achievement_id`),
  ADD KEY `user_achievements_achievement_id_foreign` (`achievement_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_user_id_foreign` (`user_id`),
  ADD KEY `withdrawals_method_id_foreign` (`method_id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_proof`
--
ALTER TABLE `withdraw_proof`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_bonus`
--
ALTER TABLE `daily_bonus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popups`
--
ALTER TABLE `popups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reject_templates`
--
ALTER TABLE `reject_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `spin_history`
--
ALTER TABLE `spin_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spin_prizes`
--
ALTER TABLE `spin_prizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `spin_segments`
--
ALTER TABLE `spin_segments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task_categories`
--
ALTER TABLE `task_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_achievements`
--
ALTER TABLE `user_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdraw_proof`
--
ALTER TABLE `withdraw_proof`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daily_bonus`
--
ALTER TABLE `daily_bonus`
  ADD CONSTRAINT `daily_bonus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_referred_id_foreign` FOREIGN KEY (`referred_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `referrals_referrer_id_foreign` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `spin_history`
--
ALTER TABLE `spin_history`
  ADD CONSTRAINT `spin_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `task_categories` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
  ADD CONSTRAINT `users_referred_by_foreign` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_achievements`
--
ALTER TABLE `user_achievements`
  ADD CONSTRAINT `user_achievements_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`),
  ADD CONSTRAINT `user_achievements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `withdraw_methods` (`id`),
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
