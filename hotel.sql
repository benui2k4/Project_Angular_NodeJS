-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 31, 2024 lúc 09:14 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hotel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `creaed_at` date DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `password`, `role`, `creaed_at`, `last_login`) VALUES
(1, 'admin', 'admin@gmail.com', '1234', 'admin', '2024-07-29', '2024-07-29 15:30:16'),
(2, 'user', 'user@gmail.com', '1234', 'user', '2024-07-29', '2024-07-29 15:30:16'),
(3, 'Nguyễn Văn Hoàng', 'h@gmail.com', '4321', 'user', '2024-07-29', '2024-07-29 15:30:16'),
(4, 'Nguyễn Huyền Trang', 't@gmail.com', '3242', 'user', '2024-07-29', '2024-07-29 15:30:16'),
(5, 'Nguyễn Ngọc Vân', 'v@gmail.com', 'cr13', 'user', '2024-07-29', '2024-07-29 15:30:16'),
(6, 'Nguyễn Hồng Ngọc', 'n@gmail.com', '65k3', 'user', '2024-07-29', '2024-07-29 15:30:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Phòng Standard', 1),
(2, 'Phòng Superior', 2),
(3, 'Phòng Deluxe', 3),
(4, 'Phòng Suite ', 4),
(5, 'Connecting room', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favourite`
--

CREATE TABLE `favourite` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `creaed_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `code` float DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `description` text NOT NULL,
  `creaed_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room`
--

INSERT INTO `room` (`id`, `name`, `price`, `code`, `image`, `category_id`, `status`, `description`, `creaed_at`) VALUES
(1, 'Phòng Standard (STD)', 543, 4523, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYjLlugUFGj32Sypp3vZKVQW9SBEZSmlccbg&usqp=CAU', 1, 1, 'Phòng có ban công, thoáng mát và đầy đủ tiện nghi', '2024-07-29'),
(2, 'Phòng Superior (SUP)', 1, 1243, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJTgGeRt3s1cifa002JqDg5svwmRLjqf6keWSFIiYR3ovau2Gss90wSA_qucBL6mW_W3E&usqp=CAU', 2, 2, 'Phòng có ban công hướng biển, có bồn tắm ngoài trời và cây cảnh xung quanh', '2024-07-29'),
(3, 'Phòng Deluxe (DLX)', 2.432, 7853, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkhlmh_KIRbhE71MXF_uNHuq6Jrrjs_XT7wg&usqp=CAU', 3, 0, 'Phòng tiện nghi hiện đại, có view hướng biển và hoàng hôn cực chill', '2024-07-29'),
(4, 'Phòng Suite (SUT)', 23.351, 3452, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR85GyId10hsQV0T3omycWADuvXNPqKhc63Q&usqp=CAU', 4, 3, 'Phòng có đồ đạc hiện đại bậc nhất và được phục vụ đồ ăn 24/24', '2024-07-29'),
(5, 'Connecting room ', 1.123, 2452, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIZhgqaZrHRWYiaV9EcUkDwCN_fzE0P3IgKg&usqp=CAU', 1, 4, 'Nhân viên nhiệt tình cùng với phục vụ tận tâm chu đáo', '2024-07-29'),
(6, 'Twin bed room (TWN)', 7.325, 3754, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(7, 'Double bed room (DBL)', 241, 842, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9iWTD86lWNvhOAJjcLKDzLyQQ-ttvlczXcA&usqp=CAU', 5, 8, 'Phòng ngủ bình dân, có những thiết bị phục vụ nhu cầu cơ bản', '2024-07-29'),
(8, 'Single bed room (SGL)', 7.325, 37554, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(9, 'Triple bed room (TRPL)', 7.325, 37354, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(10, 'Quad room', 7.325, 3235750, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(11, 'Mini Suite', 7.325, 352754, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(12, 'Hollywood Twin room', 7.325, 375354, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(13, 'Double-Double room', 7.325, 372354, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(14, 'Junior Suite room', 7.325, 3732550, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(15, 'Villa', 7.325, 375254, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(16, 'Bungalow', 7.325, 37254, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(17, 'Murphy room', 7.325, 325754, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(18, 'Executive Floor', 7.325, 375464, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(19, 'Non-Smoking Room', 7.325, 36754, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(20, 'Floored Room', 7.325, 376454, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, 5, 'Phòng qua đêm dành cho các khách du lịch', '2024-07-29'),
(21, 'Disabled room', 7.325, 375634, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3, NULL, '', '2024-07-29');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `favourite`
--
ALTER TABLE `favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Các ràng buộc cho bảng `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
