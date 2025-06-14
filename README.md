📚 Ebook Management System (JSP-Servlet-MySQL)

A full-stack web application developed using JSP, Servlets, and MySQL, designed to manage eBook transactions. This system allows users to register, log in, order books, and sell used books, while the admin can manage users, books, and orders.

🔧 Tech Stack:

Backend: Java (JDK 1.8), Servlet, JSP, JSTL
Frontend: HTML5, CSS3, Bootstrap4 and FontAwesome
Database: MySQL
Server: Apache Tomcat 10.1
JDBC: MySQL Connector/J

✨ Features

👤 User:

Register a new account
Login/Logout
Order available books
Add old books for selling (includes name, author, price, condition, image)
View and delete their listed books
View order history
Search for books

🔧 Admin:

Login to admin dashboard
View and delete users
Add new books
Delete any book (including user-uploaded)
View all orders placed by users

📁 Project Structure:
graphql
ebook-management/
│
├── src/
│   ├── dao/               # Data access layer (DB operations)
│   ├── model/             # POJO classes for Book, User, Order etc.
│   ├── servlet/           # Servlet controllers for user/admin actions
├── WebContent/
│   ├── jsp/               # JSP pages (views)
│   ├── images/            # Uploaded book images
│   ├── WEB-INF/
│   │   └── web.xml        # Deployment descriptor
│   │   └── pom.xml  
│
├── lib/                   # MySQL JDBC driver (mysql-connector-java.jar)
└── README.md
⚙️ Setup Instructions
🛠️ Pre-requisites:
Java JDK 1.8
Apache Tomcat 10.1
MySQL Server (5.7+)
IDE (Eclipse/IntelliJ/NetBeans)
MySQL JDBC Driver

📦 Database Configuration

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
  PRIMARY KEY (`ID`)
  )

CREATE TABLE `book_details` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(70) DEFAULT NULL,
  `author` varchar(70) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
)

CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(70) DEFAULT NULL,
  `author` varchar(70) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
)

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
  PRIMARY KEY (`id`)
)

Update DB credentials in DBConnection.java:
String url = "jdbc:mysql://localhost:8080/ebookdb";
String user = "root";
String password = "12345";

▶️ Running the App:
Clone or download this repository.
Import it into your IDE as a Dynamic Web Project.
Add the MySQL JDBC driver to the lib/ directory.
Configure the web.xml file and servlet mappings.
Deploy the app on Tomcat 10.1.
Visit: http://localhost:8080/ebook
🔑 Default Admin Credentials:
Email: admin@gmail.com
Password: admin

📷 Website Pages:
Index Page
![index](https://github.com/user-attachments/assets/73bbc8d0-daa1-4c7c-a761-8125157e817f)

User Registration
![user-registration](https://github.com/user-attachments/assets/35a7da36-5a65-4949-9b30-776543ec0f9f)

User Login
![user-login](https://github.com/user-attachments/assets/bc139bd1-5975-4b46-9beb-e552427ff92a)

User Home
![user-home](https://github.com/user-attachments/assets/8caea308-cab9-49c3-b146-b27951b1e54b)

User Cart
![user-cart](https://github.com/user-attachments/assets/ec08a92e-a2a3-4566-a6c2-eb767ba95078)

Order Conformation
![order-placed](https://github.com/user-attachments/assets/d8332fa8-57aa-4d8d-ad05-20de7e6bb34d)

User Orders
![user all-orders](https://github.com/user-attachments/assets/e22ca011-2726-46a6-9ab1-65bdb0ef3d43)

User Books
![user all-books](https://github.com/user-attachments/assets/fefd7d29-c188-411d-afac-a8d47efcf4da)

Add Books
![add-books](https://github.com/user-attachments/assets/8f3a1578-f8f1-422c-a4f2-52ccb4483deb)

Book Details
![book-details](https://github.com/user-attachments/assets/592f6766-b24c-4061-8a27-9c61326f6e27)

Search Results
![search-results](https://github.com/user-attachments/assets/123f770e-0a49-4986-ac46-4e87140a292c)

Contact Us
![contact-us](https://github.com/user-attachments/assets/367d87f1-a5ff-4c8d-82e3-f9dece060638)

Admin Home
![admin-home](https://github.com/user-attachments/assets/1b6a7aa3-7cfb-485e-b73d-39391910ebfd)

Admin All Books
![admin all-books](https://github.com/user-attachments/assets/955e845b-4baa-4de9-abe8-04fa2641f94f)

Admin All Users
![all-users](https://github.com/user-attachments/assets/c3645259-ecf0-48f2-a815-cc960004c7cb)

Admin All Orders
![admin all-orders](https://github.com/user-attachments/assets/a28fb503-f055-4ac7-be98-511b6cd6c365)


Conclusion:
This project helps us in online library, users and orders management for the admin and provides an interface to the user to buy and sell old books, manage orders and edit profile. It uses database for storing information of books, users, cart and orders. Admin can add or delete new and old books while user can also add old books to sell and toggle book status between active and inactive. Users can also search books and the website has a contact us page.   

📝 License:
You are free to use, modify, and distribute it for personal or educational use.

👨‍💻 Author:
Mohd Kamran Khan
GitHub: @mohdkamran-khan
