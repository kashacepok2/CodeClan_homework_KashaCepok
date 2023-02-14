-- W02D2 lab/ homework

-- Question 1a)

SELECT 
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM teams AS t LEFT JOIN employees AS e
    ON t.id = e.team_id;
    
-- Question 1b)

SELECT 
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM teams AS t LEFT JOIN employees AS e
    ON t.id = e.team_id
WHERE e.pension_enrol = TRUE;

-- Question 1c)

SELECT 
    e.first_name,
    e.last_name,
    t.name,
    CAST(t.charge_cost AS INT)
FROM teams AS t LEFT JOIN employees AS e
    ON t.id = e.team_id
WHERE CAST(t.charge_cost AS INT) > 80;

-- Question 2a)

SELECT
    e.*, 
    p_d.local_account_no,
    p_d.local_sort_code 
FROM employees AS e LEFT JOIN pay_details AS p_d  
    ON e.pay_detail_id  = p_d.id;
    
-- Question 2b)

SELECT
    e.*, 
    p_d.local_account_no,
    p_d.local_sort_code,
    t.name AS team_name
FROM (employees AS e LEFT JOIN pay_details AS p_d  
    ON e.pay_detail_id  = p_d.id)
LEFT JOIN teams AS t
ON e.team_id = t.id;

-- Question 3a)

SELECT
    e.id AS employee_id,
    t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id;

-- Question 3b)

SELECT
    count(e.id) AS employee_id,
    t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id
GROUP BY t.name;

-- Question 3c)

SELECT
    count(e.id) AS employee_id,
    t.name AS team_name
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id
GROUP BY t.name
ORDER BY count(e.id) ASC;

-- Question 4a)

SELECT
    count(e.id) AS employee_id,
    t.name AS team_name,
    t.id
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id
GROUP BY t.name, t.id;

-- Question 4b)

SELECT
    count(e.id) AS employee_count,
    t.name AS team_name,
    CAST(t.charge_cost AS INT) * count(e.id) AS total_day_charge 
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id
GROUP BY t.name, t.charge_cost;

-- Question 4c)

SELECT
    count(e.id) AS employee_count,
    t.name AS team_name,
    CAST(t.charge_cost AS INT) * count(e.id) AS total_day_charge 
FROM employees AS e INNER JOIN teams AS t
    ON e.team_id = t.id
GROUP BY t.name, t.charge_cost
ORDER BY total_day_charge DESC
LIMIT 5;

-- Extension
-- Question 5

SELECT 
    employee_id,
    count(committee_id) AS num_committees
FROM employees_committees 
GROUP BY employee_id
ORDER BY num_committees DESC
LIMIT 2;

-- Question 6

SELECT *
FROM employees AS e LEFT JOIN employees_committees AS e_c
    ON e.id = e_c.employee_id 
WHERE e_c.committee_id IS NULL

-- answer: 978





