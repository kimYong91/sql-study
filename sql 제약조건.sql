-- 데이터베이스(스티마 생성)
CREATE DATABASE test_db;

-- 데이터베이스 사용
USE test_db;

-- 테이블 생성
-- 제약조건 설정하기
CREATE TABLE employees (
	employee_id INT NOT NULL, -- 컬럼에서 제약조건
    first_name VARCHAR(50),	  -- 제약조건을 주지 않을 경우 기본 NULL 허용
    last_name VARCHAR(50),
    PRIMARY KEY (employee_id) -- 해당 컬럼을 기본키로 설정
);

-- 테이블의 정보 확인하기
DESCRIBE employees;


-- 복합 기본 키 설정하기
CREATE TABLE player (
	team_id INT NOT NULL,
    back_number VARBINARY(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY (team_id, back_number)
    -- team_id와 back_number을 조합하여 기본키로 만들수 있음.
    -- 각 컬럼은(team_id, back_number)은 중복될 수 있지만, 두 조합으로는 고유한 기본키 생성
);

-- 2개의 컬럼으로 기본키 구성 확인
DESC player;

CREATE TABLE members (
  member_id INT PRIMARY KEY	 -- 복합키 속성이 하나일 경우, 컬럼에서 제약조건을 지정할 수도 있다.
);

DESC members;

-- UNIQUE 제약 조건
-- 동일한 값이 두번 이상 나타나지 않도록
CREATE TABLE users (
	user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE		-- email열의 고유 보장, null 허용
);

DESCRIBE users;
SELECT * FROM users;

-- 체크 제약조건
CREATE TABLE adults (
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    CHECK (age >= 19)
    -- age 필드에 값이 들어올 때 19세 이상인지 체크
);
DESCRIBE adults;

SELECT * FROM adults;