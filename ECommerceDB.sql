CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    SignupDate DATE NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Create Orders Details Table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Create Shipping Table
CREATE TABLE Shipping (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ShippingMethod VARCHAR(50) NOT NULL,
    ShippingDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Mock Data into Customers Table
INSERT INTO Customers (Name, Email, SignupDate, City, State, Country)
VALUES
('John Doe', 'johndoe@email.com', '2022-01-15', 'New York', 'NY', 'USA'),
('Jane Smith', 'janesmith@email.com', '2021-06-10', 'Los Angeles', 'CA', 'USA'),
('Emily Johnson', 'emilyj@email.com', '2023-03-22', 'Chicago', 'IL', 'USA'),
('Michael Brown', 'michaelb@email.com', '2022-11-05', 'Houston', 'TX', 'USA'),
('Sarah Davis', 'sarahd@email.com', '2021-12-30', 'Phoenix', 'AZ', 'USA');

-- Insert Mock Data into Products Table
INSERT INTO Products (Name, Category, Price, StockQuantity)
VALUES
('Wireless Mouse', 'Electronics', 25.99, 200),
('Gaming Keyboard', 'Electronics', 59.99, 150),
('Bluetooth Speaker', 'Electronics', 39.99, 100),
('USB-C Charger', 'Accessories', 15.99, 300),
('Noise Cancelling Headphones', 'Electronics', 99.99, 50);

-- Insert Mock Data into Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2023-10-15', 85.97),
(2, '2023-10-16', 59.99),
(3, '2023-10-18', 39.99),
(4, '2023-10-20', 115.98),
(5, '2023-10-22', 99.99);

-- Insert Mock Data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 2, 25.99), -- 2 Wireless Mice
(1, 4, 1, 15.99), -- 1 USB-C Charger
(2, 2, 1, 59.99), -- 1 Gaming Keyboard
(3, 3, 1, 39.99), -- 1 Bluetooth Speaker
(4, 5, 1, 99.99), -- 1 Noise Cancelling Headphones
(4, 4, 1, 15.99), -- 1 USB-C Charger
(5, 5, 1, 99.99); -- 1 Noise Cancelling Headphones

-- Insert Mock Data into Shipping Table
INSERT INTO Shipping (OrderID, ShippingMethod, ShippingDate, Status)
VALUES
(1, 'Standard', '2023-10-16', 'Delivered'),
(2, 'Express', '2023-10-17', 'Shipped'),
(3, 'Standard', '2023-10-19', 'Delivered'),
(4, 'Overnight', '2023-10-21', 'Pending'),
(5, 'Express', '2023-10-23', 'Processing');

