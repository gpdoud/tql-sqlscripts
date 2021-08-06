declare @nbr int = 3;
while 1=1 begin
	if @nbr % 9 = 0 begin
		set @nbr = @nbr + 3;
		continue;
	end
	print @nbr;
	set @nbr = @nbr + 3;
	if @nbr > 100 begin
		break;
	end;
end
print 'Done ..';