USE ROLE ACCOUNTADMIN; 
USE DATABASE ZOMATO; 
USE SCHEMA RAW; 

-- Create restaurants table 
CREATE OR REPLACE TABLE RAW.restaurants (
    _idx STRING, 
      id STRING, 
    name STRING, 
    city STRING, 
   rating STRING, 
   rating_count STRING, 
   cost STRING, 
   cuisine STRING, 
   lic_no STRING,
   link STRING, 
   address STRING, 
   menu STRING
);

-- Create users table 
CREATE OR REPLACE TABLE RAW.users (
_idx STRING, 
user_id STRING, 
name STRING,
email STRING,
password STRING,
age STRING,
gender STRING,
marital_status STRING,
occupation STRING,
monthly_income STRING,
educational_qualifications STRING,
family_size STRING
);

-- Create food table
CREATE OR REPLACE TABLE RAW.food  (
_idx STRING,
f_id STRING,
item STRING,
veg_or_non_veg STRING
);

-- Create menu table 
CREATE OR REPLACE TABLE RAW.menu(
 _idx STRING, 
 menu_id STRING,  
 r_id STRING, 
 f_id STRING, 
 cuisine STRING, 
 price STRING
); 

-- Create orders table 
CREATE OR REPLACE TABLE RAW.orders(
 order_id NUMBER, 
 order_timestamp TIMESTAMP_NTZ, 
 order_date DATE, 
 user_id NUMBER, 
 r_id NUMBER, 
 restaurant_city STRING, 
 cuisine STRING,
 items_count NUMBER, 
 sales_qty NUMBER, 
 subtotal NUMBER, 
 discount NUMBER, 
 delivery_fee NUMBER, 
 gst NUMBER, 
 sales_amount NUMBER, 
 currency STRING, 
 payment_menthod STRING, 
 order_status STRING, 
 customer_rating NUMBER, 
 delivery_time_min NUMBER
); 

-- Create order_items table 
CREATE OR REPLACE TABLE RAW.order_items(
 order_item_id NUMBER, 
 order_id NUMBER, 
 r_id NUMBER, 
 f_id STRING, 
 price NUMBER, 
 quantity NUMBER, 
 line_amount NUMBER
); 

--Create reviews table 
CREATE OR REPLACE TABLE RAW.reviews(
 review_id NUMBER, 
 order_id NUMBER, 
 user_id NUMBER, 
 restaurnat_id NUMBER, 
 rating NUMBER, 
 comment STRING, 
 review_date DATE
);
