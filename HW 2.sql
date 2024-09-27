-- DB Assignmnet 2
-- Christina DiMaggio
-- September 26 2024



use examples;

-- 1. Average Price of Foods at Each Restaurant
		-- restaurants to join with food and serves 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the restaurants 
        -- need the price of the food 
        -- need to know what food is served in restaurants
    
select restaurants.name as restaurant_name, avg(foods.price) as avg_food_price 	-- alias for restaurants.name and avg(foods.price)
from restaurants 																-- universal set
     inner join serves on restaurants.restID = serves.restID
     inner join foods on serves.foodID = foods.foodID
group by restaurant_name; 														--  way to summerize value and findings
																				-- looking for aggregate needs grouping


-- 2. Maximum Food Price at Each Restaurant
	-- restaurants to join with food and serves 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the restaurants 
        -- need the maximum price of the food 
        -- need to know what food is served in restaurants
    
select restaurants.name as restaurant_name, max(foods.price) as max_food_price 	-- alias for restaurants.name and max(foods.price)
from restaurants 																-- universal set
     inner join serves on restaurants.restID = serves.restID
     inner join foods on serves.foodID = foods.foodID
group by restaurant_name; 														--  way to summerize value and findings
																				-- looking for aggregate needs grouping


-- 3. Count of Different Food Types Served at Each Restaurant
	-- restaurants to join with food and serves 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the restaurants 
        -- need types of the food (COUNT, how many?)
        -- need to know what food is served in restaurants

select restaurants.name as restaurants_name, count(foods.type) as food_types 	-- alias for restaurants.name and count(foods.type)
from restaurants 																-- universal set
     inner join serves on restaurants.restID = serves.restID
     inner join foods on serves.foodID = foods.foodID
group by restaurants_name; 														--  way to summerize value and findings
																				-- looking for aggregate needs grouping


-- 4. Average Price of Foods Served by Each Chef
	-- chefs to join with works, restaurants, serves, foods 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the chefs and what restuarant they work at
        -- need to know types of the food served at the restaurants 
        -- need to be able to calculate average price of foods
select chefs.name as chef_name, avg(foods.price) as average_price 				-- alias for chefs.name and avg(foods.price)
from chefs 																		-- universal set
inner join works on chefs.chefID = works.chefID
inner join restaurants on works.restID = restaurants.restID
inner join serves on restaurants.restID = serves.restID
inner join foods on serves.foodID = foods.foodID
group by chef_name; 															--  way to summerize value and findings
																				-- looking for aggregate needs grouping
    
    
-- 5. Find the Restaurant with the Highest Average Food Price 
		-- restaurants to join with food and serves 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the restaurants 
        -- need the price of the food 
        -- need to know what food is served in restaurants

select restaurants.name as restaurant_name, avg(foods.price) as avg_food_price	-- alias for chefs.name and count(foods.type)
from restaurants 																-- universal set
     inner join serves on restaurants.restID = serves.restID
     inner join foods on serves.foodID = foods.foodID
group by restaurants.name 														--  way to summerize value and findings
																				-- looking for aggregate needs grouping
order by avg_food_price desc -- ** running up to this line you run at this line you will see three are tied for highest average food price 			
limit 3; 																		-- this is a special case where we can limit to three 
																				-- from the line 'order...' it is know that La Trattoria, Bistro Paris, and Indian Spice 
                                                                                -- all have the highest average food price
                                                                                -- thus why we limit to 3 
                                                                                -- only showing these restaurants in a tied for highest average food prices.


-- 6. Extra Credit: Which chef has the highest average price of the foods served at the restaurants where they work?
	-- chefs to join with works, restaurants, serves, foods 
			-- chain broken if there is no link with primary keys, everything has to be conneceted
					-- serves has foreign keys 
        -- need names of the chefs and what restuarant they work at
        -- need to know types of the food served at the restaurants 
        -- need to be able to calculate average price of foods

select restaurants.name as restaurant_name, chefs.name as chef_name, avg(foods.price) as average_price 	-- alias for restaurants.name, chefs.name and avg(foods.price)
from chefs																								-- universal set
inner join works on chefs.chefID = works.chefID
inner join restaurants on works.restID = restaurants.restID
inner join serves on restaurants.restID = serves.restID
inner join foods on serves.foodID = foods.foodID
group by chef_name, restaurant_name 																	--  way to summerize value and findings
																										-- looking for aggregate needs grouping
order by average_price desc;																			