-- ==========================================
-- E-COMMERCE DATA: INSERT SAMPLE RECORDS
-- PostgreSQL
-- ==========================================

-- 1. Customers
INSERT INTO customers
(customer_id, customer_name, city)
VALUES
(1, 'Chandana', 'Hyderabad'),
(2, 'Rahul', 'Bangalore'),
(3, 'Priya', 'Chennai'),
(4, 'Arjun', 'Hyderabad'),
(5, 'Sneha', 'Vijayawada')
ON CONFLICT (customer_id) DO NOTHING;


-- 2. Products
INSERT INTO products
(product_id, product_name, price)
VALUES
(101, 'Laptop', 50000),
(102, 'Mobile', 20000),
(103, 'Headphones', 2000),
(104, 'Keyboard', 1500)
ON CONFLICT (product_id) DO NOTHING;


-- 3. Orders
INSERT INTO orders
(order_id, customer_id, product_id, quantity, status, order_date)
VALUES
(1001, 1, 101, 1, 'Delivered', '2026-10-01'),
(1002, 2, 102, 2, 'Pending', '2026-10-02'),
(1003, 1, 103, 3, 'Delivered', '2026-10-03'),
(1004, 3, 101, 1, 'Cancelled', '2026-10-04'),
(1005, 2, 104, 2, 'Delivered', '2026-10-05')
ON CONFLICT (order_id) DO NOTHING;