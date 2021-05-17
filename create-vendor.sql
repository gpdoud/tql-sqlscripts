create or alter procedure AddVendor
    @code varchar(30) = null,
    @name varchar(30) = null,
    @address varchar(30) = null,
    @city varchar(30) = null,
    @state varchar(2) = null,
    @zip varchar(10) = null,
    @phone varchar(12) = null,
    @email varchar(255) = null
as
begin
    if exists (select 1 from Vendors where Code = @code)
    begin
        print 'Vendor code already exists';
        return -1;
    end
    INSERT into Vendor (Code, Name, Address, City, State, Zip, Phone, Email)
        values (@code, @name, @address, @city, @state, @zip, @phone, @email);
    return 0
end
go
