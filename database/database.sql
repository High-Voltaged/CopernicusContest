-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2020 at 07:10 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `copernicus`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `picture_key` char(255) DEFAULT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `times_read` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `picture_key`, `author_id`, `category_id`, `times_read`, `timestamp`) VALUES
(3, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 4, '2020-05-12 17:47:38'),
(4, 'ok my name is title', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 126, '2020-05-12 20:09:44'),
(5, 'hkjhkh', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra, massa vitae elementum rutrum, nisi est hendrerit orci, in tincidunt sem tortor id dolor. Curabitur scelerisque ac lorem sed malesuada. Cras commodo a leo nec fringilla. Maecenas quis volutpat lacus. Duis condimentum rutrum nunc ut pellentesque. Nam id accumsan mi, vel rhoncus leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla facilisi. Vestibulum viverra felis ac dolor fermentum faucibus. Etiam pretium id magna ut tincidunt. Sed malesuada sodales bibendum. Suspendisse hendrerit, leo vel imperdiet hendrerit, sapien tortor molestie massa, et elementum metus ante ut ipsum. Quisque eu nibh quis nisi congue tristique.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra, massa vitae elementum rutrum, nisi est hendrerit orci, in tincidunt sem tortor id dolor. Curabitur scelerisque ac lorem sed malesuada. Cras commodo a leo nec fringilla. Maecenas quis volutpat lacus. Duis condimentum rutrum nunc ut pellentesque. Nam id accumsan mi, vel rhoncus leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla facilisi. Vestibulum viverra felis ac dolor fermentum faucibus. Etiam pretium id magna ut tincidunt. Sed malesuada sodales bibendum. Suspendisse hendrerit, leo vel imperdiet hendrerit, sapien tortor molestie massa, et elementum metus ante ut ipsum. Quisque eu nibh quis nisi congue tristique.\r\n\r\n\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra, massa vitae elementum rutrum, nisi est hendrerit orci, in tincidunt sem tortor id dolor. Curabitur scelerisque ac lorem sed malesuada. Cras commodo a leo nec fringilla. Maecenas quis volutpat lacus. Duis condimentum rutrum nunc ut pellentesque. Nam id accumsan mi, vel rhoncus leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla facilisi. Vestibulum viverra felis ac dolor fermentum faucibus. Etiam pretium id magna ut tincidunt. Sed malesuada sodales bibendum. Suspendisse hendrerit, leo vel imperdiet hendrerit, sapien tortor molestie massa, et elementum metus ante ut ipsum. Quisque eu nibh quis nisi congue tristique.', NULL, 1, 2, 860, '2020-05-12 20:09:46'),
(6, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 809, '2020-05-12 20:09:46'),
(7, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(8, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(9, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 791, '2020-05-12 20:09:46'),
(10, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 791, '2020-05-12 20:09:46'),
(11, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 1, '2020-05-12 17:47:38'),
(12, 'hkjhoktest', '<p> oko ko ko </p>\r\n<p> ok oko k <nt> dfgdf </p>\r\n\r\n<br>', NULL, 1, 2, 787963, '2020-05-12 20:09:44'),
(13, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 790, '2020-05-12 20:09:46'),
(14, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(15, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(16, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(17, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(18, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(19, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(20, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(21, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(22, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(23, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(24, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(25, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(26, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(27, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(28, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(29, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(30, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(31, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(32, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(33, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(34, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(35, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(36, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(37, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(38, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(39, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(40, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(41, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 791, '2020-05-12 20:09:46'),
(42, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(43, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(44, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(45, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(46, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(47, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(48, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(49, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(50, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(51, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 0, '2020-05-12 17:47:38'),
(52, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 0, '2020-05-12 20:09:44'),
(53, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(54, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 789, '2020-05-12 20:09:46'),
(55, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 1, '2020-05-12 17:47:38'),
(56, 'hkjh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 2, '2020-05-12 20:09:44'),
(57, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 793, '2020-05-12 20:09:46'),
(58, 'hkjhkh', 'okopkklj\r\ndfsdf\r\nsdfldfkjwkelfjlwkej', NULL, 1, 2, 793, '2020-05-12 20:09:46'),
(59, 'hkhkjhkjh', 'ghjg', NULL, 1, 1, 23, '2020-05-12 17:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'auth 1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'test1\r\n'),
(2, 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answer` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `question_id`, `answer`) VALUES
(1, 2, 'qwwe'),
(2, 2, 'fsddssdf'),
(3, 2, 'qwrwqrwrq'),
(4, 2, 'qweqwe'),
(5, 4, 'qwqwr'),
(6, 2, 'kljljlj ok'),
(7, 2, 'gdfgd'),
(8, 2, 'wetyewtwtewte');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_correct_answers`
--

CREATE TABLE `quiz_correct_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `correct_answer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_correct_answers`
--

INSERT INTO `quiz_correct_answers` (`id`, `question_id`, `correct_answer_id`) VALUES
(1, 1, 1),
(5, 2, 6),
(13, 2, 7),
(12, 2, 8),
(4, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `question`) VALUES
(1, 'q1'),
(2, 'q3q34errth thtg'),
(3, '56r6 56ritri ty'),
(4, 'tri tyrtyr ty rty');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_id_2` (`question_id`,`correct_answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `correct_answer_id` (`correct_answer_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`);

--
-- Constraints for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  ADD CONSTRAINT `quiz_correct_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`),
  ADD CONSTRAINT `quiz_correct_answers_ibfk_2` FOREIGN KEY (`correct_answer_id`) REFERENCES `quiz_answers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
