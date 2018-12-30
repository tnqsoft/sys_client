/*
SQLyog Ultimate v12.4.3 (32 bit)
MySQL - 5.7.19 : Database - sys_client
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sys_client` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sys_client`;

/*Table structure for table `access_token` */

DROP TABLE IF EXISTS `access_token`;

CREATE TABLE `access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B6A2DD685F37A13B` (`token`),
  KEY `IDX_B6A2DD6819EB6921` (`client_id`),
  KEY `IDX_B6A2DD68A76ED395` (`user_id`),
  CONSTRAINT `FK_B6A2DD6819EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_B6A2DD68A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `access_token` */

insert  into `access_token`(`id`,`client_id`,`user_id`,`token`,`expires_at`,`scope`) values 
(1,2,1,'ZGRjMzYzZmFhNmI4ZmUyZmE2MGMyMDdlNmU1MWNlNWEwYTYxOGU2MDEyZTM2MzM4YWM1MDk1NWI2MGNmNTI4Zg',1546104583,'user'),
(2,2,1,'ZmU2ZDE0ZGI5NTc4ZmNjMzg2OTNkNzAxNzFjMDMxOTFkMGQyZmI1ZGYzOTM5ZDIwOGI3ZTQ0YmIyZDFiNWIxNw',1546104898,'user'),
(3,2,1,'OGE2NTYwZDM1OGFhYmY4MmQ1NjhkNDNlNzMwOTZkOTUzYzNlZDhmY2Q0ZjFhYTIzZTEwNWZhYTNkMWM4ODJlNQ',1546104971,'user'),
(4,2,1,'ZGNmOGE4ZDgwYjU1MmZlZDBiMDlhYTM1MmY4MTMxNTM1MGNjMThlNGQ1NzljNzFjNDRhOWNhYTcwNjY4YTQyMg',1546104993,'user'),
(5,2,1,'NGMyOWUzOTgzMjA0MjQ3ZWYzNWRiNzU5NDI4MGU2MzYwN2U5ZjIyYTQ0ZmI0NjQ3MWEwMTczNWVmYTg3ZTlhNA',1546188199,'user');

/*Table structure for table `auth_code` */

DROP TABLE IF EXISTS `auth_code`;

CREATE TABLE `auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5933D02C5F37A13B` (`token`),
  KEY `IDX_5933D02C19EB6921` (`client_id`),
  KEY `IDX_5933D02CA76ED395` (`user_id`),
  CONSTRAINT `FK_5933D02C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_5933D02CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_code` */

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `client` */

insert  into `client`(`id`,`random_id`,`redirect_uris`,`secret`,`allowed_grant_types`) values 
(1,'4zslnz4pf58oksw4c44cko4ggk8kswwksgg8088sc488k0o4cg','a:1:{i:0;s:21:\"http://example.local/\";}','569pvyguavwgwkgkk8gk8oco8gogwggsosk444o04ococg4wcs','a:5:{i:0;s:18:\"authorization_code\";i:1;s:8:\"password\";i:2;s:13:\"refresh_token\";i:3;s:5:\"token\";i:4;s:18:\"client_credentials\";}'),
(2,'gq0lokvm69wkck480000gsc4ckc80ow0gk48kckg0gooo8wo8','a:1:{i:0;s:21:\"http://example2.local\";}','4v7bcejftgg08kswog0scw4okks4skgwcw0sg0w4os4sw4w0w0','a:2:{i:0;s:8:\"password\";i:1;s:13:\"refresh_token\";}');

/*Table structure for table `refresh_token` */

DROP TABLE IF EXISTS `refresh_token`;

CREATE TABLE `refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C74F21955F37A13B` (`token`),
  KEY `IDX_C74F219519EB6921` (`client_id`),
  KEY `IDX_C74F2195A76ED395` (`user_id`),
  CONSTRAINT `FK_C74F219519EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_C74F2195A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `refresh_token` */

insert  into `refresh_token`(`id`,`client_id`,`user_id`,`token`,`expires_at`,`scope`) values 
(1,2,1,'MTNjYWYxNmRiMmM4MmUzZmIwNzc0MTRhN2MwZWY2N2M5M2JlMGU2M2FkY2RiNDcxZmIyZGUzMzk0MDYwMzQ3Ng',1547310583,'user'),
(3,2,1,'NzRhNDRmYmU1OGQxNWQ2NmQ5MjdlNDEwNTU0Y2U3YTE3MTE1NTBmOGM1MGQ3Y2Q0OGVhZWRjNDU0N2JiZmZjMg',1547310971,'user'),
(4,2,1,'MjZmMjBhNjVjYmYyMTZmYjE2ODkxMTJhODUyMzgxMGRmNjlmNDJhZjZiODAyNWMwMmM2YTE4ZTRmY2ZhNWQzNg',1547310993,'user'),
(5,2,1,'YjlkNTRkZjA4OWRkNGEwZTM0Yzk5MGY3ZDhjNDZhMWJiMTlhYjkxNmVjNzMxNTM2YWNhMDhjOWNmMzc1NDQ0Yg',1547311399,'user');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`salt`,`password`,`is_active`) values 
(1,'test1','tuanquynh0508@gmail.com','ca605cdbbb49e00c8aba431036cb2c7d','81f69409d4b6dde0bb13e9eac064f3c0982ef64b',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
