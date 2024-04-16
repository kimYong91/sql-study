USE tcl;

-- autocommit 활성화 여부 확인
SHOW VARIABLES LIKE 'autocommit';

-- ON 활서화
SET autocommit = 1;
-- OFF 비활성화
SET autocommit = 0;


CREATE TABLE person (
	name VARCHAR(255),
    age INT
);

-- autocommit 활성화 상태
INSERT INTO person VALUES ('홍길동', 30);

SELECT * FROM person; -- 바로 반영


-- 오토커밋 비활성화
SET autocommit = 0;

INSERT INTO person VALUES ('임꺽정', 40);

SELECT * FROM person; -- 세션1(현제 세션)에서 확인만 가능

-- 비활성화 상태시 반영 방법
COMMIT;

-- 이전 커밋 단위부터 작업 단위(크랜잭션)으로 끊어짐
INSERT INTO person VALUES ('전우치', 25);
SELECT * FROM person;
ROLLBACK;
SELECT * FROM person;

-- 이전 커밋으로부터 작업단위가 나누어짐 (트랜잭션)
INSERT INTO person VALUES ('김철수', 20);
INSERT INTO person VALUES ('마이콜', 25);
COMMIT;



-- 오토커밋 재활성화
SET autocommit = 1;
SHOW VARIABLES LIKE 'autocommit';