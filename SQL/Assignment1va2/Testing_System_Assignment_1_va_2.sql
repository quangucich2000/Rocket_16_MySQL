create database if not exists `Testing_System_Assignment_1`;

use `Testing_System_Assignment_1`;

create table if not exists `department`(
	`DepartmentID` tinyint primary key auto_increment,
    `DepartmentName` varchar(50)
);

insert into department(DepartmentID, DepartmentName)
values (1, 'Marketing'),
		(2, 'DEV'),
        (3, 'Sale'),
        (4, 'Security'),
        (5, 'Accountant');

create table if not exists `Positionn`(
	`PositionID` int  key auto_increment,
    `PositionName` enum('Dev', 'Test', 'Scrum Master', 'PM')
);

insert into Positionn(PositionID, PositionName)
values (1, 'Dev'),
		(2, 'Test'),
        (3, 'Scrum Master'),
        (4, 'PM');

create table if not exists `Accountt`(
	`AccountID` int key auto_increment,
    `Email` varchar(50),
    `Username` varchar(50),
    `FullName` varchar(50),
    `DepartmentID` int,
    `PositionID` int,
    `CreateDate` date
);

insert into Accountt(AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
values (1, 'abc@gmail.com', 'lanle', 'Le Thi Lan', 2, 1, '2020-02-16'),
		(2, 'tran@gmail.com', 'nguoidung1', 'Le Van Tuan', 1, 4, '2020-02-01'),
        (3, 'hung@gmail.com', 'tamcuong', 'Tam Binh Cuong', 2, 2, '2020-08-12'),
        (4, 'tuan@gmail.com', 'tuantran', 'Tran Dinh Tuan', 3, 2, '2020-05-11'),
        (5, 'binh@gmail.com', 'namchung', 'Chung Phuong Nam', 5, 1, '2020-01-01'),
        (6, 'nam2@gmail.com', 'namle', 'Le Van Nam', 1, 5, '2020-12-22'),
        (7, 'kg3@gmail.com', 'hiepdinh', 'Dinh Thi Hiep', 2, 4, '2020-06-05'),
        (8, 'vn2@gmail.com', 'thenguyen', 'Nguyen Thi The', 1, 3, '2020-01-13'),
        (9, 'cd@gmail.com', 'congtruong', 'truong Binh Cong', 2, 1, '2020-04-28');

create table if not exists `Groupp`(
	`GroupID` int key auto_increment,
    `GroupName` varchar(50),
    `CreatorID` int,
    `CreateDate` date
);

insert into Groupp(GroupID, GroupName, CreatorID, CreateDate)
values (1, 'Du An Moi', 1, '2020-02-16'),
		(2, 'Khoi Phuc', 1, '2017-09-28'),
        (3, 'Khai Giang', 3, '2009-01-02'),
        (4, 'Bong Da', 2, '2020-11-11'),
        (5, 'Try Hard', 2, '2012-05-13'),
        (6, 'Ngien Cuu', 4, '2013-02-11');

create table if not exists `GroupAccount`(
	`GroupID` int,
    `AccountID` int,
    `JoinDate` date
);

insert into GroupAccount(GroupID, AccountID, JoinDate)
values (1, 1, '2020-02-16'),
		(3, 1, '2020-12-11'),
        (4, 6, '2020-07-12'),
        (2, 6, '2020-08-13'),
        (1, 2, '2020-03-26'),
        (2, 4, '2020-01-24'),
        (5, 3, '2020-01-01'),
        (2, 3, '2020-02-16');

create table if not exists `TypeQuestion`(
	`TypeID` int key auto_increment,
    `TypeName` varchar(50)
);

insert into TypeQuestion(TypeID, TypeName)
values (1, 'EZ'),
		(2, 'Difficult'),
        (3, 'Normal'),
        (4, 'Quite'),
        (5, 'Hard');


create table if not exists `CategoryQuestion`(
	`CategoryID` int key auto_increment,
    `CategoryName` varchar(20)
);

insert into CategoryQuestion(CategoryID, CategoryName)
values (1, 'Math'),
		(2, 'English'),
        (3, 'SQL'),
        (4, 'Front End'),
        (5, 'Back End');

create table if not exists `Question`(
	`QuestionID` int key auto_increment,
    `Content` varchar(50),
    `CategoryID` int,
    `TypeID` int,
    `CreatorID` int,
    `CreateDate` date
);

insert into Question(QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
values (1, 'nvm,sank hskldfhs', 2, 1, 7 , '2013-08-09'),
		(2, 'ndf mnsdfnksfhnks sdf ', 1, 1, 4 , '2013-08-09'),
        (3, 'xcb dsfg sadf sdafsd ', 2, 4, 1 , '2013-08-09'),
        (4, 'sav ab asv asvdas asd', 3, 5, 6, '2013-08-09'),
        (5, 'n fgn dfg nfgdn f sadfdsaf', 3, 2, 1 , '2013-08-09'),
        (6, ' xvbdf savsdfsa dfsad fsd', 1, 4, 5 , '2013-08-09'),
        (7, 'asdf sdsdaf', 7, 3, 2 , '2013-08-09');

create table if not exists `Answer`(
	`AnswerID` int key auto_increment,
    `Content` varchar(50),
    `QuestionID` int,
    `isCorrect` boolean
);

insert into Answer(AnswerID, Content, QuestionID, isCorrect)
values (1, 'nvm,sank hskldfhs', 2, true),
		(2, 'ndf mnsdfnksfhnks sdf ', 1, false),
        (3, 'xcb dsfg sadf sdafsd ', 2, true),
        (4, 'sav ab asv asvdas asd', 3, false),
        (5, 'n fgn dfg nfgdn f sadfdsaf', 3, false),
        (6, ' xvbdf savsdfsa dfsad fsd', 1, true),
        (7, 'asdf sdsdaf', 7, true);


create table if not exists `Exam`(
	`ExamID` int key auto_increment,
    `Code` varchar(50),
    `Title` varchar(50),
    `CategoryID` int,
    `Duration` datetime,
    `CreatorID` int,
    `CreateDate` date
);

create table if not exists `ExamQuestion`(
	`ExamID` int,
    `QuestionID` int
);