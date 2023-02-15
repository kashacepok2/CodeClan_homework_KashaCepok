

-- Question 1

SELECT 
    count(*)
FROM employees 
WHERE grade IS NULL AND salary IS NULL;

-- answer: 2

-- Question 2

SELECT 
    department,
    concat(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY department ASC, last_name;

-- Question 3

SELECT *
FROM employees
WHERE last_name LIKE '%A%'
ORDER BY salary DESC NULLS LAST 
LIMIT 10;

-- Question 4

SELECT count(*) AS num_in_department,
    department 
FROM employees 
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department;

-- Question 5

SELECT 
    count(department) AS num_employees,
    fte_hours,
    department 
FROM employees 
GROUP BY fte_hours, department
ORDER BY count(department) ASC, fte_hours ASC;

-- Question 6

SELECT 
    count(pension_enrol),
    pension_enrol
FROM employees 
GROUP BY pension_enrol;

-- Question 7

SELECT *
FROM employees 
WHERE pension_enrol = FALSE AND department = 'Accounting'
ORDER BY salary DESC NULLS LAST 
LIMIT 1;

-- Question 8

SELECT
    country,
    count(country),
    round(CAST(avg(salary) AS NUMERIC)) AS avg_salary
FROM employees
WHERE salary IS NOT NULL
GROUP BY country
HAVING count(country) > 30
ORDER BY avg(salary) DESC;
    
-- Question 9

SELECT 
    first_name,
    last_name,
    fte_hours,
    salary,
    fte_hours * salary AS effective_yearly_salary
FROM employees
WHERE fte_hours * salary > 30000;

-- Question 10

SELECT *
FROM employees AS e INNER JOIN teams AS t 
    ON t.id = e.team_id 
WHERE t.name = 'Data Team 1' OR t.name = 'Data Team 2';

-- Question 11

SELECT 
    first_name,
    last_name
FROM employees AS e LEFT JOIN pay_details AS p_d
    ON p_d.id = e.pay_detail_id 
WHERE local_tax_code IS NULL;

-- Question 12

SELECT 
    first_name,
    last_name,
    (48 * 35 * CAST(charge_cost AS NUMERIC) - salary) * fte_hours AS expected_profit
FROM employees AS e LEFT JOIN teams AS t 
    ON t.id = e.team_id
ORDER BY expected_profit DESC NULLS LAST

-- Question 13

SELECT 
    fte_hours 
FROM employees
GROUP BY fte_hours
ORDER BY count(*)
LIMIT 1;

SELECT 
    first_name,
    last_name,
    salary,
    fte_hours
FROM employees
WHERE country = 'Japan'
    AND fte_hours = (SELECT 
    fte_hours 
FROM employees
GROUP BY fte_hours
ORDER BY count(*)
LIMIT 1)
ORDER BY salary ASC 
LIMIT 1;

-- Question 14

SELECT 
    department,
    count(department) AS num_employees_missing_name
FROM employees 
WHERE first_name IS NULL
GROUP BY department 
HAVING count(department) > 1
ORDER BY count(department) DESC, department ASC;








