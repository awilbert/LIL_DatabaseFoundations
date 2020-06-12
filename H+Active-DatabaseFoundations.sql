-- This script builds the H+Active database for LinkedIn Learning: Database Foundations
-- Users must edit the paths on lines 8 and 10 to point to their \MSSQL\DATA\ folders

USE [master]
GO
/****** Object:  Database [H+Active]    Script Date: 9/30/2015 11:18:30 AM ******/
CREATE DATABASE [H+Active] ON  PRIMARY 
( NAME = N'H-Plus-Active', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\H-Plus-Active.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'H-Plus-Active_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\H-Plus-Active_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [H+Active].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [H+Active] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [H+Active] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [H+Active] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [H+Active] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [H+Active] SET ARITHABORT OFF 
GO
ALTER DATABASE [H+Active] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [H+Active] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [H+Active] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [H+Active] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [H+Active] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [H+Active] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [H+Active] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [H+Active] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [H+Active] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [H+Active] SET  DISABLE_BROKER 
GO
ALTER DATABASE [H+Active] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [H+Active] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [H+Active] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [H+Active] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [H+Active] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [H+Active] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [H+Active] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [H+Active] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [H+Active] SET  MULTI_USER 
GO
ALTER DATABASE [H+Active] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [H+Active] SET DB_CHAINING OFF 
GO
USE [H+Active]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(10051,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](13) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nchar](2) NULL,
	[Zip] [nchar](5) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineItems]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItems](
	[LineItemID] [int] IDENTITY(109517,1) NOT NULL,
	[Line] [int] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[OptionID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_LineItems] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductListing]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductListing](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Item] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Who] [nvarchar](10) NULL,
	[Sizes] [nvarchar](100) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_ProductListing] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOptions]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptions](
	[OptionID] [int] IDENTITY(101,1) NOT NULL,
	[ProductID] [int] NULL,
	[Color] [nvarchar](20) NULL,
 CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[InvoiceTotals]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InvoiceTotals]
AS
SELECT        dbo.Invoices.InvoiceID, dbo.Customers.FirstName, dbo.Customers.LastName, SUM(dbo.ProductListing.Price * dbo.LineItems.Quantity) AS InvoiceTotal
FROM            dbo.Customers INNER JOIN
                         dbo.Invoices ON dbo.Customers.CustomerID = dbo.Invoices.CustomerID INNER JOIN
                         dbo.LineItems ON dbo.Invoices.InvoiceID = dbo.LineItems.InvoiceID INNER JOIN
                         dbo.ProductOptions ON dbo.LineItems.OptionID = dbo.ProductOptions.OptionID INNER JOIN
                         dbo.ProductListing ON dbo.ProductOptions.ProductID = dbo.ProductListing.ProductID
GROUP BY dbo.Invoices.InvoiceID, dbo.Customers.FirstName, dbo.Customers.LastName

