-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 18, 2025 at 08:04 AM
-- Server version: 5.7.24
-- PHP Version: 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evangadi-forum-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` varchar(100) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`answerid`),
  KEY `questionid` (`questionid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answerid`, `userid`, `questionid`, `answer`, `created_at`, `is_deleted`) VALUES
(2, 11, '092051e2-be23-4160-a29f-d4fae89015b1', 'Express.js, a popular, minimal, and flexible web application framework for Node.js.', '2025-10-10 08:09:04', 0),
(3, 7, '092051e2-be23-4160-a29f-d4fae89015b1', 'it is ...', '2025-10-10 08:09:04', 0),
(4, 7, '0696a39d-3454-4bd3-9448-08cad3a2502b', 'A JSON Web Token (JWT) is a standard format for securely transmitting information between parties as a compact, digitally signed JSON object. It consists of a header, a payload containing claims (data about the user), and a signature that verifies its authenticity. JWTs are used for stateless authentication, allowing a server to verify a user\'s identity without needing to query a database for session data, making them useful for web and single-sign-on (SSO) applications. ', '2025-10-10 08:09:04', 0),
(5, 19, '0696a39d-3454-4bd3-9448-08cad3a2502b', 'To use JWT, first authenticate users to receive a token from the server. Then, the front-end stores this token and sends it to the server with subsequent requests, usually in the Authorization header. The server verifies the token\'s signature and, if valid, grants access to the requested resources based on the claims within the token.  ', '2025-10-10 08:09:04', 0),
(6, 19, '9ac920d8-1c68-4601-be4a-4159c3dfd9ce', 'JSX, or JavaScript XML, is a syntax extension for JavaScript that allows developers to write HTML-like code directly within their JavaScript files. It is primarily associated with the React library for building user interfaces but can be used with other libraries and frameworks as well.', '2025-10-10 08:09:04', 0),
(7, 7, '9ac920d8-1c68-4601-be4a-4159c3dfd9ce', 'asdfghjklzvc \ncvbnm,', '2025-10-10 08:09:04', 0),
(8, 22, '52dda930-bc2e-4d08-829e-ec473c715b51', 'JavaScript is a high-level, interpreted (or just-in-time compiled) programming language that is a core technology of the World Wide Web, alongside HTML and CSS. It enables interactive and dynamic content on web pages. While primarily known for its use in web browsers (client-side), it can also be used in other environments, such as server-side development with Node.js.', '2025-10-10 08:09:04', 0),
(9, 22, '5955b27c-28eb-4949-af9e-7427778f2bb0', 'CSS, which stands for Cascading Style Sheets, is a stylesheet language used to describe the presentation and styling of a document written in a markup language, most commonly HTML. It is one of the three core technologies of the World Wide Web, alongside HTML and JavaScript. ', '2025-10-10 08:09:04', 0),
(10, 22, '5955b27c-28eb-4949-af9e-7427778f2bb0', 'Css is ', '2025-10-10 08:09:04', 0),
(11, 7, '1f4abc8e-3656-42ac-b4d3-017c5691acb4', 'React Hooks are functions that allow you to \"hook into\" React state and lifecycle features from functional components. Introduced in React 16.8, they provide a way to use state and other React features without writing class components. ', '2025-10-10 08:09:04', 0),
-- (all other INSERTs remain exactly as your original dump)
(36, 34, '76a8437c-8f85-44ec-a3c9-90b13d461fb7', 'styling method', '2025-10-14 14:10:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `questionid` (`questionid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- INSERT statements for `questions` remain exactly as your original dump

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `reset_otp` varchar(255) DEFAULT NULL,
  `otp_expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- INSERT statements for `users` remain exactly as your original dump

-- --------------------------------------------------------
-- Foreign key constraints (keep as is)
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;