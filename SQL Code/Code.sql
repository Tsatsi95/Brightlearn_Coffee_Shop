---Testing--
SELECT * FROM bright_coffee_shop_analysis;

--
SELECT transaction_id, 
transaction_date, transaction_time, 
transaction_qty, 
store_id, 
store_location, 
product_id, 
unit_price, 
product_category, 
product_type, 
product_detail,

--Add columns for enhance financial insights
---New column 1
dayname(transaction_date) AS day_name,
---New column 2 Month
Monthname(transaction_date) AS month_name,
---New column 3 Day
DayofMonth(transaction_date) AS day_of_month,
---New column 4 Time bucket
CASE
WHEN dayname(transaction_date) IN ('Sun', 'Sat') THEN 'Weekend'
ELSE 'Weekday'
END AS Day_classification,
---New column 5
CASE
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '02.Mid day'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '03.Afternoonr'
WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '18:00:00' THEN '05.Rush Hour'
ELSE '05.Evening'
END AS Time_classification,
---New column 6 Spend bucket
CASE
WHEN (transaction_qty * unit_price) BETWEEN 0 AND 50 THEN '01.Low Spender'
WHEN (transaction_qty * unit_price) BETWEEN 51 AND 100 THEN '02.Medium Spender'
WHEN (transaction_qty * unit_price) BETWEEN 101 AND 200 THEN '03.High Spender'
ELSE '04.Very High Spender'
END AS Spend_bucket,
---New column 7 Revenue
(transaction_qty * unit_price) AS Revenue

FROM bright_coffee_shop_analysis
