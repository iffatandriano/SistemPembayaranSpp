/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - laravel_sistemspp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel_sistemspp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `laravel_sistemspp`;

/*Table structure for table `detail_tagihan` */

DROP TABLE IF EXISTS `detail_tagihan`;

CREATE TABLE `detail_tagihan` (
  `id_tagihan` bigint(20) unsigned NOT NULL,
  `month` int(11) NOT NULL,
  KEY `fk_id_tagihan` (`id_tagihan`),
  CONSTRAINT `fk_id_tagihan` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_tagihan` */

insert  into `detail_tagihan`(`id_tagihan`,`month`) values 
(11,1),
(11,2),
(11,3),
(11,4),
(12,1),
(12,2),
(12,3),
(13,5),
(13,6),
(13,7),
(14,8),
(17,1),
(17,2),
(17,3);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('arifluthfi16@gmail.com','$2y$10$If50/zb6aMBfUmtUX.ki/.146zHzFZsnAMVWkFtg5XNGZndtZ9aiq','2019-04-02 01:23:34');

/*Table structure for table `tagihan` */

DROP TABLE IF EXISTS `tagihan`;

CREATE TABLE `tagihan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `inspector_id` bigint(20) unsigned DEFAULT NULL,
  `inspected_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inspector` (`inspector_id`),
  KEY `fk_user_tagihan` (`user_id`),
  CONSTRAINT `fk_inspector` FOREIGN KEY (`inspector_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_tagihan` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `tagihan` */

insert  into `tagihan`(`id`,`total`,`user_id`,`status`,`inspector_id`,`inspected_date`) values 
(10,2000001,18,1,NULL,NULL),
(11,2000011,18,1,NULL,'2019-04-08'),
(12,1500012,18,1,NULL,'2019-04-09'),
(13,1500013,18,1,NULL,'2019-04-09'),
(14,500014,18,1,NULL,'2019-04-09'),
(17,1500017,20,1,NULL,'2019-05-13'),
(18,500018,20,1,NULL,'2019-05-13'),
(19,500019,20,1,NULL,'2019-05-14'),
(35,2000020,21,1,NULL,'2019-05-20'),
(37,1000036,21,1,NULL,'2019-05-20'),
(39,1000038,21,1,NULL,'2019-05-21'),
(41,1000040,22,1,NULL,'2019-05-21'),
(42,500042,22,1,NULL,'2019-05-21'),
(44,1000043,22,1,NULL,'2019-05-21'),
(45,500045,18,1,NULL,'2019-06-18');

/*Table structure for table `user_payment_info` */

DROP TABLE IF EXISTS `user_payment_info`;

CREATE TABLE `user_payment_info` (
  `user_id` bigint(20) unsigned NOT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `inspected_date` date DEFAULT NULL,
  KEY `fk_user_id_payment` (`user_id`),
  CONSTRAINT `fk_user_id_payment` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_payment_info` */

insert  into `user_payment_info`(`user_id`,`academic_year`,`month`,`fee`,`status`,`inspected_date`) values 
(18,'2019',1,500000,1,'2019-04-09'),
(18,'2019',2,500000,1,'2019-04-09'),
(18,'2019',3,500000,1,'2019-04-09'),
(18,'2019',4,500000,1,'2019-04-08'),
(18,'2019',5,500000,1,'2019-04-09'),
(18,'2019',6,500000,1,'2019-04-09'),
(18,'2019',7,500000,1,'2019-04-09'),
(18,'2019',8,500000,1,'2019-04-09'),
(18,'2019',9,500000,1,'2019-06-18'),
(18,'2019',10,500000,0,NULL),
(18,'2019',11,500000,0,NULL),
(18,'2019',12,500000,0,NULL),
(20,'2019',1,500000,1,'2019-05-13'),
(20,'2019',2,500000,1,'2019-05-13'),
(20,'2019',3,500000,1,'2019-05-13'),
(20,'2019',4,500000,1,'2019-05-13'),
(20,'2019',5,500000,1,'2019-05-14'),
(20,'2019',6,500000,0,NULL),
(20,'2019',7,500000,0,NULL),
(20,'2019',8,500000,0,NULL),
(20,'2019',9,500000,0,NULL),
(20,'2019',10,500000,0,NULL),
(20,'2019',11,500000,0,NULL),
(20,'2019',12,500000,0,NULL),
(21,'2019',1,500000,1,'2019-05-20'),
(21,'2019',2,500000,1,'2019-05-20'),
(21,'2019',3,500000,1,'2019-05-20'),
(21,'2019',4,500000,1,'2019-05-20'),
(21,'2019',5,500000,1,'2019-05-20'),
(21,'2019',6,500000,1,'2019-05-20'),
(21,'2019',7,500000,1,'2019-05-21'),
(21,'2019',8,500000,1,'2019-05-21'),
(21,'2019',9,500000,0,NULL),
(21,'2019',10,500000,0,NULL),
(21,'2019',11,500000,0,NULL),
(21,'2019',12,500000,0,NULL),
(22,'2019',1,500000,1,'2019-05-21'),
(22,'2019',2,500000,1,'2019-05-21'),
(22,'2019',3,500000,1,'2019-05-21'),
(22,'2019',4,500000,1,'2019-05-21'),
(22,'2019',5,500000,1,'2019-05-21'),
(22,'2019',6,500000,0,NULL),
(22,'2019',7,500000,0,NULL),
(22,'2019',8,500000,0,NULL),
(22,'2019',9,500000,0,NULL),
(22,'2019',10,500000,0,NULL),
(22,'2019',11,500000,0,NULL),
(22,'2019',12,500000,0,NULL),
(23,'2019',1,500000,0,NULL),
(23,'2019',2,500000,0,NULL),
(23,'2019',3,500000,0,NULL),
(23,'2019',4,500000,0,NULL),
(23,'2019',5,500000,0,NULL),
(23,'2019',6,500000,0,NULL),
(23,'2019',7,500000,0,NULL),
(23,'2019',8,500000,0,NULL),
(23,'2019',9,500000,0,NULL),
(23,'2019',10,500000,0,NULL),
(23,'2019',11,500000,0,NULL),
(23,'2019',12,500000,0,NULL);

/*Table structure for table `user_profile` */

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text,
  `phone` varchar(15) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `nomor_induk` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_profile` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`role`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(18,'Siswa','siswa@gmail.com','siswa',NULL,'$2y$10$AukKgff5sIVu4XPQcO4FeuTjqigdCDTfpP1STK2Pyss0XoiRq3gPS',NULL,'2019-04-08 15:39:04','2019-04-08 15:39:04'),
(19,'Pegawai','pegawai@gmail.com','pegawai',NULL,'$2y$10$ajPjYxJrYS8tot8fnzHh4efJ5y/KpM3lLVaS0pMgOFiVW9ojbVlf.',NULL,'2019-04-08 16:27:04','2019-04-08 16:27:04'),
(20,'arif','arif@gmail.com','siswa',NULL,'$2y$10$6XMsyHQjawQ.33Ipk04Sl.7427NhE2ZwfcxsJOIy2QPfhqzuKAucW',NULL,'2019-05-13 15:08:53','2019-05-13 15:08:53'),
(21,'Siswa Baru','siswabaru@gmail.com','siswa',NULL,'$2y$10$GiDeuFKZdgti9c8ONLMHzOgA4/0qlLYXwLCz7R/quhDYUOQR4VgiW',NULL,'2019-05-20 23:21:48','2019-05-20 23:21:48'),
(22,'Siswa Baru 2','siswabaru2@gmail.com','siswa',NULL,'$2y$10$1ldg52a0AD2tqcRI2u91autuBkiSijWGrpfWY42Yt7IoNX23HgSKy',NULL,'2019-05-21 00:50:50','2019-05-21 00:50:50'),
(23,'siswa 2','siswa2@gmail.com','siswa',NULL,'$2y$10$IPbjO5vGPa8A6ttwC6hplucxRfGoefb1oLYqKKG9Z.t5Y35XCynQ2',NULL,'2019-06-18 01:16:59','2019-06-18 01:16:59'),
(25,'Pegawai','pegawai2@gmail.com','pegawai',NULL,'$2y$10$Nx3KUUsWvOjU4P7KoL1wjOll7JXgl/T/YoCWtY55rysmFyzg0Mtvq',NULL,'2019-06-20 16:24:52','2019-06-20 16:24:52'),
(26,'Admin','admin@gmail.com','admin',NULL,'$2y$10$9mftEqGS14iDk5CYRcCxE.RfZ92rdpdiXgvIxsasvTQ.KUq07.p.e',NULL,'2019-06-20 16:26:36','2019-06-20 16:26:36');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
