-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 10/05/2022 às 07:19
-- Versão do servidor: 5.7.37-0ubuntu0.18.04.1
-- Versão do PHP: 7.2.34-28+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `alunos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tvbox`
--

CREATE TABLE `tvbox` (
  `id` int(11) NOT NULL,
  `modelo` varchar(150) NOT NULL,
  `processador` date NOT NULL,
  `sistemaoperacional` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `tvbox`
--

INSERT INTO `tvbox` (`id`, `modelo`, `processador`, `sistemaoperacional`) VALUES
(4, 'biologia', '2022-07-06', '12:34:00'),
(5, 'historia', '2022-07-06', '12:34:00'),
(6, 'web2', '2022-05-03', '08:31:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tvbox`
--

CREATE TABLE `tvbox` (
  `id` int(11) NOT NULL,
  `modelo` varchar(10) NOT NULL,
  `processador` varchar(255) NOT NULL,
  `sistemaoperacional` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tvbox`
--
ALTER TABLE `tvbox`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tvbox`
--
ALTER TABLE `tvbox`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tvbox`
--
ALTER TABLE `tvbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `tvbox`
--
ALTER TABLE `tvbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
