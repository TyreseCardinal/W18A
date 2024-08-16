/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: w18a
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB

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
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `blogger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogger_id` (`blogger_id`),
  CONSTRAINT `blog_post_ibfk_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.','A Journey Through Time','2023-07-01 00:00:00',1),(2,'Vestibulum viverra massa eget lacus tempus, a condimentum dui aliquam.','Tech Innovations in 2023','2022-08-05 00:00:00',4),(3,'Curabitur non lectus et urna sollicitudin facilisis.','Healthy Living: Tips and Tricks','2021-10-15 00:00:00',2),(4,'Mauris malesuada, nisl in auctor pretium, velit ligula dictum nunc, vel tempor sapien ligula eu risus.','The Future of AI','2020-03-22 00:00:00',3),(5,'Phasellus vehicula leo ut metus congue, et volutpat magna luctus.','Exploring the World of Quantum Computing','2023-07-01 00:00:00',1);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_comment`
--

DROP TABLE IF EXISTS `blog_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_post_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `blogger_id` int(11) DEFAULT NULL,
  `blog_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogger_id` (`blogger_id`),
  KEY `blog_post_id` (`blog_post_id`),
  CONSTRAINT `blog_post_comment_ibfk_1` FOREIGN KEY (`blogger_id`) REFERENCES `blogger` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post_comment_ibfk_2` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_comment`
--

LOCK TABLES `blog_post_comment` WRITE;
/*!40000 ALTER TABLE `blog_post_comment` DISABLE KEYS */;
INSERT INTO `blog_post_comment` VALUES (1,'Great insights! Thanks for sharing.','2023-07-02 00:00:00',2,1),(2,'I totally agree with your points.','2023-07-02 00:00:00',3,1),(3,'Interesting perspective, but I have some doubts.','2022-08-06 00:00:00',1,2),(4,'Thanks for the tips! Very useful.','2021-10-16 00:00:00',4,3),(5,'This is a game-changer for the industry.','2020-03-23 00:00:00',2,4),(6,'Looking forward to more posts like this!','2023-07-02 00:00:00',3,5),(7,'Can you explain more about this topic?','2023-07-03 00:00:00',5,5);
/*!40000 ALTER TABLE `blog_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger`
--

DROP TABLE IF EXISTS `blogger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger`
--

LOCK TABLES `blogger` WRITE;
/*!40000 ALTER TABLE `blogger` DISABLE KEYS */;
INSERT INTO `blogger` VALUES (1,'alice123','password1','Alice Johnson','2023-07-01 00:00:00','alice@example.com'),(2,'bobsmith','password2','Bob Smith','2021-10-15 00:00:00','bob@example.com'),(3,'carol89','password3','Carol White','2020-03-22 00:00:00','carol@example.com'),(4,'david_w','pass','David Wilson','2022-08-05 00:00:00','david@example.com'),(5,'evelee','pass','Eve Lee','2019-12-25 00:00:00','eve@example.com');
/*!40000 ALTER TABLE `blogger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'w18a'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 17:20:02
