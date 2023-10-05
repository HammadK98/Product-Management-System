# Hammad Ali Khan
# Product Management System
CREATE DATABASE db_productsys;

CREATE USER 'student'@'localhost';

GRANT ALL PRIVILEGES ON db_productsys.* TO 'student'@'localhost';
FLUSH PRIVILEGES;
USE db_productsys;

CREATE TABLE User(
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(20),
    user_dob DATE,
    store_no INT,
    PRIMARY KEY(user_id),
    FOREIGN KEY (store_no) REFERENCES Store(store_no)
);

INSERT INTO User(
    username, password) VALUES (‘jdoe’,SHA(‘jdoe’));

CREATE TABLE Store(
    store_no INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(40),
    PRIMARY KEY(store_no)
);

CREATE TABLE Customer(
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(20),
    customer_dob DATE,
    PRIMARY KEY(customer_id)
);

CREATE TABLE Products(
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(30),
    inventory INT,
    price DECIMAL(7, 2),
    PRIMARY KEY(product_id),
    FOREIGN KEY (product_id) REFERENCES Purchased(product_id)
);

CREATE TABLE Purchased(
    customer_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(customer_id, product_id)
);