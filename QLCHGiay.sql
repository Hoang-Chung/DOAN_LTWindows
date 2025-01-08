use QuanLyBanGiay;
go


create table product (
	id int primary key identity,
	code varchar(20) null,
	name nvarchar(255) null,
	price int null,
	gender int null,
	amount int null,
	create_date datetime null,
	status int null,
	id_type nvarchar(255) null,
	id_discount nvarchar(255) null,
	link varchar(300) null
);


create table type (
 idName nvarchar(255) primary key,
 size_from int null,
 size_to int null
);


create table discount_product (
idInfo nvarchar(255) primary key,
discount int null,
create_date datetime null
);


INSERT INTO type (idName, size_from, size_to)
VALUES 
(N'Giày thể thao nam', 39, 44),
(N'Giày thể thao nữ', 35, 40),
(N'Giày da nam', 40, 45),
(N'Giày da nữ', 35, 40);

INSERT INTO discount_product (idInfo, discount, create_date)
VALUES 
(N'Không có mã giảm giá', 0, '2024-12-30 10:00:00'),
(N'Mã giảm giá 15% cho giày da', 15, '2024-12-30 11:00:00'),
(N'Mã giảm giá 20% cho tất cả giày', 20, '2024-12-30 12:00:00'),
(N'Mã giảm giá 5% cho giày sandal', 5, '2024-12-30 13:00:00'),
(N'Mã giảm giá 30% cho giày boot', 30, '2024-12-30 14:00:00');



INSERT INTO product (code, name, price, gender, amount, create_date, status, id_type, id_discount, link)
VALUES 
('G001', N'Giày thể thao nam Adidas', 1000000, 1, 50, '2024-12-30 10:00:00', 1, N'Giày thể thao nam', N'Mã giảm giá 10% cho giày thể thao', '1.jpg'),
('G002', N'Giày thể thao nữ Nike', 950000, 0, 80, '2024-12-30 11:00:00', 1, N'Giày thể thao nữ', N'Mã giảm giá 10% cho giày thể thao','2.jpg'),
('G003', N'Giày da nam Oxford', 1500000, 1, 40, '2024-12-30 12:00:00', 1, N'Giày da nam', N'Mã giảm giá 15% cho giày da','3.jpg'),
('G004', N'Giày da nữ cao gót', 1200000, 0, 70, '2024-12-30 13:00:00', 1, N'Giày da nữ', N'Mã giảm giá 15% cho giày da','3.jpg'),
('G005', N'Giày lười nam', 800000, 1, 60, '2024-12-30 14:00:00', 1, N'Giày thể thao nam', N'Mã giảm giá 20% cho tất cả giày','3.jpg'),
('G006', N'Giày lười nữ', 750000, 0, 90, '2024-12-30 15:00:00', 1, N'Giày thể thao nữ', N'Mã giảm giá 20% cho tất cả giày','3.jpg'),
('G007', N'Giày sandal nam', 600000, 1, 100, '2024-12-30 16:00:00', 1, N'Giày sandal nam', N'Mã giảm giá 5% cho giày sandal','3.jpg'),
('G008', N'Giày sandal nữ', 550000, 0, 120, '2024-12-30 17:00:00', 1, N'Giày sandal nữ', N'Mã giảm giá 5% cho giày sandal','3.jpg'),
('G009', N'Giày boot nam', 2000000, 1, 30, '2024-12-30 18:00:00', 1, N'Giày boot nam', N'Mã giảm giá 30% cho giày boot','3.jpg'),
('G010', N'Giày boot nữ', 1800000, 0, 50, '2024-12-30 19:00:00', 1, N'Giày boot nữ', N'Mã giảm giá 30% cho giày boot','3.jpg');

	
create table user_(
	id int primary key identity,
	username varchar(255) null,
	password varchar(255) null,
	fullname nvarchar(255) null,
	phone varchar(10) null,
	address nvarchar(255) null,
	role int null,
	email varchar(255) null,
	status int null
);

INSERT INTO user_ (username, password, fullname, phone, address, role, email, status)
VALUES 
('admin1', 'password123', N'Admin User', '0123456789', N'Hà Nội', 1, 'admin1@example.com', 1),
('customer1', 'password456', N'Nguyễn Văn A', '0987654321', N'Hồ Chí Minh', 0, 'customer1@example.com', 1),
('customer2', 'password789', N'Nguyễn Thị B', '0912345678', N'Đà Nẵng', 0, 'customer2@example.com', 1),
('admin2', 'password101112', N'Admin User 2', '0976543210', N'Hải Phòng', 1, 'admin2@example.com', 1),
('customer3', 'password131415', N'Phan Thị C', '0934567890', N'Cần Thơ', 0, 'customer3@example.com', 1);

go

create table bill (
	id int primary key identity,
	total_price int null,
	status int null,
	create_date datetime null,
	id_user int null
);

go


INSERT INTO bill (total_price, status, create_date, id_user)
VALUES 
( 100000, 1, '2024-12-25 10:00:00', 2),  -- Bill for customer1
( 150000, 1, '2024-12-26 14:30:00', 3),  -- Bill for customer2
( 200000, 0, '2024-12-27 09:00:00', 5),  -- Bill for customer3
( 120000, 1, '2024-12-28 16:45:00', 2);  -- Another bill for customer1

go

create table bill_detail (
	id int primary key identity,
	amount int null,
	sum_price int null,
	id_product int null,
	id_bill int null
);

go


INSERT INTO bill_detail (amount, sum_price, id_product, id_bill)
VALUES
(2, 100000, 1, 1),  
(1, 150000, 2, 2),  
(3, 300000, 3, 3),  
(1, 120000, 1, 4);  


-- Add foreign key constraints
ALTER TABLE product
ADD CONSTRAINT FK_product_type FOREIGN KEY (id_type) REFERENCES type(idName);

ALTER TABLE product
ADD CONSTRAINT FK_product_discount FOREIGN KEY (id_discount) REFERENCES discount_product(idInfo);

ALTER TABLE bill
ADD CONSTRAINT FK_bill_user FOREIGN KEY (id_user) REFERENCES user_(id);

ALTER TABLE bill_detail
ADD CONSTRAINT FK_bill_detail_product FOREIGN KEY (id_product) REFERENCES product(id);

ALTER TABLE bill_detail
ADD CONSTRAINT FK_bill_detail_bill FOREIGN KEY (id_bill) REFERENCES bill(id);
