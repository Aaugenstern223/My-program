CREATE DATABASE student_management;

USE student_management;

-- 用户表
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(50) NOT NULL,
                       role ENUM('admin', 'teacher', 'student') NOT NULL,
                       tcr_class VARCHAR(10) NULL
);

-- 学生表
CREATE TABLE students (
                          student_id INT AUTO_INCREMENT PRIMARY KEY,
                          chinese_name VARCHAR(50),
                          english_name VARCHAR(50),
                          tel VARCHAR(15),
                          stu_class VARCHAR(10),
                          semester INT,
                          stu_status ENUM('A', 'L') DEFAULT 'A',
                          user_id INT NULL
);

-- 成绩表
CREATE TABLE scores (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        student_id INT NOT NULL,
                        mid_marks FLOAT,
                        end_marks FLOAT,
                        FOREIGN KEY (student_id) REFERENCES students(student_id)
);
--插入管理员
insert into users
select 666666, 'admin', 'admin', 'admin', null from users;
commit;