USE `node_demo`;

DROP TABLE IF EXISTS `companydetails`;

CREATE TABLE `companydetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(500) DEFAULT NULL,
  `companyNotes` varchar(255) DEFAULT NULL,
  `companyCreator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

insert  into `companydetails`(`id`,`companyName`,`companyNotes`,`companyCreator`) values 
(1,'Demo-1 Company',NULL,1),
(2,'Demo-2 Company',NULL,1);

DROP TABLE IF EXISTS `companydetails_has_users`;

CREATE TABLE `companydetails_has_users` (
  `companyDetails_id` int(11) NOT NULL,
  `companyDetails_companyDetails_id` int(11) NOT NULL,
  `users_id` int(10) NOT NULL,
  PRIMARY KEY (`companyDetails_id`,`companyDetails_companyDetails_id`,`users_id`),
  KEY `fk_companyDetails_has_users_users1_idx` (`users_id`),
  KEY `fk_companyDetails_has_users_companyDetails1_idx` (`companyDetails_id`,`companyDetails_companyDetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `projectdetails`;

CREATE TABLE `projectdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(500) DEFAULT NULL,
  `projectNotes` varchar(500) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

insert  into `projectdetails`(`id`,`projectName`,`projectNotes`,`company_id`) values 
(1,'Project-11',NULL,1),
(2,'Project-12',NULL,1),
(3,'Project-21',NULL,2),
(4,'Project-22',NULL,2);

DROP TABLE IF EXISTS `servers`;

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `serverName` varchar(45) DEFAULT NULL,
  `serverIP` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

insert  into `users`(`id`,`email`,`uname`,`passw`,`linuxName`,`shell`,`userImage`,`ssh_key`) values 
(1,'vinyl@abc.corp','vinyl','$2a$10$xJ4Dn6R.6UdVi6vifkHCTuURgGA1Mm50U9cB722g9ETbaEwRp6V.u','vinyl','/bin/sh','vinyl@abc.corp.jpg','789'),
(5,'sunny@anarchy.com','sunny','$2a$10$xJ4Dn6R.6UdVi6vifkHCTuURgGA1Mm50U9cB722g9ETbaEwRp6V.u','sunny123','/sbin/nologin','sunny@anarchy.com.jpg',NULL),
(6,'pratyush@abc.corp','pratyush','$2a$10$NR6QNCl0JTejTxEdStI4au7yA2LRgN7JbHqavs2xA034AUpg0OEHq','pratyush',NULL,NULL,NULL);

DROP TABLE IF EXISTS `users_has_servers`;

CREATE TABLE `users_has_servers` (
  `users_id` int(10) NOT NULL,
  `servers_id` int(11) NOT NULL,
  `servers_projectDetails_projectId` int(11) NOT NULL,
  `userPermission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`users_id`,`servers_id`,`servers_projectDetails_projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;