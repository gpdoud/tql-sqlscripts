create or alter procedure SelectAllUserSafe
as
begin
	SELECT Id, Username, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin
		from Users;
end
go
exec SelectAllUserSafe;