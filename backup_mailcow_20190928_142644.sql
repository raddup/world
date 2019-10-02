-- MySQL dump 10.16  Distrib 10.2.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mailcow
-- ------------------------------------------------------
-- Server version	10.2.27-MariaDB-1:10.2.27+maria~bionic

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
-- Table structure for table `_sogo_static_view`
--

DROP TABLE IF EXISTS `_sogo_static_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sogo_static_view` (
  `c_uid` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_password` varchar(255) NOT NULL DEFAULT '',
  `c_cn` varchar(255) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  `aliases` text NOT NULL,
  `ad_aliases` varchar(6144) NOT NULL DEFAULT '',
  `ext_acl` varchar(6144) NOT NULL DEFAULT '',
  `kind` varchar(100) NOT NULL DEFAULT '',
  `multiple_bookings` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`c_uid`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sogo_static_view`
--

LOCK TABLES `_sogo_static_view` WRITE;
/*!40000 ALTER TABLE `_sogo_static_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `_sogo_static_view` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mailcow`@`%`*/ /*!50003 TRIGGER sogo_update_password AFTER UPDATE ON _sogo_static_view
FOR EACH ROW
BEGIN
UPDATE mailbox SET password = NEW.c_password WHERE NEW.c_uid = username;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `superadmin` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','{SSHA256}K8eVJ6YsZbQCfuJvSUbaQRLr0HPLz5rC9IAp0PAFl0tmNDBkMDc0NDAyOTAxN2Rk',1,'2019-09-28 13:31:11','2019-09-28 13:31:11',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `private_comment` text DEFAULT NULL,
  `public_comment` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias`
--

LOCK TABLES `alias` WRITE;
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias_domain`
--

DROP TABLE IF EXISTS `alias_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) NOT NULL,
  `target_domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`alias_domain`),
  KEY `active` (`active`),
  KEY `target_domain` (`target_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias_domain`
--

LOCK TABLES `alias_domain` WRITE;
/*!40000 ALTER TABLE `alias_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api` (
  `api_key` varchar(255) NOT NULL,
  `allow_from` varchar(512) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bcc_maps`
--

DROP TABLE IF EXISTS `bcc_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bcc_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_dest` varchar(255) NOT NULL,
  `bcc_dest` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `type` enum('sender','rcpt') DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `local_dest` (`local_dest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcc_maps`
--

LOCK TABLES `bcc_maps` WRITE;
/*!40000 ALTER TABLE `bcc_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcc_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `da_acl`
--

DROP TABLE IF EXISTS `da_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `da_acl` (
  `username` varchar(255) NOT NULL,
  `syncjobs` tinyint(1) NOT NULL DEFAULT 1,
  `quarantine` tinyint(1) NOT NULL DEFAULT 1,
  `login_as` tinyint(1) NOT NULL DEFAULT 1,
  `bcc_maps` tinyint(1) NOT NULL DEFAULT 1,
  `filters` tinyint(1) NOT NULL DEFAULT 1,
  `ratelimit` tinyint(1) NOT NULL DEFAULT 1,
  `spam_policy` tinyint(1) NOT NULL DEFAULT 1,
  `extend_sender_acl` tinyint(1) NOT NULL DEFAULT 0,
  `unlimited_quota` tinyint(1) NOT NULL DEFAULT 0,
  `alias_domains` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `da_acl`
--

LOCK TABLES `da_acl` WRITE;
/*!40000 ALTER TABLE `da_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `da_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aliases` int(10) NOT NULL DEFAULT 0,
  `mailboxes` int(10) NOT NULL DEFAULT 0,
  `defquota` bigint(20) NOT NULL DEFAULT 3072,
  `maxquota` bigint(20) NOT NULL DEFAULT 102400,
  `quota` bigint(20) NOT NULL DEFAULT 102400,
  `relayhost` varchar(255) NOT NULL DEFAULT '0',
  `backupmx` tinyint(1) NOT NULL DEFAULT 0,
  `gal` tinyint(1) NOT NULL DEFAULT 1,
  `relay_all_recipients` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_admins`
--

DROP TABLE IF EXISTS `domain_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_admins`
--

LOCK TABLES `domain_admins` WRITE;
/*!40000 ALTER TABLE `domain_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filterconf`
--

DROP TABLE IF EXISTS `filterconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filterconf` (
  `object` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(100) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `prefid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`prefid`),
  KEY `object` (`object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filterconf`
--

LOCK TABLES `filterconf` WRITE;
/*!40000 ALTER TABLE `filterconf` DISABLE KEYS */;
/*!40000 ALTER TABLE `filterconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forwarding_hosts`
--

DROP TABLE IF EXISTS `forwarding_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwarding_hosts` (
  `host` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `filter_spam` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwarding_hosts`
--

LOCK TABLES `forwarding_hosts` WRITE;
/*!40000 ALTER TABLE `forwarding_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forwarding_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `grouped_domain_alias_address`
--

DROP TABLE IF EXISTS `grouped_domain_alias_address`;
/*!50001 DROP VIEW IF EXISTS `grouped_domain_alias_address`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouped_domain_alias_address` (
  `username` tinyint NOT NULL,
  `ad_alias` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouped_mail_aliases`
--

DROP TABLE IF EXISTS `grouped_mail_aliases`;
/*!50001 DROP VIEW IF EXISTS `grouped_mail_aliases`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouped_mail_aliases` (
  `username` tinyint NOT NULL,
  `aliases` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouped_sender_acl`
--

DROP TABLE IF EXISTS `grouped_sender_acl`;
/*!50001 DROP VIEW IF EXISTS `grouped_sender_acl`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouped_sender_acl` (
  `username` tinyint NOT NULL,
  `send_as_acl` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `grouped_sender_acl_external`
--

DROP TABLE IF EXISTS `grouped_sender_acl_external`;
/*!50001 DROP VIEW IF EXISTS `grouped_sender_acl_external`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `grouped_sender_acl_external` (
  `username` tinyint NOT NULL,
  `send_as_acl` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `imapsync`
--

DROP TABLE IF EXISTS `imapsync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imapsync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user2` varchar(255) NOT NULL,
  `host1` varchar(255) NOT NULL,
  `authmech1` enum('PLAIN','LOGIN','CRAM-MD5') DEFAULT 'PLAIN',
  `regextrans2` varchar(255) DEFAULT '',
  `authmd51` tinyint(1) NOT NULL DEFAULT 0,
  `domain2` varchar(255) NOT NULL DEFAULT '',
  `subfolder2` varchar(255) NOT NULL DEFAULT '',
  `user1` varchar(255) NOT NULL,
  `password1` varchar(255) NOT NULL,
  `exclude` varchar(500) NOT NULL DEFAULT '',
  `maxage` smallint(6) NOT NULL DEFAULT 0,
  `mins_interval` varchar(50) NOT NULL DEFAULT '0',
  `maxbytespersecond` varchar(50) NOT NULL DEFAULT '0',
  `port1` smallint(6) NOT NULL,
  `enc1` enum('TLS','SSL','PLAIN') DEFAULT 'TLS',
  `delete2duplicates` tinyint(1) NOT NULL DEFAULT 1,
  `delete1` tinyint(1) NOT NULL DEFAULT 0,
  `delete2` tinyint(1) NOT NULL DEFAULT 0,
  `automap` tinyint(1) NOT NULL DEFAULT 0,
  `skipcrossduplicates` tinyint(1) NOT NULL DEFAULT 0,
  `custom_params` varchar(512) NOT NULL DEFAULT '',
  `timeout1` smallint(6) NOT NULL DEFAULT 600,
  `timeout2` smallint(6) NOT NULL DEFAULT 600,
  `subscribeall` tinyint(1) NOT NULL DEFAULT 1,
  `is_running` tinyint(1) NOT NULL DEFAULT 0,
  `returned_text` longtext DEFAULT NULL,
  `last_run` timestamp NULL DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imapsync`
--

LOCK TABLES `imapsync` WRITE;
/*!40000 ALTER TABLE `imapsync` DISABLE KEYS */;
/*!40000 ALTER TABLE `imapsync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` char(32) NOT NULL DEFAULT '000000',
  `type` varchar(32) DEFAULT '',
  `msg` text DEFAULT NULL,
  `call` text DEFAULT NULL,
  `user` varchar(64) NOT NULL,
  `role` varchar(32) NOT NULL,
  `remote` varchar(39) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbox` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mailbox_path_prefix` varchar(150) DEFAULT '/var/vmail/',
  `quota` bigint(20) NOT NULL DEFAULT 102400,
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kind` varchar(100) NOT NULL DEFAULT '',
  `multiple_bookings` int(11) NOT NULL DEFAULT -1,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarantine`
--

DROP TABLE IF EXISTS `quarantine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quarantine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` varchar(30) NOT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `score` float(8,2) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `action` char(20) NOT NULL DEFAULT 'unknown',
  `symbols` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sender` varchar(255) NOT NULL DEFAULT 'unknown',
  `rcpt` varchar(255) DEFAULT NULL,
  `msg` longtext DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `user` varchar(255) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarantine`
--

LOCK TABLES `quarantine` WRITE;
/*!40000 ALTER TABLE `quarantine` DISABLE KEYS */;
/*!40000 ALTER TABLE `quarantine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota2`
--

DROP TABLE IF EXISTS `quota2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota2` (
  `username` varchar(255) NOT NULL,
  `bytes` bigint(20) NOT NULL DEFAULT 0,
  `messages` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota2`
--

LOCK TABLES `quota2` WRITE;
/*!40000 ALTER TABLE `quota2` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient_maps`
--

DROP TABLE IF EXISTS `recipient_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_dest` varchar(255) NOT NULL,
  `new_dest` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `local_dest` (`old_dest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient_maps`
--

LOCK TABLES `recipient_maps` WRITE;
/*!40000 ALTER TABLE `recipient_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipient_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relayhosts`
--

DROP TABLE IF EXISTS `relayhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relayhosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relayhosts`
--

LOCK TABLES `relayhosts` WRITE;
/*!40000 ALTER TABLE `relayhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `relayhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_acl`
--

DROP TABLE IF EXISTS `sender_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sender_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logged_in_as` varchar(255) NOT NULL,
  `send_as` varchar(255) NOT NULL,
  `external` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_acl`
--

LOCK TABLES `sender_acl` WRITE;
/*!40000 ALTER TABLE `sender_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settingsmap`
--

DROP TABLE IF EXISTS `settingsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settingsmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settingsmap`
--

LOCK TABLES `settingsmap` WRITE;
/*!40000 ALTER TABLE `settingsmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `settingsmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sieve_after`
--

DROP TABLE IF EXISTS `sieve_after`;
/*!50001 DROP VIEW IF EXISTS `sieve_after`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sieve_after` (
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `script_name` tinyint NOT NULL,
  `script_data` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sieve_before`
--

DROP TABLE IF EXISTS `sieve_before`;
/*!50001 DROP VIEW IF EXISTS `sieve_before`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sieve_before` (
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `script_name` tinyint NOT NULL,
  `script_data` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sieve_filters`
--

DROP TABLE IF EXISTS `sieve_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sieve_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `script_desc` varchar(255) NOT NULL,
  `script_name` enum('active','inactive') DEFAULT NULL,
  `script_data` text NOT NULL,
  `filter_type` enum('postfilter','prefilter') DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `script_desc` (`script_desc`),
  CONSTRAINT `fk_username_sieve_global_before` FOREIGN KEY (`username`) REFERENCES `mailbox` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sieve_filters`
--

LOCK TABLES `sieve_filters` WRITE;
/*!40000 ALTER TABLE `sieve_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `sieve_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_acl`
--

DROP TABLE IF EXISTS `sogo_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_folder_id` int(11) NOT NULL,
  `c_object` varchar(255) NOT NULL,
  `c_uid` varchar(255) NOT NULL,
  `c_role` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sogo_acl_c_folder_id_idx` (`c_folder_id`),
  KEY `sogo_acl_c_uid_idx` (`c_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_acl`
--

LOCK TABLES `sogo_acl` WRITE;
/*!40000 ALTER TABLE `sogo_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_alarms_folder`
--

DROP TABLE IF EXISTS `sogo_alarms_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_alarms_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_path` varchar(255) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_uid` varchar(255) NOT NULL,
  `c_recurrence_id` int(11) DEFAULT NULL,
  `c_alarm_number` int(11) NOT NULL,
  `c_alarm_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_alarms_folder`
--

LOCK TABLES `sogo_alarms_folder` WRITE;
/*!40000 ALTER TABLE `sogo_alarms_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_alarms_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_cache_folder`
--

DROP TABLE IF EXISTS `sogo_cache_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_cache_folder` (
  `c_uid` varchar(255) NOT NULL,
  `c_path` varchar(255) NOT NULL,
  `c_parent_path` varchar(255) DEFAULT NULL,
  `c_type` tinyint(3) unsigned NOT NULL,
  `c_creationdate` int(11) NOT NULL,
  `c_lastmodified` int(11) NOT NULL,
  `c_version` int(11) NOT NULL DEFAULT 0,
  `c_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `c_content` longtext DEFAULT NULL,
  PRIMARY KEY (`c_uid`,`c_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_cache_folder`
--

LOCK TABLES `sogo_cache_folder` WRITE;
/*!40000 ALTER TABLE `sogo_cache_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_cache_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_folder_info`
--

DROP TABLE IF EXISTS `sogo_folder_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_folder_info` (
  `c_folder_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `c_path` varchar(255) NOT NULL,
  `c_path1` varchar(255) NOT NULL,
  `c_path2` varchar(255) DEFAULT NULL,
  `c_path3` varchar(255) DEFAULT NULL,
  `c_path4` varchar(255) DEFAULT NULL,
  `c_foldername` varchar(255) NOT NULL,
  `c_location` varchar(2048) DEFAULT NULL,
  `c_quick_location` varchar(2048) DEFAULT NULL,
  `c_acl_location` varchar(2048) DEFAULT NULL,
  `c_folder_type` varchar(255) NOT NULL,
  PRIMARY KEY (`c_path`),
  UNIQUE KEY `c_folder_id` (`c_folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_folder_info`
--

LOCK TABLES `sogo_folder_info` WRITE;
/*!40000 ALTER TABLE `sogo_folder_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_folder_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_quick_appointment`
--

DROP TABLE IF EXISTS `sogo_quick_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_quick_appointment` (
  `c_folder_id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_uid` varchar(255) NOT NULL,
  `c_startdate` int(11) DEFAULT NULL,
  `c_enddate` int(11) DEFAULT NULL,
  `c_cycleenddate` int(11) DEFAULT NULL,
  `c_title` varchar(1000) NOT NULL,
  `c_participants` text DEFAULT NULL,
  `c_isallday` int(11) DEFAULT NULL,
  `c_iscycle` int(11) DEFAULT NULL,
  `c_cycleinfo` text DEFAULT NULL,
  `c_classification` int(11) NOT NULL,
  `c_isopaque` int(11) NOT NULL,
  `c_status` int(11) NOT NULL,
  `c_priority` int(11) DEFAULT NULL,
  `c_location` varchar(255) DEFAULT NULL,
  `c_orgmail` varchar(255) DEFAULT NULL,
  `c_partmails` text DEFAULT NULL,
  `c_partstates` text DEFAULT NULL,
  `c_category` varchar(255) DEFAULT NULL,
  `c_sequence` int(11) DEFAULT NULL,
  `c_component` varchar(10) NOT NULL,
  `c_nextalarm` int(11) DEFAULT NULL,
  `c_description` text DEFAULT NULL,
  PRIMARY KEY (`c_folder_id`,`c_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_quick_appointment`
--

LOCK TABLES `sogo_quick_appointment` WRITE;
/*!40000 ALTER TABLE `sogo_quick_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_quick_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_quick_contact`
--

DROP TABLE IF EXISTS `sogo_quick_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_quick_contact` (
  `c_folder_id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_givenname` varchar(255) DEFAULT NULL,
  `c_cn` varchar(255) DEFAULT NULL,
  `c_sn` varchar(255) DEFAULT NULL,
  `c_screenname` varchar(255) DEFAULT NULL,
  `c_l` varchar(255) DEFAULT NULL,
  `c_mail` text DEFAULT NULL,
  `c_o` varchar(255) DEFAULT NULL,
  `c_ou` varchar(255) DEFAULT NULL,
  `c_telephonenumber` varchar(255) DEFAULT NULL,
  `c_categories` varchar(255) DEFAULT NULL,
  `c_component` varchar(10) NOT NULL,
  `c_hascertificate` int(11) DEFAULT 0,
  PRIMARY KEY (`c_folder_id`,`c_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_quick_contact`
--

LOCK TABLES `sogo_quick_contact` WRITE;
/*!40000 ALTER TABLE `sogo_quick_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_quick_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_sessions_folder`
--

DROP TABLE IF EXISTS `sogo_sessions_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_sessions_folder` (
  `c_id` varchar(255) NOT NULL,
  `c_value` varchar(255) NOT NULL,
  `c_creationdate` int(11) NOT NULL,
  `c_lastseen` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_sessions_folder`
--

LOCK TABLES `sogo_sessions_folder` WRITE;
/*!40000 ALTER TABLE `sogo_sessions_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_sessions_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_store`
--

DROP TABLE IF EXISTS `sogo_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_store` (
  `c_folder_id` int(11) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `c_content` mediumtext NOT NULL,
  `c_creationdate` int(11) NOT NULL,
  `c_lastmodified` int(11) NOT NULL,
  `c_version` int(11) NOT NULL,
  `c_deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_folder_id`,`c_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_store`
--

LOCK TABLES `sogo_store` WRITE;
/*!40000 ALTER TABLE `sogo_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sogo_user_profile`
--

DROP TABLE IF EXISTS `sogo_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sogo_user_profile` (
  `c_uid` varchar(255) NOT NULL,
  `c_defaults` longtext DEFAULT NULL,
  `c_settings` longtext DEFAULT NULL,
  PRIMARY KEY (`c_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sogo_user_profile`
--

LOCK TABLES `sogo_user_profile` WRITE;
/*!40000 ALTER TABLE `sogo_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sogo_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sogo_view`
--

DROP TABLE IF EXISTS `sogo_view`;
/*!50001 DROP VIEW IF EXISTS `sogo_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sogo_view` (
  `c_uid` tinyint NOT NULL,
  `domain` tinyint NOT NULL,
  `c_name` tinyint NOT NULL,
  `c_password` tinyint NOT NULL,
  `c_cn` tinyint NOT NULL,
  `mail` tinyint NOT NULL,
  `aliases` tinyint NOT NULL,
  `ad_aliases` tinyint NOT NULL,
  `ext_acl` tinyint NOT NULL,
  `kind` tinyint NOT NULL,
  `multiple_bookings` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spamalias`
--

DROP TABLE IF EXISTS `spamalias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spamalias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `validity` int(11) NOT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spamalias`
--

LOCK TABLES `spamalias` WRITE;
/*!40000 ALTER TABLE `spamalias` DISABLE KEYS */;
/*!40000 ALTER TABLE `spamalias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfa`
--

DROP TABLE IF EXISTS `tfa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `authmech` enum('yubi_otp','u2f','hotp','totp') DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `keyHandle` varchar(255) DEFAULT NULL,
  `publicKey` varchar(255) DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `certificate` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfa`
--

LOCK TABLES `tfa` WRITE;
/*!40000 ALTER TABLE `tfa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tls_policy_override`
--

DROP TABLE IF EXISTS `tls_policy_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tls_policy_override` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL,
  `policy` enum('none','may','encrypt','dane','dane-only','fingerprint','verify','secure') NOT NULL,
  `parameters` varchar(255) DEFAULT '',
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dest` (`dest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tls_policy_override`
--

LOCK TABLES `tls_policy_override` WRITE;
/*!40000 ALTER TABLE `tls_policy_override` DISABLE KEYS */;
/*!40000 ALTER TABLE `tls_policy_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(255) NOT NULL,
  `nexthop` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lookup_mx` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `destination` (`destination`),
  KEY `nexthop` (`nexthop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_acl`
--

DROP TABLE IF EXISTS `user_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_acl` (
  `username` varchar(255) NOT NULL,
  `spam_alias` tinyint(1) NOT NULL DEFAULT 1,
  `tls_policy` tinyint(1) NOT NULL DEFAULT 1,
  `spam_score` tinyint(1) NOT NULL DEFAULT 1,
  `spam_policy` tinyint(1) NOT NULL DEFAULT 1,
  `delimiter_action` tinyint(1) NOT NULL DEFAULT 1,
  `syncjobs` tinyint(1) NOT NULL DEFAULT 1,
  `eas_reset` tinyint(1) NOT NULL DEFAULT 1,
  `sogo_profile_reset` tinyint(1) NOT NULL DEFAULT 1,
  `quarantine` tinyint(1) NOT NULL DEFAULT 1,
  `quarantine_attachments` tinyint(1) NOT NULL DEFAULT 1,
  `quarantine_notification` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `mailbox` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_acl`
--

LOCK TABLES `user_acl` WRITE;
/*!40000 ALTER TABLE `user_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `application` varchar(255) NOT NULL,
  `version` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`application`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES ('db_schema','01092019_1240','2019-09-28 13:31:11'),('GUID','9a5df0d5aa534fecdfe5edc221a48be653f13106a8509c3f38570e1159da6ba2','2019-09-28 14:11:56');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `grouped_domain_alias_address`
--

/*!50001 DROP TABLE IF EXISTS `grouped_domain_alias_address`*/;
/*!50001 DROP VIEW IF EXISTS `grouped_domain_alias_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grouped_domain_alias_address` AS select `mailbox`.`username` AS `username`,ifnull(group_concat(`mailbox`.`local_part`,'@',`alias_domain`.`alias_domain` separator ' '),'') AS `ad_alias` from (`mailbox` left join `alias_domain` on(`alias_domain`.`target_domain` = `mailbox`.`domain`)) group by `mailbox`.`username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouped_mail_aliases`
--

/*!50001 DROP TABLE IF EXISTS `grouped_mail_aliases`*/;
/*!50001 DROP VIEW IF EXISTS `grouped_mail_aliases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grouped_mail_aliases` AS select `alias`.`goto` AS `username`,ifnull(group_concat(`alias`.`address` separator ' '),'') AS `aliases` from `alias` where `alias`.`address` <> `alias`.`goto` and `alias`.`active` = '1' and `alias`.`address`  not like '@%' group by `alias`.`goto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouped_sender_acl`
--

/*!50001 DROP TABLE IF EXISTS `grouped_sender_acl`*/;
/*!50001 DROP VIEW IF EXISTS `grouped_sender_acl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grouped_sender_acl` AS select `sender_acl`.`logged_in_as` AS `username`,ifnull(group_concat(`sender_acl`.`send_as` separator ' '),'') AS `send_as_acl` from `sender_acl` where `sender_acl`.`send_as`  not like '@%' group by `sender_acl`.`logged_in_as` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `grouped_sender_acl_external`
--

/*!50001 DROP TABLE IF EXISTS `grouped_sender_acl_external`*/;
/*!50001 DROP VIEW IF EXISTS `grouped_sender_acl_external`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `grouped_sender_acl_external` AS select `sender_acl`.`logged_in_as` AS `username`,ifnull(group_concat(`sender_acl`.`send_as` separator ' '),'') AS `send_as_acl` from `sender_acl` where `sender_acl`.`send_as`  not like '@%' and `sender_acl`.`external` = '1' group by `sender_acl`.`logged_in_as` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sieve_after`
--

/*!50001 DROP TABLE IF EXISTS `sieve_after`*/;
/*!50001 DROP VIEW IF EXISTS `sieve_after`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sieve_after` AS select md5(`sieve_filters`.`script_data`) AS `id`,`sieve_filters`.`username` AS `username`,`sieve_filters`.`script_name` AS `script_name`,`sieve_filters`.`script_data` AS `script_data` from `sieve_filters` where `sieve_filters`.`filter_type` = 'postfilter' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sieve_before`
--

/*!50001 DROP TABLE IF EXISTS `sieve_before`*/;
/*!50001 DROP VIEW IF EXISTS `sieve_before`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sieve_before` AS select md5(`sieve_filters`.`script_data`) AS `id`,`sieve_filters`.`username` AS `username`,`sieve_filters`.`script_name` AS `script_name`,`sieve_filters`.`script_data` AS `script_data` from `sieve_filters` where `sieve_filters`.`filter_type` = 'prefilter' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sogo_view`
--

/*!50001 DROP TABLE IF EXISTS `sogo_view`*/;
/*!50001 DROP VIEW IF EXISTS `sogo_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mailcow`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sogo_view` AS select `mailbox`.`username` AS `c_uid`,`mailbox`.`domain` AS `domain`,`mailbox`.`username` AS `c_name`,if(json_extract(`mailbox`.`attributes`,'$.force_pw_update') like '%0%',if(json_extract(`mailbox`.`attributes`,'$.sogo_access') like '%1%',`mailbox`.`password`,'{SSHA256}A123A123A321A321A321B321B321B123B123B321B432F123E321123123321321'),'{SSHA256}A123A123A321A321A321B321B321B123B123B321B432F123E321123123321321') AS `c_password`,`mailbox`.`name` AS `c_cn`,`mailbox`.`username` AS `mail`,ifnull(group_concat(`ga`.`aliases` separator ' '),'') AS `aliases`,ifnull(`gda`.`ad_alias`,'') AS `ad_aliases`,ifnull(`external_acl`.`send_as_acl`,'') AS `ext_acl`,`mailbox`.`kind` AS `kind`,`mailbox`.`multiple_bookings` AS `multiple_bookings` from (((`mailbox` left join `grouped_mail_aliases` `ga` on(`ga`.`username` regexp concat('(^|,)',`mailbox`.`username`,'($|,)'))) left join `grouped_domain_alias_address` `gda` on(`gda`.`username` = `mailbox`.`username`)) left join `grouped_sender_acl_external` `external_acl` on(`external_acl`.`username` = `mailbox`.`username`)) where `mailbox`.`active` = '1' group by `mailbox`.`username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-28 14:27:36
