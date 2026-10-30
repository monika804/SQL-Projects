use pizzahut;

-- BASIC QUESTIONS TO PERFORM

-- 1) Retrieve the total number of orders placed
SELECT 
     COUNT(order_id) AS total_number_of_orders
 FROM
     orders;

-- 2) Calculate the total revenue generated from pizza sales
 SELECT 
    SUM(orders_details.quantity * pizzas.price) AS Total_revenue
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id;

-- 3) Identify the highest-priced pizza
 SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4) Identify the most common pizza size ordered
  SELECT 
    pizzas.size,
    COUNT(orders_details.orders_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;


-- 5)List the top 5 most ordered pizza types along with their quantities
 SELECT 
    pizza_types.name,
    SUM(orders_details.quantity) AS total_quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_types_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC
LIMIT 5;


-- INTERMIDIATE QUESTIONS TO PERFORM:

 -- 1) Join the necessary tables to find the total quantity of each pizza category ordered.
 SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_types_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- 2) Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time);

-- 3) Join relevant tables to find the category-wise distribution of pizzas
 select category, count(name) from pizza_types
 group by category 
 
-- 4) Join relevant tables to find the category-wise distribution of pizzas.
 SELECT 
    AVG(quantity)
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;

-- 5) Determine the top 3 most ordered pizza types based on revenue.
 SELECT 
    pizza_types.name,
    SUM(orders_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- 6) Calculate the percentage contribution of each pizza type to total revenue. 
SELECT 
    pizza_types.category,
    SUM(orders_details.quantity * pizza_price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

 




 
 
