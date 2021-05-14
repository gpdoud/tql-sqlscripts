use master;
drop table if exists PrsDb;
create table PrsDb;
go
use PrsDb;
-- create tables
CREATE TABLE Users (
    Id int primary key identity(1,1),
    Username varchar(30) not null unique,
    Password varchar(30) not null,
    Firstname varchar(30) not null,
    Lastname varchar(30) not null,
    Phone varchar(12) null,
    Email varchar(255) null,
    IsReviewer bit not null default 0,
    IsAdmin bit not null default 0
);
CREATE TABLE Vendors (
    Id int primary key identity(1,1),
    Code varchar(30) not null unique,
    Name varchar(30) not null,
    Address varchar(30) not null,
    City varchar(30) not null,
    State char(2) not null,
    Zip varchar(5) not null,
    Phone varchar(12) null,
    Email varchar(255) null,
);
CREATE TABLE Products (
    Id int primary key identity(1,1),
    PartNbr varchar(30) not null unique,
    Name varchar(30) not null,
    Price decimal(11,2) not null default 10.0,
    Unit varchar(30) not null default 'Each',
    PhotoPath varchar(255) null,
    VendorId int not null foreign key references Vendors(Id)
);
CREATE TABLE Requests (
    Id int primary key identity(1,1),
    Description varchar(80) not null,
    Justification varchar(80) not null,
    RejectionReason varchar(80) null,
    DeliveryMode varchar(20) not null default 'Pickup',
    Status varchar(10) not null default 'NEW',
    Total decimal(11,2) not null default 0,
    UserId int not null foreign key references Users(Id)
);
CREATE TABLE Requestlines (
    Id int primary key identity(1,1),
    RequestId int not null foreign key references Requests(Id),
    ProductId int not null foreign key references Products(Id),
    Quantity int not null default 1
);
go
-- Create the data