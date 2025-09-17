-- Exploring Data

select count(*) from walmart;

select * from walmart limit 10;

select distinct payment_method from walmart;

select 
	payment_method, 
	count(*) 
from walmart
group by payment_method;

select 
	count (distinct branch)
from walmart;

select max(quantity) from walmart;


-- Business Problems

-- 1. find different payment method and number of transactions, number of qty sold.
select
	payment_method,
	count(*) as no_payments,
	sum(quantity) as no_qty_sold
from walmart
group by payment_method;



-- 2. Identify the highest-rated category in each branch, displaying the branch, catrgory, avg rating.
select * 
from
	(select
		branch,
		category,
		avg(rating) as avg_rating,
		rank() over(partition by branch order by avg(rating) desc) as rank
	from walmart
	group by 1, 2
	)
where rank = 1;



-- 3. Identify the busiest day for each branch based on the number of transactions.
select 
	date,
	to_date(date, 'DD/MM/YY') as formated_date
from walmart;

select *
from 
	(select
		branch,
		to_char(to_date(date, 'DD/MM/YY'), 'Day') as day_name,
		count(*) as no_transactions,
		rank() over(partition by branch order by count(*) desc) as rank
	from walmart
	group by 1, 2
	)
where rank = 1;



-- 4. Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.
select
	payment_method,
	sum(quantity) as total_quantity
from walmart
group by payment_method;



-- 5. Determine the average, minimum and maximum rating of category for each city. 
-- List the city, average_rating, min_rating and max_rating.
select
	city,
	category,
	min(rating) as min_rating,
	max(rating) as max_rating,
	avg(rating) as avg_rating
from walmart
group by 1, 2;



-- 6. calculate the total profit for each category by considering total_profit as (unit_price * quantity * profit_margin). 
-- List the category and total_profit, ordered from highest to lowest profit.
select 
	category,
	sum(total) as total_revenue,
	sum(total * profit_margin) as total_profit
from walmart
group by 1;



-- 7. Determine the most common payment method for each branch. Display Branch and preffered_payment_method.
with cte
as
	(select
		branch,
		payment_method,
		count(*) as total_trans,
		rank() over (partition by branch order by count(*) desc) as rank
	from walmart
	group by 1, 2
	 )
select * from cte
where rank = 1;



-- 8. Categories sales into 3 group Morning, Afternoon, Evening.
-- Find out each of the shift and number of invoices.
select
	branch,
case
		when extract (hour from(time::time)) < 12 then 'Morning'
		when extract (hour from(time::time)) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end day_time,
	count(*)
from walmart
group by 1, 2
order by 1, 3 desc;


-- 9. Identify 5 branch with highest decrese ration in revenue compare to last year(current year is 2023 and last year is 2022)
		
--2022 sales
with revenue_2022
as
(
	select 
		branch,
		sum(total) as revenue
	from walmart
	where extract(year from to_date(date, 'DD/MM/YY')) = 2022
	group by 1
),
 -- 2023 sales
revenue_2023
as
(
	select 
		branch,
		sum(total) as revenue
	from walmart
	where extract(year from to_date(date, 'DD/MM/YY')) = 2023
	group by 1
)

select
	ls.branch,
	ls.revenue as last_yeat_revenue,
	cs.revenue as current_year_revenue,
	round(
		(ls.revenue - cs.revenue)::numeric/
		ls.revenue::numeric * 100, 
		2) as rev_dec_ration
from revenue_2022 as ls
join revenue_2023 as cs
on ls.branch = cs.branch
where 
	ls.revenue > cs.revenue
order by 4 desc
limit 5;



-- 10. Find the top 3 best-selling categories in each city (by revenue).
select *
from (
    select 
        city,
        category,
        sum(total) as total_revenue,
        rank() over(partition by city order by sum(total) desc) as rank
    from walmart
    group by 1, 2
) ranked
where rank <= 3
order by city, rank;



-- 11. Find the customer satisfaction score (avg rating) weighted by revenue for each category.
select
    category,
    round((sum(rating * total)::numeric / sum(total))::numeric, 2) as weighted_rating
from walmart
group by category
order by weighted_rating desc;


-- 12. Identify revenue contribution % of each branch to its city.
with city_sales as (
    select city, sum(total) as city_revenue
    from walmart
    group by city
),
branch_sales as (
    select branch, city, sum(total) as branch_revenue
    from walmart
    group by branch, city
)
select 
    b.city,
    b.branch,
    b.branch_revenue,
    round((b.branch_revenue::numeric / c.city_revenue:: numeric) * 100, 2) as contribution_percent
from branch_sales b
join city_sales c on b.city = c.city
order by contribution_percent desc;













