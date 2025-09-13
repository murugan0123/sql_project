create database sql_project;
use sql_project;

create table orders(
     order_id INT PRIMARY KEY,
     customer_id INT NOT NULL,
     product_id INT NOT NULL,
     order_date DATE NOT NULL,
     quantity INT NOT NULL,
     unit_price double NOT NULL,
     totel_price double NOT NULL,	 
     shipping_address VARCHAR(255)NOT NULL,
     shipping_city VARCHAR(100)NOT NULL,
     shipping_state VARCHAR(100)NOT NULL,
     shipping_zip VARCHAR(10)NOT NULL,
     payment_method VARCHAR(50) NOT NULL,
     order_status VARCHAR(50) NOT NULL DEFAULT "xyz",
     shipping_cost int DEFAULT 0.00,
     tracking_number VARCHAR(50) DEFAULT NULL);
     


# DML - DATA MANIPULATION LANGUAGE :

# 1.How do you insert a new order into the orders table ?;
insert into orders values(11,21,31,"2024-12-10",3,50,150,"2/88 middle street kizhumathur","perambalur","tamil nadu","621717","credit card","pending","5.00","1Z23456789");
insert into orders values(12,22,32,"2024-07-01",2,25.50,51,"1/22 north street korakkai","cuddalore","tamil nadu","721717","debit card","processing","7.00","AB45678901");
insert into orders values(13,23,33,"2024-01-23",5,100,500,"123 main road","coimbatore","tamil nadu","341217","cash","pending","10","12AS990654");
insert into orders values(14,24,34,"2025-01-12",1,50,50,"23 MS mall","bengalore","karnataka","542901","goole pay","cancelled","4.50","M120987345");
insert into orders values(15,25,35,"2025-07-10",7,10,70,"89 MR nagar silk board","bangalore","karnataka","890217","debit card","shipping","1.00","M092387192");
insert into orders values(16,25,36,"2023-12-23",2,100,200,"209 anna salai","chennai","tamil nadu","921717","credit card","delivered","50","AL54456789");
insert into orders values(17,26,36,"2024-03-20",1,609,609,"902 billar6 iblur","bangalore","karnataka","884517","cash","pending","7.00","7O2387192M");
insert into orders values(18,27,37,"2023-09-30",4,30,120,"23/3 btm","bangalore","karnataka","510217","cash","shipping","1.00","M092387192");
insert into orders values(19,28,38,"2025-10-27",6,100,600,"20 west street","perambalur","tamil nadu","671717","debit card","delivered","4.00","BHF4456789");
insert into orders values(111,210,310,"2024-05-23",9,109,981," 36 bK street","trichy","tamil nadu","791717","paytm","shipping","30","NL54456789");


# 2.How do you insert multiple rows (orders) into the orders table at once?
insert into orders (order_id,customer_id,product_id,order_date,quantity,unit_price,totel_price,shipping_address,shipping_city,    shipping_state,shipping_zip,payment_method,order_status,shipping_cost,tracking_number) values(112,210,310,"2025-03-30",2,50,100,"34 lk nagar","suncity","hydrabath","210217","debit card","processing","6.00","ER72387192"),(113,211,311,"2022-03-17",10,50,500,"66 mk road","city of bar","hydrabath","610217","credit card","cancelled","4.00","QR72387192"),(114,212,313,"2025-08-30",3,60,180,"jj nagar 2","north chennai","tamil nadu","810217","cash","shipping","10.00","V78T823064"),(115,214,314,"2024-06-20",5,50,250,"2/46 kk nagar","chennai","tamil nadu","540217","gpay","processing","7.00","UI72387192"),(116,215,316,"2024-02-15",1,500,500,"2 rajaji nagar","bangalore","karnataka","680217","debit card","delivered","3.00","QA35878192");


# 3.How do you update the order status to "Shipped" for a specific order_id?
 update orders set order_status="shipped" where order_id=11;
  
# 4.How do you update the shipping address of an order by its order_id?
 update orders set shipping_address="velachery road" where order_id=14;

# 5.How do you update the quantity of a product in an existing order in the order_items table?
 update orders set quantity=5 where product_id=35;
 
# 6.How do you delete an order from the orders table based on order_id?
 delete from orders where order_id=15;
 
