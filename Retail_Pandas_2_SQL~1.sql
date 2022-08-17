create table country_r
(country_id number(10) primary key,	
country_name varchar2(50));

create table state_r
(state_id number(10) primary key,	
state_name varchar2(50),
country_id number(10)references country_r(country_id));

create table city_type_r
(city_type_id number(10) primary key,	
city_type varchar2(50));

create table city_r
(city_id number(10) primary key,
city_name varchar2(50),	
city_type_id number(10)references city_type_r(city_type_id),	
state_id number(10)references state_r(state_id));

create table customer_type_r
(cust_type_id number(10) primary key,	
cust_type varchar2(50));

create table customer_r
(customer_id number(10) primary key,
customer_name varchar2(25),
customer_phone number(10),
customer_email varchar2(50),
customer_type_id number(10)references customer_type_r(cust_type_id),
city_id number(10)references city_r(city_id),
city_type_id number(10)references city_type_r(city_type_id),
crt_date timestamp);

create table shop_outlet_r
(shop_id number(10) primary key,	
shop_name varchar2(100),
city_id  number(10)references city_r(city_id),
crt_date timestamp);

create table department_r
(department_id number(10) primary key,
department_name varchar2(50),
shop_id number(10)references shop_outlet_r(shop_id));

create table employee_type_r
(employee_type_id number(10) primary key,	
employee_type_desc varchar2(50));

create table employee_r
(emp_id number(10) primary key,	
employee_name varchar2(50),	
employee_type_id number(10)references employee_type_r(employee_type_id),	
hire_date date,
salary number(15),
city_id	number(10)references city_r(city_id),
department_id number(10)references department_r(department_id),
crt_date timestamp);

create table product_manufacture_r
(manufacture_id	number(10) primary key,
manufacture_name varchar2(100),
manufacture_phone number(10),
city_id	number(10)references city_r(city_id));

create table product_cat_r
(product_cat_id	number(10) primary key,
product_cat_name varchar2(50));

create table product_sub_cat_r
(product_sub_cat_id number(10)primary key,
product_sub_cat_name varchar2(50),	
product_cat_id number(10)references product_cat_r(product_cat_id));

create table product_type_r
(product_type_id number(10) primary key,	
product_type_name varchar2(50));

create table product_r
(product_id	number(10) primary key,
product_name varchar2(50),	
product_type_id number(10)references product_type_r(product_type_id),
product_cat_id	number(10)references product_cat_r(product_cat_id),
product_sub_cat_id number(10)references product_sub_cat_r(product_sub_cat_id),
product_manufacture_id number(10)references product_manufacture_r(manufacture_id),
product_wholesale_price	number(15,3),
product_retail_price number(15,3),
product_cost number(15,3),
crt_date timestamp);

create table sales_transaction_r
(sales_transaction_id number(10) primary key,	
customer_id	number(10)references customer_r(customer_id),
shop_id	number(10)references shop_outlet_r(shop_id),
emp_id number(10)references employee_r(emp_id),	
product_wholesale_price	number(15,3),
product_retail_price number(15,3),
transaction_date_time timestamp,	
product_id number(10)references product_r(product_id),	
crt_date timestamp);

create table product_in_transaction_r
(product_id	number(10)references product_r(product_id),
sales_transaction_id number(10)references sales_transaction_r(sales_transaction_id) ,
quantity number(20));

create table transaction_r
(transaction_id	number(10) primary key,
transaction_type varchar2(50),	
crt_date timestamp);

create table payment_status_r
(payment_status_id number(10) primary key,	
payment_status_desc	varchar2(50));

create table payment_method_r
(payment_method_id number(10) primary key,	
payment_method_name	varchar2(50));

create table payment_r
(payment_id number(10) primary key,
payment_method_id number(10)references payment_method_r(payment_method_id),
payment_status_id number(10)references payment_status_r(payment_status_id),
transaction_id number(10)references transaction_r(transaction_id),	
crt_date timestamp);

COMMIT;

SELECT * FROM country_r;
SELECT * FROM state_r;
SELECT * FROM city_type_r;
SELECT * FROM city_r;
SELECT * FROM customer_type_r;
SELECT * FROM customer_r;
SELECT * FROM shop_outlet_r;
DROP TABLE shop_outlet_r;
TRUNCATE TABLE shop_outlet_r;
DELETE * FROM shop_outlet_r;
SELECT * FROM department_r;
SELECT * FROM employee_type_r;
DESC employee_r;
SELECT * FROM employee_r;
SELECT * FROM product_manufacture_r;
SELECT * FROM product_cat_r;
SELECT * FROM product_sub_cat_r;
SELECT * FROM product_type_r;
SELECT * FROM product_r;

SELECT * FROM product_in_transaction_r;
SELECT * FROM transaction_r;
SELECT * FROM payment_status_r;
SELECT * FROM payment_method_r;
SELECT * FROM payment_r;
DROP TABLE employee_r;