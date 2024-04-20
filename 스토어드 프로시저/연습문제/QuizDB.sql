DROP SCHEMA IF EXISTS quiz;
CREATE SCHEMA quiz;
USE quiz;

CREATE TABLE employees LIKE employees.employees;
CREATE TABLE salaries LIKE employees.salaries;
INSERT INTO employees SELECT * FROM employees.employees;
INSERT INTO salaries SELECT * FROM employees.salaries;



-- 문제 1.  단일 컬럼 인덱스 생성
-- `employees` 테이블에 `last_name` 컬럼에 대한 인덱스를 생성하고, 인덱스의 효과를 확인합니다.

-- 1. 인덱스 생성 전 `employees` 테이블에  `last_name` 컬럼을 조건으로 하는 쿼리문을 실행하세요.
SELECT last_name FROM employees;

-- 2. `EXPLAIN`과 Execution Plan을 사용하여 `last_name`을 조건으로 하는 SELECT 쿼리의 실행 계획을 확인하세요.
EXPLAIN SELECT last_name FROM employees;

-- 3. `employees` 테이블에 `last_name` 컬럼에 대한 인덱스를 생성하세요.
CREATE INDEX last_name_index ON employees(last_name);

-- 4. 인덱스 생성 전후의 쿼리문의 실행 시간을 비교하세요.
SELECT last_name FROM employees WHERE first_name = 'Zvonko';

-- 5.  `employees` 테이블의 모든 인덱스 정보를 조회하세요.
SELECT * FROM employees;




-- 문제 2. 복합 컬럼 인덱스 생성

-- 1. 인덱스 생성 전 `employees` 테이블에 `first_name`과  `last_name`  컬럼을 조건으로 하는 쿼리문을 실행하세요.
SELECT first_name, last_name FROM employees;

-- 2. `EXPLAIN`과 Execution Plan을 사용하여 `first_name`과  `last_name`을 조건으로 하는 SELECT 쿼리의 실행 계획을 확인하세요.
EXPLAIN SELECT first_name FROM employees;
EXPLAIN SELECT last_name FROM employees;

-- 3. `employees` 테이블에 `first_name`과  `last_name` 컬럼에 대한 복합 인덱스를 생성하세요.
CREATE INDEX index_first_name_last_name ON employees(first_name, last_name);

-- 4. 인덱스 생성 전후의 쿼리문의 실행 시간을 비교하세요.
SELECT last_name FROM employees WHERE first_name = 'Zvonko';

-- 5.  `employees` 테이블의 모든 인덱스 정보를 조회하세요.
SELECT * FROM employees;



-- 문제3. 스토어드 프로시저 작성
-- 같은 스키마의 `salaries` 테이블을 이용해서 스토어드 프로시저를 작성하세요.
SELECT * FROM salaries;
-- 1. 입력 매개변수 :  직원의 ID(emp_no)와 연도(year)를 입력받습니다.
DELIMITER $$
CREATE PROCEDURE GetEmployeeSalariesByYear(IN emp_no INT, IN year INT)
BEGIN
	SELECT * FROM salaries s WHERE s.emp_no = emp_no AND year(from_date) = year;
END$$
DELIMITER ;
DROP PROCEDURE GetEmployeeSalariesByYear;
-- 2. 입력받은 연도에 해당 직원이 받은 급여 정보(급여 salary와 해당 급여의 시작 날짜 from_date)를 조회합니다.


-- 3. 스토어드 프로시저를 작성하고 호출합니다.
CALL GetEmployeeSalariesByYear(10001, 2000);
/*
호출 및 예시

CALL GetEmployeeSalariesByYear(10001, 2000);

| salary  |  from_date |
| ------- | ---------- |
| 85,112  | 2000-06-22 |
*/



-- 문제4. 동적SQL문 사용하기
-- 동적SQL문을 사용하여 특정 직원의 급여 이력 조회
-- 요구사항:
-- 직원의 ID(`emp_no`)를 입력받습니다.
-- 해당 직원의 모든 급여 이력(급여 `salary`, 급여 시작 날짜 `from_date`, 급여 종료 날짜 `to_date`)을 조회합니다.
-- 결과는 급여 시작 날짜(`from_date`) 기준으로 오름차순으로 정렬해야 합니다.


-- 1. 동적으로 입력받을 값와 SQL문을 변수로 선언하세요.
SET @emp_no = 10001;
SET @getinformation = 'SELECT salary, from_date, to_date FROM salaries WHERE emp_no = ? ORDER BY from_date ASC';

-- 2. PREPARE 문으로 동적 SQL문을 준비하세요.
PREPARE information FROM @getinformation;


-- 3. EXECUTE 문을 매개변수를 바인딩하여 실행하세요.
EXECUTE information USING @emp_no;

-- 4. 준비된 문장을 메모리 해제하세요.
DEALLOCATE PREPARE information;





-- 문제5. 트리거 사용하기
-- 아래와 같은 주문 테이블과 주문 기록 테이블이 있습니다.

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    log_message VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 주문이 발생할 때마다(order 테이블에 INSERT 이벤트가 발생한 이후에)
-- 자동으로 실행되는 order_logs에 기록을 남기는 트리거를 만드세요.

-- * AFTER INSERT 이벤트가 발생하는 경우 새로운 속성은 NEW.컬럼명  으로 접근합니다.

-- 1. 트리거를 생성하세요


-- 2. orders 테이블에 데이터를 삽입하세요.


-- 3. order_logs 테이블에 자동으로 트리거가 작동하였는지 확인하세요.


