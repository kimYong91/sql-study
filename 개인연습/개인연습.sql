-- JOIN
-- employees 데이터베이스에서 연습해보세요.
use employees;
-- employees(first_name, last_name, emp_no), titles(emp_no, title, to_date)
-- dept_emp(dept_no, emp_no, to_date), salaries(emp_no, salary, to_date)
-- departments(dept_no, dept_name)
select * FROM employees; 
-- 문제 1: 직원의 이름(first_name, last_name)과 직원의 현재 직책(title)을 조회하세요.
SELECT first_name, last_name, title FROM employees E JOIN titles T ON E.emp_no = T.emp_no where t.to_date = "9999-01-01";

-- 문제 2: 각 부서의 이름(dept_name)과 그 부서에 현재 속해있는 직원 수를 조회하세요.
SELECT dept_name, COUNT(DE.emp_no) "부서별 직원의 수" 
FROM departments D 
JOIN dept_emp DE 
ON D.dept_no = DE.dept_no 
where DE.to_date = "9999-01-01" 
group by D.dept_name;

-- 문제 3: 현재 직원 중 급여가 80000 이상인 직원의 이름(first_name, last_name)과 급여(salary)를 조회하세요.
SELECT first_name, last_name, salary 
FROM employees E 
JOIN salaries S 
ON E.emp_no = S.emp_no 
where S.salary > 8000 
AND S.to_date = "9999-01-01";

-- 문제 4: 'Marketing' 부서에 현재 속해있는 직원의 이름(first_name, last_name)과 부서 이름(dept_name)을 조회하세요.
SELECT first_name, last_name, dept_name 
FROM employees E 
JOIN dept_emp D ON E.emp_no = D.emp_no 
JOIN departments DE ON D.dept_no = DE.dept_no 
WHERE DE.dept_name = 'Marketing' AND D.to_date = "9999-01-01";

-- 문제 5: 각 직원의 이름과 해당 직원이 현재 속한 부서 이름을 조회하세요. (LEFT JOIN 사용)
SELECT first_name, last_name, dept_name 
FROM employees E 
LEFT JOIN dept_emp D ON E.emp_no = D.emp_no 
LEFT JOIN departments DE ON D.dept_no = DE.dept_no 
WHERE D.to_date = "9999-01-01";