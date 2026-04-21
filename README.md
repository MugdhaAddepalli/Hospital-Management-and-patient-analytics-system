# Hospital Management and Patient Analytics System

## Overview

This project is a SQL-based Hospital Management System designed to store and manage hospital data efficiently while enabling analytical insights. It focuses on maintaining structured records of patients, doctors, appointments, and treatments, and performs queries to analyze hospital operations.

## Objectives

* Design a relational database for hospital data management
* Maintain relationships between patients, doctors, and treatments
* Perform analytical queries on hospital operations
* Extract insights such as doctor workload, revenue trends, and disease patterns

## Database Schema

### 1. Patients

Stores patient details.

* patient_id (Primary Key)
* name
* age
* gender

### 2. Doctors

Stores doctor information.

* doctor_id (Primary Key)
* name
* specialization

### 3. Appointments

Links patients with doctors.

* appointment_id (Primary Key)
* patient_id (Foreign Key → Patients)
* doctor_id (Foreign Key → Doctors)
* date

### 4. Treatments

Stores treatment details and cost.

* treatment_id (Primary Key)
* patient_id (Foreign Key → Patients)
* diagnosis
* cost
* date

## Naming Convention

A custom ID system is used to improve readability and avoid confusion:

* Patients: 1, 2, 3...
* Doctors: 101, 102...
* Appointments: 1001, 1002...
* Treatments: 2001, 2002...

## Key Features

* Structured relational database design
* Use of primary and foreign keys for data integrity
* Analytical SQL queries using JOIN, GROUP BY, and aggregation functions
* Handling edge cases using NULLIF to prevent division errors
* Use of LEFT JOIN to include all records in analysis

## Analytical Queries

### 1. Most Consulted Doctors

Finds doctors with the highest number of appointments.

### 2. Total Revenue per Month

Calculates monthly revenue generated from treatments.

### 3. Most Common Disease

Identifies the most frequently occurring diagnosis.

### 4. Patient Visit Frequency

Tracks how often each patient visits the hospital.

### 5. Doctor Performance Analysis

Evaluates doctor performance using:

* Total appointments
* Unique patients treated
* Average visits per patient

## Technologies Used

* SQL (MySQL)
* MySQL Workbench (for database design and query execution)

## How to Run

1. Open MySQL Workbench
2. Create a new SQL file
3. Copy and paste the provided SQL script
4. Execute the script to create the database and tables
5. Run the queries to view analytical results

## Expected Outcome

The system provides a structured way to manage hospital data and enables meaningful insights such as:

* Identifying high-demand doctors
* Monitoring hospital revenue trends
* Detecting common diseases
* Analyzing patient visit patterns

## Future Enhancements

* Add user interface using Java or web technologies
* Include patient history tracking
* Implement role-based access control
* Add more advanced analytics and reporting
