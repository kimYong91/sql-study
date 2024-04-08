-- 집계함수
USE SCOTT;
SELECT * FROM EMP;

-- 집계함수의 결과는 단일행
-- 관심있는 attribute에 주로 사용
-- NULL 값들은 제외하고 요약 값을 추출

-- COUNT : 주어진 조건을 만족하는 행의 개수를 반환
SELECT COUNT(*) FROM EMP;		-- 직원의 수
SELECT COUNT(ename) FROM EMP;	-- 직원 이름의 수
-- 행의 값이 NULL인 경우는 제외
SELECT COUNT(mgr) FROM EMP;		-- 매니저의 수 (매니저가 없는 경우 제외)
SELECT COUNT(comm) FROM EMP;	-- 커미션의 수 (커미션 없는 경우 제외)

-- SUM : 숫자로 이루어진 열(속성, 애트리뷰트)의 총합을 계산
SELECT SUM(sal) FROM EMP;
SELECT SUM(comm) FROM EMP;	-- 관심있는 열에 NULL 값이 포함될 경우 제외하고 요약

-- AVG : 숫자로 이루어진 열(속성, 애트리뷰트)의 평균을 계산 -> 소수로 리턴
SELECT AVG(sal) FROM EMP;
-- ROUND 함수와 같이 사용하면 반올림 ROUND(소수숫자, 자리수)
SELECT ROUND(AVG(sal)) FROM EMP;		-- 0의 자리 반올림
SELECT ROUND(AVG(sal), 2) FROM EMP;		-- 소수점 2자리에서 반올림
SELECT ROUND(AVG(sal), -2) FROM EMP;	-- 십의 자리에서 반올림

-- MIN, MAX 열에서 최대값, 최소값을 찾음
SELECT MIN(sal), MAX(sal) FROM emp;
SELECT MIN(sal) AS 최소급여, MAX(sal) AS 최대급여 FROM EMP;
-- MIN, MAX는 숫자 이외의 다양한 데이터 형식에도 사용가능
SELECT MIN(ename), MAX(ename) FROM emp;
SELECT MIN(hiredate), MAX(hiredate) FROM emp;

-- STDDEV 표준분산, VAR_SAMP 분산
SELECT STDDEV(sal), VAR_SAMP(sal) FROM emp;


-- GROUP BY : 특정 컬럼의 값에 따라 행들을 그룹화
--  SELECT 컬럼명1, 집계함수(컬럼명2)
--  FROM 테이블명
--  GROUP BY 컬럼명1
--  컬럼명1 : 그룹화를 할 기준이 되는 열
--  컬럽명2 : 그룸에 적용할 집계함수의 대상이 되는 열
-- 주의사항 : GROUP BY 절에 지정된 열 외의 다른 열을 SELECT 절에 포함시킬수 없음

-- job 별로 평균 급여를 계산
SELECT job, AVG(sal) FROM EMP GROUP BY job;

-- 별칭 부여 
SELECT job AS 직무, AVG(sal) AS 평균급여 FROM EMP GROUP BY job;

-- job 별, 부서별로 평균 급여를 계산
SELECT job, deptno, AVG(sal) FROM EMP GROUP BY job, deptno;

-- GROUP BY 절의 순서
-- WHERE 절 다음 ORDER BY 절 이전에 뉘치해야 함
-- 부서별 평균급여를 평균급여가 높은 순으로 조회
SELECT deptno, AVG(sal) AS 평균급여
FROM EMP
GROUP BY deptno
ORDER BY 평균급여 DESC;

-- HAVING 절
-- GROUP BY 로 인해 생성된 그룹에 조건을 적용할 때 사용
-- WHERE 절과의 차이점
	-- WHERE절 : 테이블의 각 개별행에 대해 조건을 정의
	-- HAVING절 : 그룹화된 결과에 대해 조건을 정의
-- 평균 급여가 2000이상인 부서의 급여 조회
SELECT deptno, AVG(sal) AS 평균급여
FROM EMP
-- WHERE sal > 1500 	-- 원 테이블의 각행에 대하여
GROUP BY deptno
HAVING 평균급여 >= 2000;	-- 그룹화된 결과에 대해 조건
-- WHERE, GROUP BY, HAVING 절은 순서가 바뀔 수 없다.

-- WITH ROLLUP
-- 각 그룹별 소합계 및 총합계 계산
SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY deptno, job
WITH ROLLUP;