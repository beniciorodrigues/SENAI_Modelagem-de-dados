-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: deliverysuper
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `id_carrinho` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_mercado` int NOT NULL,
  `data_criacao` date NOT NULL,
  PRIMARY KEY (`id_carrinho`),
  KEY `fk_Carrinho_Usuario1_idx` (`id_usuario`),
  KEY `fk_carrinho_mercado_idx` (`id_mercado`),
  CONSTRAINT `fk_carrinho_mercado` FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`),
  CONSTRAINT `fk_Carrinho_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cartao_usuario`
--

DROP TABLE IF EXISTS `cartao_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao_usuario` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `numero_cartao` varchar(25) NOT NULL,
  `data_vencimento` varchar(15) NOT NULL,
  PRIMARY KEY (`sequencial`,`id_usuario`),
  KEY `fk_Cartao_Usuario_Usuario1` (`id_usuario`),
  CONSTRAINT `fk_Cartao_Usuario_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaborador` (
  `id_colaborador` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cnh` varchar(30) NOT NULL,
  `data_contrato` date NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_mercado`
--

DROP TABLE IF EXISTS `email_mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_mercado` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_mercado` int NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`sequencial`),
  KEY `fk_Telefone_Mercado_Mercado10` (`id_mercado`),
  CONSTRAINT `fk_Telefone_Mercado_Mercado10` FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco_mercado`
--

DROP TABLE IF EXISTS `endereco_mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_mercado` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_mercado` int NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  PRIMARY KEY (`sequencial`),
  KEY `fk_Endereco_Mercado_Mercado1` (`id_mercado`),
  CONSTRAINT `fk_Endereco_Mercado_Mercado1` FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco_usuario`
--

DROP TABLE IF EXISTS `endereco_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_usuario` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  PRIMARY KEY (`sequencial`,`id_usuario`),
  KEY `fk_Endereco_Usuario_Usuario` (`id_usuario`),
  CONSTRAINT `fk_Endereco_Usuario_Usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `id_mercado` int NOT NULL,
  `id_produto` int NOT NULL,
  `tipo_de_movimento` enum('Entrada','Saida') NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `data` date NOT NULL,
  `preco_un_de_venda` decimal(10,2) NOT NULL,
  `preco_un_de_compra` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `fk_Estoque_Mercado1_idx` (`id_mercado`),
  KEY `fk_Estoque_Produto1_idx` (`id_produto`),
  CONSTRAINT `fk_Estoque_Mercado1` FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`),
  CONSTRAINT `fk_Estoque_Produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mercado`
--

DROP TABLE IF EXISTS `mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercado` (
  `id_mercado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_cadastro` date NOT NULL,
  `horario_funcionamento` time NOT NULL,
  PRIMARY KEY (`id_mercado`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_carrinho` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_colaborador` int NOT NULL,
  `data` date NOT NULL,
  `status` enum('APROVADO','NEGADO','ENTREGUE','PENDENTE') NOT NULL COMMENT 'Aprovado = A\nNegado = N',
  `hora` time NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_carrinho_UNIQUE` (`id_carrinho`),
  KEY `fk_Pedido_Usuario1_idx` (`id_usuario`),
  KEY `fk_Pedido_Colaborador1_idx` (`id_colaborador`),
  KEY `fk_Pedido_Carrinho1_idx` (`id_carrinho`),
  CONSTRAINT `fk_Pedido_Carrinho1` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`id_carrinho`),
  CONSTRAINT `fk_Pedido_Colaborador1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id_colaborador`),
  CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prod_carrinho`
--

DROP TABLE IF EXISTS `prod_carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_carrinho` (
  `id_carrinho` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_carrinho`,`id_produto`),
  KEY `fk_Prod_Carrinho_Produto1_idx` (`id_produto`),
  CONSTRAINT `fk_Prod_Carrinho_Carrinho1` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`id_carrinho`),
  CONSTRAINT `fk_Prod_Carrinho_Produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_un_medida` int NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_Produto_Sigla1_idx` (`id_un_medida`),
  CONSTRAINT `fk_Produto_Sigla1` FOREIGN KEY (`id_un_medida`) REFERENCES `unidade_medida` (`id_un_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_mercado`
--

DROP TABLE IF EXISTS `telefone_mercado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_mercado` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_mercado` int NOT NULL,
  `telefone` varchar(25) NOT NULL,
  PRIMARY KEY (`sequencial`),
  KEY `fk_Telefone_Mercado_Mercado1` (`id_mercado`),
  CONSTRAINT `fk_Telefone_Mercado_Mercado1` FOREIGN KEY (`id_mercado`) REFERENCES `mercado` (`id_mercado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `telefone_usuario`
--

DROP TABLE IF EXISTS `telefone_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone_usuario` (
  `sequencial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `telefone` varchar(25) NOT NULL,
  PRIMARY KEY (`sequencial`,`id_usuario`),
  KEY `fk_Telefone_Usuario_Usuario1` (`id_usuario`),
  CONSTRAINT `fk_Telefone_Usuario_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade_medida`
--

DROP TABLE IF EXISTS `unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_medida` (
  `id_un_medida` int NOT NULL AUTO_INCREMENT,
  `sigla` varchar(5) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id_un_medida`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-17 19:16:39
