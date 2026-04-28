CREATE DATABASE hospital_project; 

/c hospital_project;

CREATE TABLE hospital_data (
    hospital_name VARCHAR(150),
    location VARCHAR(100),
    department VARCHAR(100),
    doctors_count INT,
    patients_count INT,
    admission_date DATE,
    discharge_date DATE,
    medical_expenses NUMERIC(10,2)
);

SELECT * FROM hospital_data; 

-- QUERY 1 
SELECT SUM(patients_count) AS total_patients
FROM hospital_data; 

-- QUERY 2 
SELECT hospital_name, 
	AVG(doctors_count) AS avg_doctors
FROM hospital_data
GROUP BY hospital_name;

-- QUERY 3 
SELECT department, 
	SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

-- QUERY 4 
SELECT hospital_name, 
	SUM(medical_expenses) AS total_expense
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_expense DESC
LIMIT 1;

-- QUERY 5 
SELECT hospital_name,
       admission_date,
       AVG(medical_expenses) AS avg_daily_expense
FROM hospital_data
GROUP BY hospital_name, admission_date
ORDER BY hospital_name, admission_date;
-- OR 
SELECT hospital_name, 
AVG(medical_expenses) AS avg_daily_expense 
FROM hospital_data 
GROUP BY hospital_name; 

-- QUERY 6
SELECT *,
       (discharge_date - admission_date) AS stay_days
FROM hospital_data
ORDER BY stay_days DESC
LIMIT 1;

-- QUERY 7 
SELECT location, 
	SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY location
ORDER BY total_patients DESC;

-- QUERY 8 
SELECT department,
       AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital_data
GROUP BY department;


-- QUERY 9 
SELECT department, 
	SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;


-- QUERY 10 
SELECT 
    EXTRACT(MONTH FROM admission_date) AS month,
    SUM(medical_expenses) AS total_expense
FROM hospital_data
GROUP BY month
ORDER BY month; 

