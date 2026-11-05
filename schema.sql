-- De 10: Quan ly dich vu huong dan du lich. MySQL 8.0.16+.
-- Chay tren may chu chua co CSDL tour_guide_mini.
CREATE DATABASE tour_guide_mini CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tour_guide_mini;
SET NAMES utf8mb4;

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE guides (
    guide_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    language VARCHAR(100) NOT NULL,
    region_id INT NOT NULL,
    CONSTRAINT fk_guides_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
) ENGINE=InnoDB;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE trips (
    trip_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    guide_id INT NOT NULL,
    departure_date DATE NOT NULL,
    status ENUM('Pending','Completed','Cancelled') NOT NULL,
    destination VARCHAR(200) NOT NULL,
    participant_count INT NOT NULL,
    CONSTRAINT chk_participants CHECK (participant_count > 0),
    CONSTRAINT fk_trips_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_trips_guide FOREIGN KEY (guide_id) REFERENCES guides(guide_id)
) ENGINE=InnoDB;

CREATE TABLE trip_reports (
    report_id INT PRIMARY KEY,
    trip_id INT NOT NULL UNIQUE,
    finished_at DATE NOT NULL,
    itinerary_summary TEXT NOT NULL,
    feedback TEXT,
    fee DECIMAL(14,2) NOT NULL,
    CONSTRAINT chk_fee CHECK (fee >= 0),
    CONSTRAINT fk_reports_trip FOREIGN KEY (trip_id) REFERENCES trips(trip_id)
) ENGINE=InnoDB;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    trip_id INT NOT NULL,
    amount DECIMAL(14,2) NOT NULL,
    payment_date DATE NOT NULL,
    method ENUM('Cash','BankTransfer','Card') NOT NULL,
    CONSTRAINT chk_amount CHECK (amount > 0),
    CONSTRAINT fk_payments_trip FOREIGN KEY (trip_id) REFERENCES trips(trip_id)
) ENGINE=InnoDB;
