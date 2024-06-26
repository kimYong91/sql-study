USE SCOTT;

-- SCOTT 데이터베이스 탐색
SHOW TABLES;
DESC EMP;		-- 직원 정보 저장 테이블
-- 사원정보, 이름, 직업, 매니져, 고용일, 급여, 커머션, 부서번호

DESC DEPT;		-- 부서 정보 테이블
-- 부서번호, 부서이름, 위치

DESC SALGRADE; 	-- 급여 등급 테이블
-- 급여 등급, 최소급여, 최대급여


-- 전체 데이터 확인
SELECT * FROM EMP;

-- 프로덕션 에드리뷰트 : 속성 투영
-- 이름만 확인
SELECT ENAME FROM EMP;

-- 셀렉션 컨디션(조건식) : 조건 선택
-- 급여가 1000달러 이상인 직원만 선택
SELECT * FROM EMP WHERE SAL > 1000;

-- 셀렉션 + 프로젝션
-- 급여가 1000달러 이상이고, 부서번호가 10번인 직원의 이름만 조회
SELECT ENAME FROM EMP WHERE SAL > 1000 AND DEPTNO = 10;


-- 별칭 (AS) 사용하기
-- 1. 컬럼명에 별칭을 지정하면 쿼리 결과의 헤더로 사용
SELECT ENAME AS "직원명" FROM EMP;
SELECT ENAME AS "직원명", SAL AS "급여" FROM EMP;
-- AS는 생략 가능
SELECT ENAME "직원명", SAL "급여" FROM EMP;


-- 2. 테이블에 별칭 사용하기
-- AS E, AS D를 사용하여 줄일수 있음
SELECT EMP.ENAME, EMP.SAL, DEPT.DEPTNO, DEPT.LOC
FROM EMP
JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
-- AS E, AS D를 사용하여 줄일수 있음 * AS 생략 가능
SELECT E.ENAME, E.SAL, D.DEPTNO, D.LOC
FROM EMP AS E
JOIN DEPT AS D ON E.DEPTNO = D.DEPTNO;


-- WHERE 절 조건식
-- NOT (부정)
-- 부서가 10번이 아닌 직원 찾기
SELECT ENAME, DEPTNO FROM EMP WHERE NOT DEPTNO = 10;
-- IS NOT NULL 비교연산자 : NULL이 아닌 값인 행 선택
SELECT * FROM EMP WHERE SAL IS NOT NULL;

-- BETWEEN ... AND : 특정 범위내 값 찾기
-- WHERE 컬럼명 BETWEEN 값1 AND 값2;
-- 범위의 시작 값(값1)부터 번위의 끝값(값2)까지 조회하고, 두 값 모두 포함
-- 1. 날짜 범위
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1982-12-31';

-- 2. 숫자 범위
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000;

-- 3. 문자열 범위
SELECT ENAME
FROM EMP
WHERE ENAME BETWEEN 'A' AND 'D';

-- IN() : 주어진 목록 안의 값들 중 하나와 일치하는 행
-- OR 조건 여러개와 대체될 수 있음
-- WHERE 컬럼명 IN (값1, 값2, .....)
-- 쿼리문을 간결하게 만들고, 동적으로 여러조건을 포함해야 할 때 사용
SELECT ENAME, JOB
FROM EMP
WHERE JOB IN ('MANAGER', 'ANALYST', 'CLERK');

-- 동일한 결과
SELECT ENAME, JOB 
FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'ANALYST' OR JOB = 'CLERK';


-- LIKE
-- 문자열 패턴 매칭을 위해 사용
-- 와일드 카드
-- '%' : 0개 이상의 어느 위치에나 일치하는 문자
-- '_' : 정확히 일치하는 한 문자를 대신
-- 이름이 A로 시작하는 모든 직원 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'A%';

-- 이름에 A를 포함하는 모든 직원
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%';

-- 이름의 3번째 글자가 A인 직원
SELECT ENAME FROM EMP
WHERE ENAME LIKE '__A%'; -- <- 언더바(_)두개 들어가 있음 즉, A가 3번째에 위치함