create database if not exists `Testing_System_Assignment_1`;

use `Testing_System_Assignment_1`;

create table if not exists `department`(
	`DepartmentID` tinyint primary key auto_increment,
    `DepartmentName` varchar(50)
);

create table if not exists `Position`(
	`PositionID` int  key auto_increment,
    `PositionName` enum('Dev', 'Test', 'Scrum Master', 'PM')
);

create table if not exists `Account`(
	`AccountID` int key auto_increment,
    `Email` varchar(50),
    `Username` varchar(50),
    `FullName` varchar(50),
    `DepartmentID` int,
    `PositionID` int,
    `CreateDate` date
);

create table if not exists `Group`(
	`GroupID` int key auto_increment,
    `GroupName` varchar(50),
    `CreatorID` int,
    `CreateDate` date
);

create table if not exists `GroupAccount`(
	`GroupID` int,
    `AccountID` int,
    `JoinDate` date
);

create table if not exists `TypeQuestion`(
	`TypeID` int key auto_increment,
    `TypeName` varchar(50)
);

create table if not exists `CategoryQuestion`(
	`CategoryID` int key auto_increment,
    `CategoryName` varchar(20)
);

create table if not exists `Question`(
	`QuestionID` int key auto_increment,
    `Content` varchar(50),
    `CategoryID` int,
    `TypeID` int,
    `CreatorID` int,
    `CreateDate` date
);

create table if not exists `Answer`(
	`AnswerID` int key auto_increment,
    `Content` varchar(50),
    `QuestionID` int,
    `isCorrect` boolean
);

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