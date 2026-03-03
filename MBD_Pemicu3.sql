-- Pastikan di database yang benar
USE MBD;

-- 1. Tabel products
CREATE TABLE IF NOT EXISTS products (
  product_id     INT           AUTO_INCREMENT PRIMARY KEY,
  product_name   VARCHAR(100)  NOT NULL,
  supplier_id    INT,
  category_id    INT,
  unit_price     DECIMAL(10,2) NOT NULL,
  units_in_stock INT           NOT NULL DEFAULT 0
) ENGINE=InnoDB;

-- 2. Tabel orders
CREATE TABLE IF NOT EXISTS orders (
  order_id     INT           AUTO_INCREMENT PRIMARY KEY,
  customer_id  INT           NOT NULL,
  order_date   DATE          NOT NULL,
  shipped_date DATE,
  ship_via     INT,
  freight      DECIMAL(10,2)
) ENGINE=InnoDB;

-- 3. Tabel order_details
CREATE TABLE IF NOT EXISTS order_details (
  order_id    INT           NOT NULL,
  product_id  INT           NOT NULL,
  unit_price  DECIMAL(10,2) NOT NULL,
  quantity    INT           NOT NULL,
  discount    DECIMAL(3,2)  NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id)   REFERENCES orders(order_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;


-- 1. Insert data ke tabel products
INSERT INTO products (product_name, supplier_id, category_id, unit_price, units_in_stock) VALUES
('Laptop', 1, 1, 999.99, 50),
('Smartphone', 2, 1, 499.99, 100),
('T-Shirt', 3, 2, 19.99, 200),
('Jeans', 3, 2, 49.99, 150),
('Coffee', 4, 3, 9.99, 300),
('Tea', 4, 3, 4.99, 250),
('Headphones', 1, 1, 79.99, 75),
('Keyboard', 2, 1, 59.99, 120),
('Mouse', 2, 1, 29.99, 130),
('Notebook', 5, 3, 2.99, 500);

-- 2. Insert data ke tabel orders
INSERT INTO orders (customer_id, order_date, shipped_date, ship_via, freight) VALUES
(12, '2025-01-05', '2025-01-10', 1, 25.50),
(7,  '2025-01-08', '2025-01-12', 2, 40.75),
(23, '2025-01-11', '2025-01-15', 3, 15.20),
(34, '2025-01-14', '2025-01-18', 1, 55.00),
(45, '2025-01-17', '2025-01-22', 2, 75.30),
(56, '2025-01-20', '2025-01-25', 3, 95.10),
(67, '2025-01-23', '2025-01-28', 1, 20.40),
(78, '2025-01-26', '2025-01-30', 2, 60.00),
(89, '2025-01-29', '2025-02-03', 3, 85.65),
(90, '2025-02-01', '2025-02-05', 1, 30.99),
(15, '2025-02-04', '2025-02-08', 2, 45.22),
(26, '2025-02-07', '2025-02-12', 3, 70.15),
(37, '2025-02-10', '2025-02-14', 1, 22.50),
(48, '2025-02-13', '2025-02-18', 2, 65.38),
(59, '2025-02-16', '2025-02-20', 3, 80.05),
(61, '2025-02-19', '2025-02-24', 1, 50.99),
(72, '2025-02-22', '2025-02-26', 2, 90.00),
(83, '2025-02-25', '2025-03-01', 3, 35.75),
(94, '2025-02-28', '2025-03-04', 1, 55.55),
(10, '2025-03-03', '2025-03-07', 2, 75.80),
(21, '2025-03-06', '2025-03-11', 3, 25.40),
(32, '2025-03-09', '2025-03-13', 1, 60.65),
(43, '2025-03-12', '2025-03-17', 2, 85.20),
(54, '2025-03-15', '2025-03-19', 3, 45.10),
(65, '2025-03-18', '2025-03-22', 1, 70.99),
(76, '2025-03-21', '2025-03-25', 2, 95.25),
(87, '2025-03-24', '2025-03-28', 3, 30.00),
(98, '2025-03-27', '2025-03-31', 1, 55.45),
(11, '2025-03-30', '2025-04-04', 2, 80.75),
(22, '2025-04-02', '2025-04-07', 3, 20.85),
(33, '2025-04-05', '2025-04-09', 1, 65.32),
(44, '2025-04-08', '2025-04-12', 2, 90.10),
(55, '2025-04-11', '2025-04-16', 3, 35.25),
(66, '2025-04-14', '2025-04-18', 1, 75.55),
(77, '2025-04-17', '2025-04-21', 2, 50.40),
(88, '2025-04-20', '2025-04-24', 3, 95.60),
(99, '2025-04-23', '2025-04-27', 1, 40.95),
(13, '2025-04-26', '2025-05-01', 2, 85.30),
(24, '2025-04-29', '2025-05-03', 3, 25.10),
(35, '2025-05-02', '2025-05-06', 1, 60.55),
(46, '2025-05-05', '2025-05-10', 2, 90.80),
(57, '2025-05-08', '2025-05-12', 3, 35.45),
(68, '2025-05-11', '2025-05-15', 1, 75.25),
(79, '2025-05-14', '2025-05-18', 2, 20.65),
(80, '2025-05-17', '2025-05-21', 3, 55.90),
(91, '2025-05-20', NULL,      1, 65.00),
(2,  '2025-05-22', NULL,      2, 40.00),
(14, '2025-05-24', NULL,      3, 30.75),
(5,  '2025-05-25', NULL,      1, 50.20),
(6,  '2025-05-26', NULL,      2, 80.45);


-- 3. Insert data ke tabel order_details
INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount) VALUES
(1, 2, 499.99, 2, 0.05),
(2, 6, 4.99, 9, 0.15),
(2, 10, 2.99, 7, 0.15),
(2, 4, 49.99, 7, 0.10),
(3, 9, 29.99, 8, 0.20),
(4, 3, 19.99, 4, 0.00),
(4, 8, 59.99, 4, 0.10),
(4, 9, 29.99, 4, 0.10),
(5, 8, 59.99, 6, 0.20),
(6, 6, 4.99, 5, 0.05),
(7, 8, 59.99, 10, 0.10),
(7, 10, 2.99, 8, 0.20),
(8, 7, 79.99, 5, 0.05),
(8, 5, 9.99, 9, 0.10),
(9, 1, 999.99, 9, 0.20),
(9, 3, 19.99, 5, 0.15),
(10, 6, 4.99, 6, 0.15),
(10, 1, 999.99, 3, 0.00),
(10, 3, 19.99, 5, 0.20),
(11, 10, 2.99, 2, 0.05),
(11, 5, 9.99, 3, 0.00),
(12, 6, 4.99, 10, 0.20),
(13, 7, 79.99, 3, 0.05),
(13, 2, 499.99, 6, 0.00),
(13, 4, 49.99, 4, 0.15),
(14, 9, 29.99, 1, 0.00),
(14, 10, 2.99, 3, 0.20),
(14, 5, 9.99, 8, 0.15),
(15, 6, 4.99, 10, 0.00),
(15, 10, 2.99, 1, 0.10),
(15, 9, 29.99, 8, 0.00),
(16, 7, 79.99, 8, 0.10),
(17, 2, 499.99, 4, 0.20),
(17, 3, 19.99, 7, 0.10),
(17, 4, 49.99, 1, 0.15),
(18, 5, 9.99, 1, 0.20),
(19, 2, 499.99, 1, 0.15),
(20, 4, 49.99, 7, 0.10),
(20, 9, 29.99, 6, 0.20),
(21, 1, 999.99, 10, 0.10),
(21, 3, 19.99, 6, 0.05),
(22, 7, 79.99, 7, 0.05),
(23, 9, 29.99, 8, 0.05),
(24, 1, 999.99, 2, 0.05),
(24, 4, 49.99, 10, 0.10),
(25, 4, 49.99, 10, 0.05),
(25, 2, 499.99, 6, 0.10),
(26, 7, 79.99, 9, 0.00),
(26, 4, 49.99, 10, 0.10),
(26, 9, 29.99, 10, 0.05),
(27, 7, 79.99, 4, 0.15),
(28, 1, 999.99, 3, 0.20),
(29, 5, 9.99, 6, 0.15),
(29, 8, 59.99, 5, 0.10),
(29, 9, 29.99, 7, 0.15),
(30, 6, 4.99, 8, 0.00),
(30, 2, 499.99, 9, 0.20),
(30, 5, 9.99, 4, 0.05),
(31, 1, 999.99, 5, 0.20),
(31, 8, 59.99, 2, 0.05),
(32, 8, 59.99, 2, 0.00),
(32, 7, 79.99, 2, 0.00),
(32, 3, 19.99, 10, 0.15),
(33, 10, 2.99, 1, 0.10),
(33, 6, 4.99, 7, 0.00),
(34, 10, 2.99, 3, 0.10),
(34, 7, 79.99, 4, 0.10),
(35, 3, 19.99, 9, 0.10),
(35, 8, 59.99, 3, 0.15),
(36, 4, 49.99, 8, 0.15),
(36, 3, 19.99, 10, 0.15),
(37, 1, 999.99, 5, 0.15),
(37, 7, 79.99, 6, 0.05),
(38, 6, 4.99, 4, 0.05),
(39, 8, 59.99, 8, 0.00),
(39, 1, 999.99, 7, 0.15),
(39, 6, 4.99, 2, 0.20),
(40, 10, 2.99, 10, 0.05),
(41, 3, 19.99, 2, 0.05),
(42, 5, 9.99, 1, 0.10),
(42, 9, 29.99, 9, 0.05),
(43, 5, 9.99, 9, 0.15),
(43, 8, 59.99, 5, 0.05),
(43, 10, 2.99, 8, 0.05),
(44, 5, 9.99, 7, 0.15),
(45, 8, 59.99, 2, 0.15),
(45, 7, 79.99, 9, 0.00),
(46, 7, 79.99, 10, 0.05),
(47, 7, 79.99, 8, 0.15),
(47, 9, 29.99, 10, 0.00),
(48, 1, 999.99, 5, 0.20),
(48, 10, 2.99, 1, 0.10),
(48, 4, 49.99, 1, 0.10),
(49, 2, 499.99, 7, 0.10),
(49, 8, 59.99, 1, 0.05),
(50, 1, 999.99, 4, 0.15),
(50, 10, 2.99, 2, 0.20),
(50, 2, 499.99, 7, 0.15);