# 7.How do you delete all orders placed by a specific customer?
 delete from orders where customer_id=37;
 
# 8.How do you update the total price of an order after applying a discount?
 update orders set totel_price = totel_price * 0.5 where order_id=11;

# 9.How do you change the payment method of a specific order?
update orders set payment_method="cash" where order_id=16;

# 10.How do you insert a new product into the order_items table for an existing order?
create table orders_items(
item_id int,
order_id int,
product_id int,
quantity double,
unit_price decimal);
insert into orders_items values(201,101,301,3,45.50);
insert into orders_items values(202,102,302,1,60);
insert into orders_items values(201,103,303,2,70.8);
insert into orders_items values(203,104,303,2,50.50);
insert into orders_items values(205,105,305,6,240);

# 11.How do you remove a product from an existing order in the order_items table without deleting the order?
delete from orders_items where order_id=105 and product_id=305;

# 12.How do you update multiple orders to the status "Delivered" based on the shipping date?
 update orders set order_status="Deliverd" where order_status="shipping"and order_date<"2025-01-01";
 
 # 13.How do you update all orders with a status of "Pending" that are older than 30 days to "Cancelled"?
 update orders set order_status="Cancelled" where order_status="pending"and order_date< CURDATE() - INTERVAL 30 DAY;
 
 # 14.How do you insert a new order with multiple products into the order_items table?
 insert into orders_items (item_id , order_id , product_id , quantity ,unit_price ) 
 values(205,105,305,6,240),(206,106,306,4,80.8);

# 15.How do you delete all orders that have been marked as "Cancelled"?
delete from orders where order_status="cancelled";



# DQL - DATA QUERY LANGUAGE :

# 1.How do you retrieve all orders from the orders table?
 select*from orders;
 
# 2.How do you retrieve all orders placed by a specific customer using their customer_id?
  select*from orders where customer_id=27;
 
# 3.How do you find the details of an order using its order_id?
  select*from orders where order_id=11;
  
# 4.How do you list all products in an order using order_id?
  select*from orders where order_id;
 
# 5.How do you find all orders with the status "Pending"?
  select*from  orders where order_status="pending";
 
# 6.How do you get the total price of all orders for a particular customer?
  select sum(totel_price) as totel_price from orders where customer_id=210;
  
# 7.How do you retrieve the most recent order placed by a customer?
  select*from orders where customer_id order by order_date desc limit 1;
 
# 8.How do you list all orders placed within the last 30 days?
  select*from orders where order_date >= "2025-04-22" - interval 30 day;
 
# 9.How do you find the number of orders placed by each customer?
  select customer_id,count(*) as count_order from orders group by customer_id;
  
# 10.How do you retrieve orders that have a total price greater than $100?
  select*from orders where totel_price>100;
  
# 11.How do you find all orders shipped to a specific city?
  select*from orders where order_status="shipped";
  
# 12.How do you find the orders that have been shipped but not yet delivered?
  select*from orders where order_status="shipped" and order_status!="delivered";

# 13.How do you get a list of orders that were placed today?
  select*from orders where order_date="2024-07-01";
  
# 14.How do you list all orders that include a specific product by product_id?
   select*from orders where product_id=310;

# 15.How do you find the most expensive order placed by any customer?
  select*from orders where totel_price order by totel_price desc limit 1;
  
  
  
#.DDL - DATA DEFINITION LANGUAGE :

# 1.How do you create an orders table with columns for order_id, customer_id, order_date, total_price, and status?
 Create table orders(
 order_id int primary key,
 customer_id int not null,
 order_date date not null, 
 totel_price decimal not null, 
 order_status varchar(30),
 shipping_city varchar(30));

# 2.How do you create an order_items table with columns for item_id, order_id, product_id, quantity, and unit_price?
 create table order_items(
 item_id int not null , 
 order_id int not null, 
 product_id int not null, 
 quantity double, 
 unit_price decimal );

# 3.How do you add a column shipping_cost to the orders table?
 alter table orders add column shipping_cost double default 0.00;
 
# 4.How do you add a foreign key in the order_items table that references the orders table on order_id?
 alter table order_items add constraint fk foreign key (order_id) references orders (order_id);
 
# 5.How do you modify the total_price column in the orders table to allow for two decimal places?
 alter table orders modify column totel_price decimal(20,4);
 
