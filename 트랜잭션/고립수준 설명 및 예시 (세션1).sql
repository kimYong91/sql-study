-- 트랜잭션 고립 수준
USE tcl;

-- 고립수준 확인하기
SELECT @@transaction_isolation;

-- 고립 수준 변경하기

/* 1. READ UNCOMMITTED */
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;

-- 읽기 (세션2에서 쓰기 전) => 홍길동 나이 30
SELECT * FROM person;

-- 읽기 (세션2에서 쓴 후) => 홍길동 나이 50
-- 세션 2 는 커밋을 하지 않았는데 변경한 내용이 반영되어 읽어짐 => READ UNCOMMITTED
-- 더티 리드(오손 읽기, Dirty Read)
-- 무효화 되는 데이터를 읽은 것에서 결과적으로 잘못된 결과를 읽게 됨
SELECT * FROM person;


-- 읽기 (세션2에서 트랜잭션 롤백 후) =>  홍길동 나이 30
-- 세션 2 에서 작업한 데이터가 원상복귀
SELECT * FROM person;

COMMIT;





/* 2. READ COMMITTED, 반복 불가능 읽기*/
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- 읽기 : 커밋 전 // 홍길동 -> 30
SELECT * FROM person WHERE name = '홍길동';

-- 반복 읽기 : 세션 2 커밋 후 // 홍길동 -> 50
SELECT * FROM person WHERE name = '홍길동';

-- 반복 읽기 시 다른 트랜잭션 작업 여부에 따라 이전의 결과와 다른 결과가 나오고
-- 동일한 이전 결과를 읽을 수 없는 현상 => 반복 불가능 읽기

COMMIT;		-- 트랜잭션 종료

-- 다음을 위해 원 데이터 초기화
UPDATE person 
	SET age = 30 
		WHERE name = '홍길동';





/* 3. REPEATABLE READ, 반복 가능 읽기 */
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

-- 읽기 : 처음 읽은 값 // 홍길동 -> 30
SELECT * FROM person WHERE name = '홍길동';

-- 반복 읽기 : 세션 2 커밋 후(홍길동 나이가 50으로 변경 됨) => 조회는 그대로 30
-- 트랜잭션 시작했을 때 처음 읽은 값을 스냅샷으로 저장하여
-- 반복해서 읽더라도 (트랜잭션 중에 다른 트랜잭션이 값을 변경하더라도) 처음 값을 읽어 옴
SELECT * FROM person WHERE name = '홍길동';

COMMIT;





/* 4. SERIALIZABLE, 가장 높은 고립 수준 */
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
-- 이 트랜잭션이 완료될 때까지 다른 트랜잭션은 데이터를 변경할 수 없음

SELECT * FROM person WHERE name = '홍길동';

COMMIT;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; -- 원상 복구