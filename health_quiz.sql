-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 05:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `created_at`) VALUES
(1, 'What are your hair type?', '2020-07-15 03:47:38'),
(2, 'Are your hair coloured?', '2020-07-15 03:47:38'),
(3, 'What Colour?', '2020-07-15 03:47:38'),
(4, 'How frequently you Shampoo your hair?', '2020-07-15 03:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_option` varchar(256) NOT NULL,
  `next_question` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `question_option`, `next_question`, `created_at`) VALUES
(29, 1, 'Straight (0.25)', 2, '2020-07-15 16:51:14'),
(30, 1, 'Wavy (0.32)', 2, '2020-07-15 16:51:14'),
(31, 1, 'Curly (0.45)', 2, '2020-07-15 16:51:14'),
(32, 1, 'Coily (0.15)', 2, '2020-07-15 16:51:14'),
(33, 2, 'Yes (0.60)', 3, '2020-07-15 16:51:14'),
(34, 2, 'No (0.42)', 4, '2020-07-15 16:51:14'),
(35, 3, 'Red (0.09)', 4, '2020-07-15 16:51:14'),
(36, 3, 'Black (0.12)', 4, '2020-07-15 16:51:14'),
(37, 3, 'Brown (0.04)', 4, '2020-07-15 16:51:14'),
(38, 3, 'Golden (0.01)', 4, '2020-07-15 16:51:14'),
(39, 3, 'Other (0.33)', 4, '2020-07-16 12:30:45'),
(40, 4, 'Everyday (0.12)', 0, '2020-07-15 16:51:14'),
(41, 4, 'Every 2-3 Days (0.22)', 0, '2020-07-15 16:51:14'),
(42, 4, 'Every Week (0.36)', 0, '2020-07-15 16:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `created_at`) VALUES
(1, 'chakravartyaashish@gmail.com', '2020-07-16 14:00:54'),
(2, 'chakravartyaashish@gmail.com', '2020-07-16 14:02:41'),
(3, 'chakravartyaashish@gmail.com', '2020-07-16 14:03:57'),
(4, 'chakravartyaashish@gmail.com', '2020-07-16 14:05:10'),
(5, 'chakravartyaashish@gmail.com', '2020-07-16 14:06:01'),
(6, 'chakravartyaashish@gmail.com', '2020-07-16 14:07:58'),
(7, 'chakravartyaashish@gmail.com', '2020-07-16 14:08:53'),
(8, 'chakravartyaashish@gmail.com', '2020-07-16 14:10:17'),
(9, 'chakravartyaashish@gmail.com', '2020-07-16 14:13:37'),
(10, 'chakravartyaashish@gmail.com', '2020-07-16 14:14:45'),
(11, 'chakravartyaashish@gmail.com', '2020-07-16 14:18:42'),
(12, 'chakravartyaashish@gmail.com', '2020-07-16 14:21:30'),
(13, 'chakravartyaashish@gmail.com', '2020-07-16 14:22:07'),
(14, 'chakravartyaashish@gmail.com', '2020-07-16 14:22:21'),
(15, 'chakravartyaashish@gmail.com', '2020-07-16 14:23:06'),
(16, 'chakravartyaashish@gmail.com', '2020-07-16 14:36:20'),
(17, 'chakravartyaashish@gmail.com', '2020-07-16 14:37:07'),
(18, 'chakravartyaashish@gmail.com', '2020-07-16 14:38:11'),
(19, 'chakravartyaashish@gmail.com', '2020-07-16 14:39:27'),
(20, 'chakravartyaashish@gmail.com', '2020-07-16 14:40:44'),
(21, 'chakravartyaashish@gmail.com', '2020-07-16 14:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `other_answer` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_id`, `question_id`, `option_id`, `other_answer`, `created_at`) VALUES
(1, 11, 1, 29, NULL, '2020-07-16 14:18:42'),
(2, 11, 2, 33, NULL, '2020-07-16 14:18:42'),
(3, 11, 3, 39, NULL, '2020-07-16 14:18:42'),
(4, 11, 4, 40, NULL, '2020-07-16 14:18:42'),
(5, 11, 4, 40, NULL, '2020-07-16 14:18:42'),
(6, 11, 4, 41, NULL, '2020-07-16 14:18:42'),
(7, 11, 4, 42, NULL, '2020-07-16 14:18:42'),
(8, 11, 4, 41, NULL, '2020-07-16 14:18:42'),
(9, 11, 4, 42, NULL, '2020-07-16 14:18:42'),
(10, 11, 4, 42, NULL, '2020-07-16 14:18:42'),
(11, 11, 4, 41, NULL, '2020-07-16 14:18:42'),
(12, 11, 4, 41, NULL, '2020-07-16 14:18:42'),
(13, 11, 4, 41, NULL, '2020-07-16 14:18:42'),
(14, 11, 4, 40, NULL, '2020-07-16 14:18:42'),
(15, 15, 1, 29, '', '2020-07-16 14:23:06'),
(16, 15, 2, 33, '', '2020-07-16 14:23:06'),
(17, 15, 3, 39, 'e', '2020-07-16 14:23:06'),
(18, 15, 4, 40, '', '2020-07-16 14:23:06'),
(19, 15, 4, 40, '', '2020-07-16 14:23:06'),
(20, 15, 4, 41, '', '2020-07-16 14:23:06'),
(21, 15, 4, 41, '', '2020-07-16 14:23:06'),
(22, 16, 1, 29, '', '2020-07-16 14:36:20'),
(23, 16, 2, 34, '', '2020-07-16 14:36:20'),
(24, 16, 4, 40, '', '2020-07-16 14:36:20'),
(25, 17, 1, 29, '', '2020-07-16 14:37:08'),
(26, 17, 2, 34, '', '2020-07-16 14:37:08'),
(27, 17, 4, 42, '', '2020-07-16 14:37:08'),
(28, 18, 1, 30, '', '2020-07-16 14:38:11'),
(29, 18, 2, 34, '', '2020-07-16 14:38:11'),
(30, 18, 4, 41, '', '2020-07-16 14:38:11'),
(31, 19, 1, 29, '', '2020-07-16 14:39:27'),
(32, 19, 2, 33, '', '2020-07-16 14:39:27'),
(33, 19, 3, 35, '', '2020-07-16 14:39:27'),
(34, 19, 4, 41, '', '2020-07-16 14:39:27'),
(35, 20, 1, 30, '', '2020-07-16 14:40:44'),
(36, 20, 2, 33, '', '2020-07-16 14:40:44'),
(37, 20, 3, 39, 'f', '2020-07-16 14:40:44'),
(38, 20, 4, 41, '', '2020-07-16 14:40:44'),
(39, 21, 1, 29, '', '2020-07-16 14:41:25'),
(40, 21, 2, 33, '', '2020-07-16 14:41:25'),
(41, 21, 3, 39, 'reww', '2020-07-16 14:41:25'),
(42, 21, 4, 41, '', '2020-07-16 14:41:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `next_question` (`next_question`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `option_id` (`option_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `question_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `question_options_ibfk_2` FOREIGN KEY (`next_question`) REFERENCES `questions` (`id`);

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `question_options` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
