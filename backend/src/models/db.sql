create database hotel;
use hotel;

create table account(
    id int primary key AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(100) NOT NULL,
    role varchar(50),
    creaed_at date DEFAULT NOW(),
    last_login datetime DEFAULT NOW()
);

create table category(
    id int primary key AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    status tinyint
);

create table room(
    id int primary key AUTO_INCREMENT,
    name varchar(120) NOT NULL,
    price float NOT NULL default 0,
    code float NULL unique,
    image varchar(200) NOT NULL,
    category_id int NOT NULL,
    status tinyint NULL DEFAULT 1,
    description text NOT NULL,
    creaed_at date DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

create table favourite(
    id int primary key AUTO_INCREMENT,
    account_id int NOT NULL,
    room_id int NOT NULL,
    creaed_at date DEFAULT NOW(),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

insert into account(name, email, password, role) values
(N'admin', 'admin@gmail.com', '1234', 'admin'),
(N'user', 'user@gmail.com', '1234', 'user'),
(N'Nguyễn Văn Hoàng', 'h@gmail.com', '4321', 'user'), 
(N'Nguyễn Huyền Trang', 't@gmail.com', '3242', 'user'),
(N'Nguyễn Ngọc Vân', 'v@gmail.com', 'cr13', 'user'),
(N'Nguyễn Hồng Ngọc', 'n@gmail.com', '65k3', 'user');

insert into category(name, status) values
(N'Phòng Standard', 1),
(N'Phòng Superior', 2),
(N'Phòng Deluxe', 3),
(N'Phòng Suite ', 4),
(N'Connecting room', 5);

insert into room(name, code, price, image, category_id, status, description) values
(N'Phòng Standard (STD)', '4523', '543.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYjLlugUFGj32Sypp3vZKVQW9SBEZSmlccbg&usqp=CAU', 1 , 1 , N'Phòng có ban công, thoáng mát và đầy đủ tiện nghi'),
(N'Phòng Superior (SUP)', '1243', '1.000.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJTgGeRt3s1cifa002JqDg5svwmRLjqf6keWSFIiYR3ovau2Gss90wSA_qucBL6mW_W3E&usqp=CAU', 2 , 2 , N'Phòng có ban công hướng biển, có bồn tắm ngoài trời và cây cảnh xung quanh'),
(N'Phòng Deluxe (DLX)', '7853', '2.432.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkhlmh_KIRbhE71MXF_uNHuq6Jrrjs_XT7wg&usqp=CAU', 3 , 0 , N'Phòng tiện nghi hiện đại, có view hướng biển và hoàng hôn cực chill'),
(N'Phòng Suite (SUT)', '3452', '23.351.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR85GyId10hsQV0T3omycWADuvXNPqKhc63Q&usqp=CAU', 4 , 3 , N'Phòng có đồ đạc hiện đại bậc nhất và được phục vụ đồ ăn 24/24'),
(N'Connecting room ', '2452', '1.123.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIZhgqaZrHRWYiaV9EcUkDwCN_fzE0P3IgKg&usqp=CAU', 1 , 4 , N'Nhân viên nhiệt tình cùng với phục vụ tận tâm chu đáo'),
(N'Twin bed room (TWN)', '3754', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Double bed room (DBL)', '0842', '241.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9iWTD86lWNvhOAJjcLKDzLyQQ-ttvlczXcA&usqp=CAU', 5 , 8 , N'Phòng ngủ bình dân, có những thiết bị phục vụ nhu cầu cơ bản'),
(N'Single bed room (SGL)', '37554', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Triple bed room (TRPL)', '37354', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Quad room', '3235754', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Mini Suite', '352754', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Hollywood Twin room', '375354', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Double-Double room', '372354', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Junior Suite room', '3732554', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Villa', '375254', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Bungalow', '37254', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Murphy room', '325754', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Executive Floor', '375464', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Non-Smoking Room', '36754', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Floored Room', '376454', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch'),
(N'Disabled room', '375634', '7.325.000', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpF96l-k3NkPv-wsnZ1NGT4l5P_aKmotjN4Q&usqp=CAU', 3 , 5 , N'Phòng qua đêm dành cho các khách du lịch');
