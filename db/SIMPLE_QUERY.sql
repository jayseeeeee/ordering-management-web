-- 1. Display all customers
SELECT * FROM customers;

-- 2. Insert a new customer
INSERT INTO customers (full_name, address, email_address, contact_number)
VALUES ('Juan Dela Cruz', 'Imus, Cavite', 'juan@gmail.com', '09171234567');

-- 3. Update remaining balance amount of a customer order
UPDATE orders
SET balance_amount = 5000.00
WHERE order_id = 1;

-- 4. Delete a customer from the database
DELETE FROM customers
WHERE customer_id = 6;

-- 5. What is the total number of orders per status?
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- 6. What is the total outstanding balance for an order?
SELECT order_id, balance_amount
FROM orders;

-- 7. What services are installers currently assigned to?
SELECT i.full_name, s.service_type, s.service_date
FROM installers i
         JOIN service_installers si ON i.installer_id = si.installer_id
         JOIN services s ON si.service_id = s.service_id;

-- 8. Which orders have partial payments only?
SELECT order_id, status
FROM transactions
WHERE status = 'Partial';

-- 9. Which orders have been fully paid?
SELECT order_id, status
FROM transactions
WHERE status = 'Full';

-- 10. Update customer contact number
UPDATE customers
SET contact_number = '09998887777'
WHERE customer_id = 2;

-- 11. Update quote status to approved
UPDATE quotes
SET status = 'Approved'
WHERE quote_id = 1;

-- 12. Delete a declined quote
DELETE FROM quotes
WHERE status = 'Declined';

-- 13. Display all installers
SELECT * FROM installers;

-- 14. Find all customers from Cavite
SELECT * FROM customers
WHERE address LIKE '%Cavite%';

-- 15. Retrieve all approved quotes
SELECT * FROM quotes
WHERE status = 'Approved';

-- 16. Retrieve all completed orders
SELECT * FROM orders
WHERE status = 'Completed';

-- 17. Display all services scheduled today
SELECT * FROM services
WHERE service_date = CURDATE();

-- 18. Show all motorized customizations
SELECT * FROM quotes
WHERE customization = 'Motorized';

-- 19. Find all blackout products
SELECT * FROM quotes
WHERE customization = 'Blackout';

-- 20. Show all accordion products
SELECT * FROM quotes
WHERE product = 'Accordion';