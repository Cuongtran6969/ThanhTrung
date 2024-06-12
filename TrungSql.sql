--create database PhoneShop2

use PhoneShop2

CREATE TABLE Brands (
    brandId int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    brandName NVARCHAR(50) NOT NULL
)

CREATE TABLE Categories (
    categoriesId int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	brandId int REFERENCES Brands(brandId),
    categoriesName NVARCHAR(50) NOT NULL,
)

CREATE TABLE Account (
    accountId int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	firstName nvarchar(50) NOT NULL,
    lastName nvarchar(50) NOT NULL,
    password varchar(100) NOT NULL, 
    email varchar(100) NOT NULL,
    address nvarchar(255),
    phone varchar(20),
	isAdmin bit
)
Insert into Account(firstName, lastName, password, email, address, phone, isAdmin) values
(N'Thanh', N'Trung', '123', 'trung@gmail.com', '123 Main St', '0123456789',1),
(N'Nam', N'Anh', '345', 'anh@example.com', '456 Oak St', '0987654321', 0),
(N'Man', N'Nhi', '567', 'Admin3@gmail.com', '1234 Main St', '0123456789', 0),
(N'Hoang', N'Nam', '123', 'admin4@gmail.com', '123 St', '0123456782', 0);

Insert into Brands values
('Apple (iPhone)'),
('Sony'),
('Samsung'),
('Xiaomi'),
('LG'),
('Oppo'),
('Vivo')

ALTER TABLE Brands
ADD country NVARCHAR(50),
    website NVARCHAR(255),
    logo NVARCHAR(255);

UPDATE Brands
SET country = CASE
    WHEN brandName = 'Apple (iPhone)' THEN N'Mỹ'
    WHEN brandName = 'Sony' THEN N'Nhật Bản'
    WHEN brandName = 'Samsung' THEN N'Hàn Quốc'
    WHEN brandName = 'Xiaomi' THEN N'Trung Quốc'
    WHEN brandName = 'LG' THEN N'Hàn Quốc'
    WHEN brandName = 'Oppo' THEN N'Trung Quốc'
    WHEN brandName = 'Vivo' THEN N'Trung Quốc'
END,
 website = CASE
    WHEN brandName = 'Apple (iPhone)' THEN 'https://www.apple.com/'
    WHEN brandName = 'Sony' THEN 'https://www.sony.com/'
    WHEN brandName = 'Samsung' THEN 'https://www.samsung.com/'
    WHEN brandName = 'Xiaomi' THEN 'https://www.mi.com/'
    WHEN brandName = 'LG' THEN 'https://www.lg.com/'
    WHEN brandName = 'Oppo' THEN 'https://www.oppo.com/'
    WHEN brandName = 'Vivo' THEN 'https://www.vivo.com/'
END,
logo = CASE
    WHEN brandName = 'Apple (iPhone)' THEN 'apple_logo'
    WHEN brandName = 'Sony' THEN 'sony_logo'
    WHEN brandName = 'Samsung' THEN 'samsung_logo'
    WHEN brandName = 'Xiaomi' THEN 'xiaomi_logo'
    WHEN brandName = 'LG' THEN 'lg_logo'
    WHEN brandName = 'Oppo' THEN 'oppo_logo'
    WHEN brandName = 'Vivo' THEN 'vivo_logo'
END;

Insert into Categories values
(1,'X'),
(1,'XS'),
(1,'SE'),
(1,'11'),
(1,'12'),
(1,'13'),
(1,'14'),
(1,'Plus'),
(1,'Pro Max'),
(1,'15'),
(1,'15 Plus'),
(1,'15 Pro Max'),
(2,'1 series'),
(2,'5 series'),
(2,'10 series'),
(2,'L series'), 
(3,'A14'),
(3,'A14 5G'),
(3,'A05'),
(3,'A05s'),
(3,'A34 5G'),
(3,'A54 5G'),
(4,'Xiaomi Redmi Note 13')

CREATE TABLE Products (
    productId int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	categoriesId int REFERENCES Categories(categoriesId),
	productName NVARCHAR(100),
	available int NOT NULL,
    listPrice DECIMAL(10, 2) NOT NULL,
	discount int,
	productImg VARCHAR(255),
);
Insert into Products(categoriesId, productName, available, listPrice, discount, productImg) VALUES
(12, 'iPhone 15 Pro Max 256GB', 10, 32690000, 10, 'iphone15-pro-max-titan-xanh_1.jpg'),
(12, 'iPhone 15 Pro Max 512GB', 12, 32990000, 14, 'vn_iphone_15_pro_black_titanium_pdp_image_position-2_design.jpg'),
(12, 'iPhone 15 Pro Max 1TB', 13, 39990000, 18, 'iphone15-pro-max-titan-nau_1.jpg'),
(4, 'iPhone 11 128GB', 10, 11990000, 10, 'iphone-11-white.jpg'),
(4, 'iPhone 11 256GB', 12, 12990000, 14, 'iphone-11-black.jpg'),
(23, 'Xiaomi Redmi Note 13 6GB 128GB', 8, 4890000, 6, 'xiaomi-redmi-note-13_10_.jpg'),
(23, 'Xiaomi Redmi Note 13 6GB 256GB', 5, 4890000, 6, 'xiaomi-redmi-note-13_12_.jpg')

CREATE TABLE Orders (
    orderId int PRIMARY KEY IDENTITY(1, 1),
    accountId int REFERENCES Account(accountId) NOT NULL,
    orderDate DATETIME NOT NULL,
	recieveDate DATETIME,
    status nvarchar(100)
);

CREATE TABLE OrderItems (
    orderItemId int PRIMARY KEY IDENTITY(1, 1),
    orderId int REFERENCES Orders(orderId),
    productId int REFERENCES Products(productId),
    listPrice DECIMAL(10, 2) NOT NULL,
    discount int,
    quantity int NOT NULL
);
