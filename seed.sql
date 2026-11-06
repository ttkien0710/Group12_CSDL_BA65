USE tour_guide_mini;
SET NAMES utf8mb4;
START TRANSACTION;

INSERT INTO regions (region_id, name) VALUES
    (1, 'Miền Bắc'),
    (2, 'Bắc Trung Bộ'),
    (3, 'Nam Trung Bộ'),
    (4, 'Tây Nguyên'),
    (5, 'Nam Bộ');

INSERT INTO guides (guide_id, full_name, email, language, region_id) VALUES
    (1, 'Nguyễn Minh Anh', 'guide1@example.com', 'Tiếng Việt, English', 1),
    (2, 'Trần Quốc Bảo', 'guide2@example.com', 'Tiếng Việt', 1),
    (3, 'Lê Thu Hà', 'guide3@example.com', 'Tiếng Việt, English', 2),
    (4, 'Phạm Đức Huy', 'guide4@example.com', 'Tiếng Việt, Français', 3),
    (5, 'Hoàng Ngọc Lan', 'guide5@example.com', 'Tiếng Việt', 4),
    (6, 'Vũ Hải Nam', 'guide6@example.com', 'Tiếng Việt, English', 5);

INSERT INTO customers (customer_id, full_name, phone, email) VALUES
    (1, 'Nguyễn Văn An', '0900000001', 'customer1@example.com'),
    (2, 'Trần Thị Bình', '0900000002', 'customer2@example.com'),
    (3, 'Lê Minh Châu', '0900000003', 'customer3@example.com'),
    (4, 'Phạm Quốc Dũng', '0900000004', 'customer4@example.com'),
    (5, 'Hoàng Thu Giang', '0900000005', 'customer5@example.com'),
    (6, 'Vũ Đức Hải', '0900000006', 'customer6@example.com'),
    (7, 'Đặng Mỹ Linh', '0900000007', 'customer7@example.com'),
    (8, 'Bùi Ngọc Mai', '0900000008', 'customer8@example.com'),
    (9, 'Đỗ Thanh Nam', '0900000009', 'customer9@example.com'),
    (10, 'Nguyễn Văn An', '0900000010', 'customer10@example.com');

INSERT INTO trips (trip_id, customer_id, guide_id, departure_date, status, destination, participant_count) VALUES
    (1, 1, 1, '2025-01-05', 'Completed', 'Hà Nội', 4),
    (2, 1, 2, '2025-01-20', 'Completed', 'Ninh Bình', 5),
    (3, 1, 3, '2025-02-10', 'Completed', 'Huế', 3),
    (4, 1, 4, '2025-03-15', 'Completed', 'Đà Nẵng', 6),
    (5, 2, 1, '2025-02-18', 'Completed', 'Hạ Long', 4),
    (6, 3, 3, '2025-03-25', 'Completed', 'Quảng Bình', 2),
    (7, 4, 4, '2025-04-10', 'Completed', 'Hội An', 5),
    (8, 5, 5, '2025-06-12', 'Completed', 'Đà Lạt', 4),
    (9, 6, 2, '2025-09-09', 'Completed', 'Sa Pa', 3),
    (10, 7, 6, '2024-12-15', 'Completed', 'TP Hồ Chí Minh', 6),
    (11, 8, 1, '2025-03-28', 'Pending', 'Hà Nội', 2),
    (12, 9, 3, '2025-02-22', 'Cancelled', 'Huế', 4),
    (13, 2, 5, '2025-07-10', 'Pending', 'Đà Lạt', 3),
    (14, 3, 2, '2025-01-25', 'Cancelled', 'Ninh Bình', 2),
    (15, 5, 1, '2025-04-20', 'Completed', 'Hà Nội', 3),
    (16, 10, 5, '2025-05-15', 'Completed', 'Cần Thơ', 2),
    (17, 8, 3, '2025-08-05', 'Completed', 'Huế', 2);

INSERT INTO trip_reports (report_id, trip_id, finished_at, itinerary_summary, feedback, fee) VALUES
    (1, 1, '2025-01-06', 'Tham quan Hà Nội, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1000000),
    (2, 2, '2025-01-21', 'Tham quan Ninh Bình, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1200000),
    (3, 3, '2025-02-11', 'Tham quan Huế, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 800000),
    (4, 4, '2025-03-16', 'Tham quan Đà Nẵng, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1500000),
    (5, 5, '2025-02-19', 'Tham quan Hạ Long, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 900000),
    (6, 6, '2025-03-26', 'Tham quan Quảng Bình, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 700000),
    (7, 7, '2025-04-11', 'Tham quan Hội An, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1100000),
    (8, 8, '2025-06-13', 'Tham quan Đà Lạt, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1300000),
    (9, 9, '2025-09-10', 'Tham quan Sa Pa, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 600000),
    (10, 10, '2024-12-16', 'Tham quan TP Hồ Chí Minh, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1000000),
    (11, 15, '2025-04-21', 'Tham quan Hà Nội, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 1000000),
    (12, 16, '2025-05-16', 'Tham quan Cần Thơ, hoàn thành lịch trình đã thống nhất.', 'Khách hài lòng', 500000),
    (13, 17, '2025-08-06', 'Tham quan Huế, phí đã được miễn.', 'Khách hài lòng', 0);

INSERT INTO payments (payment_id, trip_id, amount, payment_date, method) VALUES
    (1, 1, 400000, '2025-01-06', 'Cash'),
    (2, 1, 300000, '2025-01-10', 'BankTransfer'),
    (3, 2, 1200000, '2025-01-21', 'Card'),
    (4, 3, 800000, '2025-02-11', 'BankTransfer'),
    (5, 4, 1500000, '2025-03-16', 'Card'),
    (6, 5, 900000, '2025-02-19', 'Cash'),
    (7, 7, 1100000, '2025-04-11', 'BankTransfer'),
    (8, 8, 1300000, '2025-06-13', 'Card'),
    (9, 9, 600000, '2025-09-10', 'Cash'),
    (10, 10, 1000000, '2024-12-16', 'BankTransfer'),
    (11, 15, 1000000, '2025-04-21', 'Card'),
    (12, 16, 200000, '2025-05-16', 'Cash'),
    (13, 16, 300000, '2025-05-20', 'BankTransfer');

COMMIT;

-- Kiem tra: row_counts (cac bang phai du so dong).
SELECT 'regions' AS table_name, COUNT(*) AS row_count FROM regions
UNION ALL
SELECT 'guides' AS table_name, COUNT(*) AS row_count FROM guides
UNION ALL
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'trips' AS table_name, COUNT(*) AS row_count FROM trips
UNION ALL
SELECT 'trip_reports' AS table_name, COUNT(*) AS row_count FROM trip_reports
UNION ALL
SELECT 'payments' AS table_name, COUNT(*) AS row_count FROM payments;

-- Kiem tra tong hop: result = OK khi 0 dong vi pham.
SELECT 'foreign_keys' AS check_name,
       IF(COUNT(*)=0,'OK','FAIL') AS result, COUNT(*) AS violations
FROM (
    SELECT g.guide_id AS id FROM guides g LEFT JOIN regions r ON r.region_id=g.region_id WHERE r.region_id IS NULL
    UNION ALL
    SELECT t.trip_id FROM trips t LEFT JOIN customers c ON c.customer_id=t.customer_id WHERE c.customer_id IS NULL
    UNION ALL
    SELECT t.trip_id FROM trips t LEFT JOIN guides g ON g.guide_id=t.guide_id WHERE g.guide_id IS NULL
    UNION ALL
    SELECT rp.report_id FROM trip_reports rp LEFT JOIN trips t ON t.trip_id=rp.trip_id WHERE t.trip_id IS NULL
    UNION ALL
    SELECT p.payment_id FROM payments p LEFT JOIN trips t ON t.trip_id=p.trip_id WHERE t.trip_id IS NULL
) v
UNION ALL
SELECT 'status_report', IF(COUNT(*)=0,'OK','FAIL'), COUNT(*)
FROM (
    SELECT t.trip_id FROM trips t LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id
    GROUP BY t.trip_id,t.status
    HAVING (t.status='Completed' AND COUNT(rp.report_id)<>1)
        OR (t.status<>'Completed' AND COUNT(rp.report_id)<>0)
) v
UNION ALL
SELECT 'finish_date', IF(COUNT(*)=0,'OK','FAIL'), COUNT(*)
FROM (
    SELECT t.trip_id FROM trips t JOIN trip_reports rp ON rp.trip_id=t.trip_id
    WHERE rp.finished_at<t.departure_date
) v
UNION ALL
SELECT 'payment_limit', IF(COUNT(*)=0,'OK','FAIL'), COUNT(*)
FROM (
    SELECT p.trip_id FROM payments p LEFT JOIN trip_reports rp ON rp.trip_id=p.trip_id
    GROUP BY p.trip_id,rp.report_id,rp.fee
    HAVING rp.report_id IS NULL OR SUM(p.amount)>rp.fee
) v
UNION ALL
SELECT 'payment_date', IF(COUNT(*)=0,'OK','FAIL'), COUNT(*)
FROM (
    SELECT p.payment_id FROM payments p JOIN trip_reports rp ON rp.trip_id=p.trip_id
    WHERE p.payment_date<rp.finished_at
) v;

-- Quy uoc: phi duoc xac nhan khi lap bao cao hoan thanh (finished_at).
-- Minh hoa vi pham UNIQUE, KHONG thuc thi:
-- INSERT INTO trip_reports VALUES (99,1,'2025-01-06','Trung bao cao',NULL,1000000);
-- Minh hoa vi pham CHECK, KHONG thuc thi:
-- INSERT INTO payments VALUES (99,1,-100,'2025-01-10','Cash');