# 6.How do you drop the order_items table from the database?
 drop table order_items;
 
# 7.How do you rename the orders table to customer_orders?
 alter table orders rename to customer_orders;

# 8.How do you create a primary key on the order_id column of the orders table?
 alter table orders add primary key (order_id);
 
# 9.How do you create a unique constraint on the tracking_number column of the orders table?
 alter table orders add column tracking_number int; 
 alter table orders add constraint ui unique (tracking_number);
 
# 10.How do you drop a column shipping_cost from the orders table?
 alter table orders drop column shipping_cost;

# 11.How do you create an index on the customer_id column in the orders table?
 alter table orders add column customer_id int;
 
# 12.How do you create a composite primary key on the order_id and product_id columns in the order_items table?
 alter table order_items add constraint pk primary key (order_id,product_id);
 
# 13.How do you change the data type of the status column in the orders table to VARCHAR(50)?
 alter table orders modify column order_status varchar(50);
 
# 14.How do you rename the order_date column in the orders table to date_placed?
 alter table orders rename column order_date to date_placed;

# 15.How do you create a customers table with columns customer_id, first_name, last_name, and email?
create table customers (
customer_id int primary key not null, 
first_name varchar(30) not null, 
last_name varchar(30) not null,
email varchar(30) not  null);



# JOINS QUESTIONS (DQL) :

# 1.How do you retrieve all orders with their associated customer details using an INNER JOIN?
select order_id,order_date,totel_price,order_status,shipping_city,first_name,last_name,email 
from orders inner join customers on orders.customer_id=customers.customer_id;

# 2.How do you find all order items and their associated products using an INNER JOIN?
  select item_id,order_id,quantity,unit_price,product_name,product_price
  from order_items inner join products on order_items.product_id=products.product_id;

# 3.How do you get a list of all customers who have placed orders using an INNER JOIN?
  select distinct customers.*
  from customers inner join orders on customers.customer_id = orders.customer_id;

# 4.How do you find the total price of all orders along with the customer name using an INNER JOIN?
  select first_name , last_name , sum(totel_price) as totel_price
  from  orders inner join customers on orders.customer_id=customers.customer_id
  group by customers.customer_id;



# 5.How do you list all orders along with their shipping details using an INNER JOIN?
  select orders.*,shipping_details.* from orders inner join shipping_details 
  on orders.order_id=shipping_details.order_id;

# 6.How do you find all orders that have been shipped and their respective tracking numbers using an INNER JOIN?
  select orders.order_id, shipping_details.tracking_number 
  from orders inner join shipping_details on orders.order_id=shipping_details.order_id
  where order_status="shipped";

# 7.How do you retrieve all orders that have associated payments using an INNER JOIN?
  select orders.*,payments.* 
  from orders inner join payments on orders.order_id=payments.order_id;
 
# 8.How do you find all customers who ordered a specific product using an INNER JOIN?
  select customers.*,products.product_name 
  from customers inner join products on customers.customer_id=products.customer_id
  where products.product_name="t-shirts";

# 9.How do you list all orders along with the details of the associated order items using an INNER JOIN?
  select orders.*,order_items.* 
  from orders inner join order_items on orders.order_id=order_items.order_id;

# 10.How do you get the customer details for orders placed in the last 30 days using an INNER JOIN?
  select customers.*,orders.* 
  from orders inner join customers on customers.customer_id=orders.customer_id
  where orders.order_date>=curdate()-interval 30 day;

# 11.How do you find the order totals grouped by customer using an INNER JOIN?
  select customers.*,count(order_id) as totel_order
  from orders inner join customers on orders.customer_id=customers.customer_id
  group by  customers.customer_id;
  
# 12.How do you retrieve orders with products that are currently in stock using an INNER JOIN?
  select orders.order_id, orders.order_date, order_items.product_id, products.product_name, order_items.quantity
  from orders inner join order_items on orders.order_id = order_items.order_id 
  inner join products on order_items.product_id = product.product_id
  where product.stock_quantity > 0;

# 13.How do you list all orders and their associated discount information using an INNER JOIN?
  select orders.order_id, orders.order_date, order_items.product_id, products.product_name, order_items.quantity,   
  order_items.unit_price, discounts.discount_amount 
  from orders inner join order_items on orders.order_id = order_items.order_id
  inner join products on order_items.product_id = products.product_id;

