create or alter procedure Fullname
	@firstname varchar(30),
	@lastname varchar(30)
as
begin
	select concat(@firstname, ' ', @lastname) 'Fullname';
end;
go

declare @fullname varchar(60);

exec @fullname = Fullname @firstname = 'Noah', @lastname = 'Phence';

print @fullname;