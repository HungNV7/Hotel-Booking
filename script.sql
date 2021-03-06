USE [Hotel Booking]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblCategory_cateogryID]  DEFAULT (newid()),
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[discountID] [nvarchar](50) NOT NULL CONSTRAINT [DF_tblDiscount_discountID]  DEFAULT (newid()),
	[discountName] [nvarchar](50) NULL,
	[percentage] [int] NOT NULL,
	[expirateDate] [date] NOT NULL,
	[createDate] [date] NULL CONSTRAINT [DF_tblDiscount_createDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[feedbackID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblFeedback_feedbackID]  DEFAULT (newid()),
	[roomID] [uniqueidentifier] NOT NULL,
	[feedback] [nvarchar](max) NULL,
	[star] [int] NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblFeedback] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHotel]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHotel](
	[hotelID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblHotel_hotelID]  DEFAULT (newid()),
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](50) NOT NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblHotel] PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblOrder_orderID]  DEFAULT (newsequentialid()),
	[userID] [nvarchar](50) NOT NULL,
	[total] [decimal](18, 2) NULL,
	[returnDate] [datetime] NULL,
	[arrriveDate] [datetime] NULL,
	[discountID] [nvarchar](50) NULL,
	[finalTotal] [decimal](18, 2) NULL,
	[statusID] [int] NULL,
	[bookingDate] [datetime] NULL CONSTRAINT [DF_tblOrder_bookingDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblOrderDetail_orderDetailID]  DEFAULT (newid()),
	[roomID] [uniqueidentifier] NOT NULL,
	[orderID] [uniqueidentifier] NOT NULL,
	[amount] [int] NULL,
	[price] [real] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblRoom_ID]  DEFAULT (newid()),
	[hotelID] [uniqueidentifier] NOT NULL,
	[categoryID] [uniqueidentifier] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [real] NULL,
	[booking] [int] NULL CONSTRAINT [DF_tblRoom_booking]  DEFAULT ((0)),
 CONSTRAINT [PK_tblRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[createDate] [date] NOT NULL,
	[statusID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'91a27f12-c2bb-4590-984b-2408968ca3f9', N'Family Room')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', N'Double Room')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (N'c585b774-c627-4ac0-b138-7f562ac7e51f', N'Single Room')
INSERT [dbo].[tblDiscount] ([discountID], [discountName], [percentage], [expirateDate], [createDate]) VALUES (N'08112000', N'Discount for haloween event', 30, CAST(N'2020-11-08' AS Date), CAST(N'2020-11-03' AS Date))
INSERT [dbo].[tblDiscount] ([discountID], [discountName], [percentage], [expirateDate], [createDate]) VALUES (N'090909', N'Discount for new event', 15, CAST(N'2020-11-08' AS Date), CAST(N'2020-10-30' AS Date))
INSERT [dbo].[tblDiscount] ([discountID], [discountName], [percentage], [expirateDate], [createDate]) VALUES (N'112233', N'Discount 1 ', 20, CAST(N'2020-10-29' AS Date), CAST(N'2020-10-28' AS Date))
INSERT [dbo].[tblDiscount] ([discountID], [discountName], [percentage], [expirateDate], [createDate]) VALUES (N'123123', N'Discount code 3', 20, CAST(N'2020-11-20' AS Date), CAST(N'2020-11-02' AS Date))
INSERT [dbo].[tblFeedback] ([feedbackID], [roomID], [feedback], [star], [userID]) VALUES (N'f22a6d08-744e-451f-850a-2bfb66f7d790', N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'Good!', 4, N'hungnvse140996@fpt.edu.vn')
INSERT [dbo].[tblFeedback] ([feedbackID], [roomID], [feedback], [star], [userID]) VALUES (N'40314214-a1a2-4b5d-805a-347721025658', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'Nice!!!!!!!', 5, N'hungnvse140996@fpt.edu.vn')
INSERT [dbo].[tblFeedback] ([feedbackID], [roomID], [feedback], [star], [userID]) VALUES (N'87dd65d3-677c-44e6-bc8e-6cb426998ede', N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'Price is reasonable!!!!!!', 4, N'hungnvse140996@fpt.edu.vn')
INSERT [dbo].[tblFeedback] ([feedbackID], [roomID], [feedback], [star], [userID]) VALUES (N'641acc85-3166-4eab-8aa7-a7ec271cf8d4', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'It is nice!', 3, N'hungnvse140996@fpt.edu.vn')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'dd8e608e-9ec9-4683-b0c4-24b5806c64b2', N'RedDoorz @ Nguyen Thai Hoc Street', N'193 Nguyen Thai Hoc Street, Pham Ngu Lao Ward, District 1, Ho Chi Minh City, Vietnam', N'02873060600', N'desktop_hotel_gallery_large_900x600_20190929_Room___Saigon__44_.jpg')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'157b08f2-d929-4813-b8b4-7bc4e8604914', N'RedDoorz near Vincom Go Vap', N' No 24, 14 street, 05 Ward, Go Vap District, Ho chi minh city, Vietnam', N'02873060501', N'desktop_hotel_show_530x360_20190917_Rdz_near__Vincom_Go_Vap_900x600.jpg')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'cb8106ef-d3f5-4241-9816-9b3350fcb70b', N'RedDoorz near Nguyen Hue Walking Street 2', N'51 Huynh Thuc Khang Street, Ben Nghe Ward, District 1, Ho Chi Minh City, Vietnam', N'02873060601', N'desktop_hotel_gallery_large_900x600_a1b0be23-7096-4a02-81ed-b63fe8ed1450_2Fdesktop.jpg')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'895f9377-c2d4-44d8-af3d-a83b05cdb86b', N'RedDoorz Plus @ Tran Quang Khai street', N'221 Tran Quang Khai Street, Tan Dinh Ward, District 1, Ho Chi Minh City, Vietnam', N'02875160401', N'desktop_hotel_show_530x360_f1810155-4788-4447-91d0-814034c3cfc7_2Fdesktop.jpg')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'ced3e405-6005-464b-9cc9-c14dbfb6f05c', N'RedDoorz near Tan Dinh Market 3', N'31-33 Ly Chinh Thang Street, Ward 8, District 3, Ho Chi Minh City, Vietnam', N'02874060401', N'desktop_hotel_gallery_large_900x600_IMG_7466.jpg')
INSERT [dbo].[tblHotel] ([hotelID], [name], [address], [phone], [image]) VALUES (N'10301150-3f18-4224-a251-cce1ece5ee17', N'RedDoorz @ Hoang Minh Hotel', N'201 Cong Hoa Street, Ward 13, Tan Binh, Ho Chi Minh City, Vietnam', N'02873060401', N'desktop_hotel_gallery_large_900x600_IMG_9580.jpg')
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'dac78bd8-7b1d-eb11-8e5b-963212092d17', N'hungnvse140996@fpt.edu.vn', CAST(50.00 AS Decimal(18, 2)), CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2020-11-03 00:00:00.000' AS DateTime), NULL, CAST(50.00 AS Decimal(18, 2)), 4, CAST(N'2020-11-03 09:25:32.613' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'6d0f820e-811d-eb11-8e5b-963212092d17', N'hungnvse140996@fpt.edu.vn', CAST(66.00 AS Decimal(18, 2)), CAST(N'2020-11-05 00:00:00.000' AS DateTime), CAST(N'2020-11-03 00:00:00.000' AS DateTime), N'123123', CAST(105.60 AS Decimal(18, 2)), 7, CAST(N'2020-11-03 10:02:50.630' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'9643a599-851d-eb11-8e5b-963212092d17', N'HungNV', CAST(115.00 AS Decimal(18, 2)), CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2020-11-03 00:00:00.000' AS DateTime), NULL, CAST(115.00 AS Decimal(18, 2)), 5, CAST(N'2020-11-03 10:35:22.050' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'cdc182e6-861d-eb11-8e5b-963212092d17', N'hungnvse140996@fpt.edu.vn', CAST(52.00 AS Decimal(18, 2)), CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2020-11-03 00:00:00.000' AS DateTime), NULL, CAST(52.00 AS Decimal(18, 2)), 6, CAST(N'2020-11-03 10:44:40.507' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'348e3bcb-af1d-eb11-8e5b-963212092d17', N'hungnvse140996@fpt.edu.vn', CAST(90.00 AS Decimal(18, 2)), CAST(N'2020-11-04 00:00:00.000' AS DateTime), CAST(N'2020-11-03 00:00:00.000' AS DateTime), N'08112000', CAST(63.00 AS Decimal(18, 2)), 7, CAST(N'2020-11-03 15:37:24.107' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'327df493-0c20-eb11-8e5d-d531d776df2b', N'hungnvse140996@fpt.edu.vn', CAST(194.00 AS Decimal(18, 2)), CAST(N'2020-11-08 00:00:00.000' AS DateTime), CAST(N'2020-11-06 00:00:00.000' AS DateTime), N'090909', CAST(164.90 AS Decimal(18, 2)), 5, CAST(N'2020-11-06 15:46:36.890' AS DateTime))
INSERT [dbo].[tblOrder] ([orderID], [userID], [total], [returnDate], [arrriveDate], [discountID], [finalTotal], [statusID], [bookingDate]) VALUES (N'7c8e1931-0d20-eb11-8e5d-d531d776df2b', N'boy.onechamp.sylas07@gmail.com', CAST(57.00 AS Decimal(18, 2)), CAST(N'2020-11-07 00:00:00.000' AS DateTime), CAST(N'2020-11-06 00:00:00.000' AS DateTime), NULL, CAST(57.00 AS Decimal(18, 2)), 6, CAST(N'2020-11-06 15:51:00.533' AS DateTime))
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'3aa61b02-0831-47e7-975a-0272fd27e182', N'082248ac-bcd0-4ec7-84cb-778e73539edf', N'327df493-0c20-eb11-8e5d-d531d776df2b', 2, 19)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'de35d9ed-5cef-4e04-97e0-0f8760d058d1', N'5678f716-dd73-4ae1-9af0-de40edea5460', N'9643a599-851d-eb11-8e5b-963212092d17', 2, 22)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'322e707c-8a7b-4c33-988a-2d78af06507e', N'00ff7fe9-a3e7-4941-8bdd-6a2030b937b4', N'348e3bcb-af1d-eb11-8e5b-963212092d17', 2, 15)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'9823ff8b-ce09-4a27-9346-434bddc4620b', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'327df493-0c20-eb11-8e5d-d531d776df2b', 1, 14)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'9775da0d-4610-4ad8-a98a-4b4af42e4b11', N'8981886b-f10f-4db1-ad7a-51fa3a307beb', N'7c8e1931-0d20-eb11-8e5d-d531d776df2b', 1, 29)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'759db016-f6c2-4f00-9f0b-513ac5722a67', N'66db4324-57d5-46dd-8736-5d597256a08e', N'dac78bd8-7b1d-eb11-8e5b-963212092d17', 1, 11)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'cd545e1a-c3b5-444f-a1f4-62a4852d080c', N'00ff7fe9-a3e7-4941-8bdd-6a2030b937b4', N'dac78bd8-7b1d-eb11-8e5b-963212092d17', 1, 15)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'c1761abe-00df-49f5-86cd-6810ea95542a', N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'9643a599-851d-eb11-8e5b-963212092d17', 5, 12)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'cdbb53ca-19ce-4cfb-ac93-87abd28beb54', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'7c8e1931-0d20-eb11-8e5d-d531d776df2b', 2, 14)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'c1de486f-f133-45ce-995b-8f32f4f788a1', N'5678f716-dd73-4ae1-9af0-de40edea5460', N'348e3bcb-af1d-eb11-8e5b-963212092d17', 1, 22)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'3dc91efb-945f-413d-98e9-95a0fea8b6f0', N'00ff7fe9-a3e7-4941-8bdd-6a2030b937b4', N'327df493-0c20-eb11-8e5d-d531d776df2b', 3, 15)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'4b1863f2-4a32-4776-ad26-b1c01cea7e51', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'348e3bcb-af1d-eb11-8e5b-963212092d17', 1, 14)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'0f084174-fc4e-4c2f-8b86-b5dd224d6213', N'66db4324-57d5-46dd-8736-5d597256a08e', N'9643a599-851d-eb11-8e5b-963212092d17', 1, 11)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'c7eda79c-2121-4166-9ee4-be479347363c', N'a5e9f66a-5110-4563-9c4f-d112f0e39c9b', N'6d0f820e-811d-eb11-8e5b-963212092d17', 1, 38)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'94c5cc1b-9a7e-4490-a237-c98b32d14df9', N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'348e3bcb-af1d-eb11-8e5b-963212092d17', 2, 12)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'8bd79e1c-866c-4f4e-84e6-d46e777ae471', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'cdc182e6-861d-eb11-8e5b-963212092d17', 2, 14)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'951a8e6c-58ab-404b-9a70-d594e5b08145', N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'dac78bd8-7b1d-eb11-8e5b-963212092d17', 2, 12)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'9d0d3724-b4b4-457d-ae17-e8b721c0e508', N'b10d0482-efa2-4183-84b6-e6a0317437af', N'cdc182e6-861d-eb11-8e5b-963212092d17', 1, 24)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [roomID], [orderID], [amount], [price]) VALUES (N'dd68c5d5-e269-4e11-b5ef-ef4062b2dc0d', N'16771914-6669-4cc9-bba8-772cd9b0e388', N'6d0f820e-811d-eb11-8e5b-963212092d17', 2, 14)
INSERT [dbo].[tblRole] ([roleID], [name]) VALUES (1, N'Admin')
INSERT [dbo].[tblRole] ([roleID], [name]) VALUES (2, N'Member')
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'327d3752-cf5f-4e67-90b7-2376fec428a2', N'cb8106ef-d3f5-4241-9816-9b3350fcb70b', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 20, 20, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'faad24da-3aa2-4a49-9257-43562fece815', N'10301150-3f18-4224-a251-cce1ece5ee17', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 15, 25, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'8981886b-f10f-4db1-ad7a-51fa3a307beb', N'cb8106ef-d3f5-4241-9816-9b3350fcb70b', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 10, 29, 1)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'f9e4c9d2-ea41-4709-b332-5475fc815bc2', N'10301150-3f18-4224-a251-cce1ece5ee17', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 10, 35, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'66db4324-57d5-46dd-8736-5d597256a08e', N'cb8106ef-d3f5-4241-9816-9b3350fcb70b', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 15, 11, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'd7f1834d-6996-4f6f-9563-5e3189672b7c', N'157b08f2-d929-4813-b8b4-7bc4e8604914', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 15, 25, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'00ff7fe9-a3e7-4941-8bdd-6a2030b937b4', N'157b08f2-d929-4813-b8b4-7bc4e8604914', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 15, 15, 3)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'16771914-6669-4cc9-bba8-772cd9b0e388', N'895f9377-c2d4-44d8-af3d-a83b05cdb86b', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 15, 14, 2)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'082248ac-bcd0-4ec7-84cb-778e73539edf', N'ced3e405-6005-464b-9cc9-c14dbfb6f05c', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 20, 19, 2)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'25d940e0-a6c8-4694-91a9-9741b379f567', N'895f9377-c2d4-44d8-af3d-a83b05cdb86b', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 10, 30, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'fb996ab3-87df-4c9b-8fcd-9eb8ebdd8a01', N'157b08f2-d929-4813-b8b4-7bc4e8604914', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 10, 34, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'b2545a84-fc78-472c-9e68-a13903f6a8a5', N'dd8e608e-9ec9-4683-b0c4-24b5806c64b2', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 20, 30, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'd640a473-f699-451b-8b56-a324288ceda9', N'10301150-3f18-4224-a251-cce1ece5ee17', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 20, 12, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'a50c9f37-7d3b-45a6-81e8-a77182745a36', N'ced3e405-6005-464b-9cc9-c14dbfb6f05c', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 15, 27, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'2bd14399-aeb8-40da-a77c-afb7635c55c7', N'dd8e608e-9ec9-4683-b0c4-24b5806c64b2', N'c585b774-c627-4ac0-b138-7f562ac7e51f', 20, 12, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'a5e9f66a-5110-4563-9c4f-d112f0e39c9b', N'ced3e405-6005-464b-9cc9-c14dbfb6f05c', N'91a27f12-c2bb-4590-984b-2408968ca3f9', 10, 38, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'5678f716-dd73-4ae1-9af0-de40edea5460', N'dd8e608e-9ec9-4683-b0c4-24b5806c64b2', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 20, 22, 0)
INSERT [dbo].[tblRoom] ([ID], [hotelID], [categoryID], [quantity], [price], [booking]) VALUES (N'b10d0482-efa2-4183-84b6-e6a0317437af', N'895f9377-c2d4-44d8-af3d-a83b05cdb86b', N'2968856b-1a06-4f7d-9fac-5cdd6c160b49', 15, 24, 0)
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (2, N'Deactive')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (3, N'Booked')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (4, N'Done Payment')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (5, N'Not yet Payment')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (6, N'Inactive')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (7, N'Check out')
INSERT [dbo].[tblUser] ([userID], [name], [password], [phone], [address], [createDate], [statusID], [roleID]) VALUES (N'boy.onechamp.sylas07@gmail.com', N'Thi Ly Vu', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0831233123', N'Da Nang city', CAST(N'2020-11-06' AS Date), 1, 2)
INSERT [dbo].[tblUser] ([userID], [name], [password], [phone], [address], [createDate], [statusID], [roleID]) VALUES (N'HungNV', N'Van Hung Nguyen', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0945326317', N'Buon Ma Thuot city', CAST(N'2020-10-27' AS Date), 1, 2)
INSERT [dbo].[tblUser] ([userID], [name], [password], [phone], [address], [createDate], [statusID], [roleID]) VALUES (N'hungnvse140996@fpt.edu.vn', N'Tran Khanh Hung', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'0914148921', N'Ha Noi capital', CAST(N'2020-10-29' AS Date), 1, 2)
INSERT [dbo].[tblUser] ([userID], [name], [password], [phone], [address], [createDate], [statusID], [roleID]) VALUES (N'nghungg0811@gmail.com', N'Nguyen Van Hung', N'8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414', N'09455455', N'Buon Ma Thuot city', CAST(N'2020-10-21' AS Date), 1, 1)
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__roomI__00DF2177] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([ID])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__roomI__00DF2177]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__userI__7EF6D905] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__userI__7EF6D905]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__discou__30F848ED] FOREIGN KEY([discountID])
REFERENCES [dbo].[tblDiscount] ([discountID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__discou__30F848ED]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__status__40058253] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__status__40058253]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK__tblOrder__userID__2F10007B] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK__tblOrder__userID__2F10007B]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__order__300424B4] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__order__300424B4]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__roomI__4222D4EF] FOREIGN KEY([roomID])
REFERENCES [dbo].[tblRoom] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__roomI__4222D4EF]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK__tblRoom__categor__2C3393D0] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK__tblRoom__categor__2C3393D0]
GO
ALTER TABLE [dbo].[tblRoom]  WITH CHECK ADD  CONSTRAINT [FK__tblRoom__hotelID__2D27B809] FOREIGN KEY([hotelID])
REFERENCES [dbo].[tblHotel] ([hotelID])
GO
ALTER TABLE [dbo].[tblRoom] CHECK CONSTRAINT [FK__tblRoom__hotelID__2D27B809]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__4D94879B] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__4D94879B]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
/****** Object:  StoredProcedure [dbo].[findAvailableRoom]    Script Date: 11/6/2020 3:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[findAvailableRoom]
	@Date DATE
AS
BEGIN
	DECLARE @ID nvarchar(50);
	DECLARE @Amount int;
	UPDATE tblRoom SET booking = 0
	DECLARE myCursor CURSOR FOR 
		SELECT roomID, amount FROM tblOrderDetail
		WHERE orderID IN (
		SELECT orderID FROM tblOrder
		WHERE returnDate > CAST(GETDATE() AS DATE) AND returnDate > @Date AND (statusID = 4 OR statusID = 5)
		)
	OPEN myCursor;
	FETCH NEXT FROM myCursor INTO @ID, @Amount;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE tblRoom SET booking = @Amount WHERE ID = @ID
		FETCH NEXT FROM myCursor INTO @ID, @Amount;
	END
	CLOSE myCursor;
	DEALLOCATE myCursor;
END



GO
