-- 인덱스 사용 실습
USE db_index;
-- 샘플 테이블 생성(sertbl, buytbl), 샘플.sql 실행

SELECT * FROM usertbl;
-- 인덱스 확인하기
SHOW INDEX FROM usertbl;
-- 인덱스 크기 확인하기
-- => 페이지의 크기 16384, 16KB / (페이지1개 크기 = 16KB) : 페이지의 수 1개
SHOW TABLE STATUS LIKE 'usertbl';


-- 인덱스 생성하기 : 단순한 보조 인덱스 (주소 컬럼 기준)
CREATE INDEX idx_usertbl_addr ON usertbl (addr);

SHOW INDEX FROM usertbl;			-- 인덱스 생성 확인
SHOW TABLE STATUS LIKE 'usertbl';	-- 테이블 상태 확인 => 적용되어 보이지 않음

-- 생성한 인덱스를 실제 적용하려면 ANALYZE로 분석해야 함
ANALYZE TABLE usertbl;

SHOW TABLE STATUS LIKE 'usertbl';	-- 테이블 상태 확인
-- 테이블의 인덱스 크기가 확인됨 16KB

-- 고유 인덱스 만들기
CREATE UNIQUE INDEX idx_uertbl_birthYear ON usertbl (birthYear);
-- 생성 불가 : 고유 인덱스를 만들기 위해서는 컬럼의 값이 고유해야 함
SELECT * FROM usertbl;

-- 컬럼의 값들이 고유한 경유 고유 인덱스 생성 가능
CREATE UNIQUE INDEX idx_uertbl_name ON usertbl (name);

SHOW INDEX FROM usertbl;		-- 인덱스 생성 확인

-- 고유 인덱스로 생성한 경우 해당 컬럼 기준 중복된 허용 불가
-- INSERT INTO usertbl
-- 	  VALUES ('BBC', '바비킴', 1972, '부산', '010', '1111111', '177', '2012-')


-- 복합 인덱스 만들기
CREATE INDEX idx_uertbl_name_birthyYear
	ON usertbl (name, birthYear);		-- 기준 컬럼 2개 이상
-- => 복합 인덱스일시 먼저 만든 인덱스 순서로 데이터를 찾음 (1. name > 2. birthYear)

    
SHOW INDEX FROM usertbl;				-- 인덱스 생성 확인

-- 복합 인덱스의 컬럼들을 사용해서 쿼리할 경우 인덱스를 통한 성능 향상
SELECT * FROM usertbl
	WHERE name = '윤종신' AND birthYear = '1969';
    
-- 쿼리 실행계획 확인하기 EXPLAIN
-- 인덱스가 있는 경우 가능한 인덱스와 key가 나오고, 검색한 행의 갯수가 효율적으로 찾아짐
EXPLAIN SELECT * FROM usertbl
	WHERE name = '윤종신' AND birthYear = '1969';

-- WHERE 컬럼에 인덱스가 없는 경우,
-- Full Table Scan 모든 테이블의 행을 다 찾아보고 결과를 알려줌
-- 가능한 인덱스도 없음
EXPLAIN SELECT * FROM usertbl WHERE height = 170;

SELECT * FROM usertbl;
-- 인덱스로 사용하는 컬럼은 고유값의 개수가 적은 경우 성능에 도움이 되지 않는다.
-- 예시 : 사람의 성별로 데이터가 쌓이는데 나누어지는 컬럼이 남, 여 말고 없다면 인덱스의 존재 의미가 없다.


-- 인덱스 삭제하기
DROP INDEX idx_uertbl_name_birthyYear ON usertbl;	-- 불가능
ALTER TABLE usertbl DROP INDEX idx_uertbl_name;		-- 가능

-- 기본키(클러스터형 인덱스)는 ALTER문으로만 제거 가능
-- 참조하고 있는 외래키가 있을 경우 참조 무결성에 의해 제거할 수 없음
ALTER TABLE usertbl DROP PRIMARY KEY;		-- 불가능

DESC buytbl;
SHOW INDEX FROM buytbl;

SELECT * FROM information_schema.referential_constraints;
-- 참조가 되어있는 경우 참조 무결성을 제거하고 삭제가 가능
ALTER TABLE buytbl DROP FOREIGN KEY buytbl_ibfk_1;
ALTER TABLE usertbl DROP PRIMARY KEY;