# 14.How do you find all orders and their respective sales representatives using an INNER JOIN?
  select orders.*, sales_representatives.rep_id, sales_representatives.rep_name
  from orders inner join sales_representatives on orders.rep_id = sales_representatives.rep_id;

# 15.How do you get the order details for customers who have an active status using an INNER JOIN?
  select orders.*,customers.*
  from orders inner join customers  on orders.customer_id = customers.customer_id
  where customers.status = 'active';

# 16.How do you find all orders and their payment methods using an INNER JOIN?
  select orders.* ,payments.payment_method
  from orders inner join payments  on orders.order_id = payments.order_id;

# 17.How do you retrieve the list of customers who have placed multiple orders using an INNER JOIN?
  select customers.*, count(orders.order_id) as order_count
  from customers inner join orders on customers.customer_id = orders.customer_id
  group by customers.customer_id having count(orders.order_id) > 1;

# 18.How do you get a list of all orders placed by customers from a specific country using an INNER JOIN?
  select orders.*, customers.*
  from orders inner join customers on orders.customer_id = customers.customer_id
  where customers.country ="india"; 

# 19.How do you find all products ordered by a specific customer using an INNER JOIN?
  select order_items.*, products.product_name
  from order_items inner join products  on order_items.product_id = products.product_id 
  inner join orders on order_items.order_id = orders.order_id
  where orders.customer_id = 22;  

# 20.How do you retrieve all orders and their associated shipping addresses using an INNER JOIN?
  select orders.* from orders 
  inner join customers on orders.customer_id = customers.customer_id;

# 21.How do you get all orders where the customer has a specific loyalty program status using an INNER JOIN?
  select orders.*,customers.*
  from orders inner join customers on orders.customer_id = customers.customer_id
  where customers.loyalty_status ="Gold";

# 22.How do you list orders and their associated customer feedback using an INNER JOIN?
  select orders.order_id, orders.order_date, customer_feedback.feedback_id, customer_feedback.feedback_text
  from orders inner join customer_feedback on orders.order_id = customer_feedback.order_id;

# 23.How do you find all orders that were placed during a specific promotion using an INNER JOIN?
  select orders.order_id, orders.order_date, orders.total_price, promotions.promotion_name
  from orders inner join promotions on orders.promotion_id = promotions.promotion_id
  where promotions.promotion_name ="Holiday Sale";

# 24.How do you retrieve all orders, including their creation timestamps, using an INNER JOIN?
  select orders.*
  from orders inner join customers on orders.customer_id = customers.customer_id;

# 25.How do you list all orders along with the details of any associated returns using an INNER JOIN?
  select orders.order_id, orders.order_date, returns.*
  from orders inner join returns on orders.order_id = returns.order_id;



# SUBQUERY QUESTIONS :

# 1.How do you retrieve all orders for customers whose IDs are greater than 100?
  select*from orders where customer_id > 100;

# 2.How do you find all products that have been ordered more than 5 times?
  select product_id from order_items group by product_id having count(*)>5;

# 3.How do you get the total amount spent by each customer who has placed an order?
  select customer_id , sum(totel_price) as totel_price from orders group by customer_id;

# 4.How do you list the names of customers who have not placed any orders?
  select customer_name from customers where customer_id not in ( select customer_id from orders);

# 5.How do you find all orders placed in the last 30 days?
  select * from orders where order_date >= curdate()-intervel - 30day ;

# 6.How do you retrieve all order items for orders that have a total price greater than $100?
  select * from order_items where order_id = ( select * from orders where totel_price <100);

# 7.How do you get the names of customers who have ordered a specific product (e.g., 'Product A')?
  select customer_name from customers where product_name = ( select * from products where product="shoes");

# 8.How do you find the maximum price of products in orders made by customers from a specific country?
  select max(product_price) from products where customer_country = 
  ( select * from orders where customer_country="india");

# 9.How do you list all orders along with their order items where the item quantity is greater than the average quantity?
  select * from orders where item_quality = 
  ( select * from order_items where item_quality < avg(item_quality));

