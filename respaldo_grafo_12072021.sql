-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: kms
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `relacion_primarias`
--

DROP TABLE IF EXISTS `relacion_primarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion_primarias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_padre` int unsigned DEFAULT NULL,
  `id_hijo` int unsigned DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `tipo` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relacion_primarias_id_padre_foreign` (`id_padre`),
  KEY `relacion_primarias_id_hijo_foreign` (`id_hijo`),
  CONSTRAINT `relacion_primarias_id_hijo_foreign` FOREIGN KEY (`id_hijo`) REFERENCES `temas` (`id`),
  CONSTRAINT `relacion_primarias_id_padre_foreign` FOREIGN KEY (`id_padre`) REFERENCES `temas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_primarias`
--

LOCK TABLES `relacion_primarias` WRITE;
/*!40000 ALTER TABLE `relacion_primarias` DISABLE KEYS */;
INSERT INTO `relacion_primarias` VALUES (1,1,2,'000000','primarias',NULL,NULL),(5,26,6,'000000','primarias',NULL,NULL),(6,12,7,'000000','primarias',NULL,NULL),(7,6,8,'000000','primarias',NULL,NULL),(8,7,9,'000000','primarias',NULL,NULL),(10,186,10,'000000','primarias',NULL,NULL),(12,8,11,'000000','primarias',NULL,NULL),(13,2,12,'000000','primarias',NULL,NULL),(14,1,13,'000000','primarias',NULL,NULL),(16,1,14,'000000','primarias',NULL,NULL),(19,1,17,'000000','primarias',NULL,NULL),(21,17,19,'000000','primarias',NULL,NULL),(24,1,20,'000000','primarias',NULL,NULL),(27,20,23,'000000','primarias',NULL,NULL),(28,14,24,'000000','primarias',NULL,NULL),(29,9,25,'000000','primarias',NULL,NULL),(31,2,26,'000000','primarias',NULL,NULL),(32,25,27,'000000','primarias',NULL,NULL),(33,27,28,'000000','primarias',NULL,NULL),(34,27,29,'000000','primarias',NULL,NULL),(35,29,30,'000000','primarias',NULL,NULL),(36,28,30,'000000','secundarias',NULL,NULL),(37,30,31,'000000','primarias',NULL,NULL),(38,31,32,'000000','primarias',NULL,NULL),(39,25,33,'000000','primarias',NULL,NULL),(40,33,30,'000000','secundarias',NULL,NULL),(43,11,30,'000000','secundarias',NULL,NULL),(44,11,34,'000000','primarias',NULL,NULL),(45,34,32,'000000','secundarias',NULL,NULL),(46,26,35,'000000','primarias',NULL,NULL),(47,35,36,'000000','primarias',NULL,NULL),(48,26,37,'000000','primarias',NULL,NULL),(50,11,39,'000000','primarias',NULL,NULL),(51,37,39,'000000','secundarias',NULL,NULL),(52,1,40,'000000','primarias',NULL,NULL),(53,192,41,'000000','primarias',NULL,NULL),(54,193,42,'000000','primarias',NULL,NULL),(55,42,43,'000000','primarias',NULL,NULL),(56,43,44,'000000','primarias',NULL,NULL),(58,43,46,'000000','primarias',NULL,NULL),(59,43,47,'000000','primarias',NULL,NULL),(60,43,48,'000000','primarias',NULL,NULL),(61,43,49,'000000','primarias',NULL,NULL),(62,43,50,'000000','primarias',NULL,NULL),(63,1,51,'000000','primarias',NULL,NULL),(64,1,52,'000000','primarias',NULL,NULL),(65,17,53,'000000','primarias',NULL,NULL),(66,19,54,'000000','primarias',NULL,NULL),(67,54,55,'000000','primarias',NULL,NULL),(68,55,56,'000000','primarias',NULL,NULL),(69,55,57,'000000','primarias',NULL,NULL),(70,53,56,'000000','secundarias',NULL,NULL),(71,56,58,'000000','primarias',NULL,NULL),(72,57,58,'000000','secundarias',NULL,NULL),(73,58,59,'000000','primarias',NULL,NULL),(74,58,60,'000000','primarias',NULL,NULL),(75,23,61,'000000','primarias',NULL,NULL),(76,61,62,'000000','primarias',NULL,NULL),(77,62,63,'000000','primarias',NULL,NULL),(93,10,71,'000000','primarias',NULL,NULL),(94,71,72,'000000','primarias',NULL,NULL),(95,72,73,'000000','primarias',NULL,NULL),(96,71,73,'000000','secundarias',NULL,NULL),(97,73,74,'000000','primarias',NULL,NULL),(98,73,75,'000000','primarias',NULL,NULL),(99,73,76,'000000','primarias',NULL,NULL),(100,76,77,'000000','primarias',NULL,NULL),(101,75,77,'000000','secundarias',NULL,NULL),(102,74,77,'000000','secundarias',NULL,NULL),(103,24,78,'000000','primarias',NULL,NULL),(104,78,79,'000000','primarias',NULL,NULL),(105,79,80,'000000','primarias',NULL,NULL),(106,78,81,'000000','primarias',NULL,NULL),(107,81,80,'000000','secundarias',NULL,NULL),(108,24,82,'000000','primarias',NULL,NULL),(112,83,86,'000000','primarias',NULL,NULL),(115,86,88,'000000','primarias',NULL,NULL),(120,88,91,'000000','primarias',NULL,NULL),(127,2,94,'000000','primarias',NULL,NULL),(129,37,36,'000000','secundarias',NULL,NULL),(130,6,36,'000000','secundarias',NULL,NULL),(131,30,36,'000000','secundarias',NULL,NULL),(132,39,36,'000000','secundarias',NULL,NULL),(133,30,95,'000000','primarias',NULL,NULL),(134,95,36,'000000','secundarias',NULL,NULL),(135,95,96,'000000','primarias',NULL,NULL),(136,95,97,'000000','primarias',NULL,NULL),(137,97,98,'000000','primarias',NULL,NULL),(138,11,99,'000000','primarias',NULL,NULL),(139,99,36,'000000','secundarias',NULL,NULL),(140,99,100,'000000','primarias',NULL,NULL),(141,100,98,'000000','secundarias',NULL,NULL),(142,100,97,'000000','secundarias',NULL,NULL),(143,30,101,'000000','primarias',NULL,NULL),(144,99,97,'000000','secundarias',NULL,NULL),(145,99,96,'000000','secundarias',NULL,NULL),(146,101,96,'000000','secundarias',NULL,NULL),(238,39,30,'000000','secundarias',NULL,NULL),(239,30,99,'000000','secundarias',NULL,NULL),(240,11,36,'000000','secundarias',NULL,NULL),(241,11,161,'000000','primarias',NULL,NULL),(242,161,36,'000000','secundarias',NULL,NULL),(243,101,36,'000000','secundarias',NULL,NULL),(244,101,31,'000000','secundarias',NULL,NULL),(245,95,31,'000000','secundarias',NULL,NULL),(246,99,31,'000000','secundarias',NULL,NULL),(247,101,95,'000000','secundarias',NULL,NULL),(248,99,95,'000000','secundarias',NULL,NULL),(249,2,14,'000000','secundarias',NULL,NULL),(250,14,20,'000000','secundarias',NULL,NULL),(251,20,13,'000000','secundarias',NULL,NULL),(252,13,17,'000000','secundarias',NULL,NULL),(253,17,40,'000000','secundarias',NULL,NULL),(254,40,51,'000000','secundarias',NULL,NULL),(255,51,52,'000000','secundarias',NULL,NULL),(258,82,83,'000000','primarias',NULL,NULL),(259,88,163,'000000','primarias',NULL,NULL),(260,91,164,'000000','primarias',NULL,NULL),(261,163,165,'000000','primarias',NULL,NULL),(262,91,166,'000000','primarias',NULL,NULL),(263,164,165,'000000','secundarias',NULL,NULL),(264,88,165,'000000','secundarias',NULL,NULL),(265,163,167,'000000','primarias',NULL,NULL),(266,163,166,'000000','secundarias',NULL,NULL),(267,94,166,'000000','secundarias',NULL,NULL),(268,166,167,'000000','secundarias',NULL,NULL),(269,167,168,'000000','primarias',NULL,NULL),(270,166,168,'000000','secundarias',NULL,NULL),(271,168,169,'000000','primarias',NULL,NULL),(272,166,81,'000000','secundarias',NULL,NULL),(273,80,170,'000000','primarias',NULL,NULL),(274,63,171,'000000','primarias',NULL,NULL),(275,171,172,'000000','primarias',NULL,NULL),(276,172,173,'000000','primarias',NULL,NULL),(277,173,174,'000000','primarias',NULL,NULL),(278,174,175,'000000','primarias',NULL,NULL),(279,174,176,'000000','primarias',NULL,NULL),(280,175,177,'000000','primarias',NULL,NULL),(281,177,178,'000000','primarias',NULL,NULL),(282,177,179,'000000','primarias',NULL,NULL),(283,177,180,'000000','primarias',NULL,NULL),(284,23,181,'000000','primarias',NULL,NULL),(285,181,182,'000000','primarias',NULL,NULL),(286,182,183,'000000','primarias',NULL,NULL),(287,183,184,'000000','primarias',NULL,NULL),(288,184,185,'000000','primarias',NULL,NULL),(289,13,186,'000000','primarias',NULL,NULL),(290,77,187,'000000','primarias',NULL,NULL),(291,53,60,'000000','secundarias',NULL,NULL),(292,60,188,'000000','primarias',NULL,NULL),(293,59,189,'000000','primarias',NULL,NULL),(294,189,190,'000000','primarias',NULL,NULL),(295,188,189,'000000','secundarias',NULL,NULL),(296,40,191,'000000','primarias',NULL,NULL),(297,191,192,'000000','primarias',NULL,NULL),(298,41,193,'000000','primarias',NULL,NULL),(299,43,194,'000000','primarias',NULL,NULL),(300,44,195,'000000','primarias',NULL,NULL),(301,46,195,'000000','secundarias',NULL,NULL),(302,47,195,'000000','secundarias',NULL,NULL),(303,48,195,'000000','secundarias',NULL,NULL),(304,49,195,'000000','secundarias',NULL,NULL),(305,50,195,'000000','secundarias',NULL,NULL),(307,194,195,'000000','secundarias',NULL,NULL),(308,51,196,'000000','primarias',NULL,NULL),(309,196,197,'000000','primarias',NULL,NULL),(310,197,198,'000000','primarias',NULL,NULL),(311,198,199,'000000','primarias',NULL,NULL),(312,199,200,'000000','primarias',NULL,NULL),(313,200,201,'000000','primarias',NULL,NULL),(314,52,202,'000000','primarias',NULL,NULL),(315,202,203,'000000','primarias',NULL,NULL),(316,203,204,'000000','primarias',NULL,NULL),(317,204,205,'000000','primarias',NULL,NULL),(318,205,206,'000000','primarias',NULL,NULL),(319,206,207,'000000','primarias',NULL,NULL),(320,207,208,'000000','primarias',NULL,NULL),(321,208,209,'000000','primarias',NULL,NULL),(322,95,100,'000000','secundarias',NULL,NULL);
/*!40000 ALTER TABLE `relacion_primarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tema` varchar(100) DEFAULT NULL,
  `nivel` int unsigned NOT NULL,
  `freex` float(8,2) NOT NULL,
  `freey` float(8,2) NOT NULL,
  `textPosition` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` VALUES (1,'Matematicas',0,500.00,50.00,0,NULL,NULL),(2,'Aritmetica',1,-513.79,169.35,0,NULL,'2021-07-05 21:36:17'),(6,'Suma aritmética de números enteros',3,-1177.52,852.78,0,NULL,'2021-07-05 21:36:32'),(7,'Conjuntos Numericos ',3,-1441.15,644.14,0,NULL,'2021-07-05 21:36:21'),(8,'Tablas de  multiplicar',4,-1154.65,1099.07,0,NULL,'2021-07-07 17:06:10'),(9,'Clasificación de los números',4,-1594.79,870.71,0,NULL,'2021-07-05 21:36:23'),(10,'Matrices',3,969.92,600.41,0,NULL,'2021-07-06 14:38:18'),(11,'Multiplicación aritmética de números enteros',5,-1248.77,1305.31,0,NULL,'2021-07-05 22:12:23'),(12,'Conjuntos',2,-1174.38,418.68,0,NULL,'2021-07-05 21:36:20'),(13,'Álgebra  lineal',1,865.04,308.08,0,NULL,'2021-07-05 21:45:05'),(14,'Álgebra',1,-38.28,322.69,0,NULL,'2021-07-05 21:37:24'),(17,'Trigonometría',1,1462.62,349.93,0,NULL,'2021-07-05 21:50:23'),(19,'Triángulos rectángulos',2,1467.65,508.31,0,NULL,'2021-07-05 21:50:37'),(20,'Geometría',1,499.77,304.39,0,NULL,'2021-07-06 16:53:16'),(23,'Principios de la Geometría',2,524.39,483.71,0,NULL,'2021-07-09 02:41:23'),(24,'Expresiones algebraicas',2,-83.56,505.68,0,NULL,'2021-07-06 14:39:21'),(25,'Números racionales ',5,-1692.91,1109.98,0,NULL,'2021-07-05 21:36:24'),(26,'Operaciones Aritméticas ',2,-1007.38,598.77,0,NULL,'2021-07-05 21:36:30'),(27,'Común denominador ',6,-1819.75,1417.05,0,NULL,'2021-07-05 21:36:26'),(28,'Mínimo común múltiplo ',7,-1593.02,1599.21,0,NULL,'2021-07-05 22:11:30'),(29,'Máximo común divisor ',7,-1861.62,1853.46,0,NULL,'2021-07-05 21:36:27'),(30,'Suma de números racionales ',8,-1256.22,1748.11,0,NULL,'2021-07-06 14:38:53'),(31,'Ley de exponentes',9,-1403.74,2412.90,0,NULL,'2021-07-05 18:47:14'),(32,'Notación científica ',10,-1569.03,2092.53,0,NULL,'2021-05-07 16:29:47'),(33,'Ley de signos',6,-1552.55,1413.83,0,NULL,'2021-07-05 21:36:47'),(34,'Exponentes de números enteros elevados a números enteros',6,-1344.17,1419.81,0,NULL,'2021-07-05 21:36:49'),(35,'Jerarquías de las operaciones aritméticas',3,-670.48,960.40,0,NULL,'2021-07-05 22:11:53'),(36,'Operaciones  aritméticas  compuestas',4,-699.78,1529.30,0,NULL,'2021-07-05 22:12:15'),(37,'Resta aritmética de números enteros',3,-938.12,910.47,0,NULL,'2021-07-05 21:36:37'),(39,'División  aritmética de números enteros',6,-930.47,1328.05,0,NULL,'2021-07-05 22:12:31'),(40,'Funciones  matemáticas',1,2150.06,346.89,0,NULL,'2021-07-05 21:56:44'),(41,'Conceptos de  funciones  matemáticas',4,2203.80,864.99,0,NULL,'2021-07-05 21:56:55'),(42,'Dominio y rango de una función',6,2426.04,1170.02,0,NULL,'2021-07-05 21:57:02'),(43,'Funciones matemáticas',7,2490.98,1383.30,0,NULL,'2021-07-05 21:57:00'),(44,'Función  Lineal',8,2111.55,1645.99,0,NULL,'2021-07-07 17:50:26'),(46,'Función Cuadrática',8,2324.57,1647.06,0,NULL,'2021-07-05 21:58:05'),(47,'Función Polinomial',8,2507.52,1631.25,0,NULL,'2021-07-05 21:58:06'),(48,'Función  Exponencial',8,2685.78,1613.62,0,NULL,'2021-07-05 21:58:07'),(49,'Funciones  Logarítmicas',8,2878.57,1599.15,0,NULL,'2021-07-05 21:58:08'),(50,'Función  Valor absoluto',8,3054.93,1580.99,0,NULL,'2021-07-05 21:58:09'),(51,'Cálculo  Diferencial',1,3437.36,446.59,0,NULL,'2021-07-06 14:35:46'),(52,'Cálculo  Integral',1,4448.31,386.23,0,NULL,'2021-07-05 22:01:45'),(53,'Tríangulos  oblicuángulos',2,1724.79,563.69,0,NULL,'2021-07-06 14:40:30'),(54,'Círculo  unitario',3,1496.11,698.64,0,NULL,'2021-07-05 21:50:39'),(55,'Razones  trigonométricas',4,1575.17,868.63,0,NULL,'2021-07-05 21:50:44'),(56,'Funciones trigonómetricas',5,1691.70,1022.82,0,NULL,'2021-07-06 14:38:03'),(57,'Ángulos y sus  razones  trigonométricas',5,1410.50,1076.08,0,NULL,'2021-07-05 21:51:04'),(58,'Identidades  trigonométricas',6,1618.99,1212.16,0,NULL,'2021-07-05 21:51:06'),(59,'Ecuaciones trigonometricas',7,1542.22,1427.38,0,NULL,'2021-07-05 21:51:11'),(60,'Ley de los Cosenos',7,2022.12,1153.40,0,NULL,'2021-07-06 14:37:58'),(61,'Ángulos',3,395.58,657.22,0,NULL,'2021-07-07 19:06:53'),(62,'Polígonos',4,368.27,850.39,0,NULL,'2021-07-06 14:41:20'),(63,'Triángulos',5,478.74,1014.90,0,NULL,'2021-07-05 21:41:05'),(71,'Operaciones  con  matrices',4,960.98,777.87,0,NULL,'2021-07-06 14:38:20'),(72,'Transpuesta',5,1228.95,801.18,0,NULL,'2021-07-06 14:38:36'),(73,'Determinantes',6,1095.26,975.90,0,NULL,'2021-07-06 14:38:35'),(74,'Regla  de  Cramer',7,995.27,1137.96,0,NULL,'2021-07-06 14:38:26'),(75,'Método de Gauss Jordan',7,1148.01,1185.23,0,NULL,'2021-07-06 14:38:28'),(76,'Matriz  Inversa',7,1283.58,1078.12,0,NULL,'2021-07-06 14:38:30'),(77,'Solución de  sistemas de  ecuaciones  por matrices',8,1230.76,1402.05,0,NULL,'2021-07-06 14:38:22'),(78,' Ecuaciones algebraicas',3,14.09,871.74,0,NULL,'2021-07-07 17:08:30'),(79,'Métodos analíticos para la resolución de sistemas de ecuaciones',4,184.61,1359.67,0,NULL,'2021-07-07 17:10:37'),(80,'Sistemas  de  ecuaciones ',5,-151.56,2179.71,0,NULL,'2021-07-07 17:07:48'),(81,'Ecuaciones de  primer grado',4,136.20,1969.68,0,NULL,'2021-07-07 17:08:41'),(82,'Operaciones básicas del álgebra',3,-281.20,575.29,0,NULL,'2021-07-06 14:39:18'),(83,'Lenguaje común y lenguaje algebraico',4,-319.57,735.59,0,NULL,'2021-07-06 14:39:08'),(86,'Suma  y resta de  terminos algebraicos',5,-291.46,886.30,0,NULL,'2021-07-05 21:38:11'),(88,'Multiplicación de  términos algebraicos',6,-172.57,1048.52,0,NULL,'2021-07-05 21:38:14'),(91,'División de  términos  algebraicos',7,-418.28,1067.30,0,NULL,'2021-07-05 21:38:08'),(94,'Fórmula general  para ecuaciones  de segundo grado',2,-667.88,594.85,0,NULL,'2021-07-05 21:37:15'),(95,'División de  números  racionales',9,-1048.67,1890.31,0,NULL,'2021-07-05 22:15:57'),(96,'Radicales',10,-888.26,2634.73,0,NULL,'2021-07-05 21:37:02'),(97,'Regla  detres',10,-622.76,2513.68,0,NULL,'2021-07-05 21:37:08'),(98,'Porcentajes',11,-322.02,2550.74,0,NULL,'2021-07-05 21:37:06'),(99,'Multiplicación de  números  racionales',6,-609.41,1890.75,0,NULL,'2021-07-05 22:15:02'),(100,'Razón y proporciones',7,-453.88,2103.94,0,NULL,'2021-07-05 22:16:13'),(101,'Resta de  números  racionales',9,-1167.67,2475.64,0,NULL,'2021-07-05 21:37:00'),(161,'Exponentes de números racionales a numeros enteros',6,-745.80,1170.11,0,NULL,'2021-07-05 22:12:30'),(163,'Multiplicación de polinomios',7,3.00,1181.91,0,NULL,'2021-07-07 17:08:38'),(164,'División de polinomio entre monomio',8,-322.66,1298.23,0,NULL,'2021-07-05 21:38:10'),(165,'División de polinomio entre polinomio',8,-73.50,1397.47,0,NULL,'2021-07-05 21:38:06'),(166,'Factorización ',8,-425.67,1588.16,0,NULL,'2021-07-07 17:09:04'),(167,'Productos notables',8,37.52,1604.09,0,NULL,'2021-07-05 21:37:41'),(168,'Ecuaciones de segundo grado',9,-305.50,1796.56,0,NULL,'2021-07-07 17:08:50'),(169,'Solución de problemas reales con ecuaciones de segundo grado',10,-195.83,1964.06,0,NULL,'2021-07-07 17:08:44'),(170,'Solución de problemas reales con sistemas de ecuaciones',6,112.95,2409.49,0,NULL,'2021-07-07 17:08:43'),(171,'Triángulos  rectángulos',6,502.86,1176.93,0,NULL,'2021-07-05 21:41:25'),(172,'Cuadrilateros',7,523.54,1368.83,0,NULL,'2021-07-05 21:41:49'),(173,'Postulados y teoremas',8,554.56,1537.75,0,NULL,'2021-07-05 21:42:04'),(174,'Perímetros áreas y volúmenes',9,661.38,1687.14,0,NULL,'2021-07-05 21:42:43'),(175,'Congruencia de trángulos',10,547.66,1859.51,0,NULL,'2021-07-05 21:42:56'),(176,'Relación métrica de la circunferencia',10,856.53,1844.12,0,NULL,'2021-07-06 16:13:52'),(177,'Semezanjas de triangulos',11,610.84,2046.81,0,NULL,'2021-07-05 21:43:23'),(178,'Teorema de Thales de Mileto',12,432.79,2218.03,0,NULL,'2021-07-05 21:43:33'),(179,'Teorema de Pitágoras',12,594.76,2221.48,0,NULL,'2021-07-05 21:43:46'),(180,'Teorema de Euclides',12,742.94,2226.07,0,NULL,'2021-07-05 21:43:56'),(181,'Plano cartesiano',3,690.57,620.88,0,NULL,'2021-07-06 14:37:25'),(182,'Recta',4,757.86,798.73,0,NULL,'2021-07-05 21:44:19'),(183,'Circunferencia',5,777.66,980.54,0,NULL,'2021-07-06 14:37:23'),(184,'Elipse',6,809.33,1168.95,0,NULL,'2021-07-05 21:44:33'),(185,'Hipérbola',7,837.03,1366.59,0,NULL,'2021-07-05 21:44:45'),(186,'Sistema de n ecuaciones lineales con n incógnitas',2,915.67,459.12,0,NULL,'2021-07-07 17:15:50'),(187,'Solución de problemas reales con álgebra lineal',9,1086.29,1521.88,0,NULL,'2021-07-06 16:49:56'),(188,'Ley de los Senos',8,1976.81,1500.11,0,NULL,'2021-07-05 21:52:38'),(189,'Solución de trángulos rectángulos',8,1748.06,1704.19,0,NULL,'2021-07-09 16:58:00'),(190,'Solución de problemas reales con trigonometría',9,1749.38,1905.79,0,NULL,'2021-07-05 21:53:13'),(191,'Intervalos',2,2148.82,520.19,0,NULL,'2021-07-05 21:56:47'),(192,'Desigualdades - inecuaciones',3,2154.75,705.90,0,NULL,'2021-07-05 21:56:51'),(193,'Formas de expresar funciones matemáticas',5,2321.62,996.79,0,NULL,'2021-07-05 21:56:58'),(194,'Funciones Trigonométricas',8,3222.94,1549.02,0,NULL,'2021-07-05 21:58:09'),(195,'Modelado de funciones',9,2714.02,2006.90,0,NULL,'2021-07-05 21:59:54'),(196,'Límites y continuidad',2,3492.29,684.87,0,NULL,'2021-07-05 22:00:50'),(197,'Derivada',3,3485.69,864.04,0,NULL,'2021-07-05 22:00:58'),(198,'Razón de cambio',4,3484.37,1031.34,0,NULL,'2021-07-05 22:01:10'),(199,'Reglas de derivación',5,3465.90,1214.47,0,NULL,'2021-07-05 22:01:21'),(200,'Razones de cambio relacionadas',6,3479.09,1380.44,0,NULL,'2021-07-05 22:01:31'),(201,'Optimizacion',7,3500.21,1579.41,0,NULL,'2021-07-05 22:01:40'),(202,'Antiderivadas',2,4443.76,580.21,0,NULL,'2021-07-05 22:01:58'),(203,'Definición de la integral',3,4452.86,783.28,0,NULL,'2021-07-05 22:02:05'),(204,'Reglas de integración inmediatas',4,4452.86,940.87,0,NULL,'2021-07-05 22:02:17'),(205,'Métodos de integración',5,4427.09,1127.27,0,NULL,'2021-07-05 22:02:26'),(206,'Integral definida',6,4436.18,1287.90,0,NULL,'2021-07-05 22:02:32'),(207,'Áreas bajo la curva',7,4434.67,1465.20,0,NULL,'2021-07-05 22:02:44'),(208,'Sólido de revolución',8,4427.09,1640.99,0,NULL,'2021-07-05 22:02:54'),(209,'Volúmen de un sólido en revolución',9,4408.90,1810.71,0,NULL,'2021-07-05 22:03:10');
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 17:38:08
