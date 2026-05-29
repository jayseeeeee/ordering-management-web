-- 1. How many customers were added per month?
SELECT MONTH(created_at) AS month, YEAR(created_at) AS year, COUNT(*) AS total_customers
FROM customers
GROUP BY YEAR(created_at), MONTH(created_at);

-- 2. How many quotes were created per month?
SELECT MONTH(date_issued) AS month, YEAR(date_issued) AS year, COUNT(*) AS total_quotes
FROM quotes
GROUP BY YEAR(date_issued), MONTH(date_issued);

-- 3. How many quotes were approved, declined, or pending?
SELECT status, COUNT(*) AS total_quotes
FROM quotes
GROUP BY status;

-- 4. Which product type gets the most approved quotes and highest sales?
SELECT product, COUNT(*) AS approved_quotes, SUM(total_amount) AS total_sales
FROM quotes
WHERE status = 'Approved'
GROUP BY product
ORDER BY total_sales DESC;

-- 5. Which orders are still in production sorted by date?
SELECT *
FROM orders
WHERE status = 'In Production'
ORDER BY installation_date ASC;

-- 6. Which orders are already completed sorted by date?
SELECT *
FROM orders
WHERE status = 'Completed'
ORDER BY installation_date ASC;

-- 7. What is the average quote amount per product?
SELECT product, AVG(total_amount) AS average_amount
FROM quotes
GROUP BY product;

-- 8. Which customer has the highest total order value?
SELECT c.full_name, SUM(q.total_amount) AS total_spent
FROM customers c
         JOIN quotes q ON c.customer_id = q.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- 9. Which installer handled the most services?
SELECT i.full_name,
       COUNT(si.service_id) AS total_services
FROM installers i
         JOIN service_installers si
              ON i.installer_id = si.installer_id
GROUP BY i.installer_id
ORDER BY total_services DESC;

-- 10. What is the total sales amount per product?
SELECT product, SUM(total_amount) AS total_sales
FROM quotes
GROUP BY product;

-- 11. What is the total amount collected per month?
SELECT MONTH(payment_date) AS month, YEAR(payment_date) AS year, SUM(amount_paid) AS total_collection
FROM transactions
GROUP BY YEAR(payment_date), MONTH(payment_date);

-- 12. Which customers made full payments?
SELECT DISTINCT c.full_name
FROM customers c
         JOIN quotes q ON c.customer_id = q.customer_id
         JOIN orders o ON q.quote_id = o.quote_id
         JOIN transactions t ON o.order_id = t.order_id
WHERE t.status = 'Full';

-- 13. What is the most commonly used payment method?
SELECT payment_method, COUNT(*) AS usage_count
FROM transactions
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;

-- 14. Which customers have more than one quote (repeat customers)?
SELECT c.full_name, COUNT(q.quote_id) AS total_quotes
FROM customers c
         JOIN quotes q ON c.customer_id = q.customer_id
GROUP BY c.customer_id
HAVING COUNT(q.quote_id) > 1;

-- 15. Which product generated the highest revenue?
SELECT product, SUM(total_amount) AS revenue
FROM quotes
GROUP BY product
ORDER BY revenue DESC
LIMIT 1;

-- 16. Count total pending quotes
SELECT COUNT(*) AS pending_quotes
FROM quotes
WHERE status = 'Pending';

-- 17. Find customers who used Down Payment terms
SELECT c.full_name, q.payment_terms
FROM customers c
         JOIN quotes q ON c.customer_id = q.customer_id
WHERE q.payment_terms = 'Down Payment';

-- 18. What is the list of upcoming installation schedules?
SELECT order_id, installation_date, status
FROM orders
WHERE installation_date >= CURDATE()
ORDER BY installation_date ASC;

-- 19. Which customers still have unpaid balances?
SELECT c.full_name, o.balance_amount
FROM customers c
         JOIN quotes q ON c.customer_id = q.customer_id
         JOIN orders o ON q.quote_id = o.quote_id
WHERE o.balance_amount > 0;

-- 20. Which customers still have valid warranty?
SELECT c.full_name, o.order_id, o.warranty_expiry_date
FROM customers c
         JOIN quotes q
              ON c.customer_id = q.customer_id
         JOIN orders o
              ON q.quote_id = o.quote_id
WHERE o.warranty_expiry_date >= CURDATE();