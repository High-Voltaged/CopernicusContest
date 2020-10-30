-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2020 at 12:56 AM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` char(32) NOT NULL,
  `password` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2b$08$JqqlHy0jLezR.mqXXlrEM.8NJKmO4u.YdDo1JXiLqFJYvK4GKdqRO');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `picture_link` char(255) NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` int(10) UNSIGNED NOT NULL,
  `times_read` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `picture_link`, `important`, `category_id`, `times_read`, `timestamp`) VALUES
(70, 'asdfsfsdf', 'wdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\nwdfwfwf\n', 'fwefwef', 0, 1, 3, '2020-10-28 23:16:41'),
(71, 'wefwefwefwf wwefwef wef', 'wefwefwefwf wwefwef wefwefwefwefwf wwefwef wef\nwefwefwefwf wwefwef wef\nwefwefwefwf wwefwef wefwefwefwefwf wwefwef wefwefwefwefwf wwefwef wefwefwefwefwf wwefwef wef\nwefwefwefwf wwefwef wefsa\nas\nda\nsd\nasd\nsad\na\nsd\nasd\nas\nda\ns\nasdasdasdasd', 'asdasd.com', 0, 1, 2, '2020-10-28 23:17:59'),
(73, 'Najważniejsze wynalazki i odkrycia Mikołaja Kopernika', '1. Teoria heliocentryczna\r\nOczywiście, do tych najważniejszych należy propagowanie teorii heliocentrycznej, która była znana już w czasach starożytnych, ale dopiero dzieło Kopernika, „O obrotach sfer niebieskich”, było prawdziwą sensacją w świecie nauki. Sześć ksiąg, składających się na kontrowersyjną pracę, ukazało się w 1543 roku w Norymberdze. To tutaj znalazł się wykład o budowie świata, według którego Słońce znajduje się w centrum Układu Słonecznego, a planety krążą wokół niego.\r\n\r\n\r\n2. Traktatem o monetach\r\nTraktat monetarny Mikołaja Kopernika, zwany również „Traktatem o monetach” był pracą z dziedziny polityki pieniężnej, którą Kopernik wykonał na zlecenie króla Zygmunta Starego. Naukowiec zwrócił w niej uwagę na relację między podażą a inflacją, ale nie tylko.\r\n\r\n\r\n3. Prawo Kopernika-Greshama\r\nPrawo Kopernika-Greshama to jedna z teorii traktatu monetarnego, która zakłada, że jeśli istnieją pieniądze, które są różne, ale zgodnie z prawem równowartościowe, to te, które wykonano z lepszego kruszcu, będą gromadzone, a w obiegu zostaną te gorsze. Thomas Gresham był, podobnie jak Kopernik, ekonomistą, który równolegle zajmował się tym zagadnieniem, a na cześć naukowców prawo to nosi ich imiona.\r\n\r\n4. Twierdzenie Kopernika\r\nTwierdzenie Kopernika zostało odkryte dwukrotnie już dużo wcześniej, ale toruński uczony nie miał o tym pojęcia, stąd jego publikacja w 1543 roku. Zakłada ono, że jeśli wewnątrz okręgu toczy się okrąg o promieniu dwa razy mniejszym, to dowolny ustalony punkt mniejszego okręgu będzie się poruszał prostoliniowo po średnicy tego większego.\r\n\r\n5. Zmienność ekscentryczności Ziemi,\r\nKopernik prowadził obserwacje astronomiczne, dzięki którym udało mu się odkryć zmienność ekscentryczności Ziemi, czyli wielkości, która charakteryzuje kształt orbity, a także ruchu apogeum słonecznego wobec gwiazd stałych.\r\n\r\n6. Reforma kalendarza juliańskiego\r\nOd 1513 do 1516 roku Mikołaj Kopernik brał czynny udział w pracach nad reformą kalendarza juliańskiego. Potrzeba poprawy kalendarza spowodowała, że Kopernik dokładnie wyznaczył długość roku zwrotnikowego na 365 dni, a jego badania przyczyniły się do powstania kalendarza gregoriańskiego niedługo po tym.\r\n\r\n7. Środek planety\r\nKopernik dowiódł, że nie istnieje jeden środek wszystkich sfer i kół niebieskich. Środek planety nie jest zaś środkiem wszechświata, a jedynie wyznacza środek ciężkości i środek sfery księżyca.\r\n\r\n8. Żaden punkt Wszechświata nie jest wyróżniony.\r\nPodstawą współczesnej astronomii jest również przekonanie Kopernika o tym, że ta część Wszechświata, którą możemy obserwować z Ziemi, niczym nie różni się od części, które nie są dostępne dla naszych oczu i teleskopów. Zgodnie z tą zasadą kopernikańską żaden punkt Wszechświata nie jest wyróżniony.\r\n\r\n9. Ziemia wykonuje pełny obrót wokół własnej osi\r\nMikołaj Kopernik opisał zjawisko, które dziś wydaje się absolutną oczywistością, ale w jego czasach brzmiało to jak herezje. Wyjaśnił bowiem, że każdego dnia Ziemia wykonuje pełny obrót wokół własnej osi, a jeśli na firmamencie widzimy jakiś ruch, to nie dlatego, że on nastąpił, ale dlatego, że Ziemia ciągle jest w ruchu.\r\n\r\n10. Źródło Pandemii w Olsztynie\r\nKopernik zajmował się dotkliwym problemem pandemii w Olsztynie i odkrył, że przyczyną choroby zakaźnej było spożywanie chleba, który był magazynowany w fatalnych warunkach. Dzięki jego spostrzeżeniom powstrzymano rozwój zarazy i zaniechano jedzenia brudnego i nieświeżego jedzenia.\r\n\r\n', 'https://webprojektor.pl/wp-content/uploads/2020/04/kopernik-700x438.jpg', 1, 1, 15, '2020-10-28 23:29:05');

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
(1, 'Osiągnięcia'),
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
(92, 18, 'Polakiem'),
(93, 18, 'Prusem'),
(94, 18, 'Rosjaninem'),
(95, 18, 'Bołgarem'),
(99, 20, '5 lat'),
(100, 20, '10 lat'),
(101, 20, '25 lat'),
(102, 20, '40 lat'),
(103, 21, 'Kraków, Polska'),
(104, 21, 'Rzym, Włochy'),
(105, 21, 'Warszawa, Polska'),
(106, 21, 'Toruń, Polska'),
(107, 22, 'Prawo kanoniczne'),
(108, 22, 'Fizyke'),
(109, 22, 'Astronomie'),
(110, 22, 'Matematyke i optyke'),
(111, 23, 'Francuski'),
(112, 23, 'Polski'),
(113, 23, 'Łacine'),
(114, 23, 'Włoski'),
(115, 24, 'Ptolemeusza'),
(116, 24, 'Isaac Newtona'),
(117, 24, 'James Kirka'),
(118, 24, 'Keplera'),
(119, 25, 'Geocentryzm'),
(120, 25, 'Heliocentryzm'),
(121, 25, 'Grawitacja'),
(122, 25, 'Przyrost'),
(123, 26, 'Geocentryzm'),
(124, 26, 'Heliocentryzm'),
(125, 26, 'Grawitacja'),
(126, 26, 'Przyrost'),
(127, 27, '10 zł'),
(128, 27, '5 zł'),
(129, 27, '25 zł'),
(130, 27, '1 grosz'),
(135, 29, 'Filologią'),
(136, 29, 'Astrologią'),
(137, 29, 'Ekonomią'),
(138, 29, 'Prawem'),
(139, 30, 'Bezwładności'),
(140, 30, 'Swobodnego spadania'),
(141, 30, 'Rozpadu naturalnego'),
(142, 30, 'Powszechnego ciążenia');

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
(32, 18, 92),
(34, 20, 102),
(35, 21, 106),
(36, 22, 110),
(37, 23, 113),
(38, 24, 115),
(39, 25, 120),
(40, 26, 124),
(41, 27, 127),
(43, 29, 137),
(44, 30, 142);

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
(18, 'Jakiej narodowości był Mikołaj Kopernik?'),
(19, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(20, 'Ile lat pracował Kopernik nad swoją pracą O rotacji sfer niebieskich?'),
(21, 'Gdzie urodził się Kopernik?'),
(22, 'Co studiował Kopernik na Uniwersytecie Krakowskim?'),
(23, 'Na jaki język tłumaczył poezję grecką Kopernik będąc biskupem?'),
(24, 'Whose astronomical system did Copernicus prove wrong?'),
(25, 'Jaka była teoria astronomiczna, którą rozwinął Kopernik?'),
(26, 'Jaka była teoria astronomiczna, którą rozwinął Kopernik?'),
(27, 'Na jakiej polskiej monecie widnieje Kopernik?'),
(28, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(29, 'Jaką inną nauką zajmował się Kopernik poza astronomią?'),
(30, 'O którym z praw fizycznych Kopernik jako jeden z pierwszych wypowiedział się?');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` char(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `token`, `timestamp`) VALUES
(2, 1, 'gennned key', '2020-10-08 19:36:17'),
(3, 1, 'gennned key', '2020-10-08 19:37:29'),
(4, 1, 'c795d04bc270bac6721bb44b6b8bfbbeb7d165c070f934f0189a3d10cb682842', '2020-10-08 20:28:17'),
(5, 1, 'b2cf8ff427c3e26c0d2215e7a55b6e04b0bbfea19cde773dc642d862aefd108f', '2020-10-09 16:59:55'),
(6, 1, 'dadb01e5d915f732f67e1e707f37b77b7ee76fc41434014b2ba11986283b8eca', '2020-10-09 19:21:37'),
(7, 1, '6d609fc6395b89b967453893a24b9697cf8d1170ec38b78e65416f2260204257', '2020-10-09 19:31:09'),
(8, 1, '7b32de3658aa659d5915e4549b8a1326c374b1447ef185e7d6cef808f8e75506', '2020-10-09 19:31:11'),
(9, 1, '3f2c861e2fbe2360c1e4da4b418b278793f61f33e73b898419e3968e749923d7', '2020-10-09 19:31:11'),
(10, 1, 'd06088c05a294adb23a41fdbe61848e2782ce8304c18f97ace3c1511b41c63e5', '2020-10-09 19:31:11'),
(11, 1, 'ec9aa2a956cb3c8bea8a83be9633d7358fda5511ff2292596c7def87d9863f22', '2020-10-09 21:15:00'),
(12, 1, '64b3069dda6a17f21934e3d51800cabc925b45cea77203812f25276662dbb530', '2020-10-09 21:15:02'),
(13, 1, 'ece00fce43e19208068cba3ab1e891a5d2dfc0a1d8a8c532fc7f0b027a0e29f7', '2020-10-09 21:15:04'),
(14, 1, '2ef888921e78af0c2ceec98b41cae2ec9a6a3b2126498650c62a59762049fd8e', '2020-10-09 21:15:04'),
(15, 1, '2850c32652ac18218c50ef73f44c7eb090e15c5fb35bccd938256b84101377da', '2020-10-09 21:15:04'),
(16, 1, '2269bc9f93c33a6aad74d3811c6b937fe63f12b09da5517ba83118001e907b55', '2020-10-09 22:07:20'),
(17, 1, '955a55a9bace67bb02cb0bf428f65e214ad44ba1790cb6cb22920bcbd54be84d', '2020-10-09 22:07:21'),
(18, 1, '0b90ba2bcdd1815441a1f2397feac576f7f31c5d40fb98b64df9fd6757a40c60', '2020-10-10 09:43:23'),
(19, 1, '638557852676c6a72f1d341a8731105cea3bd1fcf4d0bb6fb66383e1d6ab291a', '2020-10-10 09:43:24'),
(20, 1, 'd8ac9937c1bb5789b7da8ac462f688be44bada5383cb81ff748d203850f64345', '2020-10-11 09:32:47'),
(21, 1, 'eb47c5134ecef2ce5628e41acc6ff5807c20fd3e3f8eae4355a00e11ff49bb4a', '2020-10-11 11:16:23'),
(22, 1, 'c81de899d4dbe8eb809ab2133a29a5557fbab54007d1fb603b63d940cd469fcb', '2020-10-11 11:23:52'),
(23, 1, '9c', '2020-10-11 11:25:26'),
(24, 1, 'f65608508dbc58ae0b7c5fa1b0fb06a7e798d30c0d2265870c54fb3bb847479a', '2020-10-11 11:29:11'),
(25, 1, '77a45ed0b47250d1e597e1d1ed7b08e67f62857eb5f8db236b17df6ae556601b', '2020-10-12 17:29:41'),
(26, 1, 'ec4b1af6da5416c9af03919d94585f501f0a6bd680851c710ac0138229ab9b66', '2020-10-12 17:29:42'),
(27, 1, '92afab52ea83d1afd5b645b767d1cce6bb301c068d3a49ed0c2d97a0c02d94ea', '2020-10-18 16:06:59'),
(28, 1, 'fc39b80c53415e11a77f678282057a8ce62dae5cc76a4bc702892c7d9d886683', '2020-10-18 16:07:01'),
(29, 1, 'd47bd06369d0e22dd396536c2eb3c61e865e8366aa43ce5cba32eda3b58b13c1', '2020-10-18 16:07:02'),
(30, 1, 'aab96ad795d5bd79779529fcac663c4863c8ef33e34c3c6affbbed7fa6ee5004', '2020-10-18 16:07:02'),
(31, 1, 'b68828888cdf03ce5096708c0c51e0bde58cdc29fbcc2263c5f4257c85a247dd', '2020-10-18 16:07:02'),
(32, 1, '1453a079a1f95aec153f5a4318f690d872c1f66e0a149ca966af23a219b18704', '2020-10-18 16:07:02'),
(33, 1, '7e6785c3cae04c27f65a8ea93b1f5f8bd80efeb23b9a588b032364ce7efc40d9', '2020-10-18 16:07:03'),
(34, 1, '0315a8cfcb2af61795859079db7c3427f674f6472e896f6d416a5814ce8e3ee6', '2020-10-18 16:07:03'),
(35, 1, '8e62b9eb27938d31266b296419a4d056643792f944421e6a3d22d976973dceb0', '2020-10-18 16:07:03'),
(36, 1, '0d1570f664788758c9560dd75958d0f26e91c296b1f29414c9049085e4157e82', '2020-10-18 16:08:25'),
(37, 1, 'ec9b3c1c2cbb792e927022548daea702260f7249860fa2e36b1b837027f15141', '2020-10-18 16:08:26'),
(38, 1, '6b2f735a4143e1f893c9e435c680d0dd19efdf1179f8f5351334d1cd4ab70605', '2020-10-18 16:08:26'),
(39, 1, 'bc5d24abdf86a00e78f49408c56e4009da2cd76a937b1b56ed62b9a3a0ec1999', '2020-10-18 16:08:26'),
(40, 1, 'a012d0a6c3b87a344db01549f1e7be93190c2948d7c461d545861116eaa1aded', '2020-10-18 16:08:27'),
(41, 1, '9b8577cb336ce706fa46cd96d0b74698cfce2e4aed645912499ff4c77d13d61d', '2020-10-18 16:11:54'),
(42, 1, '743a7f1c62cbce739481d211826b2bc0fcc2c88835806ca970136710c9aa0788', '2020-10-18 16:12:06'),
(43, 1, '39a929ced019a9fe74ca49af9884dd3b3df5202a1036a136d796cf97cf8fd7b6', '2020-10-18 18:15:03'),
(44, 1, '2cc2fed758fdedb55880959cc059df7ff80d3b83e55bbe76e3978ea83cc19bd4', '2020-10-18 18:18:22'),
(45, 1, 'd1b31a6cae507083bf0223631953b4f33f0661a66b3af74ff94ec67b2f5839a7', '2020-10-18 18:18:28'),
(46, 1, '71fec8de945b9d1b08a092ad684f954b8401df3d928e4b84ab9375a799fbb12b', '2020-10-18 18:22:57'),
(47, 1, 'aad1de59bbbfd90d434ff43b406bca999285e949071da923b7ed32dd99106618', '2020-10-19 08:21:23'),
(48, 1, 'f7fa711f5bdc8f164b30a4cc234353581662cde80480cee54797196810d6bb4a', '2020-10-19 08:21:55'),
(49, 1, '46b75767cac36514b6e2527bf09528d5807cc6ffbbf6d850d760b814a586cadb', '2020-10-19 11:30:04'),
(50, 1, '09ec5fbf8ceb3be9236f7ea1e71888f46e8dfa7b073226336ccc3e043edf3429', '2020-10-19 12:50:43'),
(51, 1, 'efdd10d75d1402b74e5446878c0d52d0374f0561319fb74c812322b65f27bd2d', '2020-10-21 12:21:40'),
(52, 1, '5a0428f02ae30b10da38526ebebcc855054ab2a31f86c9b7e4e5fc851c58aedf', '2020-10-21 12:21:41'),
(53, 1, 'a0b859a5126f22a1696a560e647292546cc1de781b5cfa8a41249a773ded9e1c', '2020-10-24 22:48:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `important` (`important`);

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
  ADD UNIQUE KEY `correct_answer_id` (`correct_answer_id`),
  ADD UNIQUE KEY `question_id` (`question_id`),
  ADD UNIQUE KEY `question_id_2` (`question_id`,`correct_answer_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_correct_answers`
--
ALTER TABLE `quiz_correct_answers`
  ADD CONSTRAINT `quiz_correct_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_correct_answers_ibfk_2` FOREIGN KEY (`correct_answer_id`) REFERENCES `quiz_answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
