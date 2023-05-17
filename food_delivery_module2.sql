/*
Module: 2 Data Analysis using SQL(week – 2)
In this module, you will be working on performing data analysis on the pre-processed data from the previous module and conducting
Data Analysis using SQL. You will generate queries for given problem statements. 
*/

-- Task : 1 For a high-level overview of the hotels, provide us the top 5 most voted hotels in the delivery category.

select distinct name,votes,rating
from b6175983.zomato
where type = 'delivery'
order by votes desc limit 5

-- Task : 2 The rating of a hotel is a key identifier in determining a restaurant’s performance. Hence for a particular location called Banashankari find out the top 5 highly rated hotels in the delivery category.

select name,rating, location, type
from b6175983.zomato
where location = 'Banashankari'
and type = 'delivery'
order by rating desc limit 5;

-- Task : 3 Compare the ratings of the cheapest and most expensive hotels in Indiranagar.

select (select rating from b6175983.zomato where location = 'Indiranagar' order by approx_cost desc limit 1) as rating1,
(select rating from b6175983.zomato where location = 'Indiranagar' order by approx_cost asc limit 1) as rating2
from b6175983.zomato
limit 1;

-- Task : 4 Online ordering of food has exponentially increased over time. Compare the total votes of restaurants that provide online 
-- ordering services and those that don’t provide online ordering services.

select
sum(votes) as total_votes,online_order
from b6175983.zomato
group by online_order;

-- Task : 5 Number of votes defines how much the customers are involved with the service provided by the restaurants For each Restaurant type,
--  find out the number of restaurants, total votes, and average rating. Display the data with the highest votes on the top( if the first row of output is NA display the remaining rows).

select type,count(id) as number_of_restaurants,sum(votes) as  total_votes,avg(rating) as avg_rating
from b6175983.zomato
group by type
having type NOT IN('NA')
order by total_votes desc

-- Task : 6 What is the most liked dish of the most-voted restaurant on Zomato(as the restaurant has a tie-up with Zomato, the restaurant 
-- compulsorily provides online ordering and delivery facilities.



select name,dish_liked,rating,votes from zomato
where type = "Delivery" and online_order = "Yes"
order by rating desc,votes desc
limit 1

-- Task : 7 To increase the maximum profit, Zomato is in need to expand its business. For doing so Zomato wants the list of the top 15 restaurants which have min 150 votes, have a rating greater than 3, and is currently not providing online ordering. Display the restaurants with the highest votes on the top.

select name,rating,votes,online_order 
from zomato 
where rating>3 and votes>150 and online_order="No" 
order by votes desc limit 15;
