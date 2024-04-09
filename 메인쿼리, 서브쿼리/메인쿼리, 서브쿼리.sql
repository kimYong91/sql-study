-- 서브쿼리
USE SCOTT;

-- 특정 직원 'ALLEN'보다 급여를 많이 받는 직원 찾기
SELECT ENAME, SAL FROM EMP;

-- 서브쿼리 => 결과 (1600)확인 후
SELECT SAL FROM EMP WHERE ENAME = 'ALLEN';

-- 메인쿼리 => 비교조건으로 하드코딩
SELECT ENAME, SAL FROM EMP WHERE SAL > 1600;

-- 메인쿼리의 WHERE절 조건에 서브쿼리를 삽입 : 동적으로 조건이 설정 가능
SELECT ENAME, SAL FROM EMP 
	WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');
-- ^ 단일 행(single row) 서브쿼리
-- 비교 값의 타입에 맞게 서브쿼리 결과 값 맞추어야하고, 결과 값이 하나여야함

-- 특정 부서(30)의 평균급여보다 높은 급여를 받는 직원 조회
-- 집계함수를 사용하여 결과값이 단일행, -> 서브쿼리로 사용
SELECT AVG(SAL) FROM EMP WHERE deptno = 30;
-- 서브쿼리의 결과값을 where절의 조건으로 받는 메인쿼리
SELECT ENAME, SAL FROM EMP WHERE SAL > 1566.6667;

-- 메인 쿼리와 서브 쿼리를 하나의 쿼리로 사용
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE deptno = 30);


-- IN 함수 : 목록 안에 값이 포함되었는지 확인
SELECT * FROM EMP WHERE DEPTNO IN(10, 20, 30);

-- 서브쿼리
SELECT EMPNO FROM EMP WHERE SAL > 2000; -- 2000 보다 급여를 많이 받는 6명(행) 조회 결과

-- 메인쿼리
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME FROM EMP E 
	JOIN DEPT D ON E.DEPTNO = D.DEPTNO WHERE E.EMPNO IN (SELECT EMPNO FROM EMP WHERE SAL > 2000);

-- 서브쿼리 결과 20,30
SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES' OR DNAME = 'RESEARCH';

-- 메인쿼리 IN ( 20, 30의 결과에 해당하는 서브쿼리 )
SELECT * FROM emp 
WHERE deptno IN(SELECT deptno from dept where dname = 'sales' or dname = 'research');

-- 아래 실행문과 동일한 결과를 갖는다.
SELECT * FROM emp 
WHERE deptno IN(20, 30);


-- ANY 함수 :
SELECT SAL FROM EMP WHERE DEPTNO = 20; -- 서브쿼리 결과
-- ^ 20번 부서 직원의 급여 (5행) 결과값 (800, 2975, 3000, 1100, 3000)

-- 메인쿼리의 ANY 함수에 사용 (비교 연산자와 함께 사용)
-- 하나라도 큰 것이 있으면 참 => 800보다 많이 받는 모든 직원
SELECT ENAME, SAL FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 20);


-- ALL 함수 :
-- (800, 2975, 3000, 1100, 3000) 중 여러 행의 결과 값이 모두보다 이상이어야 참
-- 3000(최대값)보다 큰 경우만 참
SELECT ENAME, SAL FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 20);
-- 800(최소값)보다 작은 경우만 참
SELECT ENAME, SAL FROM EMP WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO = 20);


-- EXISTS 함수 : 주로 상호 연관 서브쿼리에서 유용하게 사용
-- 상호연관 쿼리 : 메인 쿼리의 칼럼을 서브쿼리에서 사용하는 것
-- 각 부서에 대해 직원이 존재하는 경우 참, 존재하지 않으면 거짓
SELECT DNAME, LOC FROM DEPT D WHERE EXISTS(SELECT 1 FROM EMP E WHERE E.DEPTNO = D.DEPTNO);


