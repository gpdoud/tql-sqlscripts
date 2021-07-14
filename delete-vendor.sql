create or alter procedure DeleteVendor
    @id int = 0
as
begin
    if not exists (select 1 from Vendors where id = @id)
    begin
        print 'Vendor not found';
        return -1;
    end
    DELETE from Vendors
        where Id = @id;
    return 0;
end;