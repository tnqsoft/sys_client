/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.24-0ubuntu0.18.10.1 : Database - sys_client
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `access_token` */

insert  into `access_token`(`id`,`client_id`,`user_id`,`token`,`expires_at`,`scope`) values (1,1,1,'NmM0ZTY2ODg1ZmFjYmU4ZmY1YmEyMjkxZDEzOWE2MzJkZTE2Njc2MWEyNjBkYTZhY2NmZTJjYjNlNzRkMmM2Mg',1546266554,'user'),(2,1,1,'OTkxZjljODE0YzExODJjNWQyNzQyYzAzOWQ1MTRiZWNiYTI3MzExNTM2OGY5NDRkYTk5NDEwNjRkMDg5NDFkNw',1546266555,'user'),(3,1,1,'NzE3OTVlYWEyMmZjYzFiN2M2ZGJkYjUzZDVlNjVmMjAxYjIwZmY5MmE3ZmNlYjdkNDlmMGViYjFlMDkyODAyYw',1546266995,'user'),(4,1,1,'MDY4MWNmMzNhNTk4OGQ2N2Q1NDY4OTMwZWZhZDdjYWE1NjhjYjQ0YzNkMzU0NDQyNDcyY2QyYTY3YzI5YTgzMg',1546267128,'user'),(5,1,1,'ODg5MjBmNjBjMzg1OTZjYmEyODYyMDIzZDE0YzdjZDg2ZDU1MjQyNjRkOGE4Y2Q5ZWU5MmZmOWI5MjdkYmFmNw',1546267130,'user'),(6,1,1,'ZTcxYTBjNzU3NWMwODBkYzlmNTY1MGYyODc0NDBiY2JhMjc5NzFlODllNzJiYmU2MDk1YmRmM2IyMTgyNGY1MQ',1546267147,'user'),(7,1,1,'MzllYzI4NTY1NjdjNTRmYWI4YWJjNDkwYzhhZjZhYThhMjY4M2VmOWMwMzZiMzBkOWYzNzRkMjg4NTFhNGJkNQ',1546269476,'user'),(8,1,1,'ZGNhMzU0NjljMTgwNzA2NzVlYzIwYjI1ODVlMDI5YmFlYmIzMWQ0ODQ1NzdkYTAzNGQwZTAxMDhhYzJmOTZjNw',1546269501,'user'),(9,1,NULL,'NzAzYTQ5NzZmYjRhMWFlODZlMmU5ZjFhMDExNWQ2YzU2YjIxNGMyN2U1ZmJlNmU2Nzc2MDUwOThjNDRmYzM0Nw',1546271850,'user'),(10,1,NULL,'YTVmMzBlZjMxY2EzNGFmNmJlOGE0M2MzY2U2OGZjNTIzZWY1NWJiNjAxY2IwOTAzMjBjNWZhYzFmZmFlMmJiNQ',1546271855,'user'),(11,1,NULL,'YjU4ODUyMGIwNDQ4Yjc3YmFmOTg4YjBiYTY2NWIwMzM4MTExZmIxODJiMTM3YmYyMWFiODQ1N2QxZTY0MDRmOQ',1546271910,'user'),(12,1,NULL,'YTE5MzQxYTZkNDIxNDc3YmFhMDY5NDhkNzhjNmMxYWRkMzA4NzZiMzIxZGJkZDlmOGJlNTg4OGM3YjZlYjcyMQ',1546271928,'user'),(13,1,NULL,'N2I0YTA2M2FiNTRlYjU4MjdlNmU1MjlmMGJhMmViOTdhYjJjYTMxZjg4NTdlNmI0MjJhMjZiZWFkZWU4NTU2Zg',1546271946,'user'),(14,1,NULL,'YTQyZjIyNmUxNjNjNGY0MGJmZDhkZjRlNjM0YTYyOTY5ZWY1YjcyZjNlNjY1ZjhjMTZiYzM3MzgzMGFjZDgxNA',1546271947,'user'),(15,1,NULL,'ZGVkMzlmODg5NTRmNmExNzcwMjBlNzU0NTQ0NjJlNzczNzk4ZTE5NTg0ZjEwMTQ4MWVmZGY3ZDA3YzNkNGI2Mg',1546271978,'user'),(16,2,1,'YjI0YTBkNzgxYjA3N2ZjNjA3NmUxNGZhMzRmM2UyZWUwNTc5NWI0ODg1Mjg1ZThjZWRkMjFmZTdlNjE1ODA3Nw',1546272682,NULL),(17,1,1,'ZjQ0M2VmZWEyZmUwNjdmYTY5ZDlmNDgwMmVkYzg1ZTIxMTk3YTljMjdmYmNlMzc2YzBlYmQzZjAwYzhhNjQ3OA',1546272750,'user'),(18,1,1,'ODMwZTM5YWU3NTY0MmRjNWY0NGYxMTI4NzI2MWE1YTc1YmQ1M2I5MDc1MjVkZmEyYzQxOWE1Y2Q0NmQ4Y2FhOA',1546273636,'user'),(19,2,1,'OTFlNGVlZTdmOWVkOWNkOTUwNmVlNGFjYmE0ODRkNjk1YTE2YzgwMzU2N2IzZTcwZGU1YTkwMWM5NjdhNDEyYg',1546274322,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_code` */

insert  into `auth_code`(`id`,`client_id`,`user_id`,`token`,`redirect_uri`,`expires_at`,`scope`) values (1,1,1,'YTkxN2I2OTgyYWJiNzU4OGZlZjg1YTdmYmU1ZTRhMjE0MjYzMWY3NTZlZWYzMGFmZjI2MWU2Y2QyOTBjNmNmZA','http://example.local/',1546183434,NULL),(2,1,1,'OGVhNTkzYjU1OWE3NmVjZTdmYjZlNjA4OThjNTYzMTk4NTE4NjM4YTkxYmNkOGY4OGQ2OWI2YzhkZjQyNzQ0Yg','http://example.local/',1546184433,NULL),(3,1,1,'NDY4ZDYzMWI3NDM2OGEyNTdiMTQ5ZDg3N2QwNGY5NTcxNDgxMmUwYzM0NWU3NWYyYTEzOTliMzI4NDViN2FjNA','http://example.local/',1546185331,NULL),(4,2,1,'YTJiZTZmYjU4ZDg3Zjk5OTdiNWEwZGZkMDhlYjA2OTNiYmQwOWEzZTkyNTYyYmQ1NTUxNWRjZTg4YmZjMjlkNw','http://example2.local',1546186240,NULL),(6,2,1,'N2YwYjIwYjY1ZjMwNDM0M2ZlNTQ2NmZiNDk1NTgwY2IyYzc3YjhhMTNiYjEzYjNkNDJlZGI1ZTU1YmEwNzYyZQ','http://example2.local',1546187898,NULL);

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `client` */

insert  into `client`(`id`,`random_id`,`redirect_uris`,`secret`,`allowed_grant_types`,`name`) values (1,'fbdkmdld8n400c8oss4k808okosko00k0s00sck44oww8okck','a:1:{i:0;s:21:\"http://example.local/\";}','40cc3vfs3okkg04g0w4g4ow4ooc08kc8oc4skogc40sks8c4o8','a:4:{i:0;s:8:\"password\";i:1;s:13:\"refresh_token\";i:2;s:5:\"token\";i:3;s:18:\"client_credentials\";}','Vi du cai nao'),(2,'39mfhvo2d9c0sc0c0wooos4ock8c4w8wwo40s0ck4owoww4ocw','a:1:{i:0;s:21:\"http://example2.local\";}','8e7eu67429ogco4skckg8kssc4ok80c4gswsk4c44044g0c8g','a:7:{i:0;s:8:\"password\";i:1;s:13:\"refresh_token\";i:2;s:5:\"token\";i:3;s:18:\"client_credentials\";i:4;s:18:\"authorization_code\";i:5;s:8:\"implicit\";i:6;s:11:\"device_code\";}','Full Grant Type');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `refresh_token` */

insert  into `refresh_token`(`id`,`client_id`,`user_id`,`token`,`expires_at`,`scope`) values (1,1,1,'NzRlZTIzN2FlYTRjN2RiNzE0YTk1MTU5NzI4NzgzMWU2NWZiYzIyMjk3Y2JiY2U0YzllODAyNzUzNTYwOTMyYg',1547389754,'user'),(2,1,1,'NTZhMDg4ZjZlYTVhNjEyNzMyYjVlNzkyNzZlZTY5NjkzYmIzMDI4MGUzNmY2MGU5ODc4ZTUwNGNmYzI4NTY0Mg',1547389755,'user'),(3,1,1,'YjQzNjQ0OGRlOTBkM2EyYTRmZWM0MTMzOTg1YWUxMzgzM2FjNzY1MWUwZmEwZmYwOTc4OWJlMTBhYzM1NzZiNQ',1547390195,'user'),(4,1,1,'NzZmYzkxODg5NzliZDU1Nzg4MzgxNzI4NWMwNjFjNjk3NTI4ODUzM2YyMTFiZTY1ODJhZGQ3NTQ4NTkwZTY2Nw',1547390328,'user'),(5,1,1,'ODVlZjZmY2IyY2Q3MWZjYjk5ZWQ4MTE5ODE2OGNjNjdjOTc1NDQ1MDY3YmMyOTA0OTkyNmM4MjNkMjgwYWZhNA',1547390330,'user'),(6,1,1,'N2Y4MDlmMTY1NzMyZWFhNTg5YTg4NWExODRkOGQxYzk4MTcxN2ZjNTMzMWI5MjhjZWNmZWZkZGU3ZWQ1OTBlZA',1547390347,'user'),(8,1,1,'ZmFlN2IwMmIwNjJlZjE0ZGVjMGJjNjJiYTkxODJhNWM1Y2Q1OGQ4MmViNzA0ZGE4NjdlZjFlOGY3MTEzZTUxOQ',1547392701,'user'),(9,2,1,'NDRkMTMxYjgwNjY1NzJhZWRlMWEwZDM2ZjI3YTA3YTkyMzlhYWE1OGM0ZTIzZWNiYmQwMjVlNzZjMjAzYWZmNg',1547395882,NULL),(10,1,1,'ODFmMjczZGNhMjQ2MzlhMDZiYzk5NWQ4MWNlYjliZmZiOGVhYjgwNGU2NWMyMjM0OGM3OTFmYTM0MTU5MzEzMQ',1547395950,'user'),(11,1,1,'YzI1ZmI3ZmQ1NWMwMTM2NTA4Yzg2NzU2YmQ5MjVmMzU1Mzg5NTUwNWNiMDBkZDVlY2ExMDg0Njc4NTVkM2M3NA',1547396836,'user'),(12,2,1,'ODY3ZWE1MDFiOTVlOTc2ZWZmYWVjODdmMjc2NGIxNTc0M2QwZGM4ZDg5MzFhMTgzOWJkYTJiMzgxMzk3YjQ3MA',1547397523,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`),
  KEY `search_idx_email` (`email`),
  KEY `search_idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`salt`,`password`,`enabled`,`username_canonical`,`email_canonical`,`last_login`,`confirmation_token`,`password_requested_at`,`roles`,`first_name`,`last_name`,`deleted`) values (1,'test1','tuanquynh0508@gmail.com',NULL,'zKgdNE7BHguhCKv+42U0WnRCbF8DgMJRQCi2aqzk3vMGfP0ZNIIes6SK+aE6cZtlVm4rEKfY4earvqcNGIMuSA==',1,'test1','tuanquynh0508@gmail.com','2018-12-30 16:23:20',NULL,NULL,'a:0:{}',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
