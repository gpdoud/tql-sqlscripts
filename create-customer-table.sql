create table Customer (
  Id int primary key identity(1,1),
  Code varchar(10) not null unique,
  Name varchar(30) not null,
  Sales decimal(9,2) not null default 0 check Sales >= 0,
  Active bit not null default 1,
  Created datetime not null default GETDATE()
);
