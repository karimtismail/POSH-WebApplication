# Spare Parts Cars E-commerce Project

This project is an online store for car parts. It uses HTML5, CSS3, JavaScript for the front-end and Servlets, JSP, Asynchronous, and ORM for the back-end. It follows the Java track - ITI diploma projects.

## 📦 Featutes
- Customer
    - Registration and login
    - Forget password
    - View profile
    - Edit profile
    - View homepage
    - View product details
    - Add product to cart
    - View shopping cart
    - Increase & decrease product quantity from cart
    - Search by product
    - View order history
    - Logout

- Admin
    - Add product
    - Edit product
    - Delete product
    - View all customers
    - View order history
    - Logout

## ⚙ Technologies used
- Java 17
- Maven 3.8.6
- Apache Tomcat 10.1
- Jakarta Persistence (Hibernate)
- MySQL
- Jakarta Server Pages
- Jakarta Servlet
- Jakarta Standard Tag Library
- Ajax
- JSON
- Bean Validation (Hibernate Validator)
- Jakarta Mail
- HTML5
- CSS3
- Bootstrap
- JavaScript
- JQuery

## Installation
To run this project locally, you need to have Java Development Kit (JDK), Apache Tomcat server, and MySQL database installed on your machine. Then follow these steps:
- Clone this repository to your local machine.
```
git clone https://github.com/karimtismail/POSH-WebApplication.git
```
- Go to the project directory
```
cd POSH-WebApplication
```
- Import the database schema from the db folder to your MySQL server.

- Copy the war file from the dist folder to the webapps folder of your Tomcat server.
- Start the Tomcat server 
- Create database user and set the username and password values in the persistence.xml
- Create database named posh in your MySql Server
- Run your tomcat apache server and then change the configuration of tomcat in pom.xml
- Deploy the application using the following maven command
```
mvn clean compile tomcat7:deploy
```
- Open http://localhost:8080/spareparts in your browser.

## Usage
To use this website as a __customer__, you need to register an account or log in with an existing one. Then you can browse the catalog of spare parts by category or search by keyword. You can add items to your cart and proceed to checkout. You can also view your order history and edit your profile.

To use this website as an __admin__, you need to log in with the credentials 
```
email -> admin@posh.com
password -> 123456789
```
Then you can access the admin dashboard where you can manage the spare parts inventory.

## Contributors
- [Mohamed Gomaa](https://github.com/mohamedgomaa23722)
- [Martina Naeem](https://github.com/MartinaNaeem)
- [Karim Taha](https://github.com/karimtismail)
