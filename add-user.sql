create or alter procedure AddUser
	@username varchar(30) = '',
	@password varchar(30) = '',
	@firstname varchar(30) = '',
	@lastname varchar(30) = '',
	@phone varchar(12) = null,
	@email varchar(255) = null,
	@isreview bit = false,
	@isadmin bit  = false
as
begin
	if @username = '' or @password = '' or
		@firstname = '' or @lastname = ''
	begin
		print 'Required data is not provide!';
		return -1;
	end;
	if exists (SELECT 1 From Users where Username = @username)
	begin
		print 'Username already exists - select another!';
		return -2;
	end;
	INSERT into Users 
		(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
		values
		(@username, @password, @firstname, @lastname, @phone, @email, @isreview, @isadmin);
	return 0;
end
go
exec AddUser 'xx1', 'xx', 'xx', 'xx';

select * from users;