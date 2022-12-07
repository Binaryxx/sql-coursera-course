-- Retrieve all employees whose address is in Elgin,IL.
SELECT f_name , l_name, address 
FROM employees
WHERE address LIKE '%Elgin,IL'
;

-- Retrieve all employees who were born during the 1970's.
SELECT f_name , l_name, b_date  
FROM employees 
WHERE b_date LIKE '197%' 
;

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT f_name , l_name, dep_id  
FROM employees 
WHERE dep_id = 5 AND salary BETWEEN 60000 AND 70000
;



-- Retrieve a list of employees ordered by department ID.
SELECT f_name, l_name, dep_id 
FROM employees 
ORDER BY dep_id 
;

-- Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT f_name, l_name, dep_id 
FROM employees 
ORDER BY dep_id DESC, l_name DESC
;

-- In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
SELECT employees.f_name, employees.l_name, departments.dep_name 
FROM employees, departments 
WHERE employees.dep_id = departments.dept_id_dep 
ORDER BY departments.dep_name DESC, l_name DESC
;



-- For each department ID retrieve the number of employees in the department.
SELECT dep_id, COUNT(dep_id) 
FROM employees 
GROUP BY dep_id 
;

-- For each department retrieve the number of employees in the department, and the average employee salary in the department..
SELECT dep_id, COUNT(dep_id), AVG(salary) 
FROM employees 
GROUP BY dep_id 
;

-- Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.
SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) as avg_salary  
FROM employees 
GROUP BY dep_id 
;

-- In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary.
SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) as avg_salary  
FROM employees 
GROUP BY dep_id 
ORDER BY avg_salary 
;

-- In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.
SELECT dep_id, COUNT(dep_id) AS num_employees, AVG(salary) as avg_salary  
FROM employees 
GROUP BY dep_id 
HAVING COUNT(dep_id) < 4
ORDER BY avg_salary 
;
