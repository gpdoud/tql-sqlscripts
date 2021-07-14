/* Display orders, orderlines, and customer but don't display any PK or FK */

SELECT c.Name 'Customer', o.Description 'Order', ol.Description 'Product', ol.Quantity,
		ol.Price, ol.Quantity * ol.Price 'Line total'
	from Orders o
	join OrderLines ol
		on o.Id = ol.OrdersId
	join Customers c
		on o.CustomerId = c.Id
	order by c.Name