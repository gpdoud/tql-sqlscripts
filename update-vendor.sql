create or alter procedure UpdateVendor
    @id int,
    @code varchar(30),
    @name varchar(30),
    @address varchar(30),
    @city varchar(30),
    @state varchar(2),
    @zip varchar(10),
    @phone varchar(12),
    @email varchar(255)
as
begin
    if not exists (select 1 from Vendors where Id = @id)
    begin
        print 'Vendor not found';
        return -1;
    end
    UPDATE Vendor Set 
        Code = @code,
        Name = @name,
        Address = @address,
        City = @city,
        State = @state,
        Zip = @zip,
        Phone = @phone,
        Email = @email
        Where Id = @id;
    return 0
end
go