create database doctruyen
use doctruyen
go 
create table theloai
(
	matheloai TINYINT IDENTITY(1, 1) PRIMARY KEY NOT NULL, 
	tentheloai nvarchar(50)
)

create table bangxephang
(
	tenbangxephang nvarchar(50)  PRIMARY KEY NOT NULL
)

create table quantri
(
	id int  PRIMARY KEY NOT NULL,
	username varchar(50),
	pass varchar(50)
)

create table nguoidung
(
	manguoidung int IDENTITY(1, 1) PRIMARY KEY NOT NULL, 
	tennguoidung nvarchar(50) ,
	username varchar(50),
	pass varchar(50),
	truyendadoc ntext,
	truyentheodoi bit
)

create table chuong(
	machuong  INT IDENTITY(1, 1) PRIMARY KEY NOT NULL, 
	tenchuong nvarchar(50)
)

create table binhluan(
	mabinhluan int PRIMARY KEY NOT NULL,
	tennguoidung nvarchar(50),
	hinhanh nvarchar(50),
	noidung ntext,
	thich bit,
	thoigiandang TIME
)

create table danhgia(
	madanhgia float PRIMARY KEY NOT NULL,
	tinhcachnhanvat float,
	noidungcottruyen float,
	bocucthegioi float
)

create table truyen
(
	matruyen varchar(10) PRIMARY KEY NOT NULL,
	tentruyen nvarchar(100),
	hinhanh varchar(50),
	mota ntext,
	tentacgia nvarchar(50),
	matheloai TINYINT,
	tinhtrang TINYINT,
	machuong int,
	luotdoc BIGINT,
	madanhgia FLOAT,
	mabinhluan INT,
	manguoidung INT,
	CONSTRAINT FK_truyen_chuong FOREIGN KEY (machuong) REFERENCES chuong (machuong),
	CONSTRAINT FK_truyen_danhgia FOREIGN KEY (madanhgia) REFERENCES danhgia (madanhgia),
	CONSTRAINT FK_truyen_binhluan FOREIGN KEY (mabinhluan) REFERENCES binhluan (mabinhluan),
	CONSTRAINT FK_truyen_theloai FOREIGN KEY (matheloai) REFERENCES theloai (matheloai),
	CONSTRAINT FK_truyen_nguoidung FOREIGN KEY (manguoidung) REFERENCES nguoidung (manguoidung)
)

create table bientapviendecu
(
	matruyen varchar(10),
	tentruyen nvarchar(100),
	PRIMARY KEY (matruyen,tentruyen),
	CONSTRAINT FK_bientapviendecu FOREIGN KEY (matruyen) REFERENCES truyen (matruyen)
)


