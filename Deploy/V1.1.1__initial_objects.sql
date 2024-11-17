-- Create Schema
CREATE SCHEMA IF NOT EXISTS demo_db.hr;

-- Use HR schema
use schema hr;

-- Create Department Table
CREATE OR REPLACE TABLE hr.department (
    department_id INT PRIMARY KEY,
    department_name STRING NOT NULL,
    location STRING
);

-- Create Employee Table
CREATE OR REPLACE TABLE hr.employee (
    employee_id INT PRIMARY KEY,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    email STRING UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES hr.department(department_id)
);

-- Insert Sample Data into Department Table
INSERT INTO hr.department (department_id, department_name, location)
VALUES
    (1, 'Human Resources', 'New York'),
    (2, 'Engineering', 'San Francisco'),
    (3, 'Finance', 'Chicago'),
    (4, 'Marketing', 'Los Angeles');

-- Insert Sample Data into Employee Table
INSERT INTO hr.employee (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES
    (101, 'John', 'Doe', 'john.doe@example.com', '2022-01-15', 60000.00, 2),
    (102, 'Jane', 'Smith', 'jane.smith@example.com', '2021-03-22', 75000.00, 1),
    (103, 'Robert', 'Brown', 'robert.brown@example.com', '2020-07-01', 50000.00, 3),
    (104, 'Emily', 'Davis', 'emily.davis@example.com', '2023-04-10', 80000.00, 2),
    (105, 'Michael', 'Wilson', 'michael.wilson@example.com', '2022-08-19', 55000.00, 4);