-- Hapus dulu kalau sempat ada sisa function
DROP FUNCTION IF EXISTS generate_sales_report;

-- Funtion
DELIMITER //

CREATE FUNCTION generate_sales_report(
  p_report_type VARCHAR(10),
  p_ref_date    DATE
) RETURNS JSON
DETERMINISTIC
BEGIN
  DECLARE v_start_date DATE;
  DECLARE v_end_date   DATE;

  -- Hitung periode berdasarkan tipe laporan, mulai dari ref_date ke depan
  SET v_start_date = p_ref_date;

  SET v_end_date = CASE
    WHEN p_report_type = 'daily'   THEN p_ref_date
    WHEN p_report_type = 'weekly'  THEN DATE_ADD(p_ref_date, INTERVAL 6 DAY)
    WHEN p_report_type = 'monthly' THEN LAST_DAY(p_ref_date)
    ELSE p_ref_date
  END;

  -- Buat JSON report
  RETURN JSON_OBJECT(
    'report_type',  p_report_type,
    'start_date',   v_start_date,
    'end_date',     v_end_date,
    'total_sales',  (
      SELECT IFNULL(SUM(od.quantity * od.unit_price * (1 - od.discount)), 0)
      FROM order_details od
      JOIN orders o ON o.order_id = od.order_id
      WHERE o.order_date BETWEEN v_start_date AND v_end_date
    ),
    'total_orders', (
      SELECT COUNT(DISTINCT o.order_id)
      FROM orders o
      WHERE o.order_date BETWEEN v_start_date AND v_end_date
    )
  );
