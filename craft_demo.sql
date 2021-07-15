-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2021 at 12:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_announcements`
--

CREATE TABLE `craft_announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assets`
--

CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assets`
--

INSERT INTO `craft_assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(15, 1, 1, 1, 'natural1.jpg', 'image', 294, 171, 10157, NULL, NULL, NULL, '2021-07-15 06:52:01', '2021-07-15 06:52:01', '2021-07-15 06:52:01', '78119c97-b6d6-49bf-8f9c-afee1b76e7e8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assettransformindex`
--

INSERT INTO `craft_assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 15, 'natural1.jpg', NULL, '_medium', 1, 1, 0, 0, '2021-07-15 06:57:42', '2021-07-15 06:57:42', '2021-07-15 06:57:45', 'cbe0df06-f051-45c8-bd12-3c4e396209b5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_assettransforms`
--

INSERT INTO `craft_assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `width`, `height`, `format`, `quality`, `interlace`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Medium', 'medium', 'fit', 'center-center', 700, 500, NULL, NULL, 'none', '2021-07-15 06:56:43', '2021-07-15 06:56:43', '2021-07-15 06:56:43', 'a2ec80f0-7f7f-4ba1-883b-e5df70885e50');

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_sites`
--

CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_changedattributes`
--

CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_changedattributes`
--

INSERT INTO `craft_changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(41, 1, 'slug', '2021-07-15 09:36:47', 0, 1),
(41, 1, 'title', '2021-07-15 09:36:47', 0, 1),
(41, 1, 'uri', '2021-07-15 09:36:47', 0, 1),
(43, 1, 'slug', '2021-07-15 09:38:14', 0, 1),
(43, 1, 'title', '2021-07-15 09:38:14', 0, 1),
(43, 1, 'uri', '2021-07-15 09:38:14', 0, 1),
(45, 1, 'slug', '2021-07-15 09:39:12', 0, 1),
(45, 1, 'title', '2021-07-15 09:39:12', 0, 1),
(45, 1, 'uri', '2021-07-15 09:39:12', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craft_changedfields`
--

CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_changedfields`
--

INSERT INTO `craft_changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(2, 1, 1, '2021-07-15 06:15:34', 0, 1),
(2, 1, 2, '2021-07-15 06:52:16', 0, 1),
(20, 1, 1, '2021-07-15 08:56:13', 0, 1),
(25, 1, 1, '2021-07-15 08:57:57', 0, 1),
(38, 1, 4, '2021-07-15 09:51:45', 0, 1),
(38, 1, 5, '2021-07-15 09:51:45', 0, 1),
(39, 1, 4, '2021-07-15 09:51:45', 0, 1),
(39, 1, 5, '2021-07-15 09:51:45', 0, 1),
(41, 1, 1, '2021-07-15 09:37:37', 0, 1),
(43, 1, 1, '2021-07-15 09:38:30', 0, 1),
(45, 1, 1, '2021-07-15 09:39:26', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_richText_iitdguki` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_richText_iitdguki`) VALUES
(1, 1, 1, NULL, '2021-07-15 05:06:14', '2021-07-15 05:06:14', 'c03a3b1a-7e1f-4854-b7f6-2e4f7ff6c83b', NULL),
(2, 2, 1, 'Home', '2021-07-15 05:27:51', '2021-07-15 07:01:37', '67f7f38b-6e8f-4079-85b7-a886870a7d8e', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(3, 3, 1, 'Home', '2021-07-15 05:27:52', '2021-07-15 05:27:52', 'ba1ba7a7-2052-4ab6-9bfd-e2b734c23a92', NULL),
(4, 4, 1, 'Home', '2021-07-15 05:27:57', '2021-07-15 05:27:57', '285d39b8-8aa7-407c-a72f-7e113cd35539', NULL),
(5, 5, 1, 'Home', '2021-07-15 05:28:45', '2021-07-15 05:28:45', '909987cc-d381-4248-b2c4-e614bc25990e', NULL),
(6, 6, 1, 'Home', '2021-07-15 05:28:46', '2021-07-15 05:28:46', 'a3e32b3a-cf2a-4b4e-a4cd-4f2312bee441', NULL),
(7, 7, 1, 'Home', '2021-07-15 05:28:48', '2021-07-15 05:28:48', '1098f6bb-32c0-405d-9c54-f6fb22c56a29', NULL),
(8, 8, 1, 'Home', '2021-07-15 05:28:49', '2021-07-15 05:28:49', '57428670-f06a-421c-b004-65e46281d291', NULL),
(9, 9, 1, 'Home', '2021-07-15 06:09:24', '2021-07-15 06:09:24', '8fa1176b-fab8-4bcb-a4bd-55dd9fa915e9', NULL),
(10, 10, 1, 'Home', '2021-07-15 06:10:59', '2021-07-15 06:10:59', 'b2b5dfac-9559-4683-af42-eaab03ad5e47', NULL),
(11, 11, 1, 'Home', '2021-07-15 06:11:37', '2021-07-15 06:11:37', '130609ac-cf4f-4f92-8cad-9a44b267e255', NULL),
(13, 13, 1, 'Home', '2021-07-15 06:15:36', '2021-07-15 06:15:36', '5fe4d6b1-2969-4f46-a9aa-66dda7ecad38', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(14, 14, 1, 'Home', '2021-07-15 06:50:28', '2021-07-15 06:50:28', 'c92b0946-0c0e-43a2-81c7-9672a14760c2', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(15, 15, 1, 'Natural1', '2021-07-15 06:51:57', '2021-07-15 06:51:57', '8fa07717-4707-4a45-a7a0-c0766149b77f', NULL),
(17, 17, 1, 'Home', '2021-07-15 06:52:18', '2021-07-15 06:52:18', '6ac248ba-7a7c-44a2-9d31-5a8e95de1727', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(18, 18, 1, 'Home', '2021-07-15 07:01:35', '2021-07-15 07:01:35', '54d622f9-137b-42bc-8559-7b19460cc684', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(19, 19, 1, 'Home', '2021-07-15 07:01:38', '2021-07-15 07:01:38', '3703c565-e633-4d2d-8353-1864d90bae80', '<p>This is a<strong> paragraph</strong> of text.</p>\r\n<ul><li>List items</li><li>cards</li></ul><h2>Subheading Here</h2>\r\n<p>And here\'s some more text.</p>'),
(20, 20, 1, 'About Us', '2021-07-15 07:34:49', '2021-07-15 08:56:13', 'be49b4fd-a29b-4b31-8bdb-5a5fc20a162d', '\r\n<p>Building a website is, in many ways, an exercise of willpower. It’s tempting to get distracted by the bells and whistles of the design process, and forget all about creating compelling content.</p>\r\n<p>It\'s that compelling content that\'s crucial to making inbound marketing work for your business.</p>\r\n'),
(21, 21, 1, 'About Us', '2021-07-15 07:34:51', '2021-07-15 07:34:51', '2968e70b-5324-42cb-9a74-30f7b31777b5', NULL),
(22, 22, 1, 'About Us', '2021-07-15 07:34:53', '2021-07-15 07:34:53', 'dae503f0-46b0-482e-a7e7-469a54d436dc', NULL),
(23, 23, 1, 'About Us', '2021-07-15 07:35:17', '2021-07-15 07:35:17', '117899c9-913b-4bdf-915f-6c5fb1a9b070', NULL),
(24, 24, 1, 'About Us', '2021-07-15 07:35:19', '2021-07-15 07:35:19', '9d0a8147-0b18-44a3-b47b-961fca5e3764', NULL),
(25, 25, 1, 'Contact', '2021-07-15 07:36:46', '2021-07-15 08:57:55', '6be9d850-258c-415d-8375-aaa37a05bb23', '<p>Most contact pages are designed with function in mind.</p>\r\n<p>They slap an email address, phone, and location on a plain background and call it a day.</p>\r\n<p>But basic contact pages don’t inspire visitors to reach out and connect.</p>\r\n<p>Other pages make it easy to contact the company – which is awesome.</p>\r\n<p>Except, that can also drive up customer service costs.</p>'),
(26, 26, 1, 'Contact', '2021-07-15 07:36:47', '2021-07-15 07:36:47', '0bd4f502-8a6d-4077-ac98-de5389988a6f', NULL),
(27, 27, 1, 'Contact', '2021-07-15 07:36:49', '2021-07-15 07:36:49', '428e31df-d9ac-4fcb-ac6d-df9d495dc8dd', NULL),
(28, 28, 1, 'Contact', '2021-07-15 07:37:27', '2021-07-15 07:37:27', '43f9bd7b-6a67-459e-b33f-db428d47e82e', NULL),
(29, 29, 1, 'About Us', '2021-07-15 07:41:23', '2021-07-15 07:41:23', 'e1eeb912-47d0-436e-808b-1b67a965811b', NULL),
(30, 30, 1, 'Contact', '2021-07-15 07:41:52', '2021-07-15 07:41:52', '949ee944-4fcd-40c5-88d3-db54179355ba', NULL),
(31, 31, 1, 'About Us', '2021-07-15 07:44:24', '2021-07-15 07:44:24', '09c8af73-5e60-4eec-927a-13f1571d4df3', NULL),
(32, 32, 1, 'Contact', '2021-07-15 07:45:17', '2021-07-15 07:45:17', '0044ccc2-5353-47f1-8689-99ef1c9e40d7', NULL),
(34, 34, 1, 'About Us', '2021-07-15 08:56:14', '2021-07-15 08:56:14', 'c812b344-fb96-4dcf-b8b9-2fa0dfabb9d1', '\r\n<p>Building a website is, in many ways, an exercise of willpower. It’s tempting to get distracted by the bells and whistles of the design process, and forget all about creating compelling content.</p>\r\n<p>It\'s that compelling content that\'s crucial to making inbound marketing work for your business.</p>\r\n'),
(36, 36, 1, 'Contact', '2021-07-15 08:57:55', '2021-07-15 08:57:55', '0c0b8af1-dc4a-4143-87a9-3b918169a1f9', '<p>Most contact pages are designed with function in mind.</p>\r\n<p>They slap an email address, phone, and location on a plain background and call it a day.</p>\r\n<p>But basic contact pages don’t inspire visitors to reach out and connect.</p>\r\n<p>Other pages make it easy to contact the company – which is awesome.</p>\r\n<p>Except, that can also drive up customer service costs.</p>'),
(37, 37, 1, NULL, '2021-07-15 09:06:04', '2021-07-15 09:51:45', '9405ebf3-1320-45b5-839f-8c561537a869', NULL),
(38, 40, 1, NULL, '2021-07-15 09:19:05', '2021-07-15 09:20:59', '85f7259f-67d4-4389-b3a2-5a2244c69462', '<pre>© Copyright 2020 ACME Inc. All rights reserved.</pre>'),
(39, 41, 1, 'Our First Blog Post', '2021-07-15 09:36:26', '2021-07-15 09:37:43', '6607e35d-8a5b-4f19-a30a-972a414b5947', '<p>A blog post is any article, news piece, or guide that\'s published in the blog section of a website. A blog post typically covers a specific topic or query, is educational in nature, ranges from 600 to 2,000+ words, and contains other media types such as images, videos, infographics, and interactive charts.</p>\r\n<p>Blog posts allow you and your business to publish insights, thoughts, and stories on your website about any topic. They can help you boost brand awareness, credibility, conversions, and revenue. Most importantly, they can help you drive traffic to your website.</p>'),
(40, 42, 1, 'Our First Blog Post', '2021-07-15 09:37:43', '2021-07-15 09:37:43', '476d9ce8-32bf-4f96-bc8c-93b78fd1cb46', '<p>A blog post is any article, news piece, or guide that\'s published in the blog section of a website. A blog post typically covers a specific topic or query, is educational in nature, ranges from 600 to 2,000+ words, and contains other media types such as images, videos, infographics, and interactive charts.</p>\r\n<p>Blog posts allow you and your business to publish insights, thoughts, and stories on your website about any topic. They can help you boost brand awareness, credibility, conversions, and revenue. Most importantly, they can help you drive traffic to your website.</p>'),
(41, 43, 1, 'Second Blog Post', '2021-07-15 09:38:00', '2021-07-15 09:38:31', 'd6f48d7f-89c8-4af7-a308-294cbbfa15b3', '<p>Before you write a blog, make sure you know the answers to questions like, <em>\"Why would someone keep reading this entire blog post?\"</em> and <em>\"What makes our audience come back for more?\"</em></p>\r\n<p>To start, a good blog post is interesting and educational. Blogs should answer questions and help readers resolve a challenge they\'re experiencing — and you have to do so in an interesting way.</p>'),
(42, 44, 1, 'Second Blog Post', '2021-07-15 09:38:31', '2021-07-15 09:38:31', '52de302b-6ff8-428b-b4d2-70e184a355c9', '<p>Before you write a blog, make sure you know the answers to questions like, <em>\"Why would someone keep reading this entire blog post?\"</em> and <em>\"What makes our audience come back for more?\"</em></p>\r\n<p>To start, a good blog post is interesting and educational. Blogs should answer questions and help readers resolve a challenge they\'re experiencing — and you have to do so in an interesting way.</p>'),
(43, 45, 1, 'This is our Final Blog Post', '2021-07-15 09:38:58', '2021-07-15 09:39:26', '9257bd49-4770-402d-a2fe-bf4c8275fbf4', '<p>This is where the process of <a target=\"_blank\" href=\"https://blog.hubspot.com/marketing/buyer-persona-research\" rel=\"noreferrer noopener\">creating buyer personas</a> comes in handy. Consider what you know about your buyer personas and their interests while you\'re coming up with a topic for your blog post.</p>\r\n<p>For instance, if your readers are millennials looking to start a business, you probably don\'t need to provide them with information about getting started in social media — most of them already have that down.</p>'),
(44, 46, 1, 'This is our Final Blog Post', '2021-07-15 09:39:26', '2021-07-15 09:39:26', '333a1fcf-e215-4838-a45c-685a579a07a9', '<p>This is where the process of <a target=\"_blank\" href=\"https://blog.hubspot.com/marketing/buyer-persona-research\" rel=\"noreferrer noopener\">creating buyer personas</a> comes in handy. Consider what you know about your buyer personas and their interests while you\'re coming up with a topic for your blog post.</p>\r\n<p>For instance, if your readers are millennials looking to start a business, you probably don\'t need to provide them with information about getting started in social media — most of them already have that down.</p>'),
(45, 47, 1, 'Blog', '2021-07-15 09:50:03', '2021-07-15 09:50:16', '361f6840-341f-437c-b445-ff1c4dc85491', NULL),
(46, 48, 1, 'Blog', '2021-07-15 09:50:04', '2021-07-15 09:50:04', '55b165be-d73a-45f2-adcc-b21a68886c9a', NULL),
(47, 49, 1, 'Blog', '2021-07-15 09:50:04', '2021-07-15 09:50:04', '34284b08-4b42-4843-81d2-5a6da8d41778', NULL),
(48, 50, 1, 'Blog', '2021-07-15 09:50:16', '2021-07-15 09:50:16', 'fe35b93d-9d61-4beb-867f-33a0a5d702b7', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craft_craftidtokens`
--

CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_deprecationerrors`
--

INSERT INTO `craft_deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ElementQuery::getIterator()', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig:17', '2021-07-15 09:12:06', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig', 17, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":588,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\54\\\\54d07c6cbdbaff1b51609d75456c5fd84f9d1a668cfc1c7b3f03d85506eb9186.php\",\"line\":74,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\8b\\\\8b228ad3946b6a11492160429cce980d1bbfd88d3763c77b743a9f7c45afbc58.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":401,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":462,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":271,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":256,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\web\\\\index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-07-15 09:12:06', '2021-07-15 09:12:06', '64b24cbc-22c1-4043-bcc6-f814df99d646'),
(5, 'ElementQuery::getIterator()', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig:20', '2021-07-15 09:17:24', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig', 20, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":588,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\54\\\\54d07c6cbdbaff1b51609d75456c5fd84f9d1a668cfc1c7b3f03d85506eb9186.php\",\"line\":82,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\8b\\\\8b228ad3946b6a11492160429cce980d1bbfd88d3763c77b743a9f7c45afbc58.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_90303ec0e153f2f2c46af8a1c7c1194cd2fed0ff7c5f3787a0d8be3aa659ef08\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":401,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":462,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"general\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":271,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"general\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"contact\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":256,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\web\\\\index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-07-15 09:17:24', '2021-07-15 09:17:24', '066aeea2-a369-48e4-94b9-ea204ad26fd2'),
(9, 'ElementQuery::getIterator()', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig:19', '2021-07-15 10:12:59', 'C:\\XAMPP\\htdocs\\craft_demo\\templates\\index.twig', 19, 'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":588,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\54\\\\54d07c6cbdbaff1b51609d75456c5fd84f9d1a668cfc1c7b3f03d85506eb9186.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_9db4b3976b0f652530db06733e9786272a79425a2bcfbc6f2f8aab4f7f9dd439\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\storage\\\\runtime\\\\compiled_templates\\\\b6\\\\b6915538cbd96cc937b655f3b9dfa8284c488d75d6e4d38c73f9c85e09f08c64.php\",\"line\":43,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":405,\"class\":\"__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_174b0da56dbecbecc334035d8895f4498deecb03a8b0c92dfe67868f08858efc\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":401,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":462,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"blog\\\\index\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"blog\\\\index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"blog\\\\index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"blog\\\\index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":271,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"blog\\\\index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"blog\\\\index\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"blog\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":256,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\XAMPP\\\\htdocs\\\\craft_demo\\\\web\\\\index.php\",\"line\":26,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2021-07-15 10:12:59', '2021-07-15 10:12:59', '960d0fb2-38d3-4c7b-9c9a-8a5b4bb8f1ed');

-- --------------------------------------------------------

--
-- Table structure for table `craft_drafts`
--

CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-07-15 05:06:13', '2021-07-15 05:06:13', NULL, NULL, 'f6d0ecce-1b37-41cf-9f04-b61dd019c2af'),
(2, NULL, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:27:51', '2021-07-15 07:01:37', '2021-07-15 06:52:16', NULL, '58429ade-ae6c-45a6-96b5-71f1e6cbfb80'),
(3, 2, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:27:51', '2021-07-15 05:27:52', NULL, NULL, '1914f226-6272-4bd9-8647-393967de60be'),
(4, 2, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:27:56', '2021-07-15 05:27:56', NULL, NULL, '8b52de96-cd3b-4790-8701-3f1294dd639d'),
(5, 2, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:28:44', '2021-07-15 05:28:44', NULL, NULL, '105f2430-ef05-41b3-8343-c043de90b97b'),
(6, 2, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:28:45', '2021-07-15 05:28:46', NULL, NULL, 'e84b6a11-0c65-4583-a00c-c58766eadeac'),
(7, 2, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:28:47', '2021-07-15 05:28:48', NULL, NULL, 'dad35aac-c650-420a-b348-39189d9e2938'),
(8, 2, NULL, 6, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 05:28:49', '2021-07-15 05:28:49', NULL, NULL, '62f255ae-c2c3-41e7-8629-49f931f7daba'),
(9, 2, NULL, 7, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:09:23', '2021-07-15 06:09:24', NULL, NULL, '8110793d-f8ce-4fb0-a598-1d18a5053e89'),
(10, 2, NULL, 8, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:10:59', '2021-07-15 06:10:59', NULL, NULL, '7bb7588c-2a23-4e81-9dec-c3950d18d1e6'),
(11, 2, NULL, 9, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:11:36', '2021-07-15 06:11:36', NULL, NULL, '582e524a-0914-4f36-9ac9-a0785e29ffde'),
(13, 2, NULL, 10, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:15:34', '2021-07-15 06:15:35', '2021-07-15 06:15:34', NULL, 'dbb5de1c-1f9c-4125-9bc4-ecff2c0b957c'),
(14, 2, NULL, 11, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:50:28', '2021-07-15 06:50:28', '2021-07-15 06:15:34', NULL, '5d5247ab-44d5-4182-87b0-c3f1424346b7'),
(15, NULL, NULL, NULL, 2, 'craft\\elements\\Asset', 1, 0, '2021-07-15 06:51:57', '2021-07-15 06:51:57', NULL, NULL, 'bfcf0307-7a03-464b-aad1-42e94c8cf2aa'),
(17, 2, NULL, 12, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 06:52:16', '2021-07-15 06:52:17', '2021-07-15 06:52:16', NULL, '9fff982d-5b1d-4591-8ff7-b8893a6d69b6'),
(18, 2, NULL, 13, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:01:34', '2021-07-15 07:01:34', '2021-07-15 06:52:16', NULL, '04ea52ee-48cf-4add-814a-e84a4fd1060e'),
(19, 2, NULL, 14, 1, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:01:37', '2021-07-15 07:01:37', '2021-07-15 06:52:16', NULL, '9d89e461-6d7d-4859-8ef7-00ffc46f2a5e'),
(20, NULL, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:34:49', '2021-07-15 08:56:13', '2021-07-15 08:56:13', NULL, 'e84350a3-1fd4-4d30-9256-af8c39589189'),
(21, 20, NULL, 15, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:34:49', '2021-07-15 07:34:50', NULL, NULL, '5744d8ac-bd5d-413d-8a7f-62c8d8129411'),
(22, 20, NULL, 16, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:34:53', '2021-07-15 07:34:53', NULL, NULL, '9fd54c25-1ce5-41dd-ab49-eb35fcc32270'),
(23, 20, NULL, 17, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:35:17', '2021-07-15 07:35:17', NULL, NULL, 'd64ebd10-b41c-43ca-b9f1-19303a27a26a'),
(24, 20, NULL, 18, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:35:19', '2021-07-15 07:35:19', NULL, NULL, '7d442aa5-104f-4867-9027-9911ded33ef7'),
(25, NULL, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:36:46', '2021-07-15 08:57:54', NULL, NULL, '32972348-3ac6-44ef-8709-f560b7ae99d8'),
(26, 25, NULL, 19, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:36:46', '2021-07-15 07:36:47', NULL, NULL, 'ce3c302a-4412-4010-8e86-cc0f9c3afbe8'),
(27, 25, NULL, 20, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:36:49', '2021-07-15 07:36:49', NULL, NULL, 'c081239b-0521-433e-b53d-a0d291fa262d'),
(28, 25, NULL, 21, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:37:27', '2021-07-15 07:37:27', NULL, NULL, '897a08a1-8ac8-4284-ac7d-4f643d089bf6'),
(29, 20, NULL, 22, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:41:22', '2021-07-15 07:41:22', NULL, NULL, '30de9799-f1d7-4b86-a4e1-7f0e87cf5cd9'),
(30, 25, NULL, 23, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:41:52', '2021-07-15 07:41:52', NULL, NULL, 'a0c3f58c-6c81-44b1-bf58-faca96de4d5f'),
(31, 20, NULL, 24, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:44:24', '2021-07-15 07:44:24', NULL, NULL, '1e5f5220-0f6a-4be1-b840-7f776e8f87f9'),
(32, 25, NULL, 25, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 07:45:17', '2021-07-15 07:45:17', NULL, NULL, '717d312f-1979-4d23-84d3-3ba05a06ca3c'),
(34, 20, NULL, 26, 3, 'craft\\elements\\Entry', 1, 0, '2021-07-15 08:56:13', '2021-07-15 08:56:13', '2021-07-15 08:56:13', NULL, '64659838-22a0-426c-9f9f-61a6aefd997d'),
(36, 25, NULL, 27, 4, 'craft\\elements\\Entry', 1, 0, '2021-07-15 08:57:54', '2021-07-15 08:57:55', NULL, NULL, 'a66466f7-abcf-43ae-b514-7e8a8d0db430'),
(37, NULL, NULL, NULL, 6, 'craft\\elements\\GlobalSet', 1, 0, '2021-07-15 09:06:04', '2021-07-15 09:51:45', NULL, NULL, '749c4abb-dafc-4ff2-95aa-84cbdcdead80'),
(38, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-15 09:11:40', '2021-07-15 09:51:45', NULL, NULL, '793a2bbf-a55b-41a8-a532-0b77c9bbf6a4'),
(39, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-15 09:11:41', '2021-07-15 09:51:45', NULL, NULL, '2140a0f9-130e-445c-9145-aa4efc8a5e7b'),
(40, NULL, NULL, NULL, 7, 'craft\\elements\\GlobalSet', 1, 0, '2021-07-15 09:19:05', '2021-07-15 09:20:59', NULL, NULL, '26860456-c19f-4358-ba05-c907fdac66e1'),
(41, NULL, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:36:26', '2021-07-15 09:37:43', NULL, NULL, 'fc1fb8f0-1424-4185-aae3-e43bcc8a90a0'),
(42, 41, NULL, 28, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:37:43', '2021-07-15 09:37:43', NULL, NULL, 'ddfab533-fac8-4fa1-9001-8504a36f87b7'),
(43, NULL, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:38:00', '2021-07-15 09:38:31', NULL, NULL, '119e3dce-8308-4e80-913d-a896af7a737c'),
(44, 43, NULL, 29, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:38:31', '2021-07-15 09:38:31', NULL, NULL, '0ba8873d-b23e-4e2c-a737-e0c0e99cebc3'),
(45, NULL, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:38:58', '2021-07-15 09:39:26', NULL, NULL, '8e340fb0-e01a-4e55-a74d-00d5f520a438'),
(46, 45, NULL, 30, 8, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:39:26', '2021-07-15 09:39:26', NULL, NULL, 'd59eb1de-5777-4e45-9994-87f1974e05e9'),
(47, NULL, NULL, NULL, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:50:03', '2021-07-15 09:50:16', NULL, NULL, '2405dd57-968b-4c5f-a020-a81069b34cac'),
(48, 47, NULL, 31, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:50:03', '2021-07-15 09:50:04', NULL, NULL, '5926e5ab-5bd9-480a-bb8f-fee1adddee24'),
(49, 47, NULL, 32, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:50:04', '2021-07-15 09:50:04', NULL, NULL, 'c0c7fa59-b107-4eea-8c70-a7eebe223f55'),
(50, 47, NULL, 33, 9, 'craft\\elements\\Entry', 1, 0, '2021-07-15 09:50:16', '2021-07-15 09:50:16', NULL, NULL, '1af0981f-573e-468a-b35f-762e4964df20'),
(51, NULL, NULL, NULL, 5, 'craft\\elements\\MatrixBlock', 1, 0, '2021-07-15 09:51:45', '2021-07-15 09:51:45', NULL, NULL, '744977c2-be07-493c-8ee4-3fc8ba40f7df');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_sites`
--

CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements_sites`
--

INSERT INTO `craft_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-07-15 05:06:14', '2021-07-15 05:06:14', '3398d22d-3c84-44ce-881c-3d2b28d6b0d9'),
(2, 2, 1, 'home', '__home__', 1, '2021-07-15 05:27:51', '2021-07-15 05:27:51', '16d2c1a9-033e-470d-b796-90a2ecd64ecf'),
(3, 3, 1, 'home', '__home__', 1, '2021-07-15 05:27:52', '2021-07-15 05:27:52', 'd73e16e7-cead-46b3-b991-f1e2f26d0790'),
(4, 4, 1, 'home', '__home__', 1, '2021-07-15 05:27:57', '2021-07-15 05:27:57', '93404afc-9838-40e2-a6d0-1d3fd895027c'),
(5, 5, 1, 'home', '__home__', 1, '2021-07-15 05:28:44', '2021-07-15 05:28:44', 'e88a5274-c6af-4ca6-ab9e-f1f23aacd96a'),
(6, 6, 1, 'home', '__home__', 1, '2021-07-15 05:28:46', '2021-07-15 05:28:46', '9a05447f-e251-44ab-a766-bfb9c2dc9a4e'),
(7, 7, 1, 'home', '__home__', 1, '2021-07-15 05:28:48', '2021-07-15 05:28:48', 'c6e1d7c6-b249-4b2b-b1b9-6540f22c30c0'),
(8, 8, 1, 'home', '__home__', 1, '2021-07-15 05:28:49', '2021-07-15 05:28:49', 'f9b40ea0-3c7c-47a7-85b0-fcc896a85a9a'),
(9, 9, 1, 'home', '__home__', 1, '2021-07-15 06:09:24', '2021-07-15 06:09:24', '0db2c591-379f-4075-8b0a-d0f0df61a928'),
(10, 10, 1, 'home', '__home__', 1, '2021-07-15 06:10:59', '2021-07-15 06:10:59', 'e7406427-9757-4280-9ab4-5fe3ecb4e5b5'),
(11, 11, 1, 'home', '__home__', 1, '2021-07-15 06:11:37', '2021-07-15 06:11:37', '81bdb3ca-0bec-4907-bd54-2a5e62d50c36'),
(13, 13, 1, 'home', '__home__', 1, '2021-07-15 06:15:35', '2021-07-15 06:15:35', '23603988-1e84-44a6-9401-7babf8a51545'),
(14, 14, 1, 'home', '__home__', 1, '2021-07-15 06:50:28', '2021-07-15 06:50:28', '39a2d17b-50e6-44c7-825a-83ba233a6c3e'),
(15, 15, 1, NULL, NULL, 1, '2021-07-15 06:51:57', '2021-07-15 06:51:57', 'a12854c2-3a8b-4840-90b8-242e11d7008a'),
(17, 17, 1, 'home', '__home__', 1, '2021-07-15 06:52:17', '2021-07-15 06:52:17', 'b985d1e4-6be9-4a7c-b76c-f3dd87860694'),
(18, 18, 1, 'home', '__home__', 1, '2021-07-15 07:01:35', '2021-07-15 07:01:35', '55a39af7-93f8-4319-a447-c3f0783a59a2'),
(19, 19, 1, 'home', '__home__', 1, '2021-07-15 07:01:37', '2021-07-15 07:01:37', '2005a39d-2144-4bc5-8642-3b838accd47c'),
(20, 20, 1, 'about-us', 'about-us', 1, '2021-07-15 07:34:49', '2021-07-15 07:34:49', 'aad2d7a6-9ce4-4eb0-bcee-f137d4150632'),
(21, 21, 1, 'about-us', 'about-us', 1, '2021-07-15 07:34:51', '2021-07-15 07:34:51', '7623e7df-d2c4-48fc-87f7-661a56c87af8'),
(22, 22, 1, 'about-us', 'about-us', 1, '2021-07-15 07:34:53', '2021-07-15 07:34:53', '9a9d99c0-a134-4e51-8877-d331b85a40bf'),
(23, 23, 1, 'about-us', 'about-us', 1, '2021-07-15 07:35:17', '2021-07-15 07:35:17', '6d7490cc-e2bc-4df1-914b-66400a853d6f'),
(24, 24, 1, 'about-us', 'about-us', 1, '2021-07-15 07:35:19', '2021-07-15 07:35:19', '750cee03-70e4-4dcc-9602-b9abc40e65b7'),
(25, 25, 1, 'contact', 'contact', 1, '2021-07-15 07:36:46', '2021-07-15 07:36:46', '5a9be817-680c-4e8a-9fd1-6ab8b670b484'),
(26, 26, 1, 'contact', 'contact', 1, '2021-07-15 07:36:47', '2021-07-15 07:36:47', 'dc8277d5-24b6-4b4d-adaa-c6e6dce66242'),
(27, 27, 1, 'contact', 'contact', 1, '2021-07-15 07:36:49', '2021-07-15 07:36:49', '504e5440-2e9f-4ba8-8605-7b34c561664b'),
(28, 28, 1, 'contact', 'contact', 1, '2021-07-15 07:37:27', '2021-07-15 07:37:27', '5e22a393-b453-4abc-9fe9-976df1f63c71'),
(29, 29, 1, 'about-us', 'about-us', 1, '2021-07-15 07:41:23', '2021-07-15 07:41:23', 'f3307e9c-fe39-4f44-808a-1cbe95a383cb'),
(30, 30, 1, 'contact', 'contact', 1, '2021-07-15 07:41:52', '2021-07-15 07:41:52', '5c660226-cc95-45c3-a971-0cf00d1d278b'),
(31, 31, 1, 'about-us', 'about-us', 1, '2021-07-15 07:44:24', '2021-07-15 07:44:24', '1a8a6ff8-1037-44fc-9d13-0190c1baf707'),
(32, 32, 1, 'contact', 'contact', 1, '2021-07-15 07:45:17', '2021-07-15 07:45:17', '3d4256f3-6a2b-41ad-b400-762b0b37360c'),
(34, 34, 1, 'about-us', 'about-us', 1, '2021-07-15 08:56:14', '2021-07-15 08:56:14', 'd055a98e-7ce7-45bd-a07e-eb10dd2abdfa'),
(36, 36, 1, 'contact', 'contact', 1, '2021-07-15 08:57:55', '2021-07-15 08:57:55', 'f78fd5fd-6949-4992-bbdb-17901155bcd4'),
(37, 37, 1, NULL, NULL, 1, '2021-07-15 09:06:04', '2021-07-15 09:06:04', '0cbcfa40-a6e9-4e04-bd15-079a8d6eabdd'),
(38, 38, 1, NULL, NULL, 1, '2021-07-15 09:11:40', '2021-07-15 09:11:40', '9f491552-40d3-4050-aa73-5ab671ea63a4'),
(39, 39, 1, NULL, NULL, 1, '2021-07-15 09:11:41', '2021-07-15 09:11:41', '6f55b96d-5215-4c28-8f17-77fba64d6629'),
(40, 40, 1, NULL, NULL, 1, '2021-07-15 09:19:05', '2021-07-15 09:19:05', '5b6164e3-0197-44b0-b064-0e16fe74155b'),
(41, 41, 1, 'our-first-blog-post', 'blog/our-first-blog-post', 1, '2021-07-15 09:36:26', '2021-07-15 09:36:47', '622f8612-29be-4fdb-9e88-8cc265dc025b'),
(42, 42, 1, 'our-first-blog-post', 'blog/our-first-blog-post', 1, '2021-07-15 09:37:43', '2021-07-15 09:37:43', '0a0179f8-e082-4798-9f9d-b496ad03b9c3'),
(43, 43, 1, 'second-blog-post', 'blog/second-blog-post', 1, '2021-07-15 09:38:00', '2021-07-15 09:38:13', 'd9fb18c3-993a-453a-a520-23bb4dbbf1fa'),
(44, 44, 1, 'second-blog-post', 'blog/second-blog-post', 1, '2021-07-15 09:38:31', '2021-07-15 09:38:31', 'ce30c08c-fe3c-4cb5-9033-03f4fa948303'),
(45, 45, 1, 'this-is-our-final-blog-post', 'blog/this-is-our-final-blog-post', 1, '2021-07-15 09:38:58', '2021-07-15 09:39:12', '729f36a5-2b87-429e-815f-3dad3fdbdea3'),
(46, 46, 1, 'this-is-our-final-blog-post', 'blog/this-is-our-final-blog-post', 1, '2021-07-15 09:39:26', '2021-07-15 09:39:26', '8164a5ea-abad-4b5b-a3f6-0f9bf422f00d'),
(47, 47, 1, 'blog', 'blog', 1, '2021-07-15 09:50:03', '2021-07-15 09:50:03', '587a3f32-0fca-458c-8d76-5de87a5e4438'),
(48, 48, 1, 'blog', 'blog', 1, '2021-07-15 09:50:04', '2021-07-15 09:50:04', 'f8adf814-4404-45e2-b2a1-fd9203f349e9'),
(49, 49, 1, 'blog', 'blog', 1, '2021-07-15 09:50:04', '2021-07-15 09:50:04', 'c2764d4e-dd0c-4be2-a902-697016de3bc1'),
(50, 50, 1, 'blog', 'blog', 1, '2021-07-15 09:50:16', '2021-07-15 09:50:16', 'a65b27de-f8f2-4c31-8988-f550260f6100'),
(51, 51, 1, NULL, NULL, 1, '2021-07-15 09:51:45', '2021-07-15 09:51:45', '8c328dee-a4bc-43e5-9e54-32f3ff66980d');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:27:51', '2021-07-15 05:27:51', 'f7296461-24d6-44c4-a7a3-07aad748c0d0'),
(3, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:27:52', '2021-07-15 05:27:52', '52c0228a-81d9-420d-9d12-3e0fd8aa189f'),
(4, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:27:57', '2021-07-15 05:27:57', '30f27646-d691-4d77-8274-21e67ec8a24d'),
(5, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:28:45', '2021-07-15 05:28:45', '9b377e33-714d-4de0-b0da-61b46e21ee09'),
(6, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:28:46', '2021-07-15 05:28:46', '8ea5bca0-05f3-4c45-99c8-8a8cd007746d'),
(7, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:28:48', '2021-07-15 05:28:48', '85b8921a-86b9-4bfa-838b-0ecf50ef564d'),
(8, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 05:28:49', '2021-07-15 05:28:49', '12a32247-07ae-4404-af69-27198552959d'),
(9, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:09:24', '2021-07-15 06:09:24', 'b6b89fdc-e188-42b5-8e21-5d2af5ed6f01'),
(10, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:10:59', '2021-07-15 06:10:59', 'f31c8f62-56d1-476f-9be9-c6018624d006'),
(11, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:11:37', '2021-07-15 06:11:37', '66edbb08-09db-4299-a6e7-a2aaa6875e36'),
(13, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:15:36', '2021-07-15 06:15:36', '474003b8-3824-421b-ba2b-6b87915848a4'),
(14, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:50:28', '2021-07-15 06:50:28', '33e761c8-6635-4e04-bc56-9b7af6264223'),
(17, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 06:52:18', '2021-07-15 06:52:18', '19177118-7600-4ca9-9e17-e1a6ce50a030'),
(18, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 07:01:35', '2021-07-15 07:01:35', 'cbd57853-70e9-4684-a798-2b80e46239d2'),
(19, 1, NULL, 1, NULL, '2021-07-15 05:27:00', NULL, NULL, '2021-07-15 07:01:38', '2021-07-15 07:01:38', '89a123fc-5856-468d-91e3-2a481ad0387c'),
(20, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:34:49', '2021-07-15 07:34:49', '66fcf970-44ff-436a-83d8-c34f06675be1'),
(21, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:34:51', '2021-07-15 07:34:51', 'b0e9dab8-4e72-43b2-9af0-fe4ba7b6aa16'),
(22, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:34:53', '2021-07-15 07:34:53', 'e81e0bb6-6d21-4814-9f1a-7a607394cef6'),
(23, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:35:18', '2021-07-15 07:35:18', 'e29bdd30-05c1-432b-b99c-dee302510845'),
(24, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:35:19', '2021-07-15 07:35:19', '21ea4b9d-6d59-4785-a47a-c9b1ab3e2962'),
(25, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:36:46', '2021-07-15 07:36:46', '74c5ce54-520a-47f4-9110-0f82b4194680'),
(26, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:36:47', '2021-07-15 07:36:47', '645033da-2145-4df8-ba35-b1a5b15b5999'),
(27, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:36:49', '2021-07-15 07:36:49', '680f8bb2-e870-43c1-ac52-593f8a6c762e'),
(28, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:37:27', '2021-07-15 07:37:27', 'a4e56438-14f0-4228-ac7d-6810b25450b4'),
(29, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:41:23', '2021-07-15 07:41:23', '49734d8d-e963-4966-b362-e8264f243546'),
(30, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:41:52', '2021-07-15 07:41:52', '97e5f768-fa2e-46da-a8a8-fd0ced71af85'),
(31, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 07:44:25', '2021-07-15 07:44:25', '8ede3a00-a1d1-41bd-b78f-408ed9192976'),
(32, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 07:45:17', '2021-07-15 07:45:17', 'c8e48ff5-dc20-44e1-a46c-3493f9f2c685'),
(34, 2, NULL, 2, NULL, '2021-07-15 07:34:00', NULL, NULL, '2021-07-15 08:56:14', '2021-07-15 08:56:14', '0f652cc0-2bb9-4d75-87c3-e5b80d5588b0'),
(36, 3, NULL, 3, NULL, '2021-07-15 07:36:00', NULL, NULL, '2021-07-15 08:57:56', '2021-07-15 08:57:56', 'd1bd49ad-d9fb-4d4d-b150-9bda433d3311'),
(41, 4, NULL, 4, 1, '2021-07-15 09:36:00', NULL, NULL, '2021-07-15 09:36:27', '2021-07-15 09:36:27', 'aa0ae02a-a159-4675-882f-2214e630d1e5'),
(42, 4, NULL, 4, 1, '2021-07-15 09:36:00', NULL, NULL, '2021-07-15 09:37:43', '2021-07-15 09:37:43', '7b2a2352-ebe0-448b-a6bb-895d9c6a67f3'),
(43, 4, NULL, 4, 1, '2021-07-15 09:38:00', NULL, NULL, '2021-07-15 09:38:00', '2021-07-15 09:38:00', '1443ddc5-ef76-4fe6-b956-319699ce0714'),
(44, 4, NULL, 4, 1, '2021-07-15 09:38:00', NULL, NULL, '2021-07-15 09:38:31', '2021-07-15 09:38:31', '3e999572-a19e-4800-bd99-cb3df7d54571'),
(45, 4, NULL, 4, 1, '2021-07-15 09:38:00', NULL, NULL, '2021-07-15 09:38:58', '2021-07-15 09:38:58', '01886d91-0d58-4088-a34b-1b9955c01dc8'),
(46, 4, NULL, 4, 1, '2021-07-15 09:38:00', NULL, NULL, '2021-07-15 09:39:26', '2021-07-15 09:39:26', '752ef8cd-51e3-4c2f-a835-1f7b0d114e97'),
(47, 5, NULL, 5, NULL, '2021-07-15 09:50:00', NULL, NULL, '2021-07-15 09:50:03', '2021-07-15 09:50:03', '2f064c39-35cf-4779-a0e7-957edcd2ba98'),
(48, 5, NULL, 5, NULL, '2021-07-15 09:50:00', NULL, NULL, '2021-07-15 09:50:04', '2021-07-15 09:50:04', '1f0d1ab1-c420-45fa-9c8e-3f7286a5c8a2'),
(49, 5, NULL, 5, NULL, '2021-07-15 09:50:00', NULL, NULL, '2021-07-15 09:50:04', '2021-07-15 09:50:04', '2a13c84c-d755-45e7-a7bb-c683eac1d17b'),
(50, 5, NULL, 5, NULL, '2021-07-15 09:50:00', NULL, NULL, '2021-07-15 09:50:16', '2021-07-15 09:50:16', 'd88ec00e-7954-4e6f-82c5-fac5c348204b');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Home', 'home', 0, 'site', NULL, '{section.name|raw}', 1, '2021-07-15 05:27:42', '2021-07-15 05:27:42', NULL, '3b2be009-df43-4586-a27f-bb18235a1a25'),
(2, 2, 3, 'About Us', 'aboutUs', 1, 'site', NULL, '{section.name|raw}', 1, '2021-07-15 07:34:48', '2021-07-15 07:41:21', NULL, '038f2931-b440-4c5c-8107-6812c12f9a76'),
(3, 3, 4, 'Contact', 'contact', 1, 'site', NULL, '{section.name|raw}', 1, '2021-07-15 07:36:45', '2021-07-15 07:41:51', NULL, 'ef22b476-8c74-46f4-9c7b-85e5a1765b91'),
(4, 4, 8, 'Blog Posts', 'blogPosts', 1, 'site', NULL, NULL, 1, '2021-07-15 09:31:09', '2021-07-15 09:35:46', NULL, '8bb3e594-ff9a-488f-b6e3-41cdebcdb880'),
(5, 5, 9, 'Blog', 'blog', 0, 'site', NULL, '{section.name|raw}', 1, '2021-07-15 09:50:03', '2021-07-15 09:50:03', NULL, '36ef3782-183d-4f6e-b1f7-b7d2f34046e8');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-07-15 05:06:13', '2021-07-15 05:06:13', NULL, '03a7a629-c5be-46eb-997b-ba51a4f55731');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 1, 9, 1, 0, 0, '2021-07-15 06:50:22', '2021-07-15 06:50:22', 'f1bde167-c698-4074-9b8a-0a22f0eebc54'),
(4, 1, 9, 2, 0, 1, '2021-07-15 06:50:22', '2021-07-15 06:50:22', '405de075-f8d6-4fd4-af6f-ace6ebea5c37'),
(7, 3, 16, 1, 0, 1, '2021-07-15 07:44:22', '2021-07-15 07:44:22', '5f52fe51-9adc-4a99-88f6-9310f52477de'),
(8, 4, 17, 1, 0, 1, '2021-07-15 07:45:16', '2021-07-15 07:45:16', 'd6176bd7-5927-46e2-83e6-c2179a0b96b9'),
(9, 5, 18, 5, 1, 0, '2021-07-15 09:04:09', '2021-07-15 09:04:09', '2ed7d3a3-507b-4202-bc50-ed431346a3a0'),
(10, 5, 18, 4, 1, 1, '2021-07-15 09:04:09', '2021-07-15 09:04:09', '828920f1-a388-4522-a01b-28c7714079a9'),
(11, 6, 19, 3, 0, 0, '2021-07-15 09:06:04', '2021-07-15 09:06:04', 'd0489309-326d-496f-a4db-1e4a53f01fc4'),
(12, 7, 20, 1, 0, 0, '2021-07-15 09:19:05', '2021-07-15 09:19:05', 'a1bc4367-f37d-479d-9ee7-f2ecb5353c57'),
(13, 8, 22, 1, 0, 1, '2021-07-15 09:35:46', '2021-07-15 09:35:46', '8c2ae908-98a3-4abb-ac94-923e306aaf70');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2021-07-15 05:27:41', '2021-07-15 05:27:41', NULL, 'f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2'),
(2, 'craft\\elements\\Asset', '2021-07-15 06:45:23', '2021-07-15 06:45:23', NULL, '0116fd2e-e12e-4fbd-875a-cb5596a414e2'),
(3, 'craft\\elements\\Entry', '2021-07-15 07:34:47', '2021-07-15 07:34:47', NULL, '6d815ee7-cc85-47d1-8673-ad9533e342b9'),
(4, 'craft\\elements\\Entry', '2021-07-15 07:36:44', '2021-07-15 07:36:44', NULL, '72fda802-ec08-468d-a94e-080a9704b0c6'),
(5, 'craft\\elements\\MatrixBlock', '2021-07-15 09:04:08', '2021-07-15 09:04:08', NULL, '6a769366-aea3-451d-9ff9-bb7ca6bb8f4e'),
(6, 'craft\\elements\\GlobalSet', '2021-07-15 09:06:03', '2021-07-15 09:06:03', NULL, '66cdaf7c-373f-47dc-997f-3cc67ac92382'),
(7, 'craft\\elements\\GlobalSet', '2021-07-15 09:19:05', '2021-07-15 09:19:05', NULL, '80ab1bff-fdab-456e-a399-5e4b31de27c6'),
(8, 'craft\\elements\\Entry', '2021-07-15 09:31:09', '2021-07-15 09:31:09', NULL, '44150c03-14f2-4a78-9632-38c209d33d4a'),
(9, 'craft\\elements\\Entry', '2021-07-15 09:50:03', '2021-07-15 09:50:03', NULL, '8e57f728-c531-49ce-953e-5f4756c33260');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 2, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-07-15 06:45:23', '2021-07-15 06:45:23', '773217dc-b3b1-47e6-ba67-dd1d8a26ba52'),
(8, 1, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Rich Text\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-07-15 06:50:22', '2021-07-15 06:50:22', '0b890e34-bd96-449c-9914-b4b156ce1138'),
(9, 1, 'content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d27128e9-5d17-4ac7-b3d7-b441e06ae2c6\"}]', 2, '2021-07-15 06:50:22', '2021-07-15 06:50:22', '97c82f52-be2c-40b3-b961-9e753e00e7e6'),
(16, 3, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"}]', 1, '2021-07-15 07:44:22', '2021-07-15 07:44:22', '7c512974-c9d8-4059-bed8-ee4aed9b90a7'),
(17, 4, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"}]', 1, '2021-07-15 07:45:16', '2021-07-15 07:45:16', 'fa3626e1-4b96-43da-b3ae-8fe5ba3db79f'),
(18, 5, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"81955874-cab4-4240-a3f0-91a479c125f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"3bd63b7c-cacc-4374-b75b-e36987b93ce5\"}]', 1, '2021-07-15 09:04:09', '2021-07-15 09:04:09', 'e5d52f3b-fe49-499e-a70e-104010a2cbdb'),
(19, 6, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"89beaaec-fc2e-4208-b5f4-2147fe402283\"}]', 1, '2021-07-15 09:06:03', '2021-07-15 09:06:03', 'a5ce5365-efd7-4fe5-8ae6-a80b77be97da'),
(20, 7, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"}]', 1, '2021-07-15 09:19:05', '2021-07-15 09:19:05', '43e4b14f-b900-4a0c-b740-cfa8bdd9dd9e'),
(22, 8, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"}]', 1, '2021-07-15 09:35:46', '2021-07-15 09:35:46', '68d41004-28b4-44ae-a5ea-fd8ed2a22484'),
(23, 9, 'Content', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-07-15 09:50:03', '2021-07-15 09:50:03', '993bac1c-d4d8-4930-b491-cad99da30d12');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Rich Text', 'richText', 'global', 'iitdguki', '', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}', '2021-07-15 06:06:05', '2021-07-15 06:06:05', '47aaeb33-fc15-471d-ac5f-53fdf3d35841'),
(2, 1, 'Feature Image', 'featureImage', 'global', NULL, '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add Feature Image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}', '2021-07-15 06:48:53', '2021-07-15 06:48:53', 'd27128e9-5d17-4ac7-b3d7-b441e06ae2c6'),
(3, 1, 'Navigation', 'navigation', 'global', NULL, '', 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"contentTable\":\"{{%matrixcontent_navigation}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}', '2021-07-15 09:04:05', '2021-07-15 09:04:05', '89beaaec-fc2e-4208-b5f4-2147fe402283'),
(4, NULL, 'Link Destination', 'linkDestination', 'matrixBlockType:b9fd0b54-199e-47fa-bb41-af4b1eacdabc', NULL, '', 1, 'site', NULL, 'craft\\fields\\Entries', '{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"Add a Link Destination\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}', '2021-07-15 09:04:08', '2021-07-15 09:04:08', '3bd63b7c-cacc-4374-b75b-e36987b93ce5'),
(5, NULL, 'Link Text', 'linkText', 'matrixBlockType:b9fd0b54-199e-47fa-bb41-af4b1eacdabc', 'pqhcpzru', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}', '2021-07-15 09:04:08', '2021-07-15 09:04:08', '81955874-cab4-4240-a3f0-91a479c125f2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(37, 'Header', 'header', 6, 1, '2021-07-15 09:06:04', '2021-07-15 09:06:04', '749c4abb-dafc-4ff2-95aa-84cbdcdead80'),
(40, 'Footer', 'footer', 7, 2, '2021-07-15 09:19:06', '2021-07-15 09:19:06', '26860456-c19f-4358-ba05-c907fdac66e1');

-- --------------------------------------------------------

--
-- Table structure for table `craft_gqlschemas`
--

CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_gqltokens`
--

CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.1', '3.7.7', 0, 'jgsbzytnuxpm', 'writyuzeoswm', '2021-07-15 05:06:12', '2021-07-15 09:50:04', '1e65fc34-3930-4ce7-9f68-847a9a13725e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(38, 37, 3, 1, 1, NULL, '2021-07-15 09:11:40', '2021-07-15 09:11:40', '9ca6076f-c111-4a23-84d1-f368004136f3'),
(39, 37, 3, 1, 2, NULL, '2021-07-15 09:11:41', '2021-07-15 09:11:41', 'b391ca19-92cf-4a64-8554-6feaee71ec4d'),
(51, 37, 3, 1, 3, NULL, '2021-07-15 09:51:45', '2021-07-15 09:51:45', '7a7926d7-b68b-4e86-b0c5-55c9801d25a0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, 5, 'Nav Link', 'navLink', 1, '2021-07-15 09:04:09', '2021-07-15 09:04:09', 'b9fd0b54-199e-47fa-bb41-af4b1eacdabc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_navigation`
--

CREATE TABLE `craft_matrixcontent_navigation` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_navLink_linkText_pqhcpzru` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixcontent_navigation`
--

INSERT INTO `craft_matrixcontent_navigation` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_navLink_linkText_pqhcpzru`) VALUES
(1, 38, 1, '2021-07-15 09:11:40', '2021-07-15 09:51:45', 'e9214603-afbe-49c4-b42c-b87632371d9b', 'About Us'),
(2, 39, 1, '2021-07-15 09:11:41', '2021-07-15 09:51:45', '1cb8786b-ec1e-4589-944e-9450e49ce6a1', 'Contact'),
(3, 51, 1, '2021-07-15 09:51:45', '2021-07-15 09:51:45', '5205c11c-e0c2-4897-9a4f-5743b3fb7a5b', 'Blog');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', 'b1d83df2-4092-4f67-b52e-570983118836'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '865bc050-033a-4ba2-9484-3487b013cd11'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2245c283-8acc-47ed-a3d0-d0fe9211b50d'),
(4, 'craft', 'm150403_184533_field_version', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '8e59b288-3ef8-4b33-88f1-e703171d0975'),
(5, 'craft', 'm150403_184729_type_columns', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', 'bb449a40-827c-4a48-9de3-6a5383f59e5c'),
(6, 'craft', 'm150403_185142_volumes', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '29dcb04f-d435-4376-9098-82eb41760f70'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '940d8860-073d-454d-8327-c7a9287b4947'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '4673a7db-e129-47ee-81f8-69f8fde9d557'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', 'c0dddbbc-0473-4bac-87b5-4ac5d42ec3d0'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '78c5c21e-09df-46af-b9ce-659e6b8bdb5f'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '7709b491-940d-410b-8630-acb6ecf26bf2'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '2021-07-15 05:06:17', '226c3531-c8aa-48ca-ba4d-327ddca5991e'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '488a3c6a-a52e-4a9a-8a63-31ee3393bb17'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'f7b14343-c7fd-4412-b11b-0535ce89704e'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'b6b0a43a-6729-47b4-8797-d4b82483e64b'),
(16, 'craft', 'm151209_000000_move_logo', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '19f13083-e29b-4f5a-9f10-7db07f0d0112'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '5ddcd962-f506-4d9f-88d0-d35c08840b82'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'b2d1c0e9-aecf-4201-b96f-8997d1a220fe'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '8cbddd08-245f-4662-9ecb-338f9017c56a'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'cd33dd8c-86f5-406b-96e2-10ae04a217d5'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '7c461e23-c9ff-49a4-a76c-48a195f454ff'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '8b311a30-358c-4ac9-9468-e17fc9262781'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'ca5bb005-6b94-4e3a-89c7-a1ce19fc7255'),
(24, 'craft', 'm160807_144858_sites', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'f9903a5e-81bb-4117-987a-b3c0c0110a89'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'cff67e4e-5fc4-491f-ae68-ab966d1b3dcd'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '70e982da-6302-4431-bda0-9c90ef8ae9bd'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '187293fb-3e4b-415d-858e-6f7a2f10dce0'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'ba7ed313-c223-4a93-a05b-2dc56d8b2d6e'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'f3996fa7-d612-43d0-bb39-816d5665a6d3'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'f4b5a364-8715-466c-913d-fa3def1c0e16'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'b10924b0-3884-466a-b465-1749fc651ff9'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'ddd5fb1b-e10f-4965-b2b2-01ba0537edef'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-07-15 05:06:18', '2021-07-15 05:06:18', '2021-07-15 05:06:18', 'a6f88d68-f9c3-4e24-8c45-7adb68df8e59'),
(34, 'craft', 'm161013_175052_newParentId', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'ef44f75a-85d3-47d6-a252-748a6760a6bf'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '5eacace0-2db2-4886-97c8-2bbcf4ba0710'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'ab4f12fe-5c8c-439d-8d90-b3c676fada6f'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '4e3b1290-1a37-4d7c-a5f8-d3880ac9acbc'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'd879a326-95af-49fd-8ef9-71345682b939'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'a991571b-ae2f-41f7-b784-28a2f80adedd'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '0ecfb645-b6a6-4a90-a6eb-8e6155223641'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'bf5abbf3-225c-4fb1-9bbe-c4cf6c01d9bc'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '608f9819-00ed-40d8-9142-3903dbd1980e'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'ea71cf05-c5df-4185-a7b1-1d40a03aa8d1'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '9fd7b3af-d461-4ebf-907b-a4ad0c526c0a'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'fe56d2af-7381-49d4-9ca2-9f405981a3da'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '779e9c4d-869b-4f15-a821-4c800c2bd13d'),
(47, 'craft', 'm170206_142126_system_name', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'f884e273-9160-4cfc-b152-514d743fa745'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', 'bb8c0d45-04fb-465f-9f4b-428f6ef9914c'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '2021-07-15 05:06:19', '44bfed47-4e5b-47d8-860a-6e5a4e94180f'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '1fbe9104-6f04-44db-9251-bfa0b4576aaf'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '1049b75e-ee8d-4c21-8e77-229bea54db69'),
(52, 'craft', 'm170228_171113_system_messages', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '1528801c-74e2-43ef-b8d9-5de456c43e2c'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '3f2472c3-e12f-4781-aede-40dcfdefaad9'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'f5148ec1-7e8c-485b-9a31-58f59f703aec'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '3b502bc4-a02f-4864-90f5-6f6eabfa69aa'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'd629db05-05f3-4415-92a8-33631d35abc1'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'b5422153-044b-47b9-becf-eafbd380f876'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'a871e931-77e7-46b6-b0ba-0dd6a4eef222'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '538c9d99-f243-4ffb-af73-df294e74f0dd'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'd7244e3b-9c94-4335-a9b5-cb3df0312c77'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', 'e5977889-21f0-4eec-9ae6-98f1ce7ba330'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '71ae1f26-3429-41c7-b1e3-16e0b43f2b19'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '2021-07-15 05:06:20', '7eb03314-e9da-4910-9d04-1bacc7a5ff67'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '6a01831f-012f-4906-90a9-e6c43f597244'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '0abe8779-4abf-40e7-bfa3-a3759957e68b'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '275c67d8-ea82-4bdc-b7d3-94d31fc93e9c'),
(67, 'craft', 'm171011_214115_site_groups', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '29bee490-9fa5-4985-89ea-26e57745632f'),
(68, 'craft', 'm171012_151440_primary_site', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '7dc53791-8fa4-41d7-85a2-475b073baa42'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '8abc1b1c-8e9d-4a89-a67d-63faefce3168'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '12fde0b2-582a-4e0a-9416-5a8aef85188a'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'bc7a56c9-322a-4d00-888b-130f30ce7c12'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '119a7581-aab9-48ce-9943-5bb2d50175bf'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '560fb8d2-641d-4d78-a47b-0558f9e7981d'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'a47d614f-b470-4adb-a83e-b4d934faca54'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '73bfed7c-8add-428e-a345-2ec2467ed0ea'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'd82d86b1-68eb-4971-b5e0-15cdeed4507e'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '9eb8808f-12f7-4624-971d-ac603c55f1b1'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'b443f60c-5923-4983-b885-68fd722fecb1'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'a856ad07-09be-4f6f-9dbe-7d2505dba6cb'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '45c8e909-107b-4be5-af82-a31c21795516'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '57d1674a-9ae3-4270-8cdc-18ac4bce221f'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'e2dbeeb9-b65c-49a1-a370-5c7dbd12010e'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '65361b86-ff6d-4b61-afe8-d2deb06e9443'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'c25b9b90-3833-479c-871e-5d182fe17848'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-07-15 05:06:21', '2021-07-15 05:06:21', '2021-07-15 05:06:21', 'b192fe4a-5dd8-4bae-8fe6-6647b296e316'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '6c205657-95bb-4ba8-927b-4674e3b30606'),
(87, 'craft', 'm180321_233505_small_ints', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '79b01672-c72d-49d0-a7e2-870144a38797'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'fd039dd0-8348-471d-96d0-84616d0b9d2e'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'f5b4fcfc-c5b2-4ebc-9bf6-f5ab72cd6972'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'e953a97c-81d9-4419-b90a-443f04b85bdd'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '534c3d80-492c-4835-a282-84a2e766ffc9'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '83fc2e49-ab6a-4a79-b982-84a7bb2fada1'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'a2152cd6-1b2b-41a6-99e6-0f333c0402e3'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '9bd5bbf9-428f-453a-9659-8807ff7caaa7'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'd5e47296-6e7d-46d1-b821-eca56a2ca0e5'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'c17df94e-8dc2-4ab0-9c95-f580d6b2dc60'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'dfc5bb28-bc69-488a-9eb7-69e3001910dc'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '7297ebe4-cb01-4c34-b5e8-cbd6a965bf87'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '1c187140-5e4c-4cff-9d2a-3fd3d205b51d'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '93f7845b-bfa3-4971-b0cb-23b2ff9dde48'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '57fbeb37-6262-4e92-b8bc-5d110c1f22bc'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '5b845890-3785-401d-b7c0-8b7c9d336be0'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-07-15 05:06:22', '2021-07-15 05:06:22', '2021-07-15 05:06:22', 'f898f882-b69b-40c3-b4df-35b5866376b6'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'afd5e5dc-9e4b-4811-adac-4acfce94a484'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '3bddcdc3-05e6-42c4-a442-51afbcfaff9d'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'd2f9c5f3-0a5a-4a46-ad6b-b3c29ad79fa0'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'c569b523-4c1b-477b-a26a-d4194d83833a'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'e6ca297e-5955-4001-8b3e-6a40a1554e72'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'f195542a-bd01-4805-8f74-b3a24f8016e5'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '0eeb04ed-0378-4de4-aef2-e8f36cb1482d'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '15077b10-e32f-46f5-9013-17697d27fc56'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'c26f5ab7-d96b-4247-933a-406b3fb3dd05'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '71324135-1c0e-4e54-95e7-4d0884dd703c'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', 'ec1356ac-23a6-44bb-8924-db90ad7db68a'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '1322710e-f25e-4bd3-8b11-2a59b34d9652'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '14459de7-d0e0-444a-934f-e90538351300'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '6736000c-8506-4ef1-966c-be299a513403'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '82c973f0-6a22-45a1-bcae-c9a3261deec0'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '76ad3b14-20f6-4a8c-880e-1adc34e8f92c'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '187745fb-f36a-4bca-98a4-bdfb87323c3e'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '2021-07-15 05:06:23', '6da83558-ac69-4297-8b24-6622f0231ed3'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '87657b82-b6fb-469f-a698-674b1ec1301e'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '7975cd1e-48f9-4901-b534-27f4cebe301d'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '812c8a7a-8162-4026-bf0e-ac1144e90574'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '38fe6461-c9dc-44fb-b9a9-7faf84bf8116'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '4df2b01a-051f-4782-bf15-c216b4d6da66'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '1c6ca7bf-2d4b-4f39-874d-5f25a24e5b68'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '04da3327-5952-4cdd-a94a-fa31e8284424'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '9c8c6849-7230-421b-b502-e6a473602af8'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '9c4b7ceb-b0f4-49ca-9fcb-ff0e0b2064ec'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', 'a121b544-d225-41f1-9927-edb90ccdf5a5'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '6caafd4d-bbc6-4a67-9a38-716378a78aff'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', 'f5e33954-dfb4-4fcf-8aaa-5b93691a6151'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '8ca28d1f-c51f-4426-a7db-27eab0149ccc'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '0a263a0a-67fd-43ee-b1c9-e250b3a24ccf'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '687eb7d5-bbdc-433f-b68f-401a7ef9380a'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '11589382-dfc6-41ef-a6a1-eaf13bc493cb'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '4b391cfd-5f0d-47e3-b1b3-53459df22955'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2266e1ec-168b-4726-87b3-083c6c70b72d'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '2021-07-15 05:06:24', '5666ec2f-7018-4015-a29a-fc7d783133a5'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'c8a50047-d6a7-4049-b6bc-8aba3284c375'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '3b3854f7-1987-4cfa-911b-a2834c502515'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '0b044ebd-e36e-4799-907f-acba036b2c45'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '1a0863c1-59e5-45b3-b6d8-7e46a60438e6'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '9fa3cd38-3ae5-41fd-bfe6-f8e9acd6b3b5'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '0bb51571-71bd-434b-9592-3ba19aa90239'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'c4eb2be5-0766-4965-b26a-94a013254579'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '4aa8a5f0-ccc4-4d4a-b777-264e5fa74eb1'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'd589c3c2-2038-4715-aed7-6e90de4dff87'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '5aa00209-ecc2-4ce4-a875-91ef6aaaee1f'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'c3f184ad-b196-4d9b-b279-1257eebfeecf'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2fc225f6-e50c-41b0-91d1-333005c06d93'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '82fec1d7-ab33-41af-8310-3ecc3f2c409e'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '8acb3283-867f-4c33-97fb-36b07b6db8eb'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'dc8915a8-19e7-40cc-ae34-37f68b102135'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '9cebb394-8ce2-4e1e-83b8-3740e523fdea'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '43f0b820-3a57-4e54-96ee-a60fa72e7832'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'd077a977-6d8d-4013-8259-1a1687c9b428'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '5cce29f0-405d-4c81-9d73-353293bf291d'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '7243b845-bd8a-48c5-af97-f2b9dedf5cc9'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'e0674f14-d1e0-4a04-a94b-96e1678c1e5d'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-07-15 05:06:25', '2021-07-15 05:06:25', '2021-07-15 05:06:25', 'ff58fa23-4bb7-4549-b5f0-eb898c779402'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '28acea6f-f988-4016-a6ef-16b8db5f544d'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '4b0c08c8-e89e-4c39-b66d-4f17ec4f8368'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '7827a40f-ae8b-435d-8896-ce65cb272e67'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', 'df9a018e-b6be-4412-b09a-58acaa451882'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '727caee8-4fd4-4890-a1ec-979dc6990957'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '4971ad26-ea14-4d81-a3a9-e00f8a7f4199'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '97a99589-40c8-4cb4-9c1b-cadc2ed8f81a'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '12b91b86-7df0-441a-8b7a-e5987682bac6'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', 'e29fd6a8-e852-4508-8cb6-d3782d43c906'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', 'e630252a-befe-4c27-b90d-a6000a2e1704'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2c5c706b-5897-4fa1-bd1c-21c15d9b680c'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '5aa55f79-3d86-4f67-8ea5-8faa6064e8ab'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', 'bf7156df-5fbf-4dc6-9956-8ad1beed6dae'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '6ffe6015-2782-4dc2-b763-cf290ced79d3'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '6117335e-52fd-4300-8fc6-32b40ac8aa8b'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', 'd721a941-e4ac-46fd-9de9-a4fbd231cb06'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '98f892d6-d714-40d8-8127-f64a784af437'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '4452e632-ec5a-4c02-8cd6-c5548817c365'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '927c950c-5040-4842-9baa-879dc29e369a'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '2021-07-15 05:06:26', '6381b652-203a-4c49-9b82-12d09b6d360a'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', 'd7e161e1-8861-49c2-972f-2e91dc6ec4d3'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '89497c41-2c94-4b7e-83a8-e8465ce1be3d'),
(185, 'craft', 'm210331_220322_null_author', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', 'db992e52-aa97-43eb-a9b7-4c5364547b3c'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '08e82070-7bc0-4eb4-8d5e-edf4aece3cb6'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', 'c545d9b1-4463-4dc1-87f9-d7c24924cab9'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '951424b4-1081-416e-9010-21d3169b91a7'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '85e09c64-cc1c-4c7e-a07a-939acff2f55f'),
(190, 'craft', 'm210613_184103_announcements', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '2021-07-15 05:06:27', '6aa7372c-285e-4508-91ca-42d6cf192620'),
(191, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-07-15 06:00:32', '2021-07-15 06:00:32', '2021-07-15 06:00:32', '145bdc6a-9953-40d3-8426-44aa3a889bf8'),
(192, 'plugin:redactor', 'Install', '2021-07-15 06:00:32', '2021-07-15 06:00:32', '2021-07-15 06:00:32', 'f7f4c344-1054-48ba-ab0e-fcee7e6d928e'),
(193, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-07-15 06:00:32', '2021-07-15 06:00:32', '2021-07-15 06:00:32', 'fb6f7932-d89e-4ada-aeb2-a9a81f864bc0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'redactor', '2.8.7', '2.3.0', 'unknown', NULL, '2021-07-15 06:00:28', '2021-07-15 06:00:29', '2021-07-15 06:01:07', '8761964e-545a-4efd-9aab-d5d855c366d9');

-- --------------------------------------------------------

--
-- Table structure for table `craft_projectconfig`
--

CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_projectconfig`
--

INSERT INTO `craft_projectconfig` (`path`, `value`) VALUES
('dateModified', '1626342603'),
('email.fromEmail', '\"kajaljethva2203@gmail.com\"'),
('email.fromName', '\"Craft Demo\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.class', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.disabled', 'false'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.id', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.instructions', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.label', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.max', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.min', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.name', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.orientation', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.readonly', 'false'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.requirable', 'false'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.size', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.step', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.tip', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.title', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.warning', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.0.width', '100'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.fieldUid', '\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.instructions', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.label', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.required', 'false'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.tip', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.warning', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.elements.1.width', '100'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.name', '\"Content\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.fieldLayouts.6d815ee7-cc85-47d1-8673-ad9533e342b9.tabs.0.sortOrder', '1'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.handle', '\"aboutUs\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.hasTitleField', 'true'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.name', '\"About Us\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.section', '\"7fa024f6-5801-4635-bfee-ab350a13ec24\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.sortOrder', '1'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.titleTranslationKeyFormat', 'null'),
('entryTypes.038f2931-b440-4c5c-8107-6812c12f9a76.titleTranslationMethod', '\"site\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.class', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.disabled', 'false'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.id', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.instructions', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.label', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.max', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.min', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.name', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.orientation', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.readonly', 'false'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.requirable', 'false'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.size', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.step', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.tip', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.title', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.warning', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.elements.0.width', '100'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.name', '\"Content\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.fieldLayouts.8e57f728-c531-49ce-953e-5f4756c33260.tabs.0.sortOrder', '1'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.handle', '\"blog\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.hasTitleField', 'false'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.name', '\"Blog\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.section', '\"d61d546b-dc1e-45fb-8289-572ce0d7f04c\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.sortOrder', '1'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.titleTranslationKeyFormat', 'null'),
('entryTypes.36ef3782-183d-4f6e-b1f7-b7d2f34046e8.titleTranslationMethod', '\"site\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.class', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.disabled', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.id', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.instructions', '\"\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.label', '\"Rich Text\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.max', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.min', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.name', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.orientation', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.readonly', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.requirable', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.size', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.step', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.tip', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.title', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.warning', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.elements.0.width', '100'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.name', '\"Content\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.0.sortOrder', '1'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.fieldUid', '\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.instructions', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.label', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.required', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.tip', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.warning', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.0.width', '100'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.fieldUid', '\"d27128e9-5d17-4ac7-b3d7-b441e06ae2c6\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.instructions', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.label', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.required', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.tip', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.warning', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.elements.1.width', '100'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.name', '\"content\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.fieldLayouts.f2cfc49b-fb9a-4377-83c2-d82c3f4bfef2.tabs.1.sortOrder', '2'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.handle', '\"home\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.hasTitleField', 'false'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.name', '\"Home\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.section', '\"4980feae-a850-4821-8414-2aab28bc88a1\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.sortOrder', '1'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.titleTranslationKeyFormat', 'null'),
('entryTypes.3b2be009-df43-4586-a27f-bb18235a1a25.titleTranslationMethod', '\"site\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.class', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.disabled', 'false'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.id', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.instructions', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.label', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.max', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.min', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.name', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.orientation', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.readonly', 'false'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.requirable', 'false'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.size', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.step', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.tip', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.title', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.warning', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.0.width', '100'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.fieldUid', '\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.instructions', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.label', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.required', 'false'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.tip', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.warning', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.elements.1.width', '100'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.name', '\"Content\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.fieldLayouts.44150c03-14f2-4a78-9632-38c209d33d4a.tabs.0.sortOrder', '1'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.handle', '\"blogPosts\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.hasTitleField', 'true'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.name', '\"Blog Posts\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.section', '\"e54c85a4-00de-4b7f-906f-2b7590636af1\"'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.sortOrder', '1'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.titleFormat', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.titleTranslationKeyFormat', 'null'),
('entryTypes.8bb3e594-ff9a-488f-b6e3-41cdebcdb880.titleTranslationMethod', '\"site\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.class', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.disabled', 'false'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.id', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.instructions', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.label', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.max', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.min', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.name', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.orientation', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.readonly', 'false'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.requirable', 'false'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.size', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.step', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.tip', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.title', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.warning', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.0.width', '100'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.fieldUid', '\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.instructions', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.label', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.required', 'false'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.tip', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.warning', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.elements.1.width', '100'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.name', '\"Content\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.fieldLayouts.72fda802-ec08-468d-a94e-080a9704b0c6.tabs.0.sortOrder', '1'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.handle', '\"contact\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.hasTitleField', 'true'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.name', '\"Contact\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.section', '\"7886db53-bd14-4b29-9362-dc82fa40ad91\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.sortOrder', '1'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.titleFormat', '\"{section.name|raw}\"'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.titleTranslationKeyFormat', 'null'),
('entryTypes.ef22b476-8c74-46f4-9c7b-85e5a1765b91.titleTranslationMethod', '\"site\"'),
('fieldGroups.03a7a629-c5be-46eb-997b-ba51a4f55731.name', '\"Common\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.columnSuffix', '\"iitdguki\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.contentColumnType', '\"text\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.fieldGroup', '\"03a7a629-c5be-46eb-997b-ba51a4f55731\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.handle', '\"richText\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.instructions', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.name', '\"Rich Text\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.searchable', 'true'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.availableTransforms', '\"*\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.availableVolumes', '\"*\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.cleanupHtml', 'true'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.columnType', '\"text\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.configSelectionMode', '\"choose\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.defaultTransform', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.manualConfig', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.purifierConfig', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.purifyHtml', '\"1\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.redactorConfig', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.removeEmptyTags', '\"1\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.removeInlineStyles', '\"1\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.removeNbsp', '\"1\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.showHtmlButtonForNonAdmins', '\"\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.showUnpermittedFiles', 'false'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.showUnpermittedVolumes', 'false'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.settings.uiMode', '\"normal\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.translationKeyFormat', 'null'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.translationMethod', '\"none\"'),
('fields.47aaeb33-fc15-471d-ac5f-53fdf3d35841.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.columnSuffix', 'null'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.contentColumnType', '\"string\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.fieldGroup', '\"03a7a629-c5be-46eb-997b-ba51a4f55731\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.handle', '\"navigation\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.instructions', '\"\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.name', '\"Navigation\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.searchable', 'true'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.settings.contentTable', '\"{{%matrixcontent_navigation}}\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.settings.maxBlocks', '\"\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.settings.minBlocks', '\"\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.settings.propagationKeyFormat', 'null'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.settings.propagationMethod', '\"all\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.translationKeyFormat', 'null'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.translationMethod', '\"site\"'),
('fields.89beaaec-fc2e-4208-b5f4-2147fe402283.type', '\"craft\\\\fields\\\\Matrix\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.columnSuffix', 'null'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.contentColumnType', '\"string\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.fieldGroup', '\"03a7a629-c5be-46eb-997b-ba51a4f55731\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.handle', '\"featureImage\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.instructions', '\"\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.name', '\"Feature Image\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.searchable', 'true'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.allowedKinds.0', '\"image\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.allowSelfRelations', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.allowUploads', 'true'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.defaultUploadLocationSource', '\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.defaultUploadLocationSubpath', '\"\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.limit', '\"1\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.localizeRelations', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.previewMode', '\"full\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.restrictFiles', '\"1\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.selectionLabel', '\"Add Feature Image\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.showSiteMenu', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.showUnpermittedFiles', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.showUnpermittedVolumes', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.singleUploadLocationSource', '\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.singleUploadLocationSubpath', '\"\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.source', 'null'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.sources.0', '\"volume:d6947288-b758-4a87-91a7-83c13bcd9329\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.targetSiteId', 'null'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.useSingleFolder', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.validateRelatedElements', 'false'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.settings.viewMode', '\"large\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.translationKeyFormat', 'null'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.translationMethod', '\"site\"'),
('fields.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6.type', '\"craft\\\\fields\\\\Assets\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.fieldUid', '\"47aaeb33-fc15-471d-ac5f-53fdf3d35841\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.instructions', 'null'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.label', 'null'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.required', 'false'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.tip', 'null'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.warning', 'null'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.elements.0.width', '100'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.name', '\"Content\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.fieldLayouts.80ab1bff-fdab-456e-a399-5e4b31de27c6.tabs.0.sortOrder', '1'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.handle', '\"footer\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.name', '\"Footer\"'),
('globalSets.26860456-c19f-4358-ba05-c907fdac66e1.sortOrder', '2'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.fieldUid', '\"89beaaec-fc2e-4208-b5f4-2147fe402283\"'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.instructions', 'null'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.label', 'null'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.required', 'false'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.tip', 'null'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.warning', 'null'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.elements.0.width', '100'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.name', '\"Content\"'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.fieldLayouts.66cdaf7c-373f-47dc-997f-3cc67ac92382.tabs.0.sortOrder', '1'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.handle', '\"header\"'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.name', '\"Header\"'),
('globalSets.749c4abb-dafc-4ff2-95aa-84cbdcdead80.sortOrder', '1'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.format', 'null'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.handle', '\"medium\"'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.height', '500'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.interlace', '\"none\"'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.mode', '\"fit\"'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.name', '\"Medium\"'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.position', '\"center-center\"'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.quality', 'null'),
('imageTransforms.a2ec80f0-7f7f-4ba1-883b-e5df70885e50.width', '700'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.field', '\"89beaaec-fc2e-4208-b5f4-2147fe402283\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.fieldUid', '\"81955874-cab4-4240-a3f0-91a479c125f2\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.instructions', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.label', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.required', 'true'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.tip', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.warning', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.0.width', '100'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.fieldUid', '\"3bd63b7c-cacc-4374-b75b-e36987b93ce5\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.instructions', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.label', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.required', 'true'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.tip', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.warning', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.elements.1.width', '100'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.name', '\"Content\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fieldLayouts.6a769366-aea3-451d-9ff9-bb7ca6bb8f4e.tabs.0.sortOrder', '1'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.columnSuffix', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.contentColumnType', '\"string\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.fieldGroup', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.handle', '\"linkDestination\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.instructions', '\"\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.name', '\"Link Destination\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.searchable', 'true'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.allowSelfRelations', 'false'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.limit', '\"1\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.localizeRelations', 'false'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.selectionLabel', '\"Add a Link Destination\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.showSiteMenu', 'false'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.source', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.sources', '\"*\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.targetSiteId', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.validateRelatedElements', 'false'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.settings.viewMode', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.translationKeyFormat', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.translationMethod', '\"site\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.3bd63b7c-cacc-4374-b75b-e36987b93ce5.type', '\"craft\\\\fields\\\\Entries\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.columnSuffix', '\"pqhcpzru\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.contentColumnType', '\"text\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.fieldGroup', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.handle', '\"linkText\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.instructions', '\"\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.name', '\"Link Text\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.searchable', 'true'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.byteLimit', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.charLimit', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.code', '\"\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.columnType', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.initialRows', '\"4\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.multiline', '\"\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.placeholder', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.settings.uiMode', '\"normal\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.translationKeyFormat', 'null'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.translationMethod', '\"none\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.fields.81955874-cab4-4240-a3f0-91a479c125f2.type', '\"craft\\\\fields\\\\PlainText\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.handle', '\"navLink\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.name', '\"Nav Link\"'),
('matrixBlockTypes.b9fd0b54-199e-47fa-bb41-af4b1eacdabc.sortOrder', '1'),
('meta.__names__.038f2931-b440-4c5c-8107-6812c12f9a76', '\"About Us\"'),
('meta.__names__.03a7a629-c5be-46eb-997b-ba51a4f55731', '\"Common\"'),
('meta.__names__.26860456-c19f-4358-ba05-c907fdac66e1', '\"Footer\"'),
('meta.__names__.36ef3782-183d-4f6e-b1f7-b7d2f34046e8', '\"Blog\"'),
('meta.__names__.3b2be009-df43-4586-a27f-bb18235a1a25', '\"Home\"'),
('meta.__names__.3bd63b7c-cacc-4374-b75b-e36987b93ce5', '\"Link Destination\"'),
('meta.__names__.47aaeb33-fc15-471d-ac5f-53fdf3d35841', '\"Rich Text\"'),
('meta.__names__.4980feae-a850-4821-8414-2aab28bc88a1', '\"Home\"'),
('meta.__names__.6ffb3c87-a384-463e-aaed-202be5098a93', '\"Craft Demo\"'),
('meta.__names__.749c4abb-dafc-4ff2-95aa-84cbdcdead80', '\"Header\"'),
('meta.__names__.7886db53-bd14-4b29-9362-dc82fa40ad91', '\"Contact\"'),
('meta.__names__.7fa024f6-5801-4635-bfee-ab350a13ec24', '\"About Us\"'),
('meta.__names__.81955874-cab4-4240-a3f0-91a479c125f2', '\"Link Text\"'),
('meta.__names__.89beaaec-fc2e-4208-b5f4-2147fe402283', '\"Navigation\"'),
('meta.__names__.8bb3e594-ff9a-488f-b6e3-41cdebcdb880', '\"Blog Posts\"'),
('meta.__names__.a2ec80f0-7f7f-4ba1-883b-e5df70885e50', '\"Medium\"'),
('meta.__names__.b9fd0b54-199e-47fa-bb41-af4b1eacdabc', '\"Nav Link\"'),
('meta.__names__.c6c4212a-17a4-47ce-9787-e5a7e5803da3', '\"Craft Demo\"'),
('meta.__names__.d27128e9-5d17-4ac7-b3d7-b441e06ae2c6', '\"Feature Image\"'),
('meta.__names__.d61d546b-dc1e-45fb-8289-572ce0d7f04c', '\"Blog\"'),
('meta.__names__.d6947288-b758-4a87-91a7-83c13bcd9329', '\"Uploads\"'),
('meta.__names__.e54c85a4-00de-4b7f-906f-2b7590636af1', '\"Blog Posts\"'),
('meta.__names__.ef22b476-8c74-46f4-9c7b-85e5a1765b91', '\"Contact\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.defaultPlacement', '\"end\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.enableVersioning', 'true'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.handle', '\"home\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.name', '\"Home\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.propagationMethod', '\"all\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.enabledByDefault', 'true'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.template', '\"home\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.uriFormat', '\"__home__\"'),
('sections.4980feae-a850-4821-8414-2aab28bc88a1.type', '\"single\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.defaultPlacement', '\"end\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.enableVersioning', 'true'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.handle', '\"contact\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.name', '\"Contact\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.propagationMethod', '\"all\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.enabledByDefault', 'true'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.template', '\"general\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.uriFormat', '\"contact\"'),
('sections.7886db53-bd14-4b29-9362-dc82fa40ad91.type', '\"single\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.defaultPlacement', '\"end\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.enableVersioning', 'true'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.handle', '\"aboutUs\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.name', '\"About Us\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.propagationMethod', '\"all\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.enabledByDefault', 'true'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.template', '\"general\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.uriFormat', '\"about-us\"'),
('sections.7fa024f6-5801-4635-bfee-ab350a13ec24.type', '\"single\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.defaultPlacement', '\"end\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.enableVersioning', 'true'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.handle', '\"blog\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.name', '\"Blog\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.propagationMethod', '\"all\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.enabledByDefault', 'true'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.template', '\"blog\\\\index\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.uriFormat', '\"blog\"'),
('sections.d61d546b-dc1e-45fb-8289-572ce0d7f04c.type', '\"single\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.defaultPlacement', '\"end\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.enableVersioning', 'true'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.handle', '\"blogPosts\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.name', '\"Blog Posts\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.propagationMethod', '\"all\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.enabledByDefault', 'true'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.template', '\"blog\\\\_entry\"');
INSERT INTO `craft_projectconfig` (`path`, `value`) VALUES
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.siteSettings.6ffb3c87-a384-463e-aaed-202be5098a93.uriFormat', '\"blog/{slug}\"'),
('sections.e54c85a4-00de-4b7f-906f-2b7590636af1.type', '\"channel\"'),
('siteGroups.c6c4212a-17a4-47ce-9787-e5a7e5803da3.name', '\"Craft Demo\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.handle', '\"default\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.hasUrls', 'true'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.language', '\"en-US\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.name', '\"Craft Demo\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.primary', 'true'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.siteGroup', '\"c6c4212a-17a4-47ce-9787-e5a7e5803da3\"'),
('sites.6ffb3c87-a384-463e-aaed-202be5098a93.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Craft Demo\"'),
('system.schemaVersion', '\"3.7.7\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.autocomplete', 'false'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.autocorrect', 'true'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.class', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.disabled', 'false'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.id', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.instructions', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.label', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.max', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.min', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.name', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.orientation', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.placeholder', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.readonly', 'false'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.requirable', 'false'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.size', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.step', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.tip', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.title', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.warning', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.elements.0.width', '100'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.name', '\"Content\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.fieldLayouts.0116fd2e-e12e-4fbd-875a-cb5596a414e2.tabs.0.sortOrder', '1'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.handle', '\"uploads\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.hasUrls', 'true'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.name', '\"Uploads\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.settings.path', '\"@webroot/uploads\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.sortOrder', '1'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.titleTranslationKeyFormat', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.titleTranslationMethod', 'null'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.d6947288-b758-4a87-91a7-83c13bcd9329.url', '\"@web/uploads\"');

-- --------------------------------------------------------

--
-- Table structure for table `craft_queue`
--

CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, 2, NULL, 15, 1, '2021-07-15 06:52:16', '2021-07-15 06:52:16', '2a904aef-3eb9-4ad9-b88c-66728fe38159'),
(3, 2, 17, NULL, 15, 1, '2021-07-15 06:52:18', '2021-07-15 06:52:18', '36f04e73-5850-4e84-8f77-2e638b50a6c0'),
(4, 2, 18, NULL, 15, 1, '2021-07-15 07:01:35', '2021-07-15 07:01:35', '0e0b0ed6-adb3-4bd6-a317-af9a61c38cf8'),
(5, 2, 19, NULL, 15, 1, '2021-07-15 07:01:38', '2021-07-15 07:01:38', 'b0350154-c16c-485f-807c-8563c9646414'),
(6, 4, 38, NULL, 20, 1, '2021-07-15 09:11:40', '2021-07-15 09:11:40', 'fe15f443-71a3-453e-b742-7c5b1c59a9b0'),
(7, 4, 39, NULL, 25, 1, '2021-07-15 09:11:41', '2021-07-15 09:11:41', 'e6dcf14a-bf92-4b12-acfc-113510441799'),
(8, 4, 51, NULL, 47, 1, '2021-07-15 09:51:46', '2021-07-15 09:51:46', 'cf7e6ce2-6021-44a1-a752-e1267d64acd0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_resourcepaths`
--

CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_resourcepaths`
--

INSERT INTO `craft_resourcepaths` (`hash`, `path`) VALUES
('14e4905', '@craft/web/assets/admintable/dist'),
('1786c020', '@craft/redactor/assets/redactor-plugins/dist/video'),
('19774266', '@lib/fabric'),
('1c261b43', '@craft/web/assets/editentry/dist'),
('1d8b8969', '@craft/web/assets/cp/dist'),
('205c3530', '@lib/velocity'),
('25629f66', '@lib/iframe-resizer'),
('29c1a071', '@lib/fileupload'),
('3129a18f', '@lib/picturefill'),
('31d3c24d', '@bower/jquery/dist'),
('35525f94', '@craft/web/assets/pluginstore/dist'),
('356e3a7b', '@lib/element-resize-detector'),
('368d9d4d', '@lib/jquery-touch-events'),
('3c7b9ad8', '@lib/jquery.payment'),
('3c80d943', '@craft/web/assets/dashboard/dist'),
('3f8c81de', '@lib/d3'),
('409cf19b', '@craft/web/assets/cp/dist'),
('454200b6', '@craft/web/assets/admintable/dist'),
('45cc1c33', '@craft/web/assets/edittransform/dist'),
('46ad7539', '@craft/web/assets/installer/dist'),
('49c94da9', '@lib/vue'),
('4eb75390', '@craft/web/assets/recententries/dist'),
('4f0fbd1f', '@lib/axios'),
('535bfd0a', '@craft/redactor/assets/field/dist'),
('54e091cd', '@craft/web/assets/updater/dist'),
('5bb12fd3', '@craft/web/assets/pluginstore/dist'),
('5c36e1d8', '@craft/web/assets/matrix/dist'),
('5cd8cec9', '@craft/web/assets/feed/dist'),
('5ebe5865', '@craft/web/assets/editsection/dist'),
('639995fc', '@craft/web/assets/updateswidget/dist'),
('65578c0b', '@lib/selectize'),
('6ef5ae95', '@lib/jquery-ui'),
('6f3bc881', '@lib/xregexp'),
('700d11fe', '@craft/web/assets/updateswidget/dist'),
('760e8451', '@craft/web/assets/recententries/dist'),
('7ad6c2cc', '@craft/web/assets/craftsupport/dist'),
('821f93e0', '@lib/iframe-resizer'),
('8ebcacf7', '@lib/fileupload'),
('921336fd', '@lib/element-resize-detector'),
('98f18d58', '@lib/d3'),
('9d2a0d19', '@craft/web/assets/editsection/dist'),
('a4d5fedc', '@craft/web/assets/fields/dist'),
('ab4c9ade', '@lib/garnishjs'),
('ac0c6a75', '@lib/velocity'),
('b02bc59d', '@lib/jquery.payment'),
('b8579fc9', '@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
('b85bc881', '@lib/prismjs'),
('b94297b0', '@craft/web/assets/craftsupport/dist'),
('baddc208', '@lib/jquery-touch-events'),
('bd79feca', '@lib/picturefill'),
('bd839d08', '@bower/jquery/dist'),
('be0a4ee0', '@lib/fabric'),
('c319658', '@lib/garnishjs'),
('c59912ec', '@lib/vue'),
('c9163c33', '@craft/web/assets/feed/dist'),
('c92226dd', '@craft/web/assets/fieldsettings/dist'),
('cc8e2c2', '@craft/redactor/assets/redactor/dist'),
('dc94cfb1', '@lib/timepicker'),
('dfb24e3f', '@craft/web/assets/editentry/dist'),
('e2a5f1d0', '@lib/jquery-ui'),
('e36b97c4', '@lib/xregexp'),
('e872b199', '@lib/axios'),
('e907d34e', '@lib/selectize'),
('ea51da10', '@craft/web/assets/matrixsettings/dist'),
('fe05b6ba', '@craft/web/assets/login/dist'),
('ff148c3f', '@craft/web/assets/dashboard/dist');

-- --------------------------------------------------------

--
-- Table structure for table `craft_revisions`
--

CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_revisions`
--

INSERT INTO `craft_revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 2, 1, 3, NULL),
(4, 2, 1, 4, NULL),
(5, 2, 1, 5, NULL),
(6, 2, 1, 6, NULL),
(7, 2, 1, 7, NULL),
(8, 2, 1, 8, NULL),
(9, 2, 1, 9, NULL),
(10, 2, 1, 10, 'Applied “Draft 1”'),
(11, 2, 1, 11, NULL),
(12, 2, 1, 12, 'Applied “Draft 1”'),
(13, 2, 1, 13, NULL),
(14, 2, 1, 14, NULL),
(15, 20, 1, 1, NULL),
(16, 20, 1, 2, NULL),
(17, 20, 1, 3, NULL),
(18, 20, 1, 4, NULL),
(19, 25, 1, 1, NULL),
(20, 25, 1, 2, NULL),
(21, 25, 1, 3, NULL),
(22, 20, 1, 5, NULL),
(23, 25, 1, 4, NULL),
(24, 20, 1, 6, NULL),
(25, 25, 1, 5, NULL),
(26, 20, 1, 7, 'Applied “Draft 1”'),
(27, 25, 1, 6, ''),
(28, 41, 1, 1, ''),
(29, 43, 1, 1, ''),
(30, 45, 1, 1, ''),
(31, 47, 1, 1, NULL),
(32, 47, 1, 2, NULL),
(33, 47, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' kajaljethva2203 gmail com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' home '),
(2, 'title', 0, 1, ' home '),
(2, 'field', 1, 1, ' this is a paragraph of text list items cards subheading here and heres some more text '),
(15, 'filename', 0, 1, ' natural1 jpg '),
(15, 'extension', 0, 1, ' jpg '),
(15, 'kind', 0, 1, ' image '),
(15, 'slug', 0, 1, ''),
(15, 'title', 0, 1, ' natural1 '),
(2, 'field', 2, 1, ' natural1 '),
(20, 'slug', 0, 1, ' about us '),
(20, 'title', 0, 1, ' about us '),
(25, 'slug', 0, 1, ' contact '),
(25, 'title', 0, 1, ' contact '),
(20, 'field', 1, 1, ' building a website is in many ways an exercise of willpower its tempting to get distracted by the bells and whistles of the design process and forget all about creating compelling content its that compelling content thats crucial to making inbound marketing work for your business '),
(25, 'field', 1, 1, ' most contact pages are designed with function in mind they slap an email address phone and location on a plain background and call it a day but basic contact pages dont inspire visitors to reach out and connect other pages make it easy to contact the company which is awesome except that can also drive up customer service costs '),
(37, 'slug', 0, 1, ''),
(38, 'slug', 0, 1, ''),
(38, 'field', 5, 1, ' about us '),
(39, 'slug', 0, 1, ''),
(39, 'field', 5, 1, ' contact '),
(37, 'field', 3, 1, ' about us about us contact contact blog blog '),
(40, 'slug', 0, 1, ''),
(40, 'field', 1, 1, ' copyright 2020 acme inc all rights reserved '),
(41, 'slug', 0, 1, ' our first blog post '),
(41, 'title', 0, 1, ' our first blog post '),
(43, 'title', 0, 1, ' second blog post '),
(43, 'slug', 0, 1, ' second blog post '),
(45, 'title', 0, 1, ' this is our final blog post '),
(45, 'slug', 0, 1, ' this is our final blog post '),
(47, 'title', 0, 1, ' blog '),
(47, 'slug', 0, 1, ' blog '),
(38, 'field', 4, 1, ' about us '),
(39, 'field', 4, 1, ' contact '),
(51, 'slug', 0, 1, ''),
(51, 'field', 5, 1, ' blog '),
(51, 'field', 4, 1, ' blog ');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', 'end', NULL, '2021-07-15 05:27:38', '2021-07-15 05:27:38', NULL, '4980feae-a850-4821-8414-2aab28bc88a1'),
(2, NULL, 'About Us', 'aboutUs', 'single', 1, 'all', 'end', NULL, '2021-07-15 07:34:46', '2021-07-15 07:34:46', NULL, '7fa024f6-5801-4635-bfee-ab350a13ec24'),
(3, NULL, 'Contact', 'contact', 'single', 1, 'all', 'end', NULL, '2021-07-15 07:36:43', '2021-07-15 07:36:43', NULL, '7886db53-bd14-4b29-9362-dc82fa40ad91'),
(4, NULL, 'Blog Posts', 'blogPosts', 'channel', 1, 'all', 'end', NULL, '2021-07-15 09:31:08', '2021-07-15 09:31:08', NULL, 'e54c85a4-00de-4b7f-906f-2b7590636af1'),
(5, NULL, 'Blog', 'blog', 'single', 1, 'all', 'end', NULL, '2021-07-15 09:50:03', '2021-07-15 09:50:03', NULL, 'd61d546b-dc1e-45fb-8289-572ce0d7f04c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_sites`
--

CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections_sites`
--

INSERT INTO `craft_sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'home', 1, '2021-07-15 05:27:39', '2021-07-15 07:01:28', 'd1f1e19d-e8c7-4691-812d-7146556ebbec'),
(2, 2, 1, 1, 'about-us', 'general', 1, '2021-07-15 07:34:47', '2021-07-15 07:34:47', '0ad6cd6b-3eec-49c8-a4cf-44b5218f8911'),
(3, 3, 1, 1, 'contact', 'general', 1, '2021-07-15 07:36:44', '2021-07-15 07:36:44', '1d1d91bf-501d-4cd3-90e1-e80ae8b473cb'),
(4, 4, 1, 1, 'blog/{slug}', 'blog\\_entry', 1, '2021-07-15 09:31:08', '2021-07-15 09:31:08', '85bb954a-913d-4094-8663-f86cf0fd49b6'),
(5, 5, 1, 1, 'blog', 'blog\\index', 1, '2021-07-15 09:50:03', '2021-07-15 09:50:03', '453c7165-9f7f-4cd4-b117-3b7cdf9ec5c5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sequences`
--

CREATE TABLE `craft_sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'hdIC3-P-M3tLAKxk6-ZnQq-pnm2XMJMYmEE4vDHkXvPW97Ya9N5vHHk8_sv7VzydsuhEBh6MEW04boZq1Aq2paS6qjuCfg3M-VGc', '2021-07-15 05:19:53', '2021-07-15 10:14:33', '60b65630-1266-4310-879e-b731e822f954');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_sitegroups`
--

CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sitegroups`
--

INSERT INTO `craft_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft Demo', '2021-07-15 05:06:13', '2021-07-15 05:06:13', NULL, 'c6c4212a-17a4-47ce-9787-e5a7e5803da3');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sites`
--

CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sites`
--

INSERT INTO `craft_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Craft Demo', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-07-15 05:06:13', '2021-07-15 05:06:13', NULL, '6ffb3c87-a384-463e-aaed-202be5098a93');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemmessages`
--

CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachequeries`
--

CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpreferences`
--

CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_userpreferences`
--

INSERT INTO `craft_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'kajaljethva2203@gmail.com', '$2y$13$0/fL34jzgE9ObW3trNgAqu44.P6HyCjAy8CRYs.VoTq8Rr1HG1wmO', 1, 0, 0, 0, '2021-07-15 05:19:54', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-07-15 05:06:15', '2021-07-15 05:06:15', '2021-07-15 05:20:06', '58836f5c-1f3e-4d30-9de5-0cfd934dabb5');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumefolders`
--

CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_volumefolders`
--

INSERT INTO `craft_volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'Uploads', '', '2021-07-15 06:45:24', '2021-07-15 06:45:24', '04b2f21e-14f1-4c86-814f-801ee3598776'),
(2, NULL, NULL, 'Temporary source', NULL, '2021-07-15 06:51:27', '2021-07-15 06:51:27', '1a32a353-7a8d-404d-a7b3-3e1e37fefe05'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-07-15 06:51:27', '2021-07-15 06:51:27', '15ef3876-caa1-4f5b-b498-b4f72aafb088');

-- --------------------------------------------------------

--
-- Table structure for table `craft_volumes`
--

CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_volumes`
--

INSERT INTO `craft_volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 2, 'Uploads', 'uploads', 'craft\\volumes\\Local', 1, '@web/uploads', 'site', NULL, '{\"path\":\"@webroot/uploads\"}', 1, '2021-07-15 06:45:23', '2021-07-15 06:45:23', NULL, 'd6947288-b758-4a87-91a7-83c13bcd9329');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-07-15 05:20:05', '2021-07-15 05:20:05', 'a841e00c-10e5-4cd1-ade1-eb23b3b0875c'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-07-15 05:20:05', '2021-07-15 05:20:05', '3702374e-9258-44ab-af7f-dba6dbb610f8'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-07-15 05:20:06', '2021-07-15 05:20:06', '5b7d56b0-5e3b-4b25-a76d-dd1a603b9f23'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-07-15 05:20:06', '2021-07-15 05:20:06', '48b69d68-0812-4954-b4ba-f7a6995211aa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_announcements`
--
ALTER TABLE `craft_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_kdjvcnudkrwylziiskolodserskkrpryshoq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `craft_idx_wotrvntffuoopnrtcymbiepdyqvveoelnunm` (`dateRead`),
  ADD KEY `craft_fk_qeldbrsigmjrycqmxdfqegxqgeukoemvcxzl` (`pluginId`);

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ctdxdkeixcisohenstgfssluehopflwejjkb` (`sessionId`,`volumeId`),
  ADD KEY `craft_idx_shzpnaorrpqybsjxsvgfvpymxoslsjkenowr` (`volumeId`);

--
-- Indexes for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_fotkdgcrzqgrkmucslgfswaaqzidptvfbqzp` (`filename`,`folderId`),
  ADD KEY `craft_idx_nfnzpscnnjwhudyntskwraqqgjnxsmrgvdbp` (`folderId`),
  ADD KEY `craft_idx_syejjuviopeflwnismngdlnpzdbcxemanozk` (`volumeId`),
  ADD KEY `craft_fk_fvnmwcoeatvibbucgciafwiauziqutuuttbr` (`uploaderId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ceemthqttcruskmvetioscjiynmnoinwmowu` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_gttdxwwuvyjlnfgxhdxbfxtcqnbzobmlsofg` (`name`),
  ADD KEY `craft_idx_lwejehcqttiuielknavuzgdxxqytlkkzvems` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_txnbbopzuyqcafxzfgvjxwhocsygxwdnjqnj` (`groupId`),
  ADD KEY `craft_fk_gggmbmbbwlxqbguzcufynutlotpvmyictlgt` (`parentId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_atnzfpukfhtzavjxivtewdvkubzqzvdtfpor` (`name`),
  ADD KEY `craft_idx_lqmucqcnegdanmwkebvexfquqcmpgwwecvok` (`handle`),
  ADD KEY `craft_idx_jpqaljoqhymmnjmdyezewzgyvcyjyvfvoodt` (`structureId`),
  ADD KEY `craft_idx_otprbtmgzdhtphyoagcivjvwpzrxjqxoifdh` (`fieldLayoutId`),
  ADD KEY `craft_idx_ztstqemlpnwxwoluvvjuarqhxmapqctnzibm` (`dateDeleted`);

--
-- Indexes for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_cwccdbeqvtcanidaiiafmbogiovjmvxxvptb` (`groupId`,`siteId`),
  ADD KEY `craft_idx_levpznopidwdpfjgjxrdjxvtqwrphumxucqk` (`siteId`);

--
-- Indexes for table `craft_changedattributes`
--
ALTER TABLE `craft_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `craft_idx_iiwhnaxlftduyvpurocvbscfxuspvvdivzrd` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `craft_fk_ujnrrebenhyooslgmurkejfwlcxsimgmgjml` (`siteId`),
  ADD KEY `craft_fk_ktjgggehseefrihbxalxgwijahtfdhxaxlyk` (`userId`);

--
-- Indexes for table `craft_changedfields`
--
ALTER TABLE `craft_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `craft_idx_dmrnfvpziznimlqyuzqacjdkxqudxjqzgahh` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `craft_fk_nyudandcbomstfejjewlkbzkbynimqbjmbrq` (`siteId`),
  ADD KEY `craft_fk_dmjbvgbwztfrkmczqynjqqhididrgtqzxmiu` (`fieldId`),
  ADD KEY `craft_fk_eoupoykczautkndnylnkganvyouxnkovkhee` (`userId`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_rdyxxqeqncjtxyusijxtdkxjettvqpofrkju` (`elementId`,`siteId`),
  ADD KEY `craft_idx_zvwhsevklmmmdffsvwrbbfbyqvquhvrahtti` (`siteId`),
  ADD KEY `craft_idx_blxmgfpnlgjnxhdatzgyfaqenddqlgoviqus` (`title`);

--
-- Indexes for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fk_mwthczbfpfwbtlicmnxukinowuxqkcexxnmt` (`userId`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_sqqiewcuvmmpfttzygdhvytzvxxpsmoydwzf` (`key`,`fingerprint`);

--
-- Indexes for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_wtkjmvrpyaxfojeewpvnbrgbqxmsjwzyykso` (`creatorId`,`provisional`),
  ADD KEY `craft_idx_ruhxuuiypouykoxmpeadzphzbsxjaipmdpyd` (`saved`),
  ADD KEY `craft_fk_nxwuspfnadvfyqnvxieaeanojmrwkmtyrfxk` (`sourceId`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_pcoaxcfdyzxcwjvnhxbvmibnvtliszcpnowc` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_khqjvuegnyxzuvgyeuzcgiuxzvetogrkugwu` (`dateDeleted`),
  ADD KEY `craft_idx_xpejfotcusriohrrackujakyiopbmjjhbxcc` (`fieldLayoutId`),
  ADD KEY `craft_idx_jakhtvdfeabyickmdyjtsgtltizevifqghhk` (`type`),
  ADD KEY `craft_idx_kjaqpyimczalnqzhxxzdcjuvolaxnqrnzafs` (`enabled`),
  ADD KEY `craft_idx_xwloxuzfhhywgxlsrtidwnerqcbzbujmqmxj` (`archived`,`dateCreated`),
  ADD KEY `craft_idx_sutyszdijauyjawkmfukxhsdwqwvklnhtmjm` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `craft_fk_zmgsslwytjmbmnwlznzveuzrralvolgvmuff` (`canonicalId`),
  ADD KEY `craft_fk_ybaygrxatqarfqvpzxtnkkgccbxxmgggkogh` (`draftId`),
  ADD KEY `craft_fk_yqpyzdjsqfbzgucuaaerowzgmhumrpgrwfzl` (`revisionId`);

--
-- Indexes for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_kyjuyyljcaqirrccbwngipucwfnbjqgwvpnv` (`elementId`,`siteId`),
  ADD KEY `craft_idx_lzuekcigavbwblgbxvhvuajdzuvmtitrdvpq` (`siteId`),
  ADD KEY `craft_idx_mwatgrarpcwbdbipxbvfpbexqhwrdxggwbhk` (`slug`,`siteId`),
  ADD KEY `craft_idx_wzcfpqlpcekxujyumlzvkcbdhbotulxkykpa` (`enabled`),
  ADD KEY `craft_idx_ixfgrufpllflhfaetlweajwgmoszvjdkkqqu` (`uri`,`siteId`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_hlqrusmeozuzxarwqvhiqsmgnwbdmnbptzal` (`postDate`),
  ADD KEY `craft_idx_ntijkhichgmyellgycejcryuabcsjinlhtbb` (`expiryDate`),
  ADD KEY `craft_idx_fxrugksoaefqsunmangsumidkahoefywmyiy` (`authorId`),
  ADD KEY `craft_idx_jzcomrydsomgdlvowikozvejyogbwcfwqnvc` (`sectionId`),
  ADD KEY `craft_idx_dlexbrcxowwgnfuuiitssptzienexgrrvgmc` (`typeId`),
  ADD KEY `craft_fk_nuvpyfodtbsxethfwtcnxewmrppasxytxajx` (`parentId`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_hxfbbtrirjdocnswxcjlcmqzdshdfdawwyah` (`name`,`sectionId`),
  ADD KEY `craft_idx_bnjiwuwlpipkwlefguqxdxavoufoehknqvlh` (`handle`,`sectionId`),
  ADD KEY `craft_idx_vfxybrbjdfodmciqmzrnkrrxusisicljpbmp` (`sectionId`),
  ADD KEY `craft_idx_oxsevubrlwuxuwmjurnauoehnbelxermdlzc` (`fieldLayoutId`),
  ADD KEY `craft_idx_hpwotngvrojycilxnbttmolekhvddefuaamk` (`dateDeleted`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_smilhgeghwyvwjgmycxvsrovlvgpyceemxyw` (`name`),
  ADD KEY `craft_idx_zofzpfplevrthchnlklnojenhxpboxoaiwsg` (`dateDeleted`,`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_muqonbznzztyvtvdwdnsolloskiqgcxpjvcv` (`layoutId`,`fieldId`),
  ADD KEY `craft_idx_hlrevgtmebnsbkzdcuvsfcxmmmxphsokjtvd` (`sortOrder`),
  ADD KEY `craft_idx_pxmscewsfnctljlipwxvfpjaemqtxizqagqg` (`tabId`),
  ADD KEY `craft_idx_bfxmautfdhgzythagcqgqnulrdzbyllrfcuy` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_wnppxaprkkjfgrhdsiaqrmkomheiqmzojtix` (`dateDeleted`),
  ADD KEY `craft_idx_uwcverzhkursabeupgfqladewcncosnostgt` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_qsxwoohdutsdejosqjbgqvupjdlptxbeeajx` (`sortOrder`),
  ADD KEY `craft_idx_moinxorlkmuaplrnhemzwyztucvjpqhlykod` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ylhregyosqwovbpfxymdqhonhqcgpeowkoyf` (`handle`,`context`),
  ADD KEY `craft_idx_fafimwpimzcnvxkfyuypsiuhzflnvtmvoyni` (`groupId`),
  ADD KEY `craft_idx_nfnwuwiyygyqcwgcxskkybvgmjsiolhsthnw` (`context`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_jstthuwutppudgmyccktmxebptykqneiebjv` (`name`),
  ADD KEY `craft_idx_hqfnepwzjlrbdcswprhrxzilugncjmtevidd` (`handle`),
  ADD KEY `craft_idx_btwbmnjorvcsxcbgliprljitowyghmjjykdn` (`fieldLayoutId`),
  ADD KEY `craft_idx_uxpeenvntezfedjopbpihdvrncubxcyupemp` (`sortOrder`);

--
-- Indexes for table `craft_gqlschemas`
--
ALTER TABLE `craft_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_lvbseldsjykhiaziglwjgjmhpkwzkhuglipg` (`accessToken`),
  ADD UNIQUE KEY `craft_idx_qucfwzattkggonzokcqgbueulahropfnvfhv` (`name`),
  ADD KEY `craft_fk_gvffjqfsndbbwpgxoeisewjvorgijencndbd` (`schemaId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_pzpsjhipnyfznxzugbcofhusmikrqabpcuag` (`ownerId`),
  ADD KEY `craft_idx_cypgwjxgrobfaoadfzdkfuwrpmhsuzcrwned` (`fieldId`),
  ADD KEY `craft_idx_bykauxvveyawzjpzlnbxmdnhbrgxgswgunhy` (`typeId`),
  ADD KEY `craft_idx_odapyfajljktfnxegtieoqrgvyuqxxlflnwl` (`sortOrder`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_oydvgrejwyfbweqwrlpqvfaqpvfaaqrduomc` (`name`,`fieldId`),
  ADD KEY `craft_idx_vfvobzvaintnskofmbhifenjdaumyjuauumh` (`handle`,`fieldId`),
  ADD KEY `craft_idx_xwwtllqmiqstjsyqffouqqojivcqzcbtfycd` (`fieldId`),
  ADD KEY `craft_idx_onstsjcukchdsxnaizntmczbohsifangcgwk` (`fieldLayoutId`);

--
-- Indexes for table `craft_matrixcontent_navigation`
--
ALTER TABLE `craft_matrixcontent_navigation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_ihbtueoioyulvejcvwusrajrnapacwjouopk` (`elementId`,`siteId`),
  ADD KEY `craft_fk_hddrdmhzhtnhprpglrukpvpeoniqbeeqvhcb` (`siteId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_sfggsyaadncghhomlvhqfixcvbtpfnjawtis` (`track`,`name`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_rxxsmpxgmjpvutykbupztpemmokqxhwdjjxn` (`handle`);

--
-- Indexes for table `craft_projectconfig`
--
ALTER TABLE `craft_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `craft_queue`
--
ALTER TABLE `craft_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_eiighfqfkqxvmlqxccjnbgjopyqkgakrzmbl` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `craft_idx_vrvzrfqgszfippyheveqsnrkhwcijnefcnnv` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_dupanodivujqbiyjnqcafwrmhivojvybajet` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `craft_idx_qrfqtkvvevmtfvrrcynnamybprvmzsqqpola` (`sourceId`),
  ADD KEY `craft_idx_nhkbqcxbickufdownqmhzjtjariavomqvteb` (`targetId`),
  ADD KEY `craft_idx_boegevwccsnpcykeonspsgtzdgfhsqqeapde` (`sourceSiteId`);

--
-- Indexes for table `craft_resourcepaths`
--
ALTER TABLE `craft_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_hqdjjsyexqdjpnlkszgbxkexfbtjudkjstnx` (`sourceId`,`num`),
  ADD KEY `craft_fk_bupbbterzlcykfxtlxazmwarltwcjisuhkek` (`creatorId`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_idx_jggpzqrbkduqynjwxyfrhvccnssvhsqxghfa` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_pygdmqsdupxpxudrndfknhixbqkuxpzhavre` (`handle`),
  ADD KEY `craft_idx_pwogdccspmmvbqxtugizgbyyvzhpjxdrboys` (`name`),
  ADD KEY `craft_idx_cmdabiqtzphgevpwdwufcbpgzhirubokoryz` (`structureId`),
  ADD KEY `craft_idx_hoonzzynmpfuldklkwjkrgosxczjgoyggbys` (`dateDeleted`);

--
-- Indexes for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_oaqpujnapbmkfpkvrhvoexfxmnpyklfggjsp` (`sectionId`,`siteId`),
  ADD KEY `craft_idx_graswjxlgchnayzvmbikulzeicyuqwejwjlv` (`siteId`);

--
-- Indexes for table `craft_sequences`
--
ALTER TABLE `craft_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_fkopfwqtcoiltxldinpoettjtgkddkkqyral` (`uid`),
  ADD KEY `craft_idx_lkuhvgwuvvmpqmesqfqzkwawrbsgptxephxh` (`token`),
  ADD KEY `craft_idx_unofldybguxmhvewmxivyqkufgrvlscgpsxx` (`dateUpdated`),
  ADD KEY `craft_idx_yuorqydruzwlbursideogrfnwjypecuxtrrl` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_bfumfjspdrmujfukzcvdqrmnvbqujwkxfqvd` (`userId`,`message`);

--
-- Indexes for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_tijukrlzdeoeiwfaktxiyhmykerbiuyqsoqf` (`name`);

--
-- Indexes for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_jeonghtodfdewkoxgmycjsvwqevtqojmtlto` (`dateDeleted`),
  ADD KEY `craft_idx_iwxamltmvgvlvtjnnlgfntopdxdyjsvgzqrs` (`handle`),
  ADD KEY `craft_idx_ljfabwzuuxhwwygmxjthrxwgdonqgebbqfrs` (`sortOrder`),
  ADD KEY `craft_fk_wonteufbyuzaanujyvchgwjtswitjffftanz` (`groupId`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_kndznrivcsmfibijxlraulyfcagqdhqynxfg` (`structureId`,`elementId`),
  ADD KEY `craft_idx_olkafpbtnyjgpuhpawovnbffyxslexhxiwmm` (`root`),
  ADD KEY `craft_idx_nxdrkqiwewfyzimcbnnmnpurpjmxrjvrmdxs` (`lft`),
  ADD KEY `craft_idx_kmmvmucdqcoakuvvpxbqcnfsbyccsvbcwayk` (`rgt`),
  ADD KEY `craft_idx_kbvjbshnbvsatmspiajkgsbfbjcnxodbyqqe` (`level`),
  ADD KEY `craft_idx_necrbvxsoahjejrtbvmfggicxwgvmonjcrvv` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_bygcrxqsebsygvcxxnjlrlfthifahvfplhlm` (`dateDeleted`);

--
-- Indexes for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_vnskcdzrbovddaghhqblzvzvmiaoahghgjhv` (`key`,`language`),
  ADD KEY `craft_idx_ecbakwtvwvsraudqilhcefmaccayoucfqftl` (`language`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_fsuiuwcglcxcfemwbxfvyorkodrbwhehtilu` (`name`),
  ADD KEY `craft_idx_fywpcjwdlrhcmtfvomlvzdajciedpuujefxg` (`handle`),
  ADD KEY `craft_idx_kqluamdrtkoqxbmgfyypmfzxekbhuwnouehc` (`dateDeleted`),
  ADD KEY `craft_fk_rpmdtbejpjyhnqgblybjvvkkzblckmjqxyzl` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ngjuvvfzxyyvonmcmosbhcevaqgaviohvmcb` (`groupId`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_xsetjncbrvvenufogqtpqxotcvfrypfkwzqs` (`cacheId`),
  ADD KEY `craft_idx_bbydgevourjrkebaaogwqkvtydeknfdwdbkd` (`elementId`);

--
-- Indexes for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_jtwblatfbgfsijrwcrxzwvpouthcmugkopdb` (`cacheId`),
  ADD KEY `craft_idx_jfhggxhspfogsibdjjfmpkkhwtsgpbxgsnay` (`type`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_azjrrakhtxryklfshyzhddnuyyfrrmwbfbzm` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `craft_idx_vyndkhstlkrssgcwktuqpadyrnkhtblggmgg` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `craft_idx_vsibuerrflkwtajkwrlrbybqzuuadphjymwo` (`siteId`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_ozbcytnibftaueaftmlkzlfutjeylsxzvpvr` (`token`),
  ADD KEY `craft_idx_djnbndugbdftbywvnrrpvqwfksqpuosyvcxd` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_gfbijqnoddshyyjxrtfjwomwnnqrgxusvesl` (`handle`),
  ADD KEY `craft_idx_bepwzvzqlivfqcqgezrdligniwiaaldiclpi` (`name`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_tuvklnvynahhyfjiorgtzdqgcuiyjtqjzhjm` (`groupId`,`userId`),
  ADD KEY `craft_idx_llnjbsfdgwklchanaezkxfilpjvsicxqibua` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_mfxnflgahwkkuefexsgfwqvvnmroscvmhxkq` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_ncjiobqdhbdarpyscwnlwjotrpbwykwfoclq` (`permissionId`,`groupId`),
  ADD KEY `craft_idx_vrshgpyeyokzfzvrjcxxgxbdxawsbubioiwv` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_kjgvyqtxkwksgqmojbzrvinzjuvgmnxhkgte` (`permissionId`,`userId`),
  ADD KEY `craft_idx_uyypjvjefqunzlfcpwyxympmkbflncgwfcks` (`userId`);

--
-- Indexes for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ktmfjybmmtwlgsfeekslsgamrvzpamgjmham` (`uid`),
  ADD KEY `craft_idx_gvkaxvbfapaharjhgmrxdqqfhxgqjejkjekk` (`verificationCode`),
  ADD KEY `craft_idx_gkzmqzlncxdbvwwiuakcpbhfrwxyepupjvic` (`email`),
  ADD KEY `craft_idx_yntdyeytnnoochqdvczlpsaczkraxaajqjae` (`username`),
  ADD KEY `craft_fk_hdrqbuowvlqdhayxkzdxkspkvdacisqmhbyc` (`photoId`);

--
-- Indexes for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_idx_gkjqmxwuospavfortplnpsyxsipqkugwosjw` (`name`,`parentId`,`volumeId`),
  ADD KEY `craft_idx_kbohdgbixqkcwcxowiuyrypvdnoljnoesggu` (`parentId`),
  ADD KEY `craft_idx_jiszapkbfsfgsvsdeelrrldawaropdbizfbe` (`volumeId`);

--
-- Indexes for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ovzzmnqcbsnpimowbuolinovoezjhvbkmwao` (`name`),
  ADD KEY `craft_idx_xqxjufzxchrfinwwjegmlbrrconluvwqyeym` (`handle`),
  ADD KEY `craft_idx_nsgidjfcjuxeluinjabtgdyiuamqnsetyryc` (`fieldLayoutId`),
  ADD KEY `craft_idx_qegedpdukwwhwfnziafixhnzwcknabcogrcl` (`dateDeleted`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_idx_ozlzxzgyqbrpktoycfecaknxzexptnoqgnqf` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_announcements`
--
ALTER TABLE `craft_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `craft_gqlschemas`
--
ALTER TABLE `craft_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_matrixcontent_navigation`
--
ALTER TABLE `craft_matrixcontent_navigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_queue`
--
ALTER TABLE `craft_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_sitegroups`
--
ALTER TABLE `craft_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_sites`
--
ALTER TABLE `craft_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_systemmessages`
--
ALTER TABLE `craft_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_announcements`
--
ALTER TABLE `craft_announcements`
  ADD CONSTRAINT `craft_fk_qeldbrsigmjrycqmxdfqegxqgeukoemvcxzl` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_sadmnafqixqtfthrdoqavhxkruyhwzhwxyoy` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_fk_jmijkgzyaobvzjaudtccguubufznskgycnjj` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assets`
--
ALTER TABLE `craft_assets`
  ADD CONSTRAINT `craft_fk_bgknmkcxmhgazlhvhpxgwdfaositfhesfunw` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_fvnmwcoeatvibbucgciafwiauziqutuuttbr` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_hviacugrnbhioomwadbwdaiuwzfnwlkingko` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_qjnhcztwvymrbfyxrcdteoimjklzendhposo` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_fk_egcifisvhnnqcegwfwqbenvaagqwkgzvcyjl` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_gggmbmbbwlxqbguzcufynutlotpvmyictlgt` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_ytdafsiojfpgtkuhotaxmiclbstdvllffera` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_fk_kfbtwxhbtvakpprgudndsizffnkqdxyyykex` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_qjfftkjtfnsomatgxaipjnhlhgrdydgoysln` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_sites`
--
ALTER TABLE `craft_categorygroups_sites`
  ADD CONSTRAINT `craft_fk_crqqxxqhciybwukgiortimbxgsvyxwyqmkmg` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_jsuuwdjdpjtoydbfioejqfwpzeakovviytdl` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_changedattributes`
--
ALTER TABLE `craft_changedattributes`
  ADD CONSTRAINT `craft_fk_kredczqkdvkmidfredeajblqkdsroidukvlx` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_ktjgggehseefrihbxalxgwijahtfdhxaxlyk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_ujnrrebenhyooslgmurkejfwlcxsimgmgjml` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_changedfields`
--
ALTER TABLE `craft_changedfields`
  ADD CONSTRAINT `craft_fk_dmjbvgbwztfrkmczqynjqqhididrgtqzxmiu` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_eoupoykczautkndnylnkganvyouxnkovkhee` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_nyudandcbomstfejjewlkbzkbynimqbjmbrq` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_zhmkqrrtnaqyqmwjtvqnyeravlspvcohwdtc` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_fk_lnnpiwuvdsfshysdapeuzqxqjjvipjgsxfqj` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_xptcpzpjjnjuhfmcmrurrrpmowinziyvbglh` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_craftidtokens`
--
ALTER TABLE `craft_craftidtokens`
  ADD CONSTRAINT `craft_fk_mwthczbfpfwbtlicmnxukinowuxqkcexxnmt` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_drafts`
--
ALTER TABLE `craft_drafts`
  ADD CONSTRAINT `craft_fk_nxwuspfnadvfyqnvxieaeanojmrwkmtyrfxk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_sjhhbfknnzavzctruphnkjoaqmnoyiydthdz` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD CONSTRAINT `craft_fk_nxswpdigpkimynajltzvvfdackbsegthqttb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_ybaygrxatqarfqvpzxtnkkgccbxxmgggkogh` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_yqpyzdjsqfbzgucuaaerowzgmhumrpgrwfzl` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_zmgsslwytjmbmnwlznzveuzrralvolgvmuff` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_elements_sites`
--
ALTER TABLE `craft_elements_sites`
  ADD CONSTRAINT `craft_fk_lgvsmdpkxpmabgjdsaguskfiljjdljlnwvua` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_lilwtxggickmmdvjspxnhexeuzphelkbcrjn` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_fk_iskgjbqszhdtsgqfypfzdyxaxsinaohtvuht` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_nuvpyfodtbsxethfwtcnxewmrppasxytxajx` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_sdvfmcdhsgulafsowetcvwwncxeocjahkylh` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_tngyaujqchyhehctiblrrpdgmgigkzqibnsi` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_yfgzmecwyofrincfhkfjxesrhpfnixxnppqz` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_fk_phprpvypvwnfhjspnqpuewexaarrpjrzexki` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_qybecfgwgvwrorbxpgfabrkuzeofmaudaqhs` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fk_nhmdnfrdmhdhefrhpwdtymgoebhnnjavjyok` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_pnzazjkssudrsgwjqyxlskbafbvgusmotnto` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_rlxtpbgefspabveebqmbpwrymcqewlwsixzd` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fk_risxbvqyjvsfuvpkvhpruhhubrxzmrqvtpns` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fk_zdrzwtnsbxercjgrwkpqdymwqwhznbkaqqra` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_fk_mrxvsptgtmqgsfcjxbrnixvdmlfxqudxcqqr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_ozdqznunhotminzabsnpeegbecftqtzismkb` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_gqltokens`
--
ALTER TABLE `craft_gqltokens`
  ADD CONSTRAINT `craft_fk_gvffjqfsndbbwpgxoeisewjvorgijencndbd` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_fk_binqhrlhmovxtojqxxdobwwelggbqadgpefx` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_ljdhcvwovccmgsleqizxhbfyecwyzsjueala` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_oxxgjjbxktzkylobotgzxunkcohjvyucekmh` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_xoartujbyfdtcncopxwqwwskpuymgxndykom` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_fk_aekvcvsyajmpifyuybrcktyqzlqtigwiabut` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_caxcvkpxxtcgywlzhdpuqofkhdotwwsvwgyl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_navigation`
--
ALTER TABLE `craft_matrixcontent_navigation`
  ADD CONSTRAINT `craft_fk_hddrdmhzhtnhprpglrukpvpeoniqbeeqvhcb` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_sobpsjuswiedfhoqubekbcvfuuvyymhrntqe` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_fk_clsfxvulszyzvvalbuniorktizguntcbblws` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_ogxwxeenslizaalynghthjemnulvsvfrgiyn` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_rqcwayyzpwmgdbbpiwxtlqohirjqrrluastm` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_wjsdbflxpntllrmsnpueuvqevgjkrqspnzyg` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_revisions`
--
ALTER TABLE `craft_revisions`
  ADD CONSTRAINT `craft_fk_absodxyjcybfeqzfcspxhcjggscqzcikyctu` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_bupbbterzlcykfxtlxazmwarltwcjisuhkek` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_fk_yelirncswvgtuvuqnsaqlxursvqryjmnoogw` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_sites`
--
ALTER TABLE `craft_sections_sites`
  ADD CONSTRAINT `craft_fk_arokedufrnyzbkzfytvblkknudufgmfridha` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_fk_htxdlvkmiymobfuqaaffqdmbqoooinzzujjm` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_fk_zeouzreqgspvodmumrrpmrqcnoarzcyddvso` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_fk_gjjzyjoivofsjaqwkweatwcyddmlbylreucz` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sites`
--
ALTER TABLE `craft_sites`
  ADD CONSTRAINT `craft_fk_wonteufbyuzaanujyvchgwjtswitjffftanz` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_fk_hqesleeroagwvecliarptftaqgbjyubruwqq` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_vncbgebcrjqzjejcaejzecarknwzouontqhz` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_fk_rpmdtbejpjyhnqgblybjvvkkzblckmjqxyzl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_fk_sbviytgvfceziafjdnjasoemeqxbnmykiogj` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_vpzdwifbwwkkksyottqtecuvmmlrtptraemv` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_fk_ghbtpxtlmkoochtjficeqlwhvutcqevkceag` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_rhbyfxoegrufvnahwshpstpsgpoleagkrrgb` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachequeries`
--
ALTER TABLE `craft_templatecachequeries`
  ADD CONSTRAINT `craft_fk_uagabwjmjcimwkjpbwrxmfnpfzaqzmsmcctf` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_fk_znfqowwjzfjkgveaicqfczqygndrbhikubhh` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_fk_heqlqoerxleossnvvaxoxtubbeyizovcaype` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_jydknpkmtlwbggxezecsmzvlbakzwirfvpmp` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_fk_nnqabfhlagtjwwwgvvsykghahxxoovfggnml` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_smtwmupqjnrkydxkgmgjajcbopwibykvxyia` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_fk_viviiugorsvythiudaggxlidtfpyrottwshy` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_vxkuabpirqudmptsvhrpouayofnsibcmvbir` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpreferences`
--
ALTER TABLE `craft_userpreferences`
  ADD CONSTRAINT `craft_fk_kidpgdkekkezdllmumruymjjimqmiamyyhvx` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_fk_hdrqbuowvlqdhayxkzdxkspkvdacisqmhbyc` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_fk_tebnjgowucqjtnkykofxwtoeboywcmyabsub` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_volumefolders`
--
ALTER TABLE `craft_volumefolders`
  ADD CONSTRAINT `craft_fk_foppqucksreqmyjesxvhlclozfapdfmnepbg` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fk_xqqkwpwoqrdbiqximjgeigjontblwezeyzvn` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_volumes`
--
ALTER TABLE `craft_volumes`
  ADD CONSTRAINT `craft_fk_xfwzkmistrwvvxrihddxwbhlsqhueghkviwr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_fk_jqwpwyymmsgzuyjdhguhlrhluamdonxzseyl` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