GO
/****** Object:  View [dbo].[LineItemDetails]    Script Date: 9/30/2015 11:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LineItemDetails]
AS
SELECT        dbo.Customers.CustomerID, dbo.Customers.FirstName, dbo.Customers.LastName, dbo.Invoices.Date, dbo.Invoices.InvoiceID, dbo.LineItems.Line, dbo.ProductListing.Item, dbo.ProductOptions.Color, 
                         dbo.LineItems.Quantity, dbo.ProductListing.Price, dbo.LineItems.Quantity * dbo.ProductListing.Price AS Total
FROM            dbo.Invoices INNER JOIN
                         dbo.LineItems ON dbo.Invoices.InvoiceID = dbo.LineItems.InvoiceID INNER JOIN
                         dbo.ProductOptions ON dbo.LineItems.OptionID = dbo.ProductOptions.OptionID INNER JOIN
                         dbo.ProductListing ON dbo.ProductOptions.ProductID = dbo.ProductListing.ProductID INNER JOIN
                         dbo.Customers ON dbo.Invoices.CustomerID = dbo.Customers.CustomerID

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10051, N'Aidan', N'Crawford', N'(947) 236-003', N'6889 Quaking Highlands', N'West Hartford', N'CT', N'06127')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10052, N'Sopoline', N'Weber', N'(110) 846-162', N'6587 Indian Point', N'Chicago', N'IL', N'60687')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10053, N'Lance', N'Baker', N'(563) 286-996', N'265 High Harbour', N'Boca Raton', N'FL', N'33427')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10054, N'Candice', N'Mosley', N'(390) 484-091', N'4325 Red Branch Ridge', N'Fort Wayne', N'IN', N'46819')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10055, N'Macey', N'Kelly', N'(286) 505-104', N'843 Silver Lane', N'Akron', N'OH', N'44312')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10056, N'Cassady', N'Summers', N'(883) 787-638', N'909 Umber Village', N'Dayton', N'OH', N'45429')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10057, N'Maisie', N'Flynn', N'(686) 442-503', N'9343 Silent Downs', N'Crawfordsville', N'IN', N'47934')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10058, N'Cadman', N'Patrick', N'(182) 910-786', N'203 Emerald Bluff Corner', N'Jacksonville', N'FL', N'32227')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10059, N'Dexter', N'Good', N'(322) 197-612', N'4816 Grand Abbey', N'Fort Myers', N'FL', N'33911')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10060, N'Stella', N'Ryan', N'(684) 975-954', N'4227 Sleepy Blossom Close', N'Sacramento', N'CA', N'95852')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10061, N'Gary', N'Ramirez', N'(945) 277-143', N'4003 Shady Pioneer Alley', N'Lebanon', N'PA', N'17042')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10062, N'Katelyn', N'Hamilton', N'(152) 737-613', N'599 Easy Arbor', N'Salt Lake City', N'UT', N'84138')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10063, N'Jade', N'Rose', N'(259) 701-483', N'3385 Burning Log Bank', N'Oakland', N'CA', N'94610')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10064, N'Remedios', N'Anthony', N'(230) 514-385', N'5724 Pleasant View Quay', N'Saint Augustine', N'FL', N'32086')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Phone], [Address], [City], [State], [Zip]) VALUES (10065, N'Hilel', N'Branch', N'(410) 481-539', N'6039 Rustic Lake Row', N'Hartford', N'CT', N'06150')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (1, N'Henry', N'Twill', N'CEO', N'HTwill@HPlusSport.com')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (2, N'Jessica', N'Newton-Smith', N'CFO', N'JSmith@HPlusSport.com')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (3, N'Phi', N'Tang', N'Director of Product Development', N'PTang@HPlusSport.com')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (4, N'Maria', N'Sontas', N'Director of Marketing', N'MSontas@HPlusSport.com')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (5, N'Angela', N'Hashton', N'Director of Sales', N'AHashton@HPlusSport.com')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Position], [Email]) VALUES (6, N'Michael', N'Lewiston', N'Creative Director', N'MLewiston@HPlusSport.com')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (1, 10056, CAST(N'2015-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (2, 10053, CAST(N'2015-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (3, 10051, CAST(N'2015-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (4, 10051, CAST(N'2015-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (5, 10060, CAST(N'2015-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (6, 10055, CAST(N'2015-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (7, 10055, CAST(N'2015-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (8, 10052, CAST(N'2015-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (9, 10052, CAST(N'2015-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (10, 10055, CAST(N'2015-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (11, 10059, CAST(N'2015-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (12, 10056, CAST(N'2015-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (13, 10059, CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (14, 10055, CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (15, 10051, CAST(N'2015-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (16, 10061, CAST(N'2015-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (17, 10065, CAST(N'2015-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (18, 10064, CAST(N'2015-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (19, 10056, CAST(N'2015-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[Invoices] ([InvoiceID], [CustomerID], [Date]) VALUES (20, 10059, CAST(N'2015-02-21 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Invoices] OFF
SET IDENTITY_INSERT [dbo].[LineItems] ON 

INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109517, 1, 1, 163, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109518, 2, 1, 167, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109519, 3, 1, 132, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109520, 4, 1, 117, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109521, 1, 2, 157, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109522, 1, 3, 176, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109523, 1, 4, 151, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109524, 2, 4, 169, 4)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109525, 1, 5, 114, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109526, 2, 5, 182, 5)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109527, 1, 6, 101, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109528, 2, 6, 121, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109529, 1, 7, 176, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109530, 1, 8, 124, 4)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109531, 2, 8, 107, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109532, 1, 9, 111, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109533, 2, 9, 195, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109534, 1, 10, 128, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109535, 1, 11, 108, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109536, 2, 11, 175, 5)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109537, 3, 11, 149, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109538, 1, 12, 103, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109539, 2, 12, 105, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109540, 3, 12, 135, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109541, 1, 13, 186, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109542, 2, 13, 182, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109543, 3, 13, 181, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109544, 1, 14, 190, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109545, 2, 14, 148, 5)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109546, 1, 15, 198, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109547, 1, 16, 195, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109548, 2, 16, 103, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109549, 3, 16, 131, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109550, 1, 17, 157, 2)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109551, 2, 17, 130, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109552, 1, 18, 183, 3)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109553, 1, 19, 173, 1)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109554, 1, 20, 144, 5)
INSERT [dbo].[LineItems] ([LineItemID], [Line], [InvoiceID], [OptionID], [Quantity]) VALUES (109555, 2, 20, 113, 2)
SET IDENTITY_INSERT [dbo].[LineItems] OFF
SET IDENTITY_INSERT [dbo].[ProductListing] ON 

INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (1, N'Cross-back training tank', N'Our cross-back training tank is made from organic cotton with 10% Lycra for form and support, and a flattering feminine cut. ', N'Women', N'P, S, M, L, XL', 35.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (2, N'Bamboo thermal ski coat', N'You’ll be the most environmentally conscious skier on the slopes - and the most stylish - wearing our fitted bamboo thermal ski coat, made from organic bamboo with recycled plastic down filling.', N'Women', N'P, S, M, L, XL', 128.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (3, N'Stretchy dance pants', N'Whether dancing the samba, mastering a yoga pose, or scaling the climbing wall, our stretchy dance pants, made from 80% organic cotton and 20% Lycra, are the most versatile and comfortable workout pants you’ll ever have the pleasure of wearing.', N'Women', N'P, S, M, L, XL', 85.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (4, N'Ultra-soft tank top', N'This versatile tank can be worn in the gym, under a blazer, or for a day out in the sun. Made from our patented organic bamboo and cotton mix, our ultra-soft tank never stops feeling soft, even when you forget the fabric softener.', N'Women', N'P, S, M, L, XL', 23.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (5, N'V-neck t-shirt', N'Our pre-shrunk organic cotton t-shirt, with its slightly fitted waist and elegant V-neck is designed to flatter. You’ll want one in every color!', N'Women', N'P, S, M, L, XL', 26.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (6, N'V-neck sweater', N'This medium-weight sweater, made from organic knitted cotton and bamboo, is the perfect solution to a chilly night at the campground or a misty walk on the beach.', N'Men', N'Men’s S, M, L, XL, XXL', 65.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (7, N'Polo shirt', N'Our pre-shrunk organic cotton polo shirt is perfect for weekend activities, lounging around the house, and casual days at the office. With its triple-stitched sleeves and waistband, our polo has maximum durability.', N'Men', N'Men’s S, M, L, XL, XXL', 38.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (8, N'Skater graphic T-shirt', N'Hip at the skate park or around down, our pre-shrunk organic cotton graphic T-shirt has you covered.', N'Men', N'Men’s S, M, L, XL, XXL', 45.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (9, N'Thermal fleece jacket', N'Our thermal organic fleece jacket, is brushed on both sides for ultra softness and warmth. This medium-weight jacket is versatile all year around, and can be worn with layers for the winter season.', N'Men', N'Men’s S, M, L, XL, XXL', 85.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (10, N'V-neck pullover', N'This organic hemp jersey pullover is perfect in a pinch. Wear for casual days at the office, a game of hoops after work, or running your weekend errands.', N'Men', N'Men’s S, M, L, XL, XXL', 35.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (11, N'V-neck T-shirt', N'Our pre-shrunk organic cotton V-neck T-shirt is the ultimate in comfort and durability, with triple stitching at the collar, sleeves, and waist. So versatile you’ll want one in every color!', N'Men', N'Men’s S, M, L, XL, XXL', 28.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (12, N'Grunge skater jeans', N'Our boy-cut jeans are for men and women who appreciate that skate park fashions aren’t just for skaters.  Made from the softest and most flexible organic cotton denim.', N'Unisex', N'Men’s S, M, L, XL, XXL; Women’s P, S, M, L, XL', 75.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (13, N'Slicker jacket', N'Wind and rain are no match for our organic bamboo slicker jacket for men and women.  Triple stitched seams, zippered pockets, and a stay-tight hood are just a few features of our best-selling jacket.', N'Unisex', N'Men’s S, M, L, XL, XXL; Women’s P, S, M, L, XL', 125.0000)
INSERT [dbo].[ProductListing] ([ProductID], [Item], [Description], [Who], [Sizes], [Price]) VALUES (14, N'Thermal vest', N'Our thermal vest, made from organic bamboo with recycled plastic down filling, is a favorite of both men and women. You’ll help the environment, and have a wear-easy piece for many occasions. ', N'Unisex', N'Men’s S, M, L, XL, XXL; Women’s P, S, M, L, XL', 95.0000)
SET IDENTITY_INSERT [dbo].[ProductListing] OFF
SET IDENTITY_INSERT [dbo].[ProductOptions] ON 

INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (101, 1, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (102, 1, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (103, 1, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (104, 1, N'rose')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (105, 1, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (106, 1, N'teal')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (107, 1, N'lavender')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (108, 1, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (109, 2, N'periwinkle')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (110, 2, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (111, 2, N'rose')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (112, 2, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (113, 3, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (114, 3, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (115, 3, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (116, 3, N'evergreen')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (117, 4, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (118, 4, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (119, 4, N'blue')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (120, 4, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (121, 4, N'natural')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (122, 4, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (123, 5, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (124, 5, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (125, 5, N'chocolate')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (126, 5, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (127, 5, N'natural')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (128, 5, N'red')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (129, 5, N'rose')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (130, 5, N'aqua')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (131, 5, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (132, 5, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (133, 5, N'goldenrod')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (134, 5, N'lavender')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (135, 5, N'grape')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (136, 5, N'lime')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (137, 5, N'pink')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (138, 6, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (139, 6, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (140, 6, N'chocolate')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (141, 6, N'natural')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (142, 6, N'grape')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (143, 6, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (144, 6, N'evergreen')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (145, 7, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (146, 7, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (147, 7, N'chocolate')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (148, 7, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (149, 7, N'natural')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (150, 7, N'red')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (151, 7, N'aqua')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (152, 7, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (153, 7, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (154, 7, N'goldenrod')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (155, 7, N'lavender')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (156, 7, N'grape')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (157, 7, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (158, 8, N'burgundy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (159, 8, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (160, 8, N'blue')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (161, 9, N'sky blue')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (162, 9, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (163, 9, N'brown')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (164, 9, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (165, 10, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (166, 10, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (167, 10, N'brown')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (168, 10, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (169, 10, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (170, 10, N'red')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (171, 11, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (172, 11, N'natural')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (173, 11, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (174, 11, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (175, 11, N'chocolate')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (176, 11, N'olive')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (177, 11, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (178, 11, N'sky')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (179, 11, N'blue')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (180, 11, N'red')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (181, 11, N'rose')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (182, 11, N'evergreen')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (183, 11, N'goldenrod')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (184, 12, N'indigo')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (185, 13, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (186, 13, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (187, 13, N'red')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (188, 13, N'lime')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (189, 13, N'lemon')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (190, 13, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (191, 14, N'black')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (192, 14, N'chocolate')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (193, 14, N'white')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (194, 14, N'gray')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (195, 14, N'navy')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (196, 14, N'mint')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (197, 14, N'rose')
INSERT [dbo].[ProductOptions] ([OptionID], [ProductID], [Color]) VALUES (198, 14, N'black')
SET IDENTITY_INSERT [dbo].[ProductOptions] OFF
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Customers]
GO
ALTER TABLE [dbo].[LineItems]  WITH CHECK ADD  CONSTRAINT [FK_LineItems_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_Invoices]
GO
ALTER TABLE [dbo].[LineItems]  WITH CHECK ADD  CONSTRAINT [FK_LineItems_ProductOptions] FOREIGN KEY([OptionID])
REFERENCES [dbo].[ProductOptions] ([OptionID])
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_ProductOptions]
GO
ALTER TABLE [dbo].[ProductOptions]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptions_ProductListing] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductListing] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOptions] CHECK CONSTRAINT [FK_ProductOptions_ProductListing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[30] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Invoices"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LineItems"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductOptions"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductListing"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 198
               Right = 1087
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvoiceTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1755
         Table = 2775
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvoiceTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'InvoiceTotals'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[26] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Invoices"
            Begin Extent = 
               Top = 15
               Left = 245
               Bottom = 137
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LineItems"
            Begin Extent = 
               Top = 16
               Left = 469
               Bottom = 195
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductOptions"
            Begin Extent = 
               Top = 18
               Left = 698
               Bottom = 147
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductListing"
            Begin Extent = 
               Top = 19
               Left = 929
               Bottom = 217
               Right = 1099
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 13
               Left = 13
               Bottom = 224
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 2100
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LineItemDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LineItemDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LineItemDetails'
GO
USE [master]
GO
ALTER DATABASE [H+Active] SET  READ_WRITE 
GO
