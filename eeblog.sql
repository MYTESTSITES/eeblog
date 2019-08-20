-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2019 at 01:42 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eeblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `dlp_actions`
--

CREATE TABLE `dlp_actions` (
  `action_id` int(4) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_actions`
--

INSERT INTO `dlp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'smiley_pop', 0),
(3, 'Channel', 'combo_loader', 0),
(4, 'Comment', 'insert_new_comment', 0),
(5, 'Comment_mcp', 'delete_comment_notification', 0),
(6, 'Comment', 'comment_subscribe', 0),
(7, 'Comment', 'edit_comment', 0),
(8, 'Consent', 'grantConsent', 0),
(9, 'Consent', 'submitConsent', 0),
(10, 'Consent', 'withdrawConsent', 0),
(11, 'Member', 'registration_form', 0),
(12, 'Member', 'register_member', 0),
(13, 'Member', 'activate_member', 0),
(14, 'Member', 'member_login', 0),
(15, 'Member', 'member_logout', 0),
(16, 'Member', 'send_reset_token', 0),
(17, 'Member', 'process_reset_password', 0),
(18, 'Member', 'send_member_email', 0),
(19, 'Member', 'update_un_pw', 0),
(20, 'Member', 'member_search', 0),
(21, 'Member', 'member_delete', 0),
(22, 'Rte', 'get_js', 0),
(23, 'Relationship', 'entryList', 0),
(24, 'Search', 'do_search', 1),
(25, 'Email', 'send_email', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_captcha`
--

CREATE TABLE `dlp_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_categories`
--

CREATE TABLE `dlp_categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(4) UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_categories`
--

INSERT INTO `dlp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(1, 1, 1, 0, 'News', 'news', NULL, NULL, 1),
(2, 1, 1, 0, 'Personal', 'personal', NULL, NULL, 2),
(3, 1, 1, 0, 'Photos', 'photos', NULL, NULL, 3),
(4, 1, 1, 0, 'Videos', 'videos', NULL, NULL, 4),
(5, 1, 1, 0, 'Music', 'music', NULL, NULL, 5),
(6, 1, 2, 0, 'Not Shown', 'not-shown', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_category_fields`
--

CREATE TABLE `dlp_category_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_category_field_data`
--

CREATE TABLE `dlp_category_field_data` (
  `cat_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_category_field_data`
--

INSERT INTO `dlp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_category_groups`
--

CREATE TABLE `dlp_category_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_category_groups`
--

INSERT INTO `dlp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`) VALUES
(1, 1, 'Blog', 'c', 0, 'all', NULL, NULL),
(2, 1, 'Slideshow', 'a', 0, 'all', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_category_posts`
--

CREATE TABLE `dlp_category_posts` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_category_posts`
--

INSERT INTO `dlp_category_posts` (`entry_id`, `cat_id`) VALUES
(4, 3),
(5, 4),
(6, 2),
(7, 5),
(9, 1),
(10, 5),
(11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channels`
--

CREATE TABLE `dlp_channels` (
  `channel_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) UNSIGNED DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `extra_publish_controls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) UNSIGNED DEFAULT '5000',
  `comment_timelock` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_entries` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channels`
--

INSERT INTO `dlp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `extra_publish_controls`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `preview_url`, `max_entries`) VALUES
(1, 1, 'about', 'About', '', NULL, 'en', 3, 3, 0, 1566334438, 0, NULL, 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, NULL, 0),
(2, 1, 'blog', 'Blog', '{base_url}blog/entry', NULL, 'en', 8, 8, 0, 1566334438, 0, '1', 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, NULL, 0),
(3, 1, 'contact', 'Contact', '', NULL, 'en', 1, 1, 0, 1566334438, 0, NULL, 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channels_channel_fields`
--

CREATE TABLE `dlp_channels_channel_fields` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `field_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channels_channel_field_groups`
--

CREATE TABLE `dlp_channels_channel_field_groups` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channels_channel_field_groups`
--

INSERT INTO `dlp_channels_channel_field_groups` (`channel_id`, `group_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(2, 2),
(2, 5),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channels_statuses`
--

CREATE TABLE `dlp_channels_statuses` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channels_statuses`
--

INSERT INTO `dlp_channels_statuses` (`channel_id`, `status_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data`
--

CREATE TABLE `dlp_channel_data` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data`
--

INSERT INTO `dlp_channel_data` (`entry_id`, `site_id`, `channel_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 2),
(5, 1, 2),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_1`
--

CREATE TABLE `dlp_channel_data_field_1` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_1` text COLLATE utf8mb4_unicode_ci,
  `field_ft_1` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_1`
--

INSERT INTO `dlp_channel_data_field_1` (`id`, `entry_id`, `field_id_1`, `field_ft_1`) VALUES
(1, 1, NULL, 'xhtml'),
(2, 2, NULL, 'xhtml'),
(3, 3, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_2`
--

CREATE TABLE `dlp_channel_data_field_2` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_2`
--

INSERT INTO `dlp_channel_data_field_2` (`id`, `entry_id`, `field_id_2`, `field_ft_2`) VALUES
(1, 4, NULL, 'xhtml'),
(2, 5, NULL, 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, NULL, 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, NULL, 'xhtml'),
(8, 11, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_3`
--

CREATE TABLE `dlp_channel_data_field_3` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_3` text COLLATE utf8mb4_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_3`
--

INSERT INTO `dlp_channel_data_field_3` (`id`, `entry_id`, `field_id_3`, `field_ft_3`) VALUES
(1, 4, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(2, 5, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(3, 6, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(4, 7, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(5, 8, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(6, 9, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(7, 10, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(8, 11, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_4`
--

CREATE TABLE `dlp_channel_data_field_4` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_4` text COLLATE utf8mb4_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_4`
--

INSERT INTO `dlp_channel_data_field_4` (`id`, `entry_id`, `field_id_4`, `field_ft_4`) VALUES
(1, 4, NULL, 'xhtml'),
(2, 5, NULL, 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, NULL, 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, NULL, 'xhtml'),
(8, 11, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_5`
--

CREATE TABLE `dlp_channel_data_field_5` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_5` text COLLATE utf8mb4_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_5`
--

INSERT INTO `dlp_channel_data_field_5` (`id`, `entry_id`, `field_id_5`, `field_ft_5`) VALUES
(1, 4, NULL, 'xhtml'),
(2, 5, NULL, 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, NULL, 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, NULL, 'xhtml'),
(8, 11, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_6`
--

CREATE TABLE `dlp_channel_data_field_6` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_6` text COLLATE utf8mb4_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_6`
--

INSERT INTO `dlp_channel_data_field_6` (`id`, `entry_id`, `field_id_6`, `field_ft_6`) VALUES
(1, 1, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(2, 2, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(3, 3, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(4, 12, 'Cupcake ipsum dolor sit. Amet I love liquorice jujubes pudding croissant I love pudding. Apple pie macaroon toffee jujubes pie tart cookie applicake caramels. Halvah macaroon I love lollipop. Wypas I love pudding brownie cheesecake tart jelly-o. Bear claw cookie chocolate bar jujubes toffee.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_7`
--

CREATE TABLE `dlp_channel_data_field_7` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_7` text COLLATE utf8mb4_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_7`
--

INSERT INTO `dlp_channel_data_field_7` (`id`, `entry_id`, `field_id_7`, `field_ft_7`) VALUES
(1, 12, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_8`
--

CREATE TABLE `dlp_channel_data_field_8` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_8` text COLLATE utf8mb4_unicode_ci,
  `field_ft_8` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_8`
--

INSERT INTO `dlp_channel_data_field_8` (`id`, `entry_id`, `field_id_8`, `field_ft_8`) VALUES
(1, 12, 'user@example.com', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_9`
--

CREATE TABLE `dlp_channel_data_field_9` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_9` text COLLATE utf8mb4_unicode_ci,
  `field_ft_9` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_9`
--

INSERT INTO `dlp_channel_data_field_9` (`id`, `entry_id`, `field_id_9`, `field_ft_9`) VALUES
(1, 12, '(555) 123-4567', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_10`
--

CREATE TABLE `dlp_channel_data_field_10` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_10` text COLLATE utf8mb4_unicode_ci,
  `field_ft_10` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_10`
--

INSERT INTO `dlp_channel_data_field_10` (`id`, `entry_id`, `field_id_10`, `field_ft_10`) VALUES
(1, 1, 'This is a site to show you the power of ExpressionEngine, you can remove it, you can base your next site on it, you can just use it straight.', 'xhtml'),
(2, 2, 'Sub page examples', 'xhtml'),
(3, 3, 'Sub page examples', 'xhtml'),
(4, 4, 'This is a very nice photograph I found, and I wanted to share.', 'xhtml'),
(5, 5, 'This is how it\'s done, the incomparable Jackie Chan shows us the way.', 'xhtml'),
(6, 6, 'This is a blog post about Bacon!', 'xhtml'),
(7, 7, 'An album for the intelligent and uncommon.', 'xhtml'),
(8, 8, 'Super old entry', 'xhtml'),
(9, 9, 'A blog post about the hippest of the hipsters.', 'xhtml'),
(10, 10, 'This is how you shake it off, haters take note.', 'xhtml'),
(11, 11, 'This is a quick video teaching you how to cut a rope.', 'xhtml'),
(12, 12, 'Contact us, phone, mailing, email.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_data_field_11`
--

CREATE TABLE `dlp_channel_data_field_11` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_11` text COLLATE utf8mb4_unicode_ci,
  `field_ft_11` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_data_field_11`
--

INSERT INTO `dlp_channel_data_field_11` (`id`, `entry_id`, `field_id_11`, `field_ft_11`) VALUES
(1, 1, 'About {site_name}', 'none'),
(2, 2, 'Sub page one', 'none'),
(3, 3, 'Sub page two', 'none'),
(4, 4, 'A beautiful photograph', 'none'),
(5, 5, 'Action Comedy', 'none'),
(6, 6, 'A blog all about the joys of Bacon', 'none'),
(7, 7, 'Marrow and the broken bones.', 'none'),
(8, 8, 'Super old entry', 'none'),
(9, 9, 'This is one that is hipper than most.', 'none'),
(10, 10, 'Shaking it Off, a cover.', 'none'),
(11, 11, 'The one about cutting rope.', 'none'),
(12, 12, 'Contact {site_name}', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_entries_autosave`
--

CREATE TABLE `dlp_channel_entries_autosave` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `original_entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_fields`
--

CREATE TABLE `dlp_channel_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int(6) UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_fields`
--

INSERT INTO `dlp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`) VALUES
(1, 0, 'about_image', 'About Image', 'Image for the about page.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 7, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(2, 0, 'blog_audio', 'Audio', 'Audio clip for this blog.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 3, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(3, 0, 'blog_content', 'Content', 'Content for this blog entry.', 'textarea', '', 'n', NULL, NULL, 10, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'y', 1, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(4, 0, 'blog_image', 'Image', 'Photograph, comic, any image you like.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 4, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(5, 0, 'blog_video', 'Video', 'Video for this blog.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 2, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(6, 0, 'page_content', 'Page Content', 'Content for this page.', 'textarea', '', 'n', NULL, NULL, 10, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'y', 3, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(7, 0, 'contact_address', 'Contact Address', 'Address where someone can send mail.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 4, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(8, 0, 'contact_email', 'Contact Email', 'Email address someone can send Email to.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 6, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(9, 0, 'contact_phone', 'Contact Phone', 'Phone number someone can call.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(10, 0, 'seo_desc', 'SEO Description', 'Page Description for use in HTML meta description tag, generally only seen by machines.', 'textarea', '', 'n', NULL, NULL, 2, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 6, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(11, 0, 'seo_title', 'SEO Title', 'Page title that will be added to browser titlebar/tab.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_field_groups_fields`
--

CREATE TABLE `dlp_channel_field_groups_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_field_groups_fields`
--

INSERT INTO `dlp_channel_field_groups_fields` (`field_id`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 5),
(11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_form_settings`
--

CREATE TABLE `dlp_channel_form_settings` (
  `channel_form_settings_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_grid_field_1`
--

CREATE TABLE `dlp_channel_grid_field_1` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_1` text COLLATE utf8mb4_unicode_ci,
  `col_id_2` text COLLATE utf8mb4_unicode_ci,
  `col_id_3` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_grid_field_1`
--

INSERT INTO `dlp_channel_grid_field_1` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_1`, `col_id_2`, `col_id_3`) VALUES
(1, 1, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'right'),
(2, 2, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'left'),
(3, 3, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_grid_field_2`
--

CREATE TABLE `dlp_channel_grid_field_2` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_4` text COLLATE utf8mb4_unicode_ci,
  `col_id_5` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_grid_field_2`
--

INSERT INTO `dlp_channel_grid_field_2` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_4`, `col_id_5`) VALUES
(1, 7, 0, 0, '3925868830', 'bandcamp'),
(2, 10, 0, 0, '164768245', 'soundcloud');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_grid_field_4`
--

CREATE TABLE `dlp_channel_grid_field_4` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_6` text COLLATE utf8mb4_unicode_ci,
  `col_id_7` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_grid_field_4`
--

INSERT INTO `dlp_channel_grid_field_4` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_6`, `col_id_7`) VALUES
(1, 4, 0, 0, '{filedir_6}blog.jpg', 'Dharmafrog, 2014');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_grid_field_5`
--

CREATE TABLE `dlp_channel_grid_field_5` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_8` text COLLATE utf8mb4_unicode_ci,
  `col_id_9` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_grid_field_5`
--

INSERT INTO `dlp_channel_grid_field_5` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_8`, `col_id_9`) VALUES
(1, 5, 0, 0, '113439313', 'vimeo'),
(2, 11, 0, 0, 'eCNwxqP7l44', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_grid_field_7`
--

CREATE TABLE `dlp_channel_grid_field_7` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_10` text COLLATE utf8mb4_unicode_ci,
  `col_id_11` text COLLATE utf8mb4_unicode_ci,
  `col_id_12` text COLLATE utf8mb4_unicode_ci,
  `col_id_13` text COLLATE utf8mb4_unicode_ci,
  `col_id_14` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_grid_field_7`
--

INSERT INTO `dlp_channel_grid_field_7` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_10`, `col_id_11`, `col_id_12`, `col_id_13`, `col_id_14`) VALUES
(1, 12, 0, 0, '1234 Any Street', 'Suite 2', 'Anywhere', 'ES', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_member_groups`
--

CREATE TABLE `dlp_channel_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `channel_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_channel_titles`
--

CREATE TABLE `dlp_channel_titles` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_channel_titles`
--

INSERT INTO `dlp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '127.0.0.1', 'About Default Theme', 'about-default-theme', 'Default Page', 3, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(2, 1, 1, 1, NULL, '127.0.0.1', 'Sub Page One', 'sub-page-one', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(3, 1, 1, 1, NULL, '127.0.0.1', 'Sub Page Two', 'sub-page-two', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(4, 1, 2, 1, NULL, '127.0.0.1', 'EEntry with large photograph', 'a-photograph-for-the-ages', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(5, 1, 2, 1, NULL, '127.0.0.1', 'Entry with vimeo video, lots of comments', 'action-comedy-how-to', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, 1566334497, 11),
(6, 1, 2, 1, NULL, '127.0.0.1', 'Entry with a lot of text, and comments disabled.', 'bacon-blog', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(7, 1, 2, 1, NULL, '127.0.0.1', 'Entry with BandCamp audio, comments, and comments disabled', 'marrow-and-the-broken-bones', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, 1566334492, 2),
(8, 1, 2, 1, NULL, '127.0.0.1', 'Super old entry.', 'super-old-entry', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(9, 1, 2, 1, NULL, '127.0.0.1', 'Entry with text, and comments', 'the-hip-one', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, 1566334493, 2),
(10, 1, 2, 1, NULL, '127.0.0.1', 'Entry with SoundCloud audio', 'the-one-where-we-shake-it-ff', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(11, 1, 2, 1, NULL, '127.0.0.1', 'Entry with YouTube video', 'the-one-with-rope-cutting', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0),
(12, 1, 3, 1, NULL, '127.0.0.1', 'Contact Us', 'contact-us', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1566334438, '2019', '08', '20', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_comments`
--

CREATE TABLE `dlp_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) UNSIGNED DEFAULT '0',
  `channel_id` int(4) UNSIGNED DEFAULT '1',
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_comments`
--

INSERT INTO `dlp_comments` (`comment_id`, `site_id`, `entry_id`, `channel_id`, `author_id`, `status`, `name`, `email`, `url`, `location`, `ip_address`, `comment_date`, `edit_date`, `comment`) VALUES
(1, 1, 5, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334484, NULL, 'This is a great video! Thanks for sharing!'),
(2, 1, 5, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334486, NULL, 'Woot, love it!'),
(3, 1, 5, 2, 0, 'o', 'Guest one', 'example@example.com', 'http://example.com/', 'Everywhere', '127.0.0.1', 1566334487, NULL, 'This is a comment by a guest to the site, unregistered, with a url and a location.'),
(4, 1, 5, 2, 0, 'o', 'Guest two', 'example@example.com', '', '', '127.0.0.1', 1566334488, NULL, 'This is a comment by an unregistered guest without a url, or a location.'),
(5, 1, 5, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334489, NULL, 'I really can\'t get enough of this kind of appraisal.'),
(6, 1, 5, 2, 0, 'o', 'Mr. Meanie', 'example@example.com', '', '', '127.0.0.1', 1566334491, NULL, 'I\'m a bad person, and people should not like me, and I say troll things all the time.'),
(7, 1, 5, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334492, NULL, 'Ugh, what a troll.'),
(8, 1, 5, 2, 0, 'o', 'Peter Winkle', 'peter@example.com', '', '', '127.0.0.1', 1566334493, NULL, 'This is a guest comment, from one Mr. Peter Winkle.'),
(9, 1, 5, 2, 0, 'o', 'Fancy Falls', 'fancy@example.com', 'http://example.com', 'Fancy Factory', '127.0.0.1', 1566334494, NULL, 'Fancy, I do say!'),
(10, 1, 5, 2, 0, 'o', 'Pauline Paxton', 'pauline@example.com', '', '', '127.0.0.1', 1566334496, NULL, 'Hello my name is Pauline Paxton, and I lurve Jackie Chan.'),
(11, 1, 5, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334497, NULL, 'Test'),
(12, 1, 7, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334490, NULL, 'This is a comment.\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(13, 1, 7, 2, 0, 'o', 'Quest one', 'example@example.com', '', '', '127.0.0.1', 1566334492, NULL, 'This is a comment from a Quest ;)\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(14, 1, 9, 2, 1, 'o', 'admindailypick', 'vipin950@gmail.com', 'http://eeblog.com/', NULL, '127.0.0.1', 1566334492, NULL, 'This is an author comment.'),
(15, 1, 9, 2, 0, 'o', 'Guest one', 'example@example.com', '', '', '127.0.0.1', 1566334493, NULL, 'This is a guest comment.');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_comment_subscriptions`
--

CREATE TABLE `dlp_comment_subscriptions` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_consents`
--

CREATE TABLE `dlp_consents` (
  `consent_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int(10) DEFAULT NULL,
  `response_date` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_consent_audit_log`
--

CREATE TABLE `dlp_consent_audit_log` (
  `consent_audit_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_consent_requests`
--

CREATE TABLE `dlp_consent_requests` (
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_consent_requests`
--

INSERT INTO `dlp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`) VALUES
(1, 1, 'n', 'Functionality Cookies', 'ee:cookies_functionality', 'n', NULL),
(2, 2, 'n', 'Performance Cookies', 'ee:cookies_performance', 'n', NULL),
(3, 3, 'n', 'Targeting Cookies', 'ee:cookies_targeting', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_consent_request_versions`
--

CREATE TABLE `dlp_consent_request_versions` (
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `create_date` int(10) NOT NULL DEFAULT '0',
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_consent_request_versions`
--

INSERT INTO `dlp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`) VALUES
(1, 1, 'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.', 'none', 1566334438, 0),
(2, 2, 'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.', 'none', 1566334438, 0),
(3, 3, 'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.', 'none', 1566334438, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_content_types`
--

CREATE TABLE `dlp_content_types` (
  `content_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_content_types`
--

INSERT INTO `dlp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_cp_log`
--

CREATE TABLE `dlp_cp_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_cp_log`
--

INSERT INTO `dlp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admindailypick', '127.0.0.1', 1566334587, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_developer_log`
--

CREATE TABLE `dlp_developer_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_email_cache`
--

CREATE TABLE `dlp_email_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int(6) UNSIGNED NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_email_cache_mg`
--

CREATE TABLE `dlp_email_cache_mg` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `group_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_email_cache_ml`
--

CREATE TABLE `dlp_email_cache_ml` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `list_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_email_console_cache`
--

CREATE TABLE `dlp_email_console_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_email_tracker`
--

CREATE TABLE `dlp_email_tracker` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_recipients` int(4) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_entry_versioning`
--

CREATE TABLE `dlp_entry_versioning` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_extensions`
--

CREATE TABLE `dlp_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_extensions`
--

INSERT INTO `dlp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Comment_ext', 'addCommentMenu', 'cp_custom_menu', 'a:0:{}', 10, '2.3.3', 'y'),
(2, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0.1', 'y'),
(3, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0.1', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_fieldtypes`
--

CREATE TABLE `dlp_fieldtypes` (
  `fieldtype_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_fieldtypes`
--

INSERT INTO `dlp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0.0', 'YTowOnt9', 'n'),
(5, 'duration', '1.0.0', 'YTowOnt9', 'n'),
(6, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(7, 'file', '1.0.0', 'YTowOnt9', 'n'),
(8, 'fluid_field', '1.0.0', 'YTowOnt9', 'n'),
(9, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(10, 'file_grid', '1.0.0', 'YTowOnt9', 'n'),
(11, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(12, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(13, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(14, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(15, 'rte', '1.0.1', 'YTowOnt9', 'n'),
(16, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(17, 'url', '1.0.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_field_groups`
--

CREATE TABLE `dlp_field_groups` (
  `group_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_field_groups`
--

INSERT INTO `dlp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 0, 'about'),
(2, 0, 'blog'),
(3, 0, 'common'),
(4, 0, 'contact'),
(5, 0, 'seo');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_files`
--

CREATE TABLE `dlp_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) UNSIGNED DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_files`
--

INSERT INTO `dlp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'blog.jpg', 6, 'image/jpeg', 'blog.jpg', 339111, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '900 1200'),
(2, 1, 'common.jpg', 7, 'image/jpeg', 'common.jpg', 339111, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '900 1200'),
(3, 1, 'lake.jpg', 8, 'image/jpeg', 'lake.jpg', 286878, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '502 1200'),
(4, 1, 'ocean.jpg', 8, 'image/jpeg', 'ocean.jpg', 111529, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '502 1200'),
(5, 1, 'path.jpg', 8, 'image/jpeg', 'path.jpg', 289200, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '502 1200'),
(6, 1, 'sky.jpg', 8, 'image/jpeg', 'sky.jpg', 62326, NULL, NULL, NULL, 1, 1566334479, 1, 1566334479, '502 1200');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_file_categories`
--

CREATE TABLE `dlp_file_categories` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_file_dimensions`
--

CREATE TABLE `dlp_file_dimensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int(4) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) UNSIGNED DEFAULT '90',
  `watermark_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_file_watermarks`
--

CREATE TABLE `dlp_file_watermarks` (
  `wm_id` int(4) UNSIGNED NOT NULL,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) UNSIGNED DEFAULT NULL,
  `wm_opacity` int(3) UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_fluid_field_data`
--

CREATE TABLE `dlp_fluid_field_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `fluid_field_id` int(11) UNSIGNED NOT NULL,
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `field_data_id` int(11) UNSIGNED NOT NULL,
  `order` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_global_variables`
--

CREATE TABLE `dlp_global_variables` (
  `variable_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_global_variables`
--

INSERT INTO `dlp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`, `edit_date`) VALUES
(1, 0, 'gv_comment_disabled', 'Commenting for this entry is <b>disabled</b>.', 1566334478),
(2, 0, 'gv_comment_expired', 'Commenting for this entry has <b>expired</b>.', 1566334478),
(3, 0, 'gv_comment_ignore', 'You are ignoring', 1566334478),
(4, 0, 'gv_comment_none', 'There are <b>no</b> comments on this entry.', 1566334478),
(5, 0, 'gv_entries_none', 'There are <b>no</b> entries in this channel.', 1566334478),
(6, 0, 'gv_sep', '&nbsp;/&nbsp;', 1566334478);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_grid_columns`
--

CREATE TABLE `dlp_grid_columns` (
  `col_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int(3) UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int(3) UNSIGNED DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_grid_columns`
--

INSERT INTO `dlp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`) VALUES
(1, 1, 'channel', 0, 'file', 'Image', 'image', 'Upload the image you want to use.', 'n', 'n', 0, '{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),
(2, 1, 'channel', 1, 'text', 'Caption', 'caption', 'Credit and copyright for this image.', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(3, 1, 'channel', 2, 'select', 'Alignment?', 'align', 'Align this image ot the left or right?', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_pre_channel_id\":\"0\",\"field_pre_field_id\":\"0\",\"field_list_items\":\"none\\nleft\\nright\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(4, 2, 'channel', 0, 'text', 'ID', 'id', 'Audio ID, i.e. 177363559', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(5, 2, 'channel', 1, 'select', 'Type', 'type', 'Type of audio, choose one.', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_pre_channel_id\":\"0\",\"field_pre_field_id\":\"0\",\"field_list_items\":\"soundcloud\\nbandcamp\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(6, 4, 'channel', 0, 'file', 'Image', 'image', 'Upload the image you want to use.', 'n', 'y', 0, '{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),
(7, 4, 'channel', 1, 'text', 'Caption', 'caption', 'Credit and copyright for this image.', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(8, 5, 'channel', 0, 'text', 'ID', 'id', 'Video ID, i.e. 8OcydG0RiqI', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(9, 5, 'channel', 1, 'select', 'Type', 'type', 'Type of video, choose one.', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_pre_channel_id\":\"0\",\"field_pre_field_id\":\"0\",\"field_list_items\":\"youtube\\nvimeo\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(10, 7, 'channel', 0, 'text', 'Street', 'street', 'Street address', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(11, 7, 'channel', 1, 'text', 'Street 2', 'street_2', 'Street address continued, e.g. Suite 2', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(12, 7, 'channel', 2, 'text', 'City', 'city', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(13, 7, 'channel', 3, 'text', 'State', 'state', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(14, 7, 'channel', 4, 'text', 'ZIP', 'zip', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_html_buttons`
--

CREATE TABLE `dlp_html_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int(3) UNSIGNED NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_html_buttons`
--

INSERT INTO `dlp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'a', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_layout_publish`
--

CREATE TABLE `dlp_layout_publish` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_layout_publish_member_groups`
--

CREATE TABLE `dlp_layout_publish_member_groups` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_members`
--

CREATE TABLE `dlp_members` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) UNSIGNED DEFAULT NULL,
  `avatar_height` int(4) UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int(4) UNSIGNED DEFAULT NULL,
  `photo_height` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_height` int(4) UNSIGNED DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_avatars` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_members`
--

INSERT INTO `dlp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`) VALUES
(1, 1, 'admindailypick', 'admindailypick', '4a652b11b35f4250b051fbe65a1be3ff934d25c85805237909c503626cfdce2a6c6ae9457c4ea52bc9614d8ed5f79ad4cfe8941d0cd4f4b45f279d086ffbf381', 'n]M]@:n=E(e*yu$\'OHgwWcWDzH8/)kI2,H)kAz)CVQb$B[4TLTs4NHsg!_&@nJrNYE2#}5cC#>gAX+GXmd*cOE}H}H)t#J[H}-o\'r_[m\'*HGnxROKWlwr-CL>,is)n5=', '07a75e090586e3df5383bf4c0873912de136b87a', '10fc220532c3d123e136fe2e488d229666ce38e3', NULL, 'vipin950@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1566334438, 1566334588, 1566344176, 12, 7, 0, 0, 1566334438, 1566334497, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Europe/Berlin', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, 'y', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_bulletin_board`
--

CREATE TABLE `dlp_member_bulletin_board` (
  `bulletin_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `bulletin_group` int(8) UNSIGNED NOT NULL,
  `bulletin_date` int(10) UNSIGNED NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_data`
--

CREATE TABLE `dlp_member_data` (
  `member_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_member_data`
--

INSERT INTO `dlp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_fields`
--

CREATE TABLE `dlp_member_fields` (
  `m_field_id` int(4) UNSIGNED NOT NULL,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int(3) UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_groups`
--

CREATE TABLE `dlp_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `menu_set_id` int(5) UNSIGNED NOT NULL DEFAULT '1',
  `group_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_offline_system` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_footer_report_bug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_new_ticket` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_user_guide` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_homepage_news` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_design` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_addons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_post_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) UNSIGNED NOT NULL,
  `can_send_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_create_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_new_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_security_settings` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_translate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_import` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sql_manager` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_spam` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_manage_consents` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_member_groups`
--

INSERT INTO `dlp_member_groups` (`group_id`, `site_id`, `menu_set_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_footer_report_bug`, `can_access_footer_new_ticket`, `can_access_footer_user_guide`, `can_view_homepage_news`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_members`, `can_access_sys_prefs`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_addons`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_cached_email`, `can_email_member_groups`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_upload_new_files`, `can_edit_files`, `can_delete_files`, `can_upload_new_toolsets`, `can_edit_toolsets`, `can_delete_toolsets`, `can_create_upload_directories`, `can_edit_upload_directories`, `can_delete_upload_directories`, `can_create_channels`, `can_edit_channels`, `can_delete_channels`, `can_create_channel_fields`, `can_edit_channel_fields`, `can_delete_channel_fields`, `can_create_statuses`, `can_delete_statuses`, `can_edit_statuses`, `can_create_categories`, `can_create_member_groups`, `can_delete_member_groups`, `can_edit_member_groups`, `can_create_members`, `can_edit_members`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `can_create_template_groups`, `can_edit_template_groups`, `can_delete_template_groups`, `can_create_template_partials`, `can_edit_template_partials`, `can_delete_template_partials`, `can_create_template_variables`, `can_delete_template_variables`, `can_edit_template_variables`, `can_access_security_settings`, `can_access_translate`, `can_access_import`, `can_access_sql_manager`, `can_moderate_spam`, `can_manage_consents`) VALUES
(1, 1, 1, 'Super Admin', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', NULL, 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', NULL, 0, NULL, 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'),
(2, 1, 1, 'Banned', '', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(3, 1, 1, 'Guests', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(4, 1, 1, 'Pending', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(5, 1, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', NULL, 'n', 'n', 'n', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_news_views`
--

CREATE TABLE `dlp_member_news_views` (
  `news_id` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_member_news_views`
--

INSERT INTO `dlp_member_news_views` (`news_id`, `version`, `member_id`) VALUES
(1, '5.2.6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_member_search`
--

CREATE TABLE `dlp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) UNSIGNED NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_menu_items`
--

CREATE TABLE `dlp_menu_items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_menu_sets`
--

CREATE TABLE `dlp_menu_sets` (
  `set_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_menu_sets`
--

INSERT INTO `dlp_menu_sets` (`set_id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_message_attachments`
--

CREATE TABLE `dlp_message_attachments` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_message_copies`
--

CREATE TABLE `dlp_message_copies` (
  `copy_id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_message_data`
--

CREATE TABLE `dlp_message_data` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_message_folders`
--

CREATE TABLE `dlp_message_folders` (
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_message_listed`
--

CREATE TABLE `dlp_message_listed` (
  `listed_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_modules`
--

CREATE TABLE `dlp_modules` (
  `module_id` int(4) UNSIGNED NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_modules`
--

INSERT INTO `dlp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.0.1', 'n', 'n'),
(2, 'Comment', '2.3.3', 'y', 'n'),
(3, 'Consent', '1.0.0', 'n', 'n'),
(4, 'Member', '2.1.0', 'n', 'n'),
(5, 'Stats', '2.0.0', 'n', 'n'),
(6, 'Rte', '1.0.1', 'y', 'n'),
(7, 'File', '1.0.0', 'n', 'n'),
(8, 'Filepicker', '1.0', 'y', 'n'),
(9, 'Relationship', '1.0.0', 'n', 'n'),
(10, 'Search', '2.2.2', 'n', 'n'),
(11, 'Email', '2.1.0', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_module_member_groups`
--

CREATE TABLE `dlp_module_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `module_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_online_users`
--

CREATE TABLE `dlp_online_users` (
  `online_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_password_lockout`
--

CREATE TABLE `dlp_password_lockout` (
  `lockout_id` int(10) UNSIGNED NOT NULL,
  `login_date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_plugins`
--

CREATE TABLE `dlp_plugins` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_relationships`
--

CREATE TABLE `dlp_relationships` (
  `relationship_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_remember_me`
--

CREATE TABLE `dlp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_remember_me`
--

INSERT INTO `dlp_remember_me` (`remember_me_id`, `member_id`, `ip_address`, `user_agent`, `admin_sess`, `site_id`, `expiration`, `last_refresh`) VALUES
('d9a9255b6745d69b3227add87f29d043bdbaa26e', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, 1, 1567544187, 1566334587);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_reset_password`
--

CREATE TABLE `dlp_reset_password` (
  `reset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_revision_tracker`
--

CREATE TABLE `dlp_revision_tracker` (
  `tracker_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_table` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) UNSIGNED NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_rte_tools`
--

CREATE TABLE `dlp_rte_tools` (
  `tool_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_rte_tools`
--

INSERT INTO `dlp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_rte_toolsets`
--

CREATE TABLE `dlp_rte_toolsets` (
  `toolset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tools` text COLLATE utf8mb4_unicode_ci,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_rte_toolsets`
--

INSERT INTO `dlp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_search`
--

CREATE TABLE `dlp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) UNSIGNED NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_search_log`
--

CREATE TABLE `dlp_search_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_security_hashes`
--

CREATE TABLE `dlp_security_hashes` (
  `hash_id` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_security_hashes`
--

INSERT INTO `dlp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(1, 1566334588, '1a8819a29275529e3769c9f2fb38281d968d1b9b', '61b44457f26b363017ecf265dacd1c7e2c842bed');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_sessions`
--

CREATE TABLE `dlp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `auth_timeout` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_sessions`
--

INSERT INTO `dlp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`) VALUES
('1a8819a29275529e3769c9f2fb38281d968d1b9b', 1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0', NULL, 'fe4118f5d3000eab2ec1ab6517be359a', 1566341175, 0, 1566344176, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_sites`
--

CREATE TABLE `dlp_sites` (
  `site_id` int(5) UNSIGNED NOT NULL,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_system_preferences` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_member_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_template_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_channel_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_sites`
--

INSERT INTO `dlp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Testinf EE Features', 'testinf_ee_features', NULL, 'YTo5MTp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjg6ImJhc2VfdXJsIjtzOjE4OiJodHRwOi8vZWVibG9nLmNvbS8iO3M6OToiYmFzZV9wYXRoIjtzOjIzOiJFOi94YW1wcC9odGRvY3MvZWVibG9nLyI7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MTA6IntiYXNlX3VybH0iO3M6NjoiY3BfdXJsIjtzOjE5OiJ7YmFzZV91cmx9YWRtaW4ucGhwIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjE3OiJ7YmFzZV91cmx9dGhlbWVzLyI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MzA6IkU6XHhhbXBwXGh0ZG9jc1xlZWJsb2dcdGhlbWVzXCI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjE4OiJ2aXBpbjk1MEBnbWFpbC5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjI2OiJ7YmFzZV91cmx9aW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjM5OiJFOlx4YW1wcFxodGRvY3NcZWVibG9nXGltYWdlc1xjYXB0Y2hhc1wiO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNToicmVxdWlyZV9jYXB0Y2hhIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjE6Ii8iO3M6MTU6ImNvb2tpZV9odHRwb25seSI7TjtzOjEzOiJjb29raWVfc2VjdXJlIjtOO3M6MjA6IndlYnNpdGVfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTU6ImNwX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MTM6IkV1cm9wZS9CZXJsaW4iO3M6MTE6ImRhdGVfZm9ybWF0IjtzOjg6IiVuLyVqLyVZIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiIxMiI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjEzOiJlbWFpbF9uZXdsaW5lIjtzOjI6IlxuIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6OToic210cF9wb3J0IjtOO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxNzoiZW1haWxfc210cF9jcnlwdG8iO3M6Mzoic3NsIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6MjU6IntiYXNlX3VybH1pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjEzOiJmb3J1bV90cmlnZ2VyIjtOO30=', 'YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo2OiJtZW1iZXIiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJ5IjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjI1OiJ7YmFzZV91cmx9aW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czozODoiRTpceGFtcHBcaHRkb2NzXGVlYmxvZ1xpbWFnZXNcYXZhdGFyc1wiO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6MzE6IntiYXNlX3VybH1pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MToiXCI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjM5OiJ7YmFzZV91cmx9aW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo1MjoiRTpceGFtcHBcaHRkb2NzXGVlYmxvZ1xpbWFnZXNcc2lnbmF0dXJlX2F0dGFjaG1lbnRzXCI7czoxNzoic2lnX2ltZ19tYXhfd2lkdGgiO3M6MzoiNDgwIjtzOjE4OiJzaWdfaW1nX21heF9oZWlnaHQiO3M6MjoiODAiO3M6MTQ6InNpZ19pbWdfbWF4X2tiIjtzOjI6IjMwIjtzOjE1OiJwcnZfbXNnX2VuYWJsZWQiO3M6MToieSI7czoyNToicHJ2X21zZ19hbGxvd19hdHRhY2htZW50cyI7czoxOiJ5IjtzOjE5OiJwcnZfbXNnX3VwbG9hZF9wYXRoIjtzOjQ1OiJFOlx4YW1wcFxodGRvY3NcZWVibG9nXGltYWdlc1xwbV9hdHRhY2htZW50c1wiO3M6MjM6InBydl9tc2dfbWF4X2F0dGFjaG1lbnRzIjtzOjE6IjMiO3M6MjI6InBydl9tc2dfYXR0YWNoX21heHNpemUiO3M6MzoiMjUwIjtzOjIwOiJwcnZfbXNnX2F0dGFjaF90b3RhbCI7czozOiIxMDAiO3M6MTk6InBydl9tc2dfaHRtbF9mb3JtYXQiO3M6NDoic2FmZSI7czoxODoicHJ2X21zZ19hdXRvX2xpbmtzIjtzOjE6InkiO3M6MTc6InBydl9tc2dfbWF4X2NoYXJzIjtzOjQ6IjYwMDAiO3M6MTk6Im1lbWJlcmxpc3Rfb3JkZXJfYnkiO3M6OToibWVtYmVyX2lkIjtzOjIxOiJtZW1iZXJsaXN0X3NvcnRfb3JkZXIiO3M6NDoiZGVzYyI7czoyMDoibWVtYmVybGlzdF9yb3dfbGltaXQiO3M6MjoiMjAiO3M6Mjg6ImFwcHJvdmVkX21lbWJlcl9ub3RpZmljYXRpb24iO047czoyODoiZGVjbGluZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7Tjt9', 'YTo2OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6ODoiaG9tZS80MDQiO3M6MTk6InNhdmVfdG1wbF9yZXZpc2lvbnMiO3M6MToibiI7czoxODoibWF4X3RtcGxfcmV2aXNpb25zIjtzOjE6IjUiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7Tjt9', 'YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtzOjE6InkiO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==', 'YToxOntzOjMyOiJFOlx4YW1wcFxodGRvY3NcZWVibG9nL2luZGV4LnBocCI7czozMjoiNTQwZGUwMjMxNDZkZWI5MGZhNTgxYmRkZWRhNWNlNmQiO30=', '');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_snippets`
--

CREATE TABLE `dlp_snippets` (
  `snippet_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_snippets`
--

INSERT INTO `dlp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`) VALUES
(1, 0, 'snp_blog_list', '<div class=\"entry\">\n	{!-- title --}\n	<h2><a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}\'}\">{title}</a></h2>\n	<p><b>on:</b> {entry_date format=\'%n/%j/%Y\'}, <b>by:</b> <a href=\"{path=\'member/{author_id}\'}\">{author}</a>, <a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}#comments\'}\">{comment_total} comment{if comment_total != 1}s{/if}</a></p>\n</div>', 1566334477),
(2, 0, 'snp_blog_list_paginate', '{!-- pagination --}\n{paginate}\n	<div class=\"paginate\">\n		{pagination_links page_padding=\'1\'}\n			<ul>\n				{previous_page}\n					<li><a href=\"{pagination_url}\">Previous Page</a></li>\n				{/previous_page}\n				{page}\n					<li><a href=\"{pagination_url}\"{if current_page} class=\"act\"{/if}>{pagination_page_number}</a></li>\n				{/page}\n				{next_page}\n					<li><a href=\"{pagination_url}\">Next Page</a></li>\n				{/next_page}\n			</ul>\n		{/pagination_links}\n	</div>\n{/paginate}', 1566334477),
(3, 0, 'snp_main_nav', '					<ul class=\"main-nav\">\n						<li><a{if segment_1 == \'\'} class=\"act\"{/if} href=\"{homepage}\">Home</a></li>\n						<li><a{if segment_1 == \'about\'} class=\"act\"{/if} href=\"{path=\'about\'}\">About</a></li>\n						<li><a{if segment_1 == \'blog\'} class=\"act\"{/if} href=\"{path=\'blog\'}\">Blog</a></li>\n						<li><a{if segment_1 == \'contact\'} class=\"act\"{/if} href=\"{path=\'contact\'}\">Contact</a></li>\n					</ul>', 1566334477);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_specialty_templates`
--

CREATE TABLE `dlp_specialty_templates` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_specialty_templates`
--

INSERT INTO `dlp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1566334438, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1566334438, 0),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1566334438, 0),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1566334438, 0),
(5, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1566334438, 0),
(6, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1566334438, 0),
(7, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(8, 1, 'y', 'password_changed_notification', 'Password changed', 'email', 'members', '{name},\n\nYour password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(9, 1, 'y', 'email_changed_notification', 'Email address changed', 'email', 'members', '{name},\n\nYour email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', '{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(12, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1566334438, 0),
(13, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1566334438, 0),
(14, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1566334438, 0),
(15, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1566334438, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_stats`
--

CREATE TABLE `dlp_stats` (
  `stat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_stats`
--

INSERT INTO `dlp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'admindailypick', 12, 0, 0, 15, 1566334438, 0, 1566334497, 0, 0, 0, 1566939398);

-- --------------------------------------------------------

--
-- Table structure for table `dlp_statuses`
--

CREATE TABLE `dlp_statuses` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int(3) UNSIGNED NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_statuses`
--

INSERT INTO `dlp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES
(1, 'open', 1, '009933'),
(2, 'closed', 2, '990000'),
(3, 'Default Page', 3, '2051B3');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_status_no_access`
--

CREATE TABLE `dlp_status_no_access` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_templates`
--

CREATE TABLE `dlp_templates` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_templates`
--

INSERT INTO `dlp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(1, 1, 1, 'index', 'webpage', '{layout=\'layouts/_about-layout\'}\n\n{!--\n	404 redirect\n	============\n	This is a multi-entry channel page, it doesn\'t need third segment as is. So we use the following code to make sure the page sends a 404 if someone types in an incorrect URL in the browser address bar. i.e. http://example.com/about/sub-page/nothing\n--}\n{if segment_3}\n	{redirect=\'404\'}\n{/if}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_title=\'about {site_name}\'}\n{preload_replace:p_description=\'about {site_name}\'}\n{preload_replace:p_url=\'about\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'about\'}\n{preload_replace:ch_status=\'Open|Default Page\'}\n{preload_replace:ch_disable=\'categories|category_fields|member_data|pagination\'}\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n{layout:set name=\'ch_disable\' value=\'{ch_disable}\'}\n{layout:set name=\'ch_status\' value=\'{ch_status}\'}\n{if segment_2}{layout:set name=\'entry_ch\' value=\'{ch}\'}{/if}\n\n		{!-- channel entries tag --}\n		{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'1\'{if segment_2} require_entry=\'yes\'{if:else} status=\'Default Page\'{/if}}\n			{!-- layout vars, dynamic, not output --}\n			{layout:set name=\'title\' value=\'{if seo_title}{seo_title}{if:else}{p_title}{/if}{gv_sep}\'}\n			{layout:set name=\'description\' value=\'{if seo_desc}{seo_desc}{if:else}{p_description}{/if}\'}\n			{!-- OpenGraph meta output --}\n			{layout:set name=\'og_title\' value=\'{if seo_title}{seo_title}{if:else}{p_title}{/if}\'}\n			{layout:set name=\'og_url\'}{path=\'{p_url}\'}{/layout:set}\n			{layout:set name=\'og_description\' value=\'{if seo_desc}{seo_desc}{if:else}{p_description}{/if}\'}\n			{!-- /layout vars, dynamic, not output --}\n\n			{!-- content output --}\n			<h1>{title}</h1>\n			{!-- about_image is a grid field first we check to see if it exists then we output it\'s contents. --}\n			{if about_image}\n				{about_image}\n					<figure {if about_image:align != \'none\'}class=\"{about_image:align}\"{/if}>\n						<img src=\"{about_image:image}\" alt=\"{about_image:caption:attr_safe}\">\n						<figcaption>{about_image:caption}</figcaption>\n					</figure>\n				{/about_image}\n			{/if}\n			{!-- page_content is a textarea with HTML output we don\'t need to wrap this tag with HTML as that is already included in it\'s output. --}\n			{page_content}\n			{!-- /content output --}\n\n			{!--\n				no results redirect\n				===================\n				If the entry doesn\'t exist, we redirect to 404. This works in tandem with the require_entry=\'yes\' parameter on the channel entries tag.\n			--}\n			{if no_results}\n				{redirect=\'404\'}\n			{/if}\n		{/exp:channel:entries}\n', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(2, 1, 2, 'entry', 'webpage', '{layout=\'layouts/_blog-layout\'}\n\n{!--\n	Redirect\n	============\n	This is a blog single entry page, it\'ll never need a fourth segment, so we use the following code to make sure the page redirects if someone types in an incorrect URL in the browser address bar, by adding new segments. i.e. http://example.com/blog/entry/title/nothing\n--}\n{if segment_4}\n	{redirect=\'{segment_1}/{segment_2}/{segment_3}\'}\n{/if}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_title=\'My Blog\'}\n{preload_replace:p_description=\'A blog about things, things I like and things I do.\'}\n{preload_replace:p_url=\'blog\'}\n{preload_replace:p_url_entry=\'entry\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{preload_replace:ch_disable=\'category_fields|member_data|pagination\'}\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n\n\n		{!-- single-entry pagination --}\n		<div class=\"paginate single\">\n			{exp:channel:prev_entry channel=\'{ch}\'}\n				<a class=\"page-prev\" href=\"{path=\'{p_url}/{p_url_entry}\'}\" title=\"{title}\">Previous</a>\n			{/exp:channel:prev_entry}\n			{exp:channel:next_entry channel=\'{ch}\'}\n				<a class=\"page-next\" href=\"{path=\'{p_url}/{p_url_entry}\'}\" title=\"{title}\">Next</a>\n			{/exp:channel:next_entry}\n		</div>\n		{!-- require_entry makes it so if someone types the wrong URL, they will get a 404 page --}\n		{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'1\' require_entry=\'yes\'}\n			{!-- layout vars, dynamic, not output --}\n			{layout:set name=\'title\' value=\'{seo_title}{gv_sep}{p_title}{gv_sep}\'}\n			{layout:set name=\'description\' value=\'{seo_desc}\'}\n			{layout:set name=\'entry_ch\' value=\'{ch}\'}\n			{!-- OpenGraph meta output --}\n			{layout:set name=\'og_title\' value=\'{seo_title}\'}\n			{layout:set name=\'og_url\'}{path=\'{p_url}\'}{/layout:set}\n			{layout:set name=\'og_description\' value=\'{seo_desc}\'}\n			{!-- /layout vars, dynamic, not output --}\n\n			{!-- content output --}\n			<h1>{title}</h1>\n			{!-- video, youtube or vimeo? (GRID) --}\n			{if blog_video}\n				{blog_video}\n					{if blog_video:type == \'youtube\'}\n						<figure class=\"video\">\n							<div class=\"player\">\n								<iframe width=\"940\" height=\"529\" src=\"http://www.youtube.com/embed/{blog_video:id}?rel=0&controls=2&color=white&autohide=1\" frameborder=\"0\" allowfullscreen></iframe>\n							</div>\n						</figure>\n					{/if}\n					{if blog_video:type == \'vimeo\'}\n						<figure class=\"video\">\n							<div class=\"player\">\n								<iframe src=\"//player.vimeo.com/video/{blog_video:id}?color=f0a400\" width=\"940\" height=\"529\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>\n							</div>\n						</figure>\n					{/if}\n				{/blog_video}\n			{/if}\n			{!-- audio, soundcloud or bandcamp? (GRID) --}\n			{if blog_audio}\n				{blog_audio}\n					{if blog_audio:type == \'soundcloud\'}\n						<figure class=\"audio-wrap\">\n							<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/{blog_audio:id}&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false\"></iframe>\n						</figure>\n					{/if}\n					{if blog_audio:type == \'bandcamp\'}\n						<figure class=\"audio-wrap\">\n							<iframe style=\"border: 0; width: 100%; height: 120px;\" src=\"http://bandcamp.com/EmbeddedPlayer/album={blog_audio:id}/size=large/bgcol=ffffff/linkcol=0687f5/tracklist=false/artwork=small/transparent=true/\" seamless></iframe>\n						</figure>\n					{/if}\n				{/blog_audio}\n			{/if}\n			{!-- image (GRID) --}\n			{if blog_image}\n				{blog_image}\n					<figure>\n						<img src=\"{blog_image:image}\" alt=\"{blog_image:caption:attr_safe}\">\n						<figcaption>{blog_image:caption}</figcaption>\n					</figure>\n				{/blog_image}\n			{/if}\n			{!-- blog_content is a textarea with HTML output we don\'t need to wrap this tag with HTML as that is already included in it\'s output. --}\n			{blog_content}\n			{!-- /content output --}\n\n			{!--\n				no results redirect\n				===================\n				If the entry doesn\'t exist, we redirect to 404. This works in tandem with the require_entry=\'yes\' parameter on the channel entries tag.\n			--}\n			{if no_results}\n				{redirect=\'404\'}\n			{/if}\n			{!--\n				comments\n				comment:entries and comment:form are independent of channel:entries\n				we\'ve put them into a embed here to demonstrate how to get a specific\n				display on the front end of the site using allow_comments.\n				This would not work without the embed, as these tags would not parse\n				inside the channel:entries tag.\n			--}\n			{if allow_comments}\n				{embed=\'{p_url}/_comments\' ch=\'{ch}\'}\n			{if:else}\n				{if comment_total >= 1}\n					{embed=\'{p_url}/_comments\' ch=\'{ch}\'}\n				{/if}\n				<div class=\"alert warn no-results\">\n					{if comment_expiration_date < current_time AND comment_expiration_date != 0}\n						<p>{gv_comment_expired}</p>\n					{if:else}\n						<p>{gv_comment_disabled}</p>\n					{/if}\n				</div>\n			{/if}\n		{/exp:channel:entries}\n', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(3, 1, 2, 'index', 'webpage', '{layout=\'layouts/_blog-layout\'}\n\n{!--\n	404 Redirect\n	============\n	This is a listing page, it needs categories and pagination to work, but also needs to redirect if segment_2 is invalid . i.e. http://example.com/blog/nothing\n--}\n{if segment_2}\n	{if segment_2 != \'category\' AND segment_2  ~ \'/^(?!P\\d+).*/\'}\n		{redirect=\'404\'}\n	{/if}\n{/if}\n\n{!-- prevents 3rd ++ segments on non category listings --}\n{if segment_3}\n	{if segment_2 != \'category\'}\n		{redirect=\'{segment_1}/{segment_2}\'}\n	{/if}\n{/if}\n\n{!-- prevents 4th ++ segments on category listings --}\n{if segment_4}\n	{if segment_4 ~ \'/^(?!P\\d+).*/\'}\n		{redirect=\'{segment_1}/{segment_2}/{segment_3}\'}\n	{/if}\n{/if}\n\n{!-- prevents 5th ++ segments on paginated category listings --}\n{if segment_5}\n	{redirect=\'{segment_1}/{segment_2}/{segment_3}/{segment_4}\'}\n{/if}\n\n{!-- We use preload replace variables for in-template replacements for things\n     like tag parameters that we might repeat here. That way if we change things\n     down the road, we can just change it here instead of looking all over the\n     template for them. --}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_title=\'My Blog\'}\n{preload_replace:p_description=\'A blog about things, things I like and things I do.\'}\n{preload_replace:p_url=\'blog\'}\n{preload_replace:p_url_entry=\'entry\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{preload_replace:ch_disable=\'category_fields|member_data\'}\n\n{!-- every template using the blog layout will set these which lets us use\n	 shared markup with customizable details. --}\n\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n{!-- layout vars, static --}\n{layout:set name=\'title\' value=\'{p_title}{gv_sep}\'}\n{layout:set name=\'description\' value=\'{p_description}\'}\n{!-- OpenGraph meta output --}\n{layout:set name=\'og_title\' value=\'{p_title}\'}\n{layout:set name=\'og_url\'}{path=\'{p_url}\'}{/layout:set}\n{layout:set name=\'og_description\' value=\'{p_description}\'}\n\n{!-- Everything below is the \"meat\" of the template. We\'ll use tags to output content,\n	which will populate the layout:contents of the layouts/_blog-layout layout --}\n\n			{!-- Heading output is different in the case of category listings. --}\n			{if segment_2 == \'category\'}\n				{layout:set name=\'cat_ch\' value=\'{ch}\'}\n				{exp:channel:category_heading channel=\'{ch}\'}\n					<h1>{category_name}</h1>\n					{if category_description}\n						<p>{category_description}</p>\n					{/if}\n				{/exp:channel:category_heading}\n			{if:else}\n				<h1>{p_title}</h1>\n				<p>{p_description}</p>\n			{/if}\n			<div class=\"entries\">\n				{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'5\'}\n					{!-- listing as a snippet, as it\'s used through more than one template --}\n					{snp_blog_list}\n					{!-- no results output --}\n					{if no_results}\n						<div class=\"alert warn no-results\">\n							<p>{gv_entries_none}</p>\n						</div>\n					{/if}\n					{!-- pagination --}\n					{snp_blog_list_paginate}\n				{/exp:channel:entries}\n			</div>', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(4, 1, 2, 'no-results', 'webpage', '{layout=\'layouts/_blog-layout\'}\n\n{!-- prevents 4th ++ segments on no results searches --}\n{if segment_4}\n	{redirect=\'{segment_1}/{segment_2}/{segment_3}\'}\n{/if}\n\n{!-- page vars --}\n{preload_replace:p_title=\'My Blog\'}\n{preload_replace:p_description=\'Search Results\'}\n{preload_replace:p_url=\'blog\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n{layout:set name=\'search\' value=\'y\'}\n{!-- layout vars --}\n{layout:set name=\'title\' value=\'search results{gv_sep}{p_title}{gv_sep}\'}\n{layout:set name=\'description\' value=\'{p_description}\'}\n\n		<h1>Search Results, {p_title}</h1>\n		<div class=\"alert warn no-results\">\n			<p>Sorry, zero entries found matching \"<b>{exp:search:keywords}</b>\".</p>\n		</div>\n', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(5, 1, 2, 'rss', 'feed', '{!-- page vars (prefix p_) --}\n{preload_replace:p_title=\'My Blog\'}\n{preload_replace:p_url=\'blog\'}\n{preload_replace:p_url_entry=\'entry\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{preload_replace:ch_disable=\'member_data|pagination\'}\n\n{exp:rss:feed channel=\'{ch}\'}\n	<?xml version=\"1.0\" encoding=\"{encoding}\"?>\n	<rss version=\"2.0\"\n		xmlns:dc=\"http://purl.org/dc/elements/1.1/\"\n		xmlns:sy=\"http://purl.org/rss/1.0/modules/syndication/\"\n		xmlns:admin=\"http://webns.net/mvcb/\"\n		xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n		xmlns:content=\"http://purl.org/rss/1.0/modules/content/\">\n\n		<channel>\n\n			<title><![CDATA[{p_title} / {site_name}]]></title>\n			<link>{site_url}{p_url}/</link>\n			<description>{channel_description}</description>\n			<language>{channel_language}</language>\n			<managingEditor>{email} ({author})</managingEditor>\n			<copyright>Copyright {gmt_date format=\'%Y\'}</copyright>\n			<pubDate>{gmt_date format=\'%Y-%m-%dT%H:%i:%s%Q\'}</pubDate>\n			<admin:generatorAgent rdf:resource=\"{path=\'{p_url}\'}\" />\n\n			{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'10\' rdf=\'off\' dynamic_start=\'yes\'}\n				<item>\n					<title><![CDATA[{title}]]></title>\n					<link>{title_permalink=\'{p_url}/{p_url_entry}\'}</link>\n					<guid>{title_permalink=\'{p_url}/{p_url_entry}\'}</guid>\n					<author>{email} ({author})</author>\n					<description><![CDATA[{blog_content}<p><a href=\"{title_permalink=\"{p_url}/{p_url_entry}\"}\" title=\"{title}\">Read more</a></p>]]></description>\n					<dc:subject><![CDATA[{categories backspace=\'1\'}{category_name}, {/categories}]]></dc:subject>\n					<pubDate>{gmt_entry_date format=\'{DATE_RSS}\'}</pubDate>\n				</item>\n			{/exp:channel:entries}\n\n		</channel>\n	</rss>\n{/exp:rss:feed}', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(6, 1, 2, 'search', 'webpage', '{layout=\'layouts/_blog-layout\'}\n\n{!-- prevents 4th ++ segments on search results --}\n{if segment_4}\n	{if segment_4 ~ \'/^(?!P\\d+).*/\'}\n		{redirect=\'{segment_1}/{segment_2}/{segment_3}\'}\n	{/if}\n{/if}\n\n{!-- prevents 5th ++ segments on paginated search results --}\n{if segment_5}\n	{redirect=\'{segment_1}/{segment_2}/{segment_3}/{segment_4}\'}\n{/if}\n\n{!-- page vars --}\n{preload_replace:p_title=\'My Blog\'}\n{preload_replace:p_description=\'Search Results\'}\n{preload_replace:p_url=\'blog\'}\n{preload_replace:p_url_entry=\'entry\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n{layout:set name=\'search\' value=\'y\'}\n{!-- layout vars --}\n{layout:set name=\'title\' value=\'search results{gv_sep}{p_title}{gv_sep}\'}\n{layout:set name=\'description\' value=\'{p_description}\'}\n\n		<h1>Search Results, {p_title}</h1>\n		<div class=\"entries\">\n			{exp:search:search_results}\n				{!-- listing as a snippet, as it\'s used through more than one template --}\n				{snp_blog_list}\n				{!-- pagination --}\n				{snp_blog_list_paginate}\n			{/exp:search:search_results}\n		</div>\n', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(7, 1, 2, '_comments', 'webpage', '{!-- comments --}\n<div id=\"comments\" class=\"comments\">\n	<h2>Commentary</h2>\n	{!-- comment entries --}\n	{exp:comment:entries channel=\'{embed:ch}\'}\n		<div class=\"comment{if author_id == entry_author_id} author{/if}\"{if count == total_results} id=\"last-comment\"{/if}>\n			<section class=\"row\">\n				<section class=\"w-12\">\n					{!-- change the comment text output if the commenter is being ignored by the logged in user. --}\n					{if is_ignored}\n						<div class=\"alert warn\">\n							<p>{gv_comment_ignore} <b>{name}</b>.</p>\n						</div>\n					{if:else}\n						{comment}\n					{/if}\n				</section>\n				<section class=\"w-4\">\n					{!-- mark the author of the post, and ignored differently than other commenters --}\n					<h3{if author_id == entry_author_id} class=\"author\" title=\"Author of Entry\"{if:elseif is_ignored} class=\"ignored\" title=\"Troll\"{/if}>\n						{if url}\n							<a href=\"{url}\" rel=\"external\">{name}</a>\n						{if:else}\n							{url_as_author}\n						{/if}\n					</h3>\n					<p>on {comment_date format=\"%n/%j/%Y\"}{if location}<br>from {location}{/if}</p>\n				</section>\n			</section>\n		</div>\n		{!--\n			no results output\n			===================\n			If there are no comments, show this message.\n		--}\n		{if no_results}\n			<div class=\"alert warn no-results\">\n				<p>{gv_comment_none}</p>\n			</div>\n		{/if}\n	{/exp:comment:entries}\n\n	{!-- comment form --}\n	<div class=\"alert issue hide\"></div>\n	{exp:comment:form channel=\'{embed:ch}\' form_class=\'comment-form\' return=\'{segment_1}/{segment_2}/{segment_3}#last-comment\'}\n		{!-- if the user is logged out show more fields for commenting --}\n		{if logged_out}\n			<h2>Comment as a guest <span class=\"required\">Required Fields &#10033;</span></h2>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Name <span class=\"required\" title=\"required field\">&#10033;</span></label>\n					<em>What do you want to be called?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input class=\"required\" name=\"name\" type=\"text\" value=\"{name}\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>e-mail <span class=\"required\" title=\"required field\">&#10033;</span></label>\n					<em>How do we contact you?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input class=\"required\" name=\"email\" type=\"text\" value=\"{email}\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Location</label>\n					<em>Where are you commenting from?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input name=\"location\" type=\"text\" value=\"{location}\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label><abbr title=\"Unified Resource Locator\">URL</abbr></label>\n					<em>Do you have a website to share?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input name=\"url\" type=\"text\" value=\"{url}\">\n				</section>\n			</fieldset>\n		{if:else}\n			<h2>Comment as <b>{screen_name}</b> <span class=\"required\">&#10033; Required Fields</span></h2>\n		{/if}\n		<fieldset class=\"row\">\n			<section class=\"w-4 instruct\">\n				<label>Comment? <span class=\"required\" title=\"required field\">&#10033;</span></label>\n				<em>Please keep it kind, brief and courteous.</em>\n			</section>\n			<section class=\"w-12 field\">\n				<textarea class=\"required\" name=\"comment\" cols=\"\" rows=\"\"></textarea>\n			</section>\n		</fieldset>\n		<fieldset class=\"row\">\n			<section class=\"w-4 instruct\">\n				<label>Options</label>\n				<em>Extra stuff we can do!</em>\n			</section>\n			<section class=\"w-12 field checks\">\n				<label><input type=\"checkbox\" name=\"save_info\" value=\"yes\" {save_info}> Remember Me?</label>\n				<label><input type=\"checkbox\" name=\"notify_me\" value=\"yes\" {notify_me}> Notify Me?</label>\n			</section>\n		</fieldset>\n		<fieldset class=\"ctrls\">\n			<input class=\"btn\" type=\"submit\" value=\"Comment\">\n		</fieldset>\n		{!-- required to prevent EE from outputting text --}\n		{if comments_disabled}{/if}\n		{if comments_expired}{/if}\n	{/exp:comment:form}\n</div>\n', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(8, 1, 3, 'index', 'webpage', '{!-- nothing to see here, so we redirect the users if they land on http://example.com/common/ --}\n{redirect=\'/\'}', NULL, 1566334476, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(9, 1, 3, '_breadcrumb', 'webpage', '		<section class=\"row pad breadcrumb\">\n			<section class=\"w-16\">\n				<ul>\n					{!-- always show the homepage --}\n					<li><a href=\"{homepage}\">{site_name}</a></li>\n					{!-- check for channel, category --}\n					{if embed:entry_ch}\n						<li><a href=\"{path=\'{embed:p_url}\'}\">{embed:p_title}</a></li>\n						{exp:channel:entries channel=\'{embed:entry_ch}\' limit=\'1\'}\n							<li>{title}</li>\n						{/exp:channel:entries}\n					{if:elseif embed:cat_ch}\n						<li><a href=\"{path=\'{embed:p_url}\'}\">{embed:p_title}</a></li>\n						<li>{exp:channel:category_heading channel=\'{embed:cat_ch}\'}{category_name}{/exp:channel:category_heading}</li>\n					{if:else}\n						{!-- check for search results --}\n						{if embed:search}\n							<li><a href=\"{path=\'{embed:p_url}\'}\">{embed:p_title}</a></li>\n							{if embed:search == \'y\'}\n								<li>{exp:search:total_results} search result{if \'{exp:search:total_results}\' != 1}s{/if} for <mark>{exp:search:keywords}</mark></li>\n							{if:else}\n								<li>0 search results for <mark>{exp:search:keywords}</mark></li>\n							{/if}\n						{if:else}\n							<li>{embed:p_title}</li>\n						{/if}\n					{/if}\n				</ul>\n			</section>\n		</section>', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(10, 1, 3, '_footer', 'webpage', '		<footer class=\"row\">\n			<section class=\"w-8\">\n				<p>&copy;{current_time format=\'%Y\'}, all rights reserved. Built with <a href=\"https://ellislab.com/\" rel=\"external\">ExpressionEngine&reg;</a></p>\n			</section>\n			<section class=\"w-8\">\n				{!-- appears in both header and footer, so a snippet is used to keep it DRY --}\n				{snp_main_nav}\n			</section>\n		</footer>\n		<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\" ></script>\n		<script src=\"{theme_user_folder_url}site/default/asset/js/plugins/validate.min.js\" ></script>\n		<script src=\"{theme_user_folder_url}site/default/asset/js/plugins/cycle2.min.js\" ></script>\n		<script src=\"{theme_user_folder_url}site/default/asset/js/common.min.js\" ></script>\n	</body>\n</html>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(11, 1, 3, '_header', 'webpage', '<!doctype html>\n<html>\n	<head>\n		<title>{layout:title}{site_name}</title>\n		<meta http-equiv=\"content-type\" content=\"text/html\" charset=\"utf-8\" dir=\"ltr\" lang=\"en-us\">\n		<meta name=\"viewport\" content=\"initial-scale=1\">\n		<!-- meta data -->\n		<meta name=\"author\" content=\"\">\n		<meta name=\"description\" content=\"{if layout:desc}{layout:desc}{if:else}{/if}\">\n		<!-- open graph common -->\n		<meta property=\"og:site_name\" content=\"{site_name}\">\n		<meta property=\"og:type\" content=\"website\">\n		<meta property=\"og:image\" content=\"{theme_user_folder_url}site/default/asset/img/og/default.jpg\"> {!-- square, 50*50 min --}\n		<!-- open graph per page -->\n\n		{if layout:og_title != \'\'}\n			<!-- open graph per page -->\n			<meta property=\"og:title\" content=\"{layout:og_title}\">\n			<meta property=\"og:url\" content=\"{layout:og_url}\">\n			<meta property=\"og:description\" content=\"{layout:og_description}\">\n		{/if}\n\n		<link href=\"/robots.txt\" title=\"robots\" type=\"text/plain\" rel=\"help\">\n		<link href=\"{theme_user_folder_url}site/default/asset/style/common.min.css\" title=\"common-styles\" rel=\"stylesheet\">\n		<link href=\"{theme_user_folder_url}site/default/asset/style/debug.min.css\" title=\"common-styles\" rel=\"stylesheet\">\n	</head>\n	<body>\n		<header class=\"full\">\n			<section class=\"row\">\n				<section class=\"w-8\">\n					<h1><a href=\"{homepage}\"><b>{site_name}</b> Website</a></h1>\n				</section>\n				<section class=\"w-8\">\n					{!-- appears in both header and footer, so a snippet is used to keep it DRY --}\n					{snp_main_nav}\n				</section>\n			</section>\n		</header>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(12, 1, 3, '_layout', 'webpage', '{!-- template vars --}\n{!-- used double quotes in this one file, as og_url required it :( --}\n{preload_replace:t_inc=\"common/\"}\n\n{!-- embed the header --}\n{embed=\"{t_inc}_header\"\n	title=\"{layout:title}\"\n	desc=\"{layout:desc}\"\n	{if layout:ogtitle}\n		ogtitle=\"{layout:ogtitle}\"\n		og_url=\"{layout:og_url}\"\n		og_description=\"{layout:og_description}\"\n	{/if}\n}\n\n{!-- cALL the content --}\n{layout:contents}\n\n{!-- embed the footer --}\n{embed=\"{t_inc}_footer\"}', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(13, 1, 4, 'index', 'webpage', '{layout=\'layouts/_contact-layout\'}\n\n{!--\n	404 Redirect\n	============\n	This is a single entry channel page, it only needs a second segment when the form has been successfully submitted. So we use the following code to make sure the page sends a 404 if someone types in an incorrect URL in the browser address bar. i.e. http://example.com/page/nothing\n--}\n{if segment_2 AND segment_2 != \'thanks\'}\n	{redirect=\'404\'}\n{/if}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_title=\'contact {site_name}\'}\n{preload_replace:p_description=\'contact {site_name}\'}\n{preload_replace:p_url=\'contact\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'contact\'}\n{preload_replace:ch_disable=\'categories|category_fields|member_data|pagination\'}\n{!-- layout vars, channel/page related --}\n{layout:set name=\'ch\' value=\'{ch}\'}\n{layout:set name=\'p_url\' value=\'{p_url}\'}\n{layout:set name=\'p_title\' value=\'{p_title}\'}\n{layout:set name=\'ch_disable\' value=\'{ch_disable}\'}\n\n		{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'1\'}\n			{!-- layout vars, dynamic, not output --}\n			{layout:set name=\'title\' value=\'{seo_title}{gv_sep}\'}\n			{layout:set name=\'description\' value=\'{seo_desc}\'}\n			{!-- OpenGraph meta output --}\n			{layout:set name=\'og_title\' value=\'{seo_title}\'}\n			{layout:set name=\'og_url\'}{path=\'{p_url}\'}{/layout:set}\n			{layout:set name=\'og_description\' value=\'{seo_desc}\'}\n			{!-- /layout vars, dynamic, not output --}\n\n			{!-- content output --}\n			<h1>{title} <span class=\"required\">Required Fields &#10033;</span></h1>\n			{!-- page_content is a textarea with HTML output we don\'t need to wrap this tag with HTML as that is already included in it\'s output. --}\n			{page_content}\n			{!-- /content output --}\n\n			{!--\n				no results redirect\n				===================\n				If the page doesn\'t exist, we redirect to 404.\n			--}\n			{if no_results}\n				{redirect=\'404\'}\n			{/if}\n		{/exp:channel:entries}\n\n		<div class=\"alert issue hide\"></div>\n		{!-- only show this thank you message if segment_2 is thanks --}\n		{if segment_2 == \'thanks\'}\n			<div class=\"alert success\">\n				<h3>email sent</h3>\n				<p>Thanks, your email was sent, we\'ll respond in 48 hours or less.</p>\n				<a class=\"close\" href=\"{path=\'{p_url}\'}\">&#10005; Close</a>\n			</div>\n		{/if}\n		{!-- email contact form --}\n\n		{exp:email:contact_form form_class=\'contact-form\' return=\'{site_url}index.php/{p_url}/thanks\' redirect=\'0\'}\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Name</label>\n					<em>What do you want to be called?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input name=\"name\" type=\"text\" value=\"{member_name}\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Email <span class=\"required\" title=\"required field\">&#10033;</span></label>\n					<em>How do we contact you?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input class=\"required\" name=\"from\" type=\"text\" value=\"{member_email}\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Subject</label>\n					<em>What did you want to discuss?</em>\n				</section>\n				<section class=\"w-12 field\">\n					<input name=\"subject\" type=\"text\" value=\"\">\n				</section>\n			</fieldset>\n			<fieldset class=\"row\">\n				<section class=\"w-4 instruct\">\n					<label>Message <span class=\"required\" title=\"required field\">&#10033;</span></label>\n					<em>Please keep it kind, brief and courteous.</em>\n				</section>\n				<section class=\"w-12 field\">\n					<textarea class=\"required\" name=\"message\" cols=\"\" rows=\"\"></textarea>\n				</section>\n			</fieldset>\n			<fieldset class=\"ctrls\">\n				<input class=\"btn\" type=\"submit\" value=\"Send e-mail\">\n			</fieldset>\n		{/exp:email:contact_form}\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(14, 1, 5, '404', 'webpage', '{layout=\'layouts/_html-wrapper\'}\n\n<section class=\"row\">\n	<section class=\"w-4\">\n		<figure>\n			<img src=\"http://i.giphy.com/l3V0tk7V9uygwnWyk.gif\" alt=\"Doing Business!\">\n		</figure>\n	</section>\n	<section class=\"w-12\">\n		<h1>404 &mdash; Page <b>Not</b> Found</h1>\n		<p>Super sorry about that, but the page you are trying to access is nowhere to be found.</p>\n		<p>We searched our whole desk.</p>\n	</section>\n</section>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(15, 1, 5, 'index', 'webpage', '{layout=\'layouts/_html-wrapper\'}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_url=\'blog\'}\n{preload_replace:p_url_entry=\'entry\'}\n{!-- channel vars (prefix ch_) --}\n{preload_replace:ch=\'blog\'}\n{preload_replace:ch_disable=\'category_fields|member_data\'}\n\n{layout:set name=\'scripts\'}{/layout:set}\n\n<section class=\"row content home pad\">\n	<section class=\"w-16\">\n		<figure class=\"cycle-slideshow\"\n			data-cycle-fx=\"scrollHorz\"\n			data-cycle-pause-on-hover=\"true\"\n			data-cycle-speed=\"500\"\n			data-cycle-prev=\".prev-slide\"\n    		data-cycle-next=\".next-slide\"\n		>\n			{!-- slideshow images from a specific directory, and category --}\n			{exp:file:entries directory_id=\'8\' dynamic=\'no\' limit=\'5\' disable=\'pagination\' category=\'not 25\'}\n				<img src=\"{file_url}\" alt=\"{file_name:attr_safe}\"{if count == 1} class=\"act\"{/if}>\n				{if count == 1}\n					<div class=\"slide-ctrls\">\n						<a class=\"prev-slide\" href=\"#\"></a>\n						<a class=\"next-slide\" href=\"#\"></a>\n					</div>\n				{/if}\n			{/exp:file:entries}\n		</figure>\n		<h1>Recent Blog Posts <a class=\"btn all\" href=\"{path=\'{p_url}\'}\">All Posts</a></h1>\n	</section>\n	<section class=\"w-8\">\n		<div class=\"entries\">\n			{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'4\'}\n				{!-- listing as a snippet, as it\'s used through more than one template --}\n				{snp_blog_list}\n				{!-- no results --}\n				{if no_results}\n					<div class=\"alert warn no-results\">\n						<p>{gv_entries_none}</p>\n					</div>\n				{/if}\n			{/exp:channel:entries}\n		</div>\n	</section>\n	<section class=\"w-8\">\n		<div class=\"entries\">\n			{!-- using the offset=\'\' parameter here to start the listing on the 5th item. which allows us to split it into two columns without any wonky math --}\n			{exp:channel:entries channel=\'{ch}\' disable=\'{ch_disable}\' limit=\'4\' offset=\'4\'}\n				{!-- listing as a snippet, as it\'s used through more than one template --}\n				{snp_blog_list}\n				{!-- no results --}\n				{if no_results}\n					<div class=\"alert warn no-results\">\n						<p>{gv_entries_none}</p>\n					</div>\n				{/if}\n			{/exp:channel:entries}\n		</div>\n	</section>\n</section>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(16, 1, 6, '_about-layout', 'webpage', '{layout=\'layouts/_html-wrapper\'}\n\n{!-- embed for breadcrumb, needed to pass arguments (embeds aren\'t evil) --}\n{layout:set name=\'breadcrumbs\'}\n	{embed=\'common/_breadcrumb\'\n		p_url=\'{layout:p_url}\'\n		p_title=\'{layout:p_title}\'\n		{if layout:entry_ch}entry_ch=\'{layout:entry_ch}\'{/if}\n	}\n{/layout:set}\n\n		<section class=\"row reverse pad\">\n			<section class=\"w-12\">\n				{layout:contents}\n			</section>\n			<section class=\"w-4\">\n				<div class=\"sidebar\">\n					<ul class=\"list\">\n						{!--\n							sub navigation\n							==============\n							This is a dynamic way to create sub navigation for this section. I use the parameter dynamic=\'no\' to prevent the URL from changing the output of a channel entries tag. I also use a status of \'Default Page\' to determine the, well default page.\n							NOTE: A channel should only have one Default Page.\n						--}\n						{exp:channel:entries channel=\'{layout:ch}\' disable=\'{layout:ch_disable}\' dynamic=\'no\' orderby=\'status\' sort=\'asc\' status=\'{layout:ch_status}\'}\n							{!-- we need to treat the default page link a little differently so we check for the \'Default Page\' status and output it, then all other page links output below that. We use the orderby=\'status\' and sort=\'asc\' parameters to accomplish this. --}\n							{if status == \'Default Page\'}\n								<li><a{if segment_1 == \'{layout:p_url}\' AND segment_2 == \'\'} class=\"act\"{/if} href=\"{path=\'{layout:p_url}\'}\">{title}</a></li>\n							{if:else}\n								<li><a{if segment_2 == \'{url_title}\'} class=\"act\"{/if} href=\"{path=\'{layout:p_url}/{url_title}\'}\">{title}</a></li>\n							{/if}\n						{/exp:channel:entries}\n					</ul>\n				</div>\n			</section>\n		</section>', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(17, 1, 6, '_blog-layout', 'webpage', '{layout=\'layouts/_html-wrapper\'}\n\n{!-- page vars (prefix p_) --}\n{preload_replace:p_url_cat=\'category\'}\n\n{!-- embed for breadcrumb, needed to pass arguments (embeds aren\'t evil) --}\n{layout:set name=\'breadcrumbs\'}\n	{embed=\'common/_breadcrumb\'\n		p_url=\'{layout:p_url}\'\n		p_title=\'{layout:p_title}\'\n		{if layout:entry_ch}entry_ch=\'{layout:entry_ch}\'{/if}\n		{if layout:search}search=\'{layout:search}\'{/if}\n		{if layout:cat_ch}cat_ch=\'{layout:cat_ch}\'{/if}\n	}\n{/layout:set}\n\n{layout:set name=\'scripts\'}\n	<script src=\"{theme_user_folder_url}site/default/asset/js/plugins/validate.min.js\"></script>\n	{layout:scripts}\n{/layout:set}\n\n		<section class=\"row pad\">\n			<section class=\"w-12\">\n				{layout:contents}\n			</section>\n			<section class=\"w-4\">\n				<div class=\"sidebar\">\n					{exp:search:simple_form\n						form_class=\'search\'\n						channel=\'{layout:ch}\'\n						search_in=\'everywhere\'\n						where=\'all\'\n						result_page=\'{layout:p_url}/search\'\n						no_result_page=\'{layout:p_url}/no-results\'\n						results=\'5\'\n					}\n						<input type=\"text\" name=\"keywords\" id=\"keywords\" value=\"\" placeholder=\"Type keywords, hit enter\">\n					{/exp:search:simple_form}\n					<h2>Categories</h2>\n					<ul class=\"list yes\">\n						{exp:channel:categories channel=\'{layout:ch}\' style=\'linear\'}\n							<li><a href=\"{path=\'{layout:p_url}/{p_url_cat}/{category_url_title}\'}\">{category_name}</a></li>\n						{/exp:channel:categories}\n					</ul>\n					<h2>RSS Feed</h2>\n					<ul class=\"list rss\">\n						<li><a href=\"{path=\'{layout:p_url}/rss\'}\">Subscribe to {layout:p_title}</a></li>\n					</ul>\n				</div>\n\n			</section>\n		</section>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(18, 1, 6, '_contact-layout', 'webpage', '{layout=\'layouts/_html-wrapper\'}\n\n{!-- embed for breadcrumb, needed to pass arguments (embeds aren\'t evil) --}\n{layout:set name=\'breadcrumbs\'}\n	{embed=\'common/_breadcrumb\'\n		p_url=\'{layout:p_url}\'\n		p_title=\'{layout:p_title}\'\n	}\n{/layout:set}\n\n{layout:set name=\'scripts\'}\n	<script src=\"{theme_user_folder_url}site/default/asset/js/plugins/validate.min.js\"></script>\n	{layout:scripts}\n{/layout:set}\n\n		<section class=\"row reverse pad\">\n			<section class=\"w-12\">\n				{layout:contents}\n			</section>\n			<section class=\"w-4\">\n				{!-- output contact info --}\n				{exp:channel:entries channel=\'{layout:ch}\' disable=\'{layout:ch_disable}\' limit=\'1\' dynamic=\'no\'}\n					<address class=\"v-card\">\n						<strong class=\"org\">{site_name}</strong>\n						{if contact_address}\n							{contact_address}\n								<span class=\"address\">\n									<span class=\"street\">{contact_address:street}</span>, <span class=\"street-2\">{contact_address:street_2}</span><br>\n									<span class=\"city\">{contact_address:city}</span>, <span class=\"state\">{contact_address:state}</span> <span class=\"zip\">{contact_address:zip}</span>\n								</span>\n							{/contact_address}\n						{/if}\n						{if contact_phone OR contact_email}\n							<span class=\"alternate\">\n								{if contact_phone}<span class=\"phone\">{contact_phone}</span>{/if}\n								{if contact_phone AND contact_email}<br>{/if}\n								{if contact_email}<span class=\"e-mail\">{contact_email}</span>{/if}\n							</span>\n						{/if}\n					</address>\n				{/exp:channel:entries}\n			</section>\n		</section>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(19, 1, 6, '_html-wrapper', 'webpage', '<!doctype html>\n<html dir=\"ltr\" lang=\"{lang}\">\n	<head>\n		<meta charset=\"utf-8\">\n		<title>{layout:title}{site_name}</title>\n		<meta name=\"viewport\" content=\"initial-scale=1\">\n\n		<!-- meta data -->\n		{if layout:meta_author}<meta name=\"author\" content=\"{layout:meta_author}\">{/if}\n		{if layout:meta_description}<meta name=\"description\" content=\"{layout:meta_description}\">{/if}\n\n		<!-- open graph common -->\n		<meta property=\"og:site_name\" content=\"{site_name}\">\n		<meta property=\"og:type\" content=\"website\">\n		<meta property=\"og:image\" content=\"{theme_user_folder_url}site/default/asset/img/og/default.jpg\"> {!-- square, 50*50 min --}\n\n		{if layout:og_title != \'\'}\n			<!-- open graph per page -->\n			<meta property=\"og:title\" content=\"{layout:og_title}\">\n			<meta property=\"og:url\" content=\"{layout:og_url}\">\n			<meta property=\"og:description\" content=\"{layout:og_description}\">\n		{/if}\n\n		<link href=\"{theme_user_folder_url}site/default/asset/style/default.min.css\" title=\"common-styles\" rel=\"stylesheet\">\n		<!-- <link href=\"{theme_user_folder_url}site/default/asset/style/debug.min.css\" title=\"common-styles\" rel=\"stylesheet\"> -->\n	</head>\n	<body>\n		<header class=\"full\">\n			<section class=\"row pad\">\n				<section class=\"w-8\">\n					<h1><a href=\"{homepage}\"><b>{site_name}</b> Website</a></h1>\n				</section>\n				<section class=\"w-8\">\n					{!-- creates a small menu link on smaller devices --}\n					<a class=\"small-menu\" href=\"#\"></a>\n					{!-- appears in both header and footer, so a snippet is used to keep it DRY --}\n					{snp_main_nav}\n				</section>\n			</section>\n		</header>\n\n		{layout:breadcrumbs}\n\n		<div class=\"content\">\n			{layout:contents}\n		</div>\n\n		<footer class=\"full\">\n			<section class=\"footer-content\">\n				{!-- appears in both header and footer, so a snippet is used to keep it DRY --}\n				{snp_main_nav}\n				<p>&copy;{current_time format=\'%Y\'}, all rights reserved. Built with <a href=\"https://ellislab.com/\" rel=\"external\">ExpressionEngine&reg;</a></p>\n			</section>\n		</footer>\n		</section>\n		<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js\" ></script>\n		<script src=\"{theme_user_folder_url}site/default/asset/js/default.min.js\" ></script>\n		<script src=\"{theme_user_folder_url}site/default/asset/js/plugins/cycle2.min.js\"></script>\n		{layout:scripts}\n	</body>\n</html>\n', NULL, 1566334477, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_template_groups`
--

CREATE TABLE `dlp_template_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int(3) UNSIGNED NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_template_groups`
--

INSERT INTO `dlp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'about', 1, 'n'),
(2, 1, 'blog', 2, 'n'),
(3, 1, 'common', 3, 'n'),
(4, 1, 'contact', 4, 'n'),
(5, 1, 'home', 5, 'y'),
(6, 1, 'layouts', 6, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_template_member_groups`
--

CREATE TABLE `dlp_template_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `template_group_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_template_no_access`
--

CREATE TABLE `dlp_template_no_access` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_template_routes`
--

CREATE TABLE `dlp_template_routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_throttle`
--

CREATE TABLE `dlp_throttle` (
  `throttle_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_update_log`
--

CREATE TABLE `dlp_update_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_update_log`
--

INSERT INTO `dlp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1566334438, 'Smartforge::add_key failed. Table \'dlp_comments\' does not exist.', 'Smartforge::add_key', 106, 'E:\\xampp\\htdocs\\eeblog\\system\\ee\\EllisLab\\Addons\\comment\\upd.comment.php');

-- --------------------------------------------------------

--
-- Table structure for table `dlp_upload_no_access`
--

CREATE TABLE `dlp_upload_no_access` (
  `upload_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dlp_upload_prefs`
--

CREATE TABLE `dlp_upload_prefs` (
  `id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dlp_upload_prefs`
--

INSERT INTO `dlp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', 'E:\\xampp\\htdocs\\eeblog\\images\\avatars\\', '{base_url}images/avatars/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Default Avatars', 'E:\\xampp\\htdocs\\eeblog\\images\\avatars\\/default/', '{base_url}images/avatars/default/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'Member Photos', '\\', '{base_url}images/member_photos/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 1, 'Signature Attachments', 'E:\\xampp\\htdocs\\eeblog\\images\\signature_attachments\\', '{base_url}images/signature_attachments/', 'img', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 1, 'PM Attachments', 'E:\\xampp\\htdocs\\eeblog\\images\\pm_attachments\\', '{base_url}images/pm_attachments/', 'img', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1, 'Blog', '{base_path}themes/user/site/default/asset/img/blog/', '{base_url}themes/user/site/default/asset/img/blog/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 1, 'Common', '{base_path}themes/user/site/default/asset/img/common/', '{base_url}themes/user/site/default/asset/img/common/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 1, 'Home', '{base_path}themes/user/site/default/asset/img/home/', '{base_url}themes/user/site/default/asset/img/home/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dlp_actions`
--
ALTER TABLE `dlp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `dlp_captcha`
--
ALTER TABLE `dlp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `dlp_categories`
--
ALTER TABLE `dlp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_category_fields`
--
ALTER TABLE `dlp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `dlp_category_field_data`
--
ALTER TABLE `dlp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `dlp_category_groups`
--
ALTER TABLE `dlp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_category_posts`
--
ALTER TABLE `dlp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Indexes for table `dlp_channels`
--
ALTER TABLE `dlp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`(191)),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_channels_channel_fields`
--
ALTER TABLE `dlp_channels_channel_fields`
  ADD PRIMARY KEY (`channel_id`,`field_id`);

--
-- Indexes for table `dlp_channels_channel_field_groups`
--
ALTER TABLE `dlp_channels_channel_field_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`);

--
-- Indexes for table `dlp_channels_statuses`
--
ALTER TABLE `dlp_channels_statuses`
  ADD PRIMARY KEY (`channel_id`,`status_id`);

--
-- Indexes for table `dlp_channel_data`
--
ALTER TABLE `dlp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_channel_data_field_1`
--
ALTER TABLE `dlp_channel_data_field_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_2`
--
ALTER TABLE `dlp_channel_data_field_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_3`
--
ALTER TABLE `dlp_channel_data_field_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_4`
--
ALTER TABLE `dlp_channel_data_field_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_5`
--
ALTER TABLE `dlp_channel_data_field_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_6`
--
ALTER TABLE `dlp_channel_data_field_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_7`
--
ALTER TABLE `dlp_channel_data_field_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_8`
--
ALTER TABLE `dlp_channel_data_field_8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_9`
--
ALTER TABLE `dlp_channel_data_field_9`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_10`
--
ALTER TABLE `dlp_channel_data_field_10`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_data_field_11`
--
ALTER TABLE `dlp_channel_data_field_11`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_entries_autosave`
--
ALTER TABLE `dlp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_channel_fields`
--
ALTER TABLE `dlp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_channel_field_groups_fields`
--
ALTER TABLE `dlp_channel_field_groups_fields`
  ADD PRIMARY KEY (`field_id`,`group_id`);

--
-- Indexes for table `dlp_channel_form_settings`
--
ALTER TABLE `dlp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `dlp_channel_grid_field_1`
--
ALTER TABLE `dlp_channel_grid_field_1`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_grid_field_2`
--
ALTER TABLE `dlp_channel_grid_field_2`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_grid_field_4`
--
ALTER TABLE `dlp_channel_grid_field_4`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_grid_field_5`
--
ALTER TABLE `dlp_channel_grid_field_5`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_grid_field_7`
--
ALTER TABLE `dlp_channel_grid_field_7`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_channel_member_groups`
--
ALTER TABLE `dlp_channel_member_groups`
  ADD PRIMARY KEY (`group_id`,`channel_id`);

--
-- Indexes for table `dlp_channel_titles`
--
ALTER TABLE `dlp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`);

--
-- Indexes for table `dlp_comments`
--
ALTER TABLE `dlp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `status` (`status`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_comment_subscriptions`
--
ALTER TABLE `dlp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `dlp_consents`
--
ALTER TABLE `dlp_consents`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `dlp_consent_audit_log`
--
ALTER TABLE `dlp_consent_audit_log`
  ADD PRIMARY KEY (`consent_audit_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexes for table `dlp_consent_requests`
--
ALTER TABLE `dlp_consent_requests`
  ADD PRIMARY KEY (`consent_request_id`);

--
-- Indexes for table `dlp_consent_request_versions`
--
ALTER TABLE `dlp_consent_request_versions`
  ADD PRIMARY KEY (`consent_request_version_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexes for table `dlp_content_types`
--
ALTER TABLE `dlp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `dlp_cp_log`
--
ALTER TABLE `dlp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_developer_log`
--
ALTER TABLE `dlp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `dlp_email_cache`
--
ALTER TABLE `dlp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `dlp_email_cache_mg`
--
ALTER TABLE `dlp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`group_id`);

--
-- Indexes for table `dlp_email_cache_ml`
--
ALTER TABLE `dlp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Indexes for table `dlp_email_console_cache`
--
ALTER TABLE `dlp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `dlp_email_tracker`
--
ALTER TABLE `dlp_email_tracker`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `dlp_entry_versioning`
--
ALTER TABLE `dlp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `dlp_extensions`
--
ALTER TABLE `dlp_extensions`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `dlp_fieldtypes`
--
ALTER TABLE `dlp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Indexes for table `dlp_field_groups`
--
ALTER TABLE `dlp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_files`
--
ALTER TABLE `dlp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_file_categories`
--
ALTER TABLE `dlp_file_categories`
  ADD PRIMARY KEY (`file_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `dlp_file_dimensions`
--
ALTER TABLE `dlp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Indexes for table `dlp_file_watermarks`
--
ALTER TABLE `dlp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Indexes for table `dlp_fluid_field_data`
--
ALTER TABLE `dlp_fluid_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`);

--
-- Indexes for table `dlp_global_variables`
--
ALTER TABLE `dlp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_grid_columns`
--
ALTER TABLE `dlp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `dlp_html_buttons`
--
ALTER TABLE `dlp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_layout_publish`
--
ALTER TABLE `dlp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `dlp_layout_publish_member_groups`
--
ALTER TABLE `dlp_layout_publish_member_groups`
  ADD PRIMARY KEY (`layout_id`,`group_id`);

--
-- Indexes for table `dlp_members`
--
ALTER TABLE `dlp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `dlp_member_bulletin_board`
--
ALTER TABLE `dlp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `dlp_member_data`
--
ALTER TABLE `dlp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `dlp_member_fields`
--
ALTER TABLE `dlp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Indexes for table `dlp_member_groups`
--
ALTER TABLE `dlp_member_groups`
  ADD PRIMARY KEY (`group_id`,`site_id`);

--
-- Indexes for table `dlp_member_news_views`
--
ALTER TABLE `dlp_member_news_views`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `dlp_member_search`
--
ALTER TABLE `dlp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_menu_items`
--
ALTER TABLE `dlp_menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `dlp_menu_sets`
--
ALTER TABLE `dlp_menu_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `dlp_message_attachments`
--
ALTER TABLE `dlp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `dlp_message_copies`
--
ALTER TABLE `dlp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `dlp_message_data`
--
ALTER TABLE `dlp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `dlp_message_folders`
--
ALTER TABLE `dlp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `dlp_message_listed`
--
ALTER TABLE `dlp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Indexes for table `dlp_modules`
--
ALTER TABLE `dlp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `dlp_module_member_groups`
--
ALTER TABLE `dlp_module_member_groups`
  ADD PRIMARY KEY (`group_id`,`module_id`);

--
-- Indexes for table `dlp_online_users`
--
ALTER TABLE `dlp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_password_lockout`
--
ALTER TABLE `dlp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Indexes for table `dlp_plugins`
--
ALTER TABLE `dlp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `dlp_relationships`
--
ALTER TABLE `dlp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexes for table `dlp_remember_me`
--
ALTER TABLE `dlp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `dlp_reset_password`
--
ALTER TABLE `dlp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `dlp_revision_tracker`
--
ALTER TABLE `dlp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `dlp_rte_tools`
--
ALTER TABLE `dlp_rte_tools`
  ADD PRIMARY KEY (`tool_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `dlp_rte_toolsets`
--
ALTER TABLE `dlp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `dlp_search`
--
ALTER TABLE `dlp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_search_log`
--
ALTER TABLE `dlp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_security_hashes`
--
ALTER TABLE `dlp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `dlp_sessions`
--
ALTER TABLE `dlp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `dlp_sites`
--
ALTER TABLE `dlp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Indexes for table `dlp_snippets`
--
ALTER TABLE `dlp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_specialty_templates`
--
ALTER TABLE `dlp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_stats`
--
ALTER TABLE `dlp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_statuses`
--
ALTER TABLE `dlp_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `dlp_status_no_access`
--
ALTER TABLE `dlp_status_no_access`
  ADD PRIMARY KEY (`status_id`,`member_group`);

--
-- Indexes for table `dlp_templates`
--
ALTER TABLE `dlp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `dlp_template_groups`
--
ALTER TABLE `dlp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Indexes for table `dlp_template_member_groups`
--
ALTER TABLE `dlp_template_member_groups`
  ADD PRIMARY KEY (`group_id`,`template_group_id`);

--
-- Indexes for table `dlp_template_no_access`
--
ALTER TABLE `dlp_template_no_access`
  ADD PRIMARY KEY (`template_id`,`member_group`);

--
-- Indexes for table `dlp_template_routes`
--
ALTER TABLE `dlp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `dlp_throttle`
--
ALTER TABLE `dlp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Indexes for table `dlp_update_log`
--
ALTER TABLE `dlp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `dlp_upload_no_access`
--
ALTER TABLE `dlp_upload_no_access`
  ADD PRIMARY KEY (`upload_id`,`member_group`);

--
-- Indexes for table `dlp_upload_prefs`
--
ALTER TABLE `dlp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dlp_actions`
--
ALTER TABLE `dlp_actions`
  MODIFY `action_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `dlp_captcha`
--
ALTER TABLE `dlp_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_categories`
--
ALTER TABLE `dlp_categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dlp_category_fields`
--
ALTER TABLE `dlp_category_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_category_groups`
--
ALTER TABLE `dlp_category_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dlp_channels`
--
ALTER TABLE `dlp_channels`
  MODIFY `channel_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_1`
--
ALTER TABLE `dlp_channel_data_field_1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_2`
--
ALTER TABLE `dlp_channel_data_field_2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_3`
--
ALTER TABLE `dlp_channel_data_field_3`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_4`
--
ALTER TABLE `dlp_channel_data_field_4`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_5`
--
ALTER TABLE `dlp_channel_data_field_5`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_6`
--
ALTER TABLE `dlp_channel_data_field_6`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_7`
--
ALTER TABLE `dlp_channel_data_field_7`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_8`
--
ALTER TABLE `dlp_channel_data_field_8`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_9`
--
ALTER TABLE `dlp_channel_data_field_9`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_10`
--
ALTER TABLE `dlp_channel_data_field_10`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `dlp_channel_data_field_11`
--
ALTER TABLE `dlp_channel_data_field_11`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `dlp_channel_entries_autosave`
--
ALTER TABLE `dlp_channel_entries_autosave`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_channel_fields`
--
ALTER TABLE `dlp_channel_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `dlp_channel_form_settings`
--
ALTER TABLE `dlp_channel_form_settings`
  MODIFY `channel_form_settings_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_channel_grid_field_1`
--
ALTER TABLE `dlp_channel_grid_field_1`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_channel_grid_field_2`
--
ALTER TABLE `dlp_channel_grid_field_2`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dlp_channel_grid_field_4`
--
ALTER TABLE `dlp_channel_grid_field_4`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_channel_grid_field_5`
--
ALTER TABLE `dlp_channel_grid_field_5`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dlp_channel_grid_field_7`
--
ALTER TABLE `dlp_channel_grid_field_7`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_channel_titles`
--
ALTER TABLE `dlp_channel_titles`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `dlp_comments`
--
ALTER TABLE `dlp_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dlp_comment_subscriptions`
--
ALTER TABLE `dlp_comment_subscriptions`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_consents`
--
ALTER TABLE `dlp_consents`
  MODIFY `consent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_consent_audit_log`
--
ALTER TABLE `dlp_consent_audit_log`
  MODIFY `consent_audit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_consent_requests`
--
ALTER TABLE `dlp_consent_requests`
  MODIFY `consent_request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_consent_request_versions`
--
ALTER TABLE `dlp_consent_request_versions`
  MODIFY `consent_request_version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_content_types`
--
ALTER TABLE `dlp_content_types`
  MODIFY `content_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dlp_cp_log`
--
ALTER TABLE `dlp_cp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_developer_log`
--
ALTER TABLE `dlp_developer_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_email_cache`
--
ALTER TABLE `dlp_email_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_email_console_cache`
--
ALTER TABLE `dlp_email_console_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_email_tracker`
--
ALTER TABLE `dlp_email_tracker`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_entry_versioning`
--
ALTER TABLE `dlp_entry_versioning`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_extensions`
--
ALTER TABLE `dlp_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_fieldtypes`
--
ALTER TABLE `dlp_fieldtypes`
  MODIFY `fieldtype_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `dlp_field_groups`
--
ALTER TABLE `dlp_field_groups`
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dlp_files`
--
ALTER TABLE `dlp_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dlp_file_dimensions`
--
ALTER TABLE `dlp_file_dimensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_file_watermarks`
--
ALTER TABLE `dlp_file_watermarks`
  MODIFY `wm_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_fluid_field_data`
--
ALTER TABLE `dlp_fluid_field_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_global_variables`
--
ALTER TABLE `dlp_global_variables`
  MODIFY `variable_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dlp_grid_columns`
--
ALTER TABLE `dlp_grid_columns`
  MODIFY `col_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `dlp_html_buttons`
--
ALTER TABLE `dlp_html_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dlp_layout_publish`
--
ALTER TABLE `dlp_layout_publish`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_members`
--
ALTER TABLE `dlp_members`
  MODIFY `member_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_member_bulletin_board`
--
ALTER TABLE `dlp_member_bulletin_board`
  MODIFY `bulletin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_member_fields`
--
ALTER TABLE `dlp_member_fields`
  MODIFY `m_field_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_member_news_views`
--
ALTER TABLE `dlp_member_news_views`
  MODIFY `news_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_menu_items`
--
ALTER TABLE `dlp_menu_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_menu_sets`
--
ALTER TABLE `dlp_menu_sets`
  MODIFY `set_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_message_attachments`
--
ALTER TABLE `dlp_message_attachments`
  MODIFY `attachment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_message_copies`
--
ALTER TABLE `dlp_message_copies`
  MODIFY `copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_message_data`
--
ALTER TABLE `dlp_message_data`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_message_listed`
--
ALTER TABLE `dlp_message_listed`
  MODIFY `listed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_modules`
--
ALTER TABLE `dlp_modules`
  MODIFY `module_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `dlp_online_users`
--
ALTER TABLE `dlp_online_users`
  MODIFY `online_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_password_lockout`
--
ALTER TABLE `dlp_password_lockout`
  MODIFY `lockout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_plugins`
--
ALTER TABLE `dlp_plugins`
  MODIFY `plugin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_relationships`
--
ALTER TABLE `dlp_relationships`
  MODIFY `relationship_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_reset_password`
--
ALTER TABLE `dlp_reset_password`
  MODIFY `reset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_revision_tracker`
--
ALTER TABLE `dlp_revision_tracker`
  MODIFY `tracker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_rte_tools`
--
ALTER TABLE `dlp_rte_tools`
  MODIFY `tool_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dlp_rte_toolsets`
--
ALTER TABLE `dlp_rte_toolsets`
  MODIFY `toolset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_search_log`
--
ALTER TABLE `dlp_search_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_security_hashes`
--
ALTER TABLE `dlp_security_hashes`
  MODIFY `hash_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_sites`
--
ALTER TABLE `dlp_sites`
  MODIFY `site_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_snippets`
--
ALTER TABLE `dlp_snippets`
  MODIFY `snippet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_specialty_templates`
--
ALTER TABLE `dlp_specialty_templates`
  MODIFY `template_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dlp_stats`
--
ALTER TABLE `dlp_stats`
  MODIFY `stat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_statuses`
--
ALTER TABLE `dlp_statuses`
  MODIFY `status_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dlp_templates`
--
ALTER TABLE `dlp_templates`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `dlp_template_groups`
--
ALTER TABLE `dlp_template_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dlp_template_routes`
--
ALTER TABLE `dlp_template_routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_throttle`
--
ALTER TABLE `dlp_throttle`
  MODIFY `throttle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dlp_update_log`
--
ALTER TABLE `dlp_update_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dlp_upload_prefs`
--
ALTER TABLE `dlp_upload_prefs`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