END; //

DELIMITER ;

-- Contoh panggilan fungsi:
SELECT generate_sales_report('daily',   '2025-01-05');
SELECT generate_sales_report('weekly',  '2025-01-05');
SELECT generate_sales_report('monthly', '2025-01-05');

-- Verifikasi manual:
-- 1) Harian untuk 2025-01-05
SELECT
    'daily'                                  AS report_type,
    o.order_date                             AS start_date,
    o.order_date                             AS end_date,
    IFNULL(SUM(od.quantity * od.unit_price * (1 - od.discount)), 0) AS total_sales,
    COUNT(DISTINCT o.order_id)               AS total_orders
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date = '2025-01-05'
GROUP BY o.order_date;

-- 2) Mingguan: 7 hari mulai 2025-01-05 s.d. 2025-01-11
SELECT
  'weekly' AS report_type,
  '2025-01-05'                         AS start_date,
  DATE_ADD('2025-01-05', INTERVAL 6 DAY) AS end_date,
  IFNULL(SUM(od.quantity * od.unit_price * (1 - od.discount)), 0) AS total_sales,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '2025-01-05' AND DATE_ADD('2025-01-05', INTERVAL 6 DAY);

-- 3) Bulanan: mulai 5 Januari 2025 sampai akhir bulan (31 Januari 2025)
SELECT
  'monthly'                                           AS report_type,
  '2025-01-05'                                        AS start_date,
  LAST_DAY('2025-01-05')                              AS end_date,
  IFNULL(SUM(od.quantity * od.unit_price * (1 - od.discount)), 0) AS total_sales,
  COUNT(DISTINCT o.order_id)                          AS total_orders
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '2025-01-05' AND LAST_DAY('2025-01-05');

