CREATE DATABASE IF NOT EXISTS example;
USE example;

drop table if exists users;
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(255) UNIQUE  
  );

 
mysqldump example > my_dump_example.sql -- ��� � ���� �� ���������� �� ����� ������� ��� �� ������
CREATE DATABASE IF NOT EXISTS sample;