USE [Shoe19]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartID] [int] NULL,
	[Size] [int] NULL,
	[Quantity] [int] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](30) NULL,
	[Email] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderCustomer]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCustomer](
	[OrderID] [int] NULL,
	[CustomerID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NULL,
	[Size] [int] NULL,
	[Quantity] [int] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2022 2:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Price] [money] NULL,
	[Image] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (1, 6)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (2, 19)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (3, 20)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (4, 10)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (5, 11)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (6, 12)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (7, 13)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (8, 14)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (9, 15)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (10, 16)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (11, 17)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (12, 18)
INSERT [dbo].[Cart] ([CartID], [CustomerID]) VALUES (13, 21)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'NIKE')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'ADIDAS')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (4, N'PUMA')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (6, N'Son Hai 123', N'sonhai1411@gmail.com', N'01234', N'Ha Noi', N'14112000', N'admin')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (10, N'Son Hai', N'sonhai14211@gmail.com', N'01234', N'Ha Noi', N'asdasd', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (11, N'Son Hai', N'sonhai14d211@gmail.com', N'01234', N'Ha Noi', N'qedsad', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (12, N'Son Hai', N'hai@gmai.com', N'012334', N'Ha Noi', N'123', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (13, N'Duc Anh', N'ducanh12@gmail.com', N'012345678', N'Nghe An', N'danhdanh', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (14, N'Hong Thang', N'thangnhhe163975@fpt.edu.vn', N'012344444', N'Quang Ninh', N'hhh', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (15, N'Tu Anh', N'tanhdao2021@gmail.com', N'012224566', N'Bac Giang', N'yyy', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (16, N'Hop Ngu', N'hophanamokee@gmail.com', N'0869517063', N'Lien Hoa', N'hop', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (17, N'Duc Anh', N'nguyenhuuducanh02@gmail.com', N'0123124154', N'Nghe An', N'DUCANHNGU', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (18, N'Chu Ba', N'chuba@gmail.com', N'0123124124', N'Bac Ninh', N'haha', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (19, N'Ba Ga', N'baga@gmail.com', N'01235677477', N'Ha Noi', N'3ga', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (20, N'4 Ga', N'4ga@gmail.com', N'01312498247', N'Ha noi', N'4ga', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Email], [Phone], [Address], [Password], [Role]) VALUES (21, N'Ngo Hong Thang', N'hongthang394@gmail.com', N'0383053423', N'Quang Ninh', N'lewlew19', N'admin')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (1, N'2022-11-1')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (2, N'2022-11-2')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (3, N'2022-31-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (4, N'2022-36-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (5, N'2022-38-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (6, N'2022-42-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (7, N'2022-43-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (8, N'2022-44-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (9, N'2022-46-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (10, N'2022-48-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (11, N'2022-51-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (12, N'2022-22-03')
INSERT [dbo].[Order] ([OrderID], [OrderDate]) VALUES (13, N'2022-26-03')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (1, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (2, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (3, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (4, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (12, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (5, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (13, 6)
INSERT [dbo].[OrderCustomer] ([OrderID], [CustomerID]) VALUES (11, 6)
GO
INSERT [dbo].[OrderDetail] ([OrderID], [Size], [Quantity], [ProductID]) VALUES (1, 44, 4, 20)
INSERT [dbo].[OrderDetail] ([OrderID], [Size], [Quantity], [ProductID]) VALUES (1, 42, 4, 19)
INSERT [dbo].[OrderDetail] ([OrderID], [Size], [Quantity], [ProductID]) VALUES (2, 40, 3, 22)
INSERT [dbo].[OrderDetail] ([OrderID], [Size], [Quantity], [ProductID]) VALUES (2, 39, 1, 22)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (3, N'Jordan1 KO', 800.0000, N'/image/Jordan1KO.jpg', N'aaaaaaa', 801, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (4, N'Jordan36', 550.0000, N'/image/Jordan36.jpg', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (5, N'Jordan36 Hanimic', 700.0000, N'/image/Jordan36Hanimichi.jpg', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (6, N'Jordan36 TacoJay', 500.0000, N'/image/Jordan36TacoJay.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (7, N'KD15 EP', 800.0000, N'/image/KD15EP.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (8, N'KDTrey 5EP', 750.0000, N'/image/KDTrey5Ep.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (9, N'Kryie6 Atum', 550.0000, N'/image/Kyrie6Atum.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (10, N'Kryie6 Valentine', 850.0000, N'/image/Kyrie6Valentine.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (11, N'KryieLow 5EP', 700.0000, N'/image/KyrieLow5EP.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (12, N'Lebron18 Low', 900.0000, N'/image/Lebron18Low.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (13, N'Lebron19', 900.0000, N'/image/Lebron19.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (14, N'Lebron19 Black', 950.0000, N'/image/Lebron19Black.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (15, N'Lebron19 Low', 850.0000, N'/image/Lebron19Low.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (16, N'BlackFives Fusion', 550.0000, N'/image/BlackFivesFusionNitro.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (17, N'CourRider Pop', 700.0000, N'/image/CourRiderPop.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (18, N'Fusion Nitro', 500.0000, N'/image/FusionNitro.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (19, N'Fusion NitroPink', 800.0000, N'/image/FusionNitroPink.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (20, N'Fusion NitroWhite', 750.0000, N'/image/FusionNitrowhite.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (21, N'MB 01UFO', 550.0000, N'/image/MB.01UFO.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (22, N'Dunkin Triple', 850.0000, N'/image/PumaxDunkinTripleBasketballSneakers.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (33, N'Dame8 Blue', 550.0000, N'/image/Dame8Blue.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (34, N'Dame8 Mint ', 700.0000, N'/image/Dame8Mint.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (35, N'Dame8 While', 500.0000, N'/image/Dame8White.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (36, N'DON Issue3', 800.0000, N'/image/DONIssue3.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (37, N'Forum Blue', 750.0000, N'/image/Forumblue.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (38, N'Harden StepBack3', 550.0000, N'/image/HardenStepBack3.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (39, N'Harden Vol6Black', 850.0000, N'/image/HardenVol6Black.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (40, N'Harden Vol6Pink', 850.0000, N'/image/HardenVol6Pink.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (41, N'Harden Vol6Purple', 850.0000, N'/image/HardenVol6Purple.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (42, N'WhyNot Zero4', 850.0000, N'/image/Whynotzero4.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (48, N'DON Issue Christmas', 850.0000, N'/image/DONIssueChirstmas.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (49, N'DON Issue Ninja', 900.0000, N'/image/DONIssueNinja.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (50, N'Freak3 Uno', 750.0000, N'/image/Freak3Uno.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (51, N'Freak3 Grey', 850.0000, N'/image/Freak3Grey.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (52, N'Freak3 Bread', 950.0000, N'/image/Freak3Bread.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (53, N'PG6 EP', 850.0000, N'/image/PG6EP.jpg', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 1)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (54, N'Future Evo Trainers', 900.0000, N'/image/Rebound.png', N'The Basketball Shoe
With constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (56, N'Puma Sky Modern', 900.0000, N'/image/SkyModern.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (57, N'DISC Rebirth', 850.0000, N'/image/DISCRebirth.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 1000, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (58, N'Rise Nitro', 900.0000, N'/image/RiseNitro.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 999, 4)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (59, N'Mid Parley', 650.0000, N'/image/MidParley.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 600, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (60, N'Harden OffWhite', 800.0000, N'/image/HardenOffWhite.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 900, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (61, N'Harden ST3White', 700.0000, N'/image/HardenST3White.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 750, 3)
INSERT [dbo].[Product] ([ProductID], [Name], [Price], [Image], [Description], [Quantity], [CategoryID]) VALUES (62, N'Rider Maverick', 900.0000, N'/image/RiderMaverick.png', N'The Basketball ShoeWith constant jumping, starting and stopping, basketball shoes are designed to act as shock absorbers and provide ankle stability with the flexibility to allow players to move laterally. As such, basketball shoes are much bulkier than running shoes.', 999, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderCustomer]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[OrderCustomer]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