# 10.How do you retrieve customers who have placed more than one order?
  select customer_id, customer_name from customers where customer_id =
  ( select customer_id from orders group by  customer_id having count(order_id) > 1);



 # CORRELATED SUBQUERIES QUESTIONS :

# 11.How do you find customers whose total orders exceed the average order value?
  select customer_id from orders group by customer_id having sum(total_price) > 
  (select avg(total_price) from orders);

# 12.How do you retrieve products that have been ordered more than the average number of times?
  select product_id from orders group by product_id having count(*) > 
  (select avg(order_count) from (select count(*)  FROM orders GROUP BY product_id));

# 13.How do you list orders for customers who have placed orders greater than the customer’s average order value?
  select * from orders where total_price > (select avg(total_price) from orders where customer_id = orders.customer_id);

# 14.How do you get all orders that exceed the total price of the customers last order?
  select * from orders where total_price > (select avg(total_price) from orders 
  where customer_id = orders.customer_id order by order_date desc limit 1);

# 15.How do you find customers who have ordered products that are not currently in stock?
  select distinct orders.customer_id from orders join products on orders.product_id = products.product_id
  where products.stock_quantity = 0;

# 16.How do you retrieve all orders for customers with a total order amount higher than the average for all customers?
  select orders.order_id, orders.customer_id, orders.total_price from orders where orders.customer_id in (
  select orders.customer_id from orders group by orders.customer_id having sum(orders.total_price) > (
  select avg(total_price) from orders));

# 17.How do you find products whose price is above the average price of products in the same category?
  select products.product_id from products where products.unit_price > ( select avg(unit_price)
  from products where category_id = products.category_id);

# 18.How do you list all customers who have made purchases in the same month as a specific order?
  select * from customers where ( select *from orders where orders.customer_id 
    and extract(month from orders.order_date) = extract(month from "2024-12-01" ::dte)
    and extract(year from orders.order_date) = extract(year from "2024-12-01"::date));

# 19.How do you find orders for customers who have spent more than the average across all orders?
  select orders.order_id, orders.customer_id, orders.total_price from orders where orders.total_price > (
  select(orders.total_price) from orders );

# 20.How do you retrieve all order items where the price is higher than the average price of items in that order?
  select order_items.order_id, order_items.product_id, oi.price from order_items where order_items.price > (
  select avg(order_items.price) from order_items where order_items.order_id = order_items.order_id);



# SUBQUERIES WITH IN OPERATOR :

# 21.How do you find all orders that have been placed by customers from a specific city?
  select * from orders where customer_id in ( select customer_id from customers where city = "Specific City");

# 22.How do you retrieve products that are part of orders placed in the last month?
  select * from products where product_id in ( select product_id from order_items where order_id in (
  select order_id from orders where order_date >= date_sub(current_date(), interval 1 month)));

# 23.How do you get the names of customers who have purchased any product from a specific category?
  select customer_name from customers where customer_id in (select customer_id from orders where order_id in (
  select order_id from order_items where product_id in (select product_id from products where category_id = "123")));

# 24.How do you find orders where the total price is greater than the average total price of all orders?
  select * from orders where total_price > (select avg(total_price) from orders);

# 25.How do you list all products that are part of orders with a specific shipping method?
select product_id from order_items where order_id in (select order_id from orders
where shipping_method = "transport");

# 26.How do you retrieve customers whose IDs are in the list of customers who have placed orders?
  select * from customers where customer_id in (select customer_id from orders);

# 27.How do you find products that have been ordered at least once by customers from a specific country?
  select distinct product_id from order_items where customer_id in (select customer_id from customers
  where country =" india");

# 28.How do you get the total orders placed by customers who have ordered a specific product?
  select customer_id, count(*) as total_order from orders where customer_id in (select customer_id from order_items
  where product_id = 'Specific Product') group by customer_id;

# 29.How do you retrieve all orders made by customers whose last order was over a year ago?
  select * from orders where customer_id in (select customer_id from orders where order_date < date_sub(curdate(), 
  interval 1 year) group by customer_id having max(order_date) < date_sub(curdate(), interval 1 year));

# 30.How do you find customers who have placed orders in multiple states?
  select customer_id from orders where state in (select distinct state from orders where 
  customer_id = orders.customer_id)group by customer_id having count(distinct state) > 1;

