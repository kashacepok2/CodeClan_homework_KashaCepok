-- Week 3 Day 1 homework

-- /* MVP */
-- /* Question 1 */

SELECT *
FROM employees 
WHERE department = 'Human Resources'

-- /* Question 2 */

SELECT
    first_name,
    last_name,
    country
FROM employees 
WHERE department = 'Legal'

-- /* Question 3 */

SELECT
    COUNT(*)
FROM employees 
WHERE country = 'Portugal';

-- /* Question 4 */

SELECT
    COUNT(*)
FROM employees 
WHERE country = 'Portugal' OR country = 'Spain';
-- /* Question 5 */

SELECT
    count(local_account_no)
FROM pay_details 
WHERE local_account_no IS NULL;

-- /* Question 6 */

SELECT
    count(local_account_no)
FROM pay_details 
WHERE (local_account_no IS NULL) AND (iban IS NULL);

-- answer: no

-- /* Question 7 */

SELECT 
    first_name,
    last_name
FROM employees
ORDER BY last_name ASC NULLS LAST;

-- /* Question 8 */

SELECT 
    first_name,
    last_name,
    country
FROM employees
ORDER BY 
country ASC NULLS LAST,
last_name ASC NULLS LAST;

-- /* Question 9 */

SELECT *
FROM employees 
ORDER BY salary DESC NULLS LAST
LIMIT 10;

-- /* Question 10 */

SELECT
first_name,
last_name,
salary
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST;

-- /* Question 11 */

SELECT 
    count(first_name)
FROM employees 
WHERE first_name LIKE 'F%';

-- answer: 30

-- /* Question 12 */

SELECT *
FROM employees 
WHERE email  LIKE '%yahoo%';

-- /* Question 13 */

SELECT 
    count(pension_enrol)
FROM employees 
WHERE (pension_enrol = TRUE) AND country NOT IN ('France', 'Germany');

-- /* Question 14 */

SELECT 
    max(salary)
FROM employees 
WHERE (department = 'Engineering') AND (fte_hours = 1.0);

-- /* Question 15 */

SELECT 
    first_name,
    last_name,
    fte_hours,
    salary,
    fte_hours * salary AS effective_yearly_salary
FROM employees; 

-- /* Extension */

-- /* Question 16 */

SELECT 
    CONCAT(first_name, ' ', last_name, ' - ', department) AS badge_label
FROM employees
WHERE first_name IS NOT NULL AND last_name IS NOT NULL AND department IS NOT NULL;

-- /* Question 17 */

SELECT 
    CONCAT(first_name, ' ', last_name, ' - ', department, ' (joined ',EXTRACT(MONTH FROM start_date), '-', EXTRACT(YEAR FROM start_date), ')') AS badge_label
FROM employees
WHERE first_name IS NOT NULL AND last_name IS NOT NULL AND department IS NOT NULL;






