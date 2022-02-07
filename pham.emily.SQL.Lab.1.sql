#1. Write a query to get Product name and quantity/unit.  
Select northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;

#2. Write a query to get current Product list (Product ID and name).  
Select northwind.products.id, northwind.products.product_name FROM northwind.products;

#3. Write a query to get discontinued Product list (Product ID and name). 
Select northwind.products.id, northwind.products.product_name FROM northwind.products WHERE northwind.products.discontinued = 1;

#4. Write a query to get most expense and least expensive Product list (name and unit price).
Select northwind.products.product_name, northwind.order_details.unit_price as 'most expensive unit price' FROM northwind.products, northwind.order_details WHERE northwind.order_details.unit_price = (Select max(northwind.order_details.unit_price) FROM northwind.order_details); 
Select northwind.products.product_name, northwind.order_details.unit_price as 'least expensive unit price' FROM northwind.products, northwind.order_details WHERE northwind.order_details.unit_price = (Select min(northwind.order_details.unit_price) FROM northwind.order_details); 

#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20. 
Select northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products, northwind.order_details WHERE northwind.order_details.unit_price < 20 AND northwind.products.discontinued = 0;

#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.  
Select northwind.products.id, northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products, northwind.order_details WHERE northwind.order_details.unit_price BETWEEN 15 AND 25;

#7. Write a query to get Product list (name, unit price) of above average price.  
Select northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products, northwind.order_details WHERE northwind.order_details.unit_price > (Select avg(northwind.order_details.unit_price) FROM northwind.order_details);

#8. Write a query to get Product list (name, unit price) of ten most expensive products.  
Select northwind.products.product_name, northwind.order_details.unit_price FROM northwind.products, northwind.order_details ORDER BY northwind.order_details.unit_price LIMIT 10;

#9. Write a query to count current and discontinued products. 
Select count(northwind.products.discontinued = 0) as continued, count(northwind.products.discontinued = 1) as discontinued FROM northwind.products;

#10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
Select northwind.products.product_name, northwind.order_details.quantity, northwind.inventory_transactions.quantity FROM northwind.products, northwind.orders, northwind.inventory_transactions WHERE northwind.order_details.quantity > northwind.inventory_transactions.quantity;
