create or alter procedure FindUserByUsernameAndPassword
	@username varchar(30) = '',
	@password varchar(30) = ''
as
begin
	if @username = ''
	begin
		Print '@Username is required!'
		return 
	end;
	if @password <> ''
	begin
		SELECT *
			from Users	
				Where Username = @username AND Password = @password;
	end
	else
	begin
		SELECT *
			from Users	
				Where Username = @username;
	end
end;
go
exec FindUserByUsernameAndPassword 'sr', 'sr1';