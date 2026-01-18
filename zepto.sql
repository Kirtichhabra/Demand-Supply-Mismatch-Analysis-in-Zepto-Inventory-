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


# EDA 
  
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

9. update zepto 
set mrp = mrp/100.0 and discountedSellingPrice= discountedSellingPrice/100.0;

10. SELECT mrp, discountedSellingPrice FROM Zepto;


# BUSINEES PROBLEMS:

   Q1. Find the top 10 products based on discount percentage ? 
why we are doing it ? 
 High discount + low demand → maybe the product still isn’t selling → question effectiveness of the discount.

 High discount + high demand → product is hot → potential to boost sales further or stock more.

 Low discount + high demand → product is premium → maybe no need to discount.

 Proritize for Makething , Customer Behaviour 

  
  Query: select distinct name, mrp,  discountPercent from zepto order by discountPercentage desc limit 10 


Q2. How many products with high mrp and outofstock?
  
why we are doing it ? 

1. Premium Product Monitoring:

These are high-value products, so every unit counts for revenue.

Out-of-stock premium products can mean lost revenue opportunities.

2. Demand vs. Supply Check:

If demand is high but products are out of stock → need to restock quickly.

If demand is low (say < 10 units sold or requested), short stock isn’t critical.

3. Customer Experience Insight:

Premium customers may get frustrated if premium products are unavailable.

Can impact brand perception and loyalty.

4. Inventory & Supply Chain Optimization:

Helps prioritize procurement for expensive or high-demand items.

Avoid tying up capital in premium items that aren’t selling.

5. Sales & Marketing Decisions:

If premium products are rare and highly demanded, can create scarcity marketing → increase urgency and conversion.

If out-of-stock products have low demand, can reduce production or remove from catalog.


Query : WITH ranked_products AS (
    SELECT
        name,
        mrp,
        outofstock,
        RANK() OVER (ORDER BY mrp DESC) AS rn
    FROM zepto
    WHERE outofstock = TRUE
)
SELECT
    name,
    mrp
FROM ranked_products
WHERE rn = 1;


Q3. Guess the Estimated Revenue ? 
     
  Why Need this ? 
  - To focus on future products and product campaigns 

    Query: Select category , sum(discountedSellingPrice * availableQuantity) as Estimated_Revenue from zepto order by Estimated_Revenue group by category 

  
Q4. find the products where mrp>500 and discount is <10%? 

    Query: select distinct name from zepto where mrp>500 and discount<10% 

    Why we need this ?
    1. High MRP + low discount = high-margin products

    2. These products usually contribute more profit per unit

    3. Helps identify premium SKUs that are already selling without heavy discounting

Q5. find the top 5 category with highest average discount offerings. 

   Query: select category, AVG(discountPercent) as average_discount from zepto 
          group by category order by average_discount desc limit 5 

  Why we need this ?
      1. Which categories are hurting our margins the most?
      2. lower profitibility 
      3. overstocked 
      4. Helps check whether heavy discounts are actually:

         1. Increasing sales volume

         2. Improving conversion

Q6. find the prize per gram for the product with above 100g and sort the best value.

   Query : select distinct name , (mrp/weightInGms) as prize_per_product from zepto 
           where weightInGms >100

