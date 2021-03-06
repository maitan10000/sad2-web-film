/* Database for assignment */
USE [Master]
IF db_id('Assignment') is not null
BEGIN
	ALTER DATABASE [Assignment]
	SET SINGLE_USER 
	WITH ROLLBACK IMMEDIATE;	
	DROP DATABASE [Assignment]
END
GO

Create database Assignment
GO

use Assignment
GO

If(OBJECT_ID('Comment')) IS NOT NULL
DROP Table [Comment]
Go

If(OBJECT_ID('Film')) IS NOT NULL
DROP Table [Film]
Go

If(OBJECT_ID('Account')) IS NOT NULL
DROP TABLE [Account]
GO

Create table [Account]
(
	Username nvarchar(50) primary key not null,
	[Password] nvarchar(50) not null,
	[Role] nvarchar(50) not null,
	JoinedDate Datetime,
	Email nvarchar(50) not null,
	IsActive bit not null	
)
GO

/*Add test db*/
INSERT INTO [Account] Values('admin', 'admin', 'admin', '01-01-2013', 'admin@site.com', 1)
INSERT INTO [Account] Values('user1', 'user1', 'user', '01-01-2013', 'user1@gmail.com', 1)
INSERT INTO [Account] Values('user2', 'user2', 'user', '01-01-2013', 'user2@gmail.com', 1)

/* Table Category */
If(OBJECT_ID('Category')) IS NOT NULL
DROP Table [Category]
Go

Create table [Category]
(
	ID int identity primary key not null,
	Name nvarchar(50) not null,
	IsActive bit not null,
)
GO
INSERT INTO [Category] Values(N'Hành động', 1)
INSERT INTO [Category] Values(N'Tình cảm', 1)
INSERT INTO [Category] Values(N'Kinh dị', 1)
INSERT INTO [Category] Values(N'Hài', 1)
INSERT INTO [Category] Values(N'Phiêu lưu', 1)
INSERT INTO [Category] Values(N'Viễn tưởng', 1)


/*Table Film */
If(OBJECT_ID('Film')) IS NOT NULL
DROP Table [Film]
Go

Create table [Film]
(
	ID bigint identity primary key not null,
	CategoryID int foreign key references[Category](ID) not null,
	ShortTitle nvarchar(256) ,
	FullTitle nvarchar(256) not null,
	[Description] ntext,	
	Link nvarchar(256) not null,
	Poster nvarchar(256),
	/*addtion attributes */
	[Length] bigint,
	ReleaseYear int,
	ViewCount bigint,
	
	IsActive bit not null,
)
Go

INSERT INTO [Film] Values(6,N'Người Sắt 3', N'Người Sắt - Iron Man 3 (2013)', N'Trong phần 3 này, mối hiểm họa mà Stark phải đối đầu lại đến từ quá khứ, khi 12 năm trước anh đã đẩy một nhà khoa học có tên Aldrich Killian (Guy Pearce) vào tuyệt vọng, để rồi giờ đây hắn trở lại đầy mạnh mẽ. Thứ mà Killian nắm trong tay là công nghệ Extremis có thể biến con người thành những chiến binh siêu hạng. Cùng lúc đó, tên khủng bố Mandarin (Ben Kingsley) đã công khai lộ diện, gây ra những vụ khủng bố rung động thế giới. Stark buộc phải rời xa những người thân yêu và cả bộ giáp quen thuộc, để anh phải chiến đấu sinh tồn bằng tất cả những gì mình có...',N'E:\',N'../../Content/image/IronMan3.jpg',0,2013,0, 1)
INSERT INTO [Film] Values(1,N'Tử Chiến 5', N'Tử Chiến 5 : DieHard 5 - Good Day To Die (2013)',N'John McClane tới Nga để giúp cậu con trai bướng bỉnh Jack, rồi phát hiện ra Jack là một đặc vụ CIA đang hoạt động bí mật để ngăn chặn một vụ trộm vũ khí hạt nhân. Vậy là hai cha con phải sát cánh bên nhau chống lại các lực lượng của thế giới ngầm Nga săn đuổi...', N'E:\',N'../../Content/image/DieHard5.jpg',0,2013,0, 1)
INSERT INTO [Film] Values(2,N'Điều Kì Diệu Trong Phòng Giam Số 7', N'Điều kì diệu trong phòng giam số 7 - Miracle  in Cell No.7',N'',N'E:\', N'../../Content/image/DieuKiDieuSo7.jpg',0,0,0, 1)
INSERT INTO [Film] Values(4,N'Kẻ Cắp Danh Tính', N'Kẻ Cắp Danh Tính - Identity Thief',N'Sandy Patterson (Jason Bateman) nhận được một cuộc gọi xác nhận tên anh và các thông tin nhận diện khác. Ngay sau đó, một spa ở Florida nhắc nhở anh về cuộc hẹn của mình và thẻ tín dụng của anh thì dùng hết giới hạn. Danh tính của mình bị đánh cắp, Sandy quyết định đến Colorado tìm cho ra kẻ cắp. Nhưng đối phó với người phụ nữ có vẻ vô hại Sandy này khó khăn hơn anh tưởng, và trong chuyến đi xuyên quốc gia của họ, hai người đã học hỏi được lẫn nhau những kinh nghiệm cuộc đời không ai ngờ tới. ',N'E:\', N'../../Content/image/KeCapDanhTinh.jpg',0,0,0, 1)


/*Table comment*/
If(OBJECT_ID('Comment')) IS NOT NULL
DROP Table [Comment]
Go

Create table [Comment]
(
	ID bigint identity primary key not null,
	FilmID bigint foreign key references Film(ID) not null,
	Username nvarchar(50) foreign key references Account(Username) not null,
	Content ntext not null,
	[DateTime] datetime not null,/*datetime comment*/
	IsActive bit,
)
GO


