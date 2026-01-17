create table zepto(
  sku_id PRIMARY KEY, 
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL, 
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8, 2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
  );

-- BASIC SYNTAX FOR INSERTING THE DATA INTO A TABLE (INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);
 * To check if data is inserted or not *
   
1. Select count(*) from zepto;

2. Select * from zepto LIMIT 10;

3. SELECT * from zepto where name IS NULL 
OR category IS NULL 
OR mrp IS NULL 
OR discountPercent IS NULL 
OR availableQuantity IS NULL 
OR discountedSellingPrice IS NULL 
OR weightInGms IS NULL 
OR outOfStock IS NULL 
OR quantity IS NULL ;

4. SELECT DISTINCT category from zepto order by category;

5. SELECT outOfStock, count(sku_id) from zepto 
group by outOfStock ;

6. select name, count(sku_id) as 
"number_of_skus" from  zepto 
  where count(sku_id)  >= 1 
  group by name order by name ;

7. select* from zepto where mrp=0 or  discountedSellingPrice = 0 
order by name ;

8. delete from zepto where mrp=0 or discountedSellingPrice= 0 



