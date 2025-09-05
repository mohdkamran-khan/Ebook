**Ebook Management System (JSP-Servlet-MySQL)**

A full-stack web application developed using JSP, Servlets, and MySQL, designed to
manage eBook transactions. This system allows users to register, log in, order books, and
sell used books, while the admin can manage users, books, and orders.

## Tech Stack:

Backend: Java (JDK 1.8), Servlet, JSP, JSTL
Frontend: HTML5, CSS3, Bootstrap4 and FontAwesome
Database: MySQL
Server: Apache Tomcat 10.1
JDBC: MySQL Connector/J

## Features

## User:

Register a new account
Login/Logout
Order available books
Add old books for selling (includes name, author, price, condition, image)
View and delete their listed books
View order history
Search for books

## Admin:

Login to admin dashboard
View and delete users
Add new books
Delete any book (including user-uploaded)
View all orders placed by users

## Project Structure:

graphql
ebook-management/
│
├── src/
│ ├── dao/ # Data access layer (DB operations)
│ ├── model/ # POJO classes for Book, User, Order etc.
│ ├── servlet/ # Servlet controllers for user/admin actions
├── WebContent/
│ ├── jsp/ # JSP pages (views)
│ ├── images/ # Uploaded book images
│ ├── WEB-INF/
│ │ └── web.xml # Deployment descriptor
│ │ └── pom.xml
│
├── lib/ # MySQL JDBC driver (mysql-connector-java.jar)
└── README.md

## Setup Instructions

## Pre-requisites:

Java JDK 1.8
Apache Tomcat 10.1
MySQL Server (5.7+)
IDE (Eclipse/IntelliJ/NetBeans)
MySQL JDBC Driver

## Database Configuration

Create a database:

create database ebook;
use ebook;

Create necessary tables:

CREATE TABLE `user` (
`ID` int NOT NULL AUTO_INCREMENT,
`FullName` varchar(100) NOT NULL,
`PhoneNo` varchar(20) DEFAULT NULL,
`Email` varchar(100) NOT NULL,
`Password` varchar(100) NOT NULL,
`Address` varchar(100) DEFAULT NULL,
`City` varchar(50) DEFAULT NULL,
`State` varchar(50) DEFAULT NULL,
`PinCode` int DEFAULT NULL,
PRIMARY KEY (`ID`))

CREATE TABLE `book_details` (
`bookId` int NOT NULL AUTO_INCREMENT,
`bookName` varchar(70) DEFAULT NULL,
`author` varchar(70) DEFAULT NULL,
`price` varchar(50) DEFAULT NULL,
`bookCategory` varchar(45) DEFAULT NULL,
`status` varchar(45) DEFAULT NULL,
`photo` varchar(45) DEFAULT NULL,
`email` varchar(70) DEFAULT NULL,
PRIMARY KEY (`bookId`))

CREATE TABLE `cart` (
`cid` int NOT NULL AUTO_INCREMENT,
`bid` int DEFAULT NULL,
`uid` int DEFAULT NULL,
`bookName` varchar(70) DEFAULT NULL,
`author` varchar(70) DEFAULT NULL,
`price` double DEFAULT NULL,
`total_price` double DEFAULT NULL,
PRIMARY KEY (`cid`))

CREATE TABLE `book_orders` (
`id` int NOT NULL AUTO_INCREMENT,
`order_id` varchar(45) DEFAULT NULL,
`user_name` varchar(45) DEFAULT NULL,
`email` varchar(45) DEFAULT NULL,
`address` varchar(500) DEFAULT NULL,
`phone` varchar(45) DEFAULT NULL,
`book_name` varchar(55) DEFAULT NULL,
`author` varchar(55) DEFAULT NULL,
`price` varchar(45) DEFAULT NULL,
`payment` varchar(45) DEFAULT NULL,
PRIMARY KEY (`id`))

## Update DB credentials in DBConnection.java:

String url = "jdbc:mysql://localhost:8080/ebookdb";
String user = "root";
String password = "12345";

## Running the App:

Clone or download this repository.
Import it into your IDE as a Dynamic Web Project.
Add the MySQL JDBC driver to the lib/ directory.
Configure the web.xml file and servlet mappings.
Deploy the app on Tomcat 10.1.
Visit: http://localhost:8080/ebook

## Default Admin Credentials:

Email: admin@gmail.com
Password: admin

## Screenshots

Index Page:
<img width="1920" height="3348" alt="index" src="https://github.com/user-attachments/assets/9751f74a-6c6b-4561-af54-467a6fcc8548" />

User registration:
<img width="1920" height="1321" alt="user-registration" src="https://github.com/user-attachments/assets/a8d9a6a6-1563-4a5e-8668-f3314e96d56c" />

User Login:
<img width="1920" height="853" alt="user-login" src="https://github.com/user-attachments/assets/9810104d-ef85-4437-8503-8f71ea0323c0" />

User Home:
<img width="1920" height="972" alt="user-home" src="https://github.com/user-attachments/assets/8c5f8864-2c05-4787-8b19-fc2af91d4e83" />

User Cart:
<img width="1920" height="1459" alt="user-cart" src="https://github.com/user-attachments/assets/c7bbb3ab-32e2-485c-b4d5-00ef0f983d90" />

Order Conformation:
<img width="1920" height="853" alt="order-placed" src="https://github.com/user-attachments/assets/f7e22a28-8de9-4f9a-ac6e-3d08a3ff675a" />

User Orders:
<img width="1920" height="1083" alt="user all-orders" src="https://github.com/user-attachments/assets/9cae8c24-78c8-47e6-b30e-882f244e91bc" />

User Books:
<img width="1920" height="924" alt="user all-books" src="https://github.com/user-attachments/assets/5da7a937-ab7a-4bf2-8551-036875741513" />

Add Books:
<img width="1920" height="1396" alt="add-books" src="https://github.com/user-attachments/assets/b6d2b73e-0841-48cb-bd4a-69fb788d5982" />

Book Details:
<img width="1920" height="1009" alt="book-details" src="https://github.com/user-attachments/assets/73920d2d-c9de-4790-9532-64aeb4efc68c" />

Search Results:
<img width="1920" height="1158" alt="search-results" src="https://github.com/user-attachments/assets/7d336808-ae8f-4f91-b545-a4896a0e39dd" />

Contact Us:
<img width="1920" height="853" alt="contact-us" src="https://github.com/user-attachments/assets/c49c7cd1-f540-4b36-84a9-3cae70e5ae41" />

Admin Home:
<img width="1920" height="958" alt="admin-home" src="https://github.com/user-attachments/assets/9e5d6f33-13c4-49ef-8e42-ec68b3c8c198" />

Admin All Books:
<img width="1920" height="5148" alt="admin all-books" src="https://github.com/user-attachments/assets/a7cd3253-c827-4b0d-8d7f-f51a1a497e15" />

Admin All Users:
<img width="1920" height="906" alt="all-users" src="https://github.com/user-attachments/assets/8c47a67e-c5f6-4460-a446-83e920eee58b" />

Admin All Orders:
<img width="1920" height="906" alt="all-users" src="https://github.com/user-attachments/assets/6da66ab8-4af5-4b36-a975-939d893b4a48" />

## Conclusion:

This project helps us in online library, users and orders management for the admin and
provides an interface to the user to buy and sell old books, manage orders and edit profile.
It uses database for storing information of books, users, cart and orders. Admin can add or
delete new and old books while user can also add old books to sell and toggle book status
between active and inactive. Users can also search books and the website has a contact us
page.

## License:

You are free to use, modify, and distribute it for personal or educational use.

## Author:

Mohd Kamran Khan
