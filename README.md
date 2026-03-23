# Brightlearn_Coffee_Shop
Creating insights about Brightlearn Coffe shop
---1. Testing---
SELECT * 
FROM bright_coffee_shop_analysis

--2. Creating "transaction_time_bucket"----
SELECT 
    from_unixtime(floor(unix_timestamp(transaction_time, 'HH:mm:ss') / 1800) * 1800, 'HH:mm') AS transaction_time_bucket,
    COUNT(*) AS total_transactions
FROM bright_coffee_shop_analysis
GROUP BY transaction_time_bucket
ORDER BY transaction_time_bucket;
