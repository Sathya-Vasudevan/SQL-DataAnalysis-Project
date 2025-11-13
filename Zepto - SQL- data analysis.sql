drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightINGms INTEGER,
outOfStock BOOLEAN,
quantiy INTEGER
);


--data exploration

--count of rows 
select count(*) from zepto;

--sample data 
select * from zepto
limit 10;

--null values 
select * from zepto 
where name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOFStock IS NULL
OR
quantiy IS NULL;

--different product categoeies
select distinct category
from zepto
order by category;

--product in stock and out of stock 
select outOfStock,count(sku_id)
from zepto
group by outOfStock;

--product names present multiple times 
select name,count(sku_id) as "number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) DESC;

--data cleaning 

--products with price = 0
select * from zepto 
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto
where mrp=0;

--convert paise into rupees 
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp,discountedSellingPrice from zepto;



--Q1. Find the top 10 best value products based on the discount percentage. 
select distinct name,mrp,discountPercent
from zepto
order by discountPercent DESC
limit 10;

--Q2. What are the products with high MRP but out of stock.
select distinct name,mrp
from zepto
where outOfStock = TRUE and mrp > 300
order by mrp DESC;

--Q3. Calculate estimated revenue for each category.
select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

--Q4. Find all products where mrp is greater than 500 and discount is less than 10%.
select distinct name,mrp,discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp DESC,discountPercent DESC;

--Q5. Identify the top 10 categories offering the highest average discount percentage. 
select category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount DESC
limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value. 
select distinct name,weightInGms,discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >=100
order by price_per_gram;

--Q7. Group the products into categories like low,medium,bulk.
select distinct name,weightInGms,
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
	else 'Bulk'
	end as weight_category
from zepto;

--Q8. What is the total inventory weight per category.
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight DESC;
