USE [master]
GO
drop database AssignmentPRJ301
go

CREATE DATABASE [AssignmentPRJ301] 

USE [AssignmentPRJ301]
GO


CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', 1)

CREATE TABLE tblRoles (
    roleID [nvarchar](50) PRIMARY KEY,
    roleName [nvarchar](50)
);

ALTER TABLE tblUsers
ADD CONSTRAINT FK_User_Role FOREIGN KEY (roleID)
REFERENCES tblRoles(roleID);

INSERT INTO tblRoles (roleID, roleName) VALUES
    (N'AD', N'Admin'),
    (N'US', N'User');

CREATE TABLE tblProduct (
    productID [nvarchar](50) PRIMARY KEY,
    productName [nvarchar](255),
	[image] [nvarchar](max) NULL,
    price DECIMAL(10, 2),
    quantity INT
);

INSERT INTO tblProduct (productID, productName, [image], price, quantity) VALUES
    (N'P001', N'Sweetie Shirt', N'https://www.themodestman.com/wp-content/uploads/2022/09/Best-Minimalist-Clothing-Brands.jpg', 59.99, 80),
    (N'P002', N'Shirt 12', N'https://www.thefashionisto.com/wp-content/uploads/2023/05/Minimalist-Fashion-Men-COS-Summer-2023.jpg', 49.99, 100),
    (N'P003', N'Jeans 3', N'https://www.themodestman.com/wp-content/uploads/2022/09/Everlane-The-Organic-Cotton-Crew-Uniform-2048x2048.jpeg', 69.99, 70),
    (N'P004', N'The 24 Trouser', N'https://www.themodestman.com/wp-content/uploads/2022/09/LEstrange-LondonThe-24-Trouser-2048x2037.jpg', 59.99, 90),
    (N'P005', N'The 12 Trouser', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512030117680-GESPYSSA22E0BN66MLT0/begin+1.jpg', 49.99, 80),
	(N'P006', N'Black topcoat turtleneck', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512032310395-M3Q04CW4AL1D8E52RNON/outerwear+1.jpg?format=1000w', 69.99, 60),
	(N'P007', N'Casio Gold Watch', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512032630354-60HWQBZXRQ5FZQUEUHNX/watches+1.jpg?format=1000w', 99.99, 40),
	(N'P008', N'Korea Vest', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512030359889-M7HM62XBPNOI6DQ7IMDW/tops+2.jpg?format=1000w', 39.99, 70),
	(N'P009', N'The Short', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512031705519-XBRQAXH6PT1VVK3CBJQF/bottoms+5.jpg?format=750w', 29.99, 110),
	(N'P0010', N'Doc Martens 1460s', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512031981714-6WENJN11DK7FEYVQI5RW/shoes+3.jpg?format=500w', 79.99, 50),
	(N'P0011', N'The Basic Trouser', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512031704814-HTNLB8JVGS6Z9URSKFEH/bottoms+2.jpg?format=1000w', 49.99, 90),
	(N'P0012', N'White Sneaker', N'https://images.squarespace-cdn.com/content/v1/59a21819bebafbe040f6ad2a/1512031981491-YNR8B7GTHJEXZK6Y90OH/shoes+1.jpg?format=1000w', 69.99, 60);

CREATE TABLE tblOrders (
    orderID INT IDENTITY(1,1) PRIMARY KEY,
    customerID NVARCHAR(50) REFERENCES tblUsers(userID),
    phoneNumber NVARCHAR(50),
    orderDate DATE,
    total DECIMAL(10, 2),
    [address] NVARCHAR(255)
);

CREATE TABLE tblOrderDetail (
    orderDetailID INT IDENTITY(1,1) PRIMARY KEY ,
    orderID INT,
    productID NVARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES tblOrders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES tblProduct(ProductID)
);