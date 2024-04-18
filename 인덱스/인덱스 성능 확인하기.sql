DROP SCHEMA IF EXISTS db_index;
CREATE SCHEMA db_index;
USE db_index;

-- 인덱스 성능 확인하기

-- 대량의 샘플 데이터 복사하기 (무작위)
CREATE TABLE emp SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_cl SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_se SELECT * FROM employees.employees ORDER BY rand();

SELECT * FROM emp LIMIT 5;		-- 인덱스 없는 테이블
SELECT * FROM emp_cl LIMIT 5;	-- 클러스터형 인덱스(만들 계획)
SELECT * FROM emp_se LIMIT 5;	-- 보조 인덱스(만들 계획)

-- 클러스터형 인덱스가 생성되면서 emp_no 기준으로 정렬
ALTER TABLE emp_cl ADD PRIMARY KEY (emp_no);	-- 만들자 마자 물리적으로 정렬이 되기에 시간이 걸림

SELECT * FROM emp_cl LIMIT 5;	-- emp_no 기준으로 정렬 조회


-- emp_no 보조 인덱스 생성
ALTER TABLE emp_se ADD INDEX idx_emp_no (emp_no);	-- 인덱스를 만들고 데이터에 부여만 했기에 시간이 짧음

SELECT * FROM emp_se LIMIT 5;	-- 조회는 인덱스 부여전과 같음

-- 테이블 상태 확인 데이터 약 17MB(약 1000 페이지)
-- 인덱스 길이는 보조 인덱스만 약 5MB(약 300 페이지)
ANALYZE TABLE emp, emp_cl, emp_se;
SHOW TABLE STATUS;	-- 현재 스키마에 있는 모든 테이블 상테 조회 (안의 데이터는 보이지 않음)









-- 서버 종료 후 재시작 (cmd(관리자 권한으로 실행) > net stop mysql80 > net start mysql80)

USE db_index;


/* 인덱스가 없는 테이블을 읽었을때 */

-- 읽은 페이지의 수 / 2039
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';

SELECT * FROM emp WHERE emp_no = 100000;
-- 실행 계획보기 (하단 Excution Plan)
-- 30000 가까운 쿼리 코스트, 전체 테이블을 스캔
EXPLAIN SELECT * FROM emp WHERE emp_no = 100000;

-- 읽은 페이지의 수 / 3074
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';
-- 처음 2039 - 지금 3074 = 대략 1000페이지 정도 읽었음




/* 클러스터형 인덱스가 있는 테이블을 읽었을때 */

SELECT * FROM emp_cl WHERE emp_no = 100000;
-- 실행계획 확인 : 쿼리 코스트 1, 읽은 줄 1, 시간 0초
EXPLAIN SELECT * FROM emp_cl WHERE emp_no = 100000;

-- 읽은 페이지의 수 / 3075
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';
-- 이전 3074 - 지금 3075 = 1페이지 읽었음




/* 보조 인덱스가 있는 테이블을 읽었을때 */

SELECT * FROM emp_se WHERE emp_no = 100000;
-- 실행계획 확인 : 쿼리 코스트 0.35, 읽은 줄 1, 시간 0초
EXPLAIN SELECT * FROM emp_se WHERE emp_no = 100000;

-- 읽은 페이지의 수 / 3077
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';
-- 이전 3075 - 지금 3077 = 2페이지 읽었음







/*인덱스가 없는 테이블 범위로 조회하기*/

-- 읽은 페이지의 수 / 3077
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';

SELECT * FROM emp WHERE emp_no < 12000;
-- 실행 계획보기 (하단 Excution Plan)
-- 30000 가까운 쿼리 코스트, 전체 테이블을 스캔, 29만줄 읽음
EXPLAIN SELECT * FROM emp WHERE emp_no < 12000;

-- 읽은 페이지의 수 / 3077 -> 페이지수 차이 없음
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';





/* 클러스터형 인덱스 범위 조회 */

SELECT * FROM emp_cl WHERE emp_no < 12000;
-- 실행계획 확인 : 인덱스 사용, Index Range Scan (인덱스 범위 조회)
-- 쿼리 코스트 402.89
EXPLAIN SELECT * FROM emp_cl WHERE emp_no < 12000;
-- 실행 타입 range, 범위 만큼의 행수를 리턴




/* 보조 인덱스가 있는 테이블을 읽었을때 */

SELECT * FROM emp_se WHERE emp_no < 12000;
-- 실행계획 확인 : 인덱스 사용, Index Range Scan (인덱스 범위 조회)
-- 쿼리 코스트 899.81, 실행시간 0.047초
EXPLAIN SELECT * FROM emp_se WHERE emp_no < 12000;
-- 실행 타입 range, 범위 만큼의 행수를 리턴