USE tour_guide_mini;
SET NAMES utf8mb4;

-- Cau 1: Chuyến Completed trong tháng 01 năm 2025
SELECT t.trip_id,c.customer_id,c.full_name AS customer_name,
       g.guide_id,g.full_name AS guide_name,t.departure_date
FROM trips t
JOIN customers c ON c.customer_id=t.customer_id
JOIN guides g ON g.guide_id=t.guide_id
WHERE t.status='Completed'
  AND t.departure_date>='2025-01-01' AND t.departure_date<'2025-02-01'
ORDER BY t.departure_date,t.trip_id;

-- Cau 2: Số chuyến theo khu vực trong quý I năm 2025
SELECT r.region_id,r.name AS region_name,COUNT(t.trip_id) AS total_trips
FROM regions r
LEFT JOIN guides g ON g.region_id=r.region_id
LEFT JOIN trips t ON t.guide_id=g.guide_id
  AND t.departure_date>='2025-01-01' AND t.departure_date<'2025-04-01'
GROUP BY r.region_id,r.name
ORDER BY r.region_id;

-- Cau 3: Khách có chuyến chưa có báo cáo và không bị hủy
SELECT c.customer_id,c.full_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM trips t
    LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id
    WHERE t.customer_id=c.customer_id
      AND t.status<>'Cancelled' AND rp.report_id IS NULL
)
ORDER BY c.customer_id;

-- Cau 4: Phí trung bình mỗi chuyến Completed theo khu vực
SELECT r.region_id,r.name AS region_name,ROUND(AVG(rp.fee),2) AS average_fee
FROM regions r
JOIN guides g ON g.region_id=r.region_id
JOIN trips t ON t.guide_id=g.guide_id
JOIN trip_reports rp ON rp.trip_id=t.trip_id
WHERE t.status='Completed'
GROUP BY r.region_id,r.name
ORDER BY r.region_id;

-- Cau 5: Ba hướng dẫn viên có nhiều chuyến Completed nhất năm 2025
SELECT g.guide_id,g.full_name,COUNT(t.trip_id) AS completed_trips
FROM guides g JOIN trips t ON t.guide_id=g.guide_id
WHERE t.status='Completed'
  AND t.departure_date>='2025-01-01' AND t.departure_date<'2026-01-01'
GROUP BY g.guide_id,g.full_name
ORDER BY completed_trips DESC,g.guide_id ASC
LIMIT 3;

-- Cau 6: Tổng tiền mỗi khách thanh toán trong năm 2025
SELECT c.customer_id,c.full_name,
       COALESCE(SUM(p.amount),0) AS total_paid_2025
FROM customers c
LEFT JOIN trips t ON t.customer_id=c.customer_id
LEFT JOIN payments p ON p.trip_id=t.trip_id
  AND p.payment_date>='2025-01-01' AND p.payment_date<'2026-01-01'
GROUP BY c.customer_id,c.full_name
ORDER BY c.customer_id;

-- Cau 7: Khách chưa từng có bản ghi thanh toán
SELECT c.customer_id,c.full_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM trips t JOIN payments p ON p.trip_id=t.trip_id
    WHERE t.customer_id=c.customer_id
)
ORDER BY c.customer_id;

-- Cau 8: Khách theo tổng phí hướng dẫn đã xác nhận
SELECT c.customer_id,c.full_name,COALESCE(SUM(rp.fee),0) AS total_fee
FROM customers c
LEFT JOIN trips t ON t.customer_id=c.customer_id
LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id
GROUP BY c.customer_id,c.full_name
ORDER BY total_fee DESC,c.customer_id ASC;

-- Cau 9: Tỷ lệ hủy của từng hướng dẫn viên năm 2025
SELECT g.guide_id,g.full_name,COUNT(t.trip_id) AS total_trips,
       SUM(CASE WHEN t.status='Cancelled' THEN 1 ELSE 0 END) AS cancelled_trips,
       ROUND(100.0 * SUM(CASE WHEN t.status='Cancelled' THEN 1 ELSE 0 END)
             / NULLIF(COUNT(t.trip_id),0),2) AS cancellation_rate
FROM guides g
LEFT JOIN trips t ON t.guide_id=g.guide_id
  AND t.departure_date>='2025-01-01' AND t.departure_date<'2026-01-01'
GROUP BY g.guide_id,g.full_name
ORDER BY g.guide_id;

-- Cau 10: Khách có hơn ba chuyến Completed năm 2025
SELECT c.customer_id,c.full_name,COUNT(t.trip_id) AS completed_trips
FROM customers c JOIN trips t ON t.customer_id=c.customer_id
WHERE t.status='Completed'
  AND t.departure_date>='2025-01-01' AND t.departure_date<'2026-01-01'
GROUP BY c.customer_id,c.full_name
HAVING COUNT(t.trip_id)>3
ORDER BY completed_trips DESC,c.customer_id ASC;
