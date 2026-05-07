CREATE DATABASE hospital_db;
USE hospital_db;

-- =========================
-- TABLE CREATION
-- =========================

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    diagnosis VARCHAR(255),
    cost DECIMAL(10,2),
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- =========================
-- DATA INSERTION
-- =========================

-- Patients Table Data
INSERT INTO Patients VALUES
(1, 'Amit', 25, 'Male'),
(2, 'Sneha', 30, 'Female'),
(3, 'Rahul', 40, 'Male'),
(4, 'Priya', 28, 'Female'),
(5, 'Karan', 35, 'Male'),
(6, 'Anjali', 22, 'Female'),
(7, 'Vikram', 50, 'Male');

-- Doctors Table Data
INSERT INTO Doctors VALUES
(101, 'Dr. Sharma', 'Cardiology'),
(102, 'Dr. Mehta', 'Dermatology'),
(103, 'Dr. Reddy', 'Orthopedics'),
(104, 'Dr. Patel', 'Neurology'),
(105, 'Dr. Verma', 'Pediatrics'),
(106, 'Dr. Iyer', 'General Medicine'),
(107, 'Dr. Khan', 'ENT');

-- Appointments Table Data
INSERT INTO Appointments VALUES
(1001, 1, 101, '2026-04-01'),
(1002, 2, 101, '2026-04-15'),
(1003, 3, 102, '2026-05-03'),
(1004, 1, 102, '2026-05-10'),
(1005, 4, 103, '2026-05-20'),
(1006, 5, 104, '2026-06-06'),
(1007, 6, 105, '2026-06-14'),
(1008, 7, 106, '2026-07-08'),
(1009, 2, 107, '2026-07-18');

-- Treatments Table Data
INSERT INTO Treatments VALUES
(2001, 1, 'Flu', 500, '2026-04-01'),
(2002, 2, 'Heart Disease', 5000, '2026-04-15'),
(2003, 3, 'Skin Allergy', 1500, '2026-05-03'),
(2004, 1, 'Flu', 700, '2026-05-10'),
(2005, 4, 'Fracture', 3500, '2026-05-20'),
(2006, 5, 'Migraine', 2000, '2026-06-06'),
(2007, 6, 'Fever', 800, '2026-06-14'),
(2008, 7, 'Ear Infection', 1200, '2026-07-08');

-- =========================
-- QUERIES / ANALYSIS
-- =========================

-- 1. Most Consulted Doctors
SELECT 
    d.doctor_id,
    d.name,
    COUNT(a.appointment_id) AS total_visits
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name
ORDER BY total_visits DESC;

-- 2. Total Revenue Per Month
SELECT 
    YEAR(t.date) AS year,
    MONTH(t.date) AS month,
    SUM(t.cost) AS total_revenue
FROM Treatments t
GROUP BY YEAR(t.date), MONTH(t.date)
ORDER BY year, month;

-- 3. Most Common Disease
SELECT 
    diagnosis,
    COUNT(*) AS cases
FROM Treatments
GROUP BY diagnosis
ORDER BY cases DESC
LIMIT 1;

-- 4. Patient Visit Frequency
SELECT 
    p.patient_id,
    p.name,
    COUNT(a.appointment_id) AS visit_count
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.name
ORDER BY visit_count DESC;

-- 5. Doctor Performance Analysis
SELECT 
    d.doctor_id,
    d.name,
    COUNT(a.appointment_id) AS total_appointments,
    COUNT(DISTINCT a.patient_id) AS unique_patients,
    ROUND(
        COUNT(a.appointment_id) / 
        NULLIF(COUNT(DISTINCT a.patient_id), 0),
    2) AS avg_visits_per_patient
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name;
