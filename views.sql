USE tour_guide_mini;
SET NAMES utf8mb4;

CREATE VIEW v_detail AS
SELECT t.trip_id,t.departure_date,t.status,
       c.customer_id,c.full_name AS customer_name,
       g.guide_id,g.full_name AS guide_name,
       r.region_id,r.name AS region_name,rp.fee
FROM trips t
JOIN customers c ON c.customer_id=t.customer_id
JOIN guides g ON g.guide_id=t.guide_id
JOIN regions r ON r.region_id=g.region_id
LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id;

CREATE VIEW v_group_summary AS
SELECT r.region_id,r.name AS region_name,COUNT(t.trip_id) AS total_trips,
       SUM(CASE WHEN t.status='Completed' THEN 1 ELSE 0 END) AS completed_trips,
       SUM(CASE WHEN t.status='Cancelled' THEN 1 ELSE 0 END) AS cancelled_trips,
       COALESCE(SUM(rp.fee),0) AS total_fee
FROM regions r
LEFT JOIN guides g ON g.region_id=r.region_id
LEFT JOIN trips t ON t.guide_id=g.guide_id
LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id
GROUP BY r.region_id,r.name;

CREATE VIEW v_debt AS
SELECT c.customer_id,c.full_name AS customer_name,
       COALESCE(SUM(rp.fee),0) AS total_fee,
       COALESCE(SUM(p.total_paid),0) AS total_paid,
       COALESCE(SUM(rp.fee),0)-COALESCE(SUM(p.total_paid),0) AS debt
FROM customers c
LEFT JOIN trips t ON t.customer_id=c.customer_id
LEFT JOIN trip_reports rp ON rp.trip_id=t.trip_id
LEFT JOIN (
    SELECT trip_id,SUM(amount) AS total_paid
    FROM payments GROUP BY trip_id
) p ON p.trip_id=t.trip_id
GROUP BY c.customer_id,c.full_name;