-- 4) Gabungan (daily, weekly, monthly) untuk ref_date = '2025-01-05'
WITH ranges AS (
  SELECT 'daily'   AS report_type,
         '2025-01-05' AS start_date,
         '2025-01-05' AS end_date
  UNION ALL
  SELECT 'weekly',
         '2025-01-05',
         DATE_ADD('2025-01-05', INTERVAL 6 DAY)
  UNION ALL
  SELECT 'monthly',
         '2025-01-05',
         LAST_DAY('2025-01-05')
)
SELECT
  r.report_type,
  r.start_date,
  r.end_date,
  COALESCE(SUM(od.quantity * od.unit_price * (1 - od.discount)), 0) AS total_sales,
  COUNT(DISTINCT o.order_id) AS total_orders
FROM ranges r
LEFT JOIN orders o
  ON o.order_date BETWEEN r.start_date AND r.end_date
LEFT JOIN order_details od
  ON od.order_id = o.order_id
GROUP BY
  r.report_type,
  r.start_date,
  r.end_date
ORDER BY
  -- agar urutannya daily → weekly → monthly
  FIELD(r.report_type, 'daily', 'weekly', 'monthly');
  

INSERT INTO R values (5, 6);
SAVEPOINT my_savepoint_1;
INSERT INTO R values (7, 8);
SAVEPOINT my_savepoint_2;
INSERT INTO R values (9, 10);
ROLLBACK TO my_savepoint_1;
INSERT INTO R values (11, 12);
COMMIT;


USE MBD;

CREATE TABLE IF NOT EXISTS R (
  a INT,
  b INT
) ENGINE=INNODB;

START TRANSACTION;

  INSERT INTO R VALUES (5, 6);
  SAVEPOINT my_savepoint_1;

  INSERT INTO R VALUES (7, 8);
  SAVEPOINT my_savepoint_2;

  INSERT INTO R VALUES (9, 10);

  ROLLBACK TO my_savepoint_1;

  INSERT INTO R VALUES (11, 12);

COMMIT;
