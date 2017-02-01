/*
SQLyog Community v12.2.6 (32 bit)
MySQL - 5.5.50 : Database - node_demo1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`node_demo1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `node_demo1`;

/*Table structure for table `companydetails` */

DROP TABLE IF EXISTS `companydetails`;

CREATE TABLE `companydetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(500) DEFAULT NULL,
  `companyNotes` varchar(255) DEFAULT NULL,
  `companyCreator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `companydetails` */

insert  into `companydetails`(`id`,`companyName`,`companyNotes`,`companyCreator`) values 
(1,'Demo-1 Company',NULL,1),
(2,'Demo-2 Company',NULL,1);

/*Table structure for table `companydetails_has_users` */

DROP TABLE IF EXISTS `companydetails_has_users`;

CREATE TABLE `companydetails_has_users` (
  `companyDetails_id` int(11) NOT NULL,
  `companyDetails_companyDetails_id` int(11) NOT NULL,
  `users_id` int(10) NOT NULL,
  PRIMARY KEY (`companyDetails_id`,`companyDetails_companyDetails_id`,`users_id`),
  KEY `fk_companyDetails_has_users_users1_idx` (`users_id`),
  KEY `fk_companyDetails_has_users_companyDetails1_idx` (`companyDetails_id`,`companyDetails_companyDetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `companydetails_has_users` */

/*Table structure for table `demo` */

DROP TABLE IF EXISTS `demo`;

CREATE TABLE `demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `demo` */

/*Table structure for table `projectdetails` */

DROP TABLE IF EXISTS `projectdetails`;

CREATE TABLE `projectdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(500) DEFAULT NULL,
  `projectNotes` varchar(500) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `projectdetails` */

insert  into `projectdetails`(`id`,`projectName`,`projectNotes`,`company_id`) values 
(1,'Project-11',NULL,1),
(2,'Project-12',NULL,1),
(3,'Project-21',NULL,2),
(4,'Project-22',NULL,2);

/*Table structure for table `servers` */

DROP TABLE IF EXISTS `servers`;

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `serverName` varchar(45) DEFAULT NULL,
  `serverIP` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servers` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `passw` varchar(100) DEFAULT NULL,
  `linuxName` varchar(50) DEFAULT NULL,
  `shell` varchar(50) DEFAULT NULL,
  `userImage` varchar(50) DEFAULT NULL,
  `ssh_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`uname`,`passw`,`linuxName`,`shell`,`userImage`,`ssh_key`) values 
(1,'vinyl@abc.corp','vinyl','$2a$10$xJ4Dn6R.6UdVi6vifkHCTuURgGA1Mm50U9cB722g9ETbaEwRp6V.u','vinyl','/bin/sh','vinyl@abc.corp.jpg','789'),
(5,'sunny@anarchy.com','sunny','$2a$10$xJ4Dn6R.6UdVi6vifkHCTuURgGA1Mm50U9cB722g9ETbaEwRp6V.u','sunny123','/sbin/nologin','sunny@anarchy.com.jpg',NULL),
(6,'pratyush@abc.corp','pratyush','$2a$10$NR6QNCl0JTejTxEdStI4au7yA2LRgN7JbHqavs2xA034AUpg0OEHq','pratyush',NULL,NULL,NULL);

/*Table structure for table `users_has_servers` */

DROP TABLE IF EXISTS `users_has_servers`;

CREATE TABLE `users_has_servers` (
  `users_id` int(10) NOT NULL,
  `servers_id` int(11) NOT NULL,
  `servers_projectDetails_projectId` int(11) NOT NULL,
  `userPermission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`users_id`,`servers_id`,`servers_projectDetails_projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_has_servers` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
