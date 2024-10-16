--mehsul
--satici
--alici
--filial
--marka
--model

create database KontaktHome

use KontaktHome

create table Filial(
	Id int identity primary key,
	filialAd nvarchar(50),
	filialNomre varchar(20),
	filialAdress nvarchar(max)
	)

create table Model(
	Id int identity primary key,
	modelAd nvarchar(40),
	markaId int foreign key references Marka(Id) on delete set null on update cascade
	)


create table Marka(
	Id int identity primary key,
	markaAd nvarchar(40)
	)


create table Reng(
	Id int identity primary key,
	rengAd nvarchar(15)
	)

create table Mehsul(
	Id int identity primary key,
	mehsulAd nvarchar(50),
	modelId int foreign key references Model(Id),
	mehsulAlisQiymet float,
	mehsulSatisQiymet float,
	rengId int foreign key references Reng(Id)
	mehsulStock int
	)


create table Satici(
	Id int identity primary key,
	saticiAd nvarchar(20),
	saticiSoyad nvarchar(20),
	saticiAtaAd nvarchar(20),
	saticiFinKod char(7),
	saticiMuqavileTarix date,
	filialId int foreign key references Filial(Id) on delete set null on update cascade,
	)


create table Alici(
	Id int identity primary key,
	AliciAd nvarchar(20),
	AliciSoyad nvarchar(20),
	AliciAtaAd nvarchar(20)
	)


create table Satis(
	Id int identity primary key,
	MehsulId int foreign key references Mehsul(Id),
	AliciId int foreign key references Alici(Id),
	SaticiId int foreign key references Satici(Id),
	SatisSay int,
	SatisTarix date,
	SatisEndirim float
	)