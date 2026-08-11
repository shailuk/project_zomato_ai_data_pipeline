USE ROLE ACCOUNTADMIN; 
USE DATABASE ZOMATO; 
USE SCHEMA RAW; 
USE WAREHOUSE ZOMATO_WH; 

LIST @ZOMATO_RAW_STAGE;

-- Load data into restaurant table
TRUNCATE TABLE RAW.restaurants; 
COPY INTO RAW.restaurants FROM @ZOMATO_RAW_STAGE/raw/restaurants/restaurant.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.restaurants LIMIT 10; 

-- Load data into user table 
TRUNCATE TABLE RAW.users; 
COPY INTO RAW.users FROM @ZOMATO_RAW_STAGE/raw/users/users.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.users LIMIT 10; 

-- Load data into food table 
TRUNCATE TABLE RAW.food; 
COPY INTO RAW.food FROM @ZOMATO_RAW_STAGE/raw/food/food.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.food LIMIT 10; 

-- Load data into menu table 
TRUNCATE TABLE RAW.menu; 
COPY INTO RAW.menu FROM @ZOMATO_RAW_STAGE/raw/menu/menu.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.menu LIMIT 10; 

-- Load data into orders table 
TRUNCATE TABLE RAW.orders; 
COPY INTO RAW.orders FROM @ZOMATO_RAW_STAGE/raw/orders/orders.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.orders LIMIT 10; 

-- Load data into order_items table 
TRUNCATE TABLE RAW.order_items; 
COPY INTO RAW.order_items FROM @ZOMATO_RAW_STAGE/raw/order_items/order_items.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.order_items LIMIT 10; 

-- Load data into reviews table 
TRUNCATE TABLE RAW.reviews; 
COPY INTO RAW.reviews FROM @ZOMATO_RAW_STAGE/raw/reviews/reviews.csv ON_ERROR = 'CONTINUE';
SELECT * FROM RAW.reviews LIMIT 10; 

