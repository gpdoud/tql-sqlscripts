create or alter procedure UpdateUser
	@id int = 0,
	@username varchar(30),
	@password varchar(30),
	@firstname varchar(30),
	@lastname varchar(30),
	@phone varchar(12),
	@email varchar(255),
	@isreview bit,
	@isadmin bit
as
begin
	if not exists (SELECT 1 From Users where Id = @id)
	begin
		print 'User not found';
		return -2;
	end;
	UPDATE Users Set
		Username = @username,
		Password = @password,
		Firstname = @firstname,
		Lastname = @lastname,
		Phone = @phone,
		Email = @email,
		IsReviewer = @isreview,
		IsAdmin = @isadmin
		Where Id = @id;
	return 0;
end;
go
exec UpdateUser 4, 'sa', 'xx', 'xx', 'xx', '911', 'xx@gmail.com', 1, 1;

select * from users;