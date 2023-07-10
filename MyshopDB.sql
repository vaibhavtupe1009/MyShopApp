/*
SQLyog Community v13.1.5  (32 bit)
MySQL - 5.7.40-log : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myshop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `myshop`;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `buyPrice` float NOT NULL,
  `salePrice` float NOT NULL,
  `pDis` varchar(200) DEFAULT NULL,
  `quantity` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`buyPrice`,`salePrice`,`pDis`,`quantity`) values 
(22,'Parle',1,1,'qsqs',2),
(23,'Marie',9.16667,10,'',24),
(24,'Goo Day',9.16667,10,'',48),
(25,'Water Bottle',7.5,10,'',12),
(27,'Eggs',4.66667,5.5,'',60),
(28,'Krack Jack',9.16667,10,'',0),
(29,'Soya Sticks',4.25,5,'',12),
(30,'Futane',4.6,5,'',25),
(31,'Soya Sticks',6.66667,10,'',15),
(32,'Creram Biscuts',9.16667,10,'',24),
(33,'Center Fruit',0.55,1,'',200);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `mobileNo` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profile` varchar(50) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobileNo` (`mobileNo`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`mobileNo`,`password`,`gender`,`address`,`email`,`profile`) values 
(66,'Tushar','4545324653','Tushar@1','Male','Vita','tushar@gmail.com','dsc06508.jpg'),
(67,'Vaibhav','9158800011','Bunty@1','Male','Vita','Vaibhav7898@gmail.com','416937_125500597576328_1429714806_n.jpg'),
(68,'Vikas','2222222222','Vikas@1','Male','Ambegaon','Vikas@gmail.com','_20150705_195403.JPG'),
(69,'nikita vishal tupe','8830165411','nikita5','Female','Vita','nikita@gmail.com','default.jpg'),
(70,'Siddharth','7385998145','Sid@1','Male','Vaduj','Siddharth@gmail.com','IMG_20150907_095746194.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
