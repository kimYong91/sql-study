## 데이터베이스
- 체계적으로 조직된 데이터의 집합
- 다양한 형태(텍스트, 숫자, 파일 등)으로 저장 가능
- 서로 관련성이 있어서 의미 있는 정보 형성
- 여러 사용자(사람, 어플리케이션)가 동시에 접근이 가능, 작업을 수행
- 안전성과 무결성(Integrity) : 데이터의 정확성과 일관성을 유지
- 제약조건(Constraint)이라고 하는 특성을 가짐
- 보안, 백업 및 복구 등을 보장

## 데이터베이스의 구성요소
- 데이터 : 저장된 원시 정보
- DBMS(DataBase Management System) : 데이터베이스를 관리하는 소프트웨어
 - MySQL, Oracle, PostgresSQL, MariaDB등
- 데이터베이스 서버 : DBMS가 실행되는 컴퓨터 시스템
- 스키마(Schema) : DB의 구조를 정의하는 메타 데이터 집합

## 데이터 모델(Data Model)
- 현실세계의 정보를 시스템 내에서 어떻게 구조화하고 조직화할지에 대한 청사진
- 예) 도서과 DB : 책-제목, 저자, 출판년도 (책에 대한 메타데이터)
 1. 개념적 데이터 모델 (Conceptual) : 높은 수준의 추상화
  - 비전문가나 일반인들도 요구사항을 이해하고 분석할 수 있게 설계
 2. 논리적 데이터 모델 (Logical)
  - 개념적 데이터모델에서 더 구체화
  - 데이터의 속성이나, 키, 관계 등을 명시
  - 특정 DBMS에 의존하지 않고 명시
 3. 물리적 데이터 모델 (Phydical)
  - 특정 DBMS에 저장이 될 수 있게, 논리적 데이터 모델을 디테일하게 설계
  - DBA(데이터베이스 관리자) 또는 개발자가 사용

 - 데이터 모델의 종류
  1. 계층형 데이터 모델 (Hierachical 부모-자식 관계, 트리 구조)
  2. 네트워크형 데이터 모델 (Network 다 대 다 관계 표현, 구조가 복잡해짐)
  3. 관계형 데이터 모델 **(Reational가장 널리 사용 되는 모델)
  4. 객체 지향 데이터 모델 (Object데이터를 객체로 표현)
  5. NoSQL (Not Only SQL) 비관계형 데이터 모델, (문서, 키-값, 그래프 등), 유연성, 확장성

## 논리적 데이터 모델의 구성 요소
- 엔티티(Entity) : 실제 세계의 객체 -> 데이터베이스에서 테이블로 표시
   - 각 엔티티는 속성(Attribute)를 가지고 있음.
- 속성(Attribute) : 엔티티의 특성 -> DB에서는 테이블의 컬럼으로 구현
   - 엔티티를 설명하는 데이터
- 관계(Relationship) : 엔티티-엔티티 간의 연관성, 상호작용 -> DB에서는 외래키로 표현
- 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
   - *기본 키 (Primary Key)* : 테이블의 행을 고유하게 식별하는 키 NULL 불가
   - *외래 키 (Foreign Key)*: 다른 테이블의 행(기본 키)을 참조하는 키 (관계 정의시 사용)
   - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
   - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
   - 복합 키 : 두 개 이상의 속성을 조합하여 만든 키

## 관계형 데이터베이스 모델
  수학 관계대수(Relational Algebra)에서 영감을 받아 데이터의 집합(릴레이션)을 테이블로 표현한 모델
  - 테이블 : 데이터를 저장하는 기본 단위 (릴레이션, 엔티티)
  - 행(Row) : 테이블에서 개별 데이터 항목 (튜플, 레코드)
  - 열(Column) : 테이블에서 데이터의 속성 (애트리뷰트, 필드)
  - 도메인(Domain) : 속성이 가질 수있는 범위, 집합 (Data Type)
  - 스키마 : 데이터베이스의 구조적인 설계 (구조와 제약조건을 정의하는 SQL문)

## 스키마와 상태
  - 스키마 : DB의 구조나 설계
     - 구체적인 데이터 항목이나 값은 포함하지 않음.
     - 데이터베이스 설계과정 초기에 정의되고, 시간이 지나도 상대적으로 변경되지 않음
     - 정적인 특성, 근본적인 요소
  - 상태(Status) : 특정 시점에 데이터베이스 실제로 저장된 데이터베이스의 집합
     - 시간에 따라 변할 수 있고, 지속적으로 업데이트
     - DB의 일관성과 무결성을 유지하기 위해, 스키마의 규칙과 제약조건을 따라야 함.
     -동적인 특성, 변화하는 데이터의 실체

# 3 Schema Architrcture
 1. 내부 스키마 : DB의 물리적 저장 구조, 최하위수준의 추상화
   - 인덱스, 압축, 암호화등 DBA(데이터베이스 관리자)가 다루는 영역
 2. 개념 스키마 : DB의 전체적인 논리적 구조, 중간수준의 추상화
   - 데이터의 관계, 데이터의 제약조건 등, DB설계자, 분석가가 다루는 영역
 3. 외부 스키마 : 사용자 관점에서 보는 DB의 일부분, 최상위수준 추상화
  - 애플리케이션이 접근하는 View, 최종 사용자, 응용프로그램 개발자가 다루는 영역

# SQL (Struectured Query Language)
 - 관계형 데이터베이스(RDBMS)에서 데이터를 관리하기 위해 사용하는 표준화된 언어
 - 데이터 정의 언어 (Data Definition Language) : DDL
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
 - 데이터 조작 언어 (Data Manipulation Language) : DML
  - INSERT, UPDATE, DELETE
 - 데이터 질의 언어 (Data Query Language) : DQL
  - SELECT
 - 데이터 제어 언어 (Data Control Language) : DCL
  - GRANT, REVOKE
 - 트랜잭션 제어 언어 (Transaction Control Language) : TCL

## DCL (Data Control Language)
 - 데이터의 접근 권한을 제어하고 관리하는 명령어들의 집합
 1. GRANT : 권한 부여
  - 특정 사용자나 사용자 그룹에게
  - 특정 데이터베이스(스키마)나 특정 테이블에서
  - 명령할 수 있는 권한 부여
  ```SQL
  GRANT SELECT ON database_name.table_name
   TO '사용자명'@'호스트명'
  ```
 2. REVOKE : 권한 징수
  - 사용자에게 부여된 권한이 더이상 필요하지 않거나
  - 보안 상의 이유로 권한 회수할 때 사용 
  ```SQL
  REVOKE SELECT ON database_name.table_name
   FROM '사용자명'@'호스트명';
  ```
- 권한 부여나 회수는 DB의 보안과 직접적인 관련이 있음으로 신중히 할 것.
- 일반적으로 사용자에게 최소한(필요한)의 권한만 부여하는  **최소 권한 원칙** 따름.
- 데이터에 대한 무단 접근을 방지하고, 시스템 보안 수준을 높일 수 있음.

* 유저 생성 SQL문
```sql
CREATE USER '사용자명'@'호스트명' IDENTIFIED BY '비밀번호'
```
* 생성한 유저 삭제 SQL문
```sql
DROP USER '사용자명'@'호스트명';
```

## key
- 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
  - *기본 키 (Primary Key)* => PK
    - 테이블의 행을 고유하게 식별하는 키
    - 하나 이상의 컬럼의 조합
    - NULL 불가 
    - 테이블 내의 각 레코드(행)을 유일하게 식별할 수 있어야 함.
  - *외래 키 (Foreign Key)* => FK
    - 다른 테이블의 행(기본 키)을 참조하는 키 
    - 두 테이블 간의 관계 정의시 사용
    - 참조 무결성 유지하는데 사용
  - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
    - 후보키에서 기본키가 선택
  - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
  - 복합 키 : 두 개 이상의 속성을 조합하여 만든 키
  - 고유 키 : 모든 행에 대해서 고유한 값을 가져야 하는 속성 (NULL 허용)

## 제약조건 (Constaint)
  - 무결성(Integrity) : DB에서 저장된 데이터의 일관성과 정확성을 지키는 것.
  1. NOT NULL
    - 해당 컬럼(속성)에는 NULL 값이 허용되지 않음.
    - 반드시 유효한 값이 있어야 함.
  2. UNIQUE
    - 해당 컬럼의 각 행은 서로 다른 값을 가져야 함.
    - 중복된 값 불가
    - NULL불가
  3. PRIMARY KEY
    - 각 행을 유일하게 식별할 수 있는 열(또는 열의 조합)
    - NOT NULL, UNIQUE
  4. FOREIGN KEY
    - 한 테이블의 열이 다른 테이블의 PK를 참조
    - 참조 무결성 유지
    - 테이블의 관계를 정의
  5. CHECK
    - 해당 속성(컬럼, 열)에서 입력될 수 있는 데이터의 범위를 제한
    - 조건을 만족하는 데이터만 입력 가능
    - 0 < 나이 < 200 : 특정 범위
  6. DEFAULT
    - 해당 속성에 대한 기본값을 설정
    - 값이 명시 되지 않으면 지정된 기본 값이 자동으로 입력
  7. AUTO_INCRREMENT
    - MySQL에서 사용하는 특수 제약 조건
    - 기본 키에 주로 사용되고, 새로운 행(row, 레코드)가 추가 될 때마다 자동으로 숫자 증가
  8. BINARY (B)
    - 해당 칼럼이 이전데이터
  9. UNDIGNED
    - 부호가 존재하지 않음. 음수 값을 혀용하지 않음 => 양수
  10. ZEROFILL
    - 해당 숫자의 열이 특정 길이로 고정되어야 하는 경우
    - 해당길이보다 부족하면 왼쪽에 0이 채워짐
    - 예시. 007
  11. GENERATED
    - 해당 열의 값이 자동으로 생성.
    - 특정 규칙에 따라 숫자가 증가하거나 문자열이 생성 등.

## 속성 데이터 타입
1. 숫자형 데이터 타입
  - INT : 정수 4byte
  - DECIMAL (M, N) : 고정 소수점 숫자, 정확한 소수 계산에 필요 M 총 자릿수, N 소수점 이하 자릿수
  - FOLAT, DOUBLE : 부동 소수점 소수 4byte, 8byte

2. 문자열 데이터 타입
  - CHAR(N) : 고정 길이 문자열, N은 문자열의 길이, 문자열이 N보다 짧으면 공백으로 채워짐.
  - VARCHAR(N) : 가변 길이 문자열, N은 문자열의 최대 길이, 실제 사용된 길이만큼만 저장공간 차지, 기본값 : 255바이트, MySQL 버전에 따라 최대 바이트가 다름
  - TEXT : 긴 텍스트를 저장, 최대 65,535 바이트
  - MEDIUMTEXT : 최대 16MB까지 저장
  - LONGTEXT : 최대 4GB까지 저장

3. 날짜, 시간 데이터 타입
  - DATE : 'YYYY-MM-DD'
  - TIME : 'HH:MM:SS'
  - DATETIME : 'YYYY-MM-DD HH:MM:SS'
  - TIMESTAMP : 유닉스 타임스템프 기반 날짜 시간정보 저장 (1970-01-01 -> 32비트 정수)

4. 이진 데이터 타입
  - BINARY(N) : 고정길이 이진데이터 (이미지, 파일 등 저장에 사용)
  - VARBINARY(N) : 가변길이
  - BLOB : 이진 대용량 객체 저장에 사용 Binary Large OBject, 4GB 저장

5. 논리 데이터 타입
  - BOOLEAN : TRUE, FALSE 값 저장, 내부적으로 TINYINT(1)로 처리 => 0 또는 1

6. 열거형
  - ENUM : 미리 정의된 값 중 하나를 저장 ENUM('mon', 'tue', 'wed'......)

- 도메인 무결성 제약조건
  - 릴레이션 내 튜플들이 각 속성의 도메인에 지정된 값만 가져야 하는 조건
  - 데이터 타입, NULL 허용 NOT NULL, DEFAULT, CHECK 제약 조건 등으로 제약조건 가짐

## 테이블 생성
- CREATE : DDL (데이터 정의어)
- 데이터베이스 생성
```SQL
CREATE DATABASE 데이터베이스명;
CREATE DATABASE IF NOT EXISTS 데이터베이스명;  -- 데이터베이스 존재 확인하고 만듬
USE 데이터베이스명;  -- 특정 데이터베이스 사용
```
- 테이블 생성 문법
```SQL
CREATE TABLE 테이블명 (
   컬럼명1 데이터타입 제약조건,
   컬럼명2 데이터타입 제약조건,
   ...
   ...
   PRIMARY KEY (하나 또는 그 이상의 컬럼)
);
```

## 외래 키 참조
 - 참조 무결성 제약조건
 - 한 테이블의 컬럼이 다른 테이블의 키(기본 키)를 참조
 - 외래키 컬럼에 참조 위치에 존재하지 않는 값을 넣을 경우
 - 참조 무결성을 위반하게 되어 실행되지 않는다. (참조 무결성 제약조건)
 - 데이터 관계의 일관성을 보장

 ```sql
 FOREIGN KEY (컬럼명) REFERENCES 참조할테이블명(참조할컬럼(기본키)명)
 ON DELETE [CASECADE/SET NULL/NO ACTION/SET DEFAULT]          -- 삭제할 때 옵션
 ON UPDATE [CASECADE/SET NULL/NO ACTION/SET DEFAULT]          -- 수정할 때 옵션
 ```

- 레퍼런스 옵션
   1. CASECADE : 
     - 부모 테이블(참조하는 테이블)에서 삭제되거나 키 값이 변경되면
     - 자식 테이블에서도 동일하게 삭제되거나 변경 됨.
     - 일관성을 유지하는데 도움이 되는 옵션.
   2. SET NULL
     - 부모 테이블(참조하는 테이블)에서 삭제되거나 키 값이 변경되면
     - 자식 테이블(외래 키를 가진 테이블)의 행의 열이 NULL로 변경 됨.
     - 관련 데이터를 삭제하지 않고 유지.
   3. NO ACTION
     - 참조된 행의 변경 또는 삭제 자체를 하지 않음.
   4. SET DEFAULT
     - 삭제나 수정될 때 사전에 정의된 기본 값으로 설정

## ALTER
 - DDL (데이터 정의어), 데이터베이스 및 객체의 구조를 수정하는데 사용
 - ALTER TABLE
   - 테이블의 열을 추가, 삭제, 타입 변경 등의 수정 작업을 할 수 있음.
   1. ADD (추가)
      ```SQL
      ALTER TABLE 테이블명
      ADD 컬럼명 데이터타입
      ```
   2. DROP (삭제)
      ```SQL
      ALTER TABLE 테이블명
      DROP COLUMN 컬럼명
      ```
   3. MODIFY 데이터 타입 수정
      ```SQL
      ALTER TABLE 테이블명
      MODIFY COLUMN 컬럼명 새로운데이터타입
      ```
   4. CHANGE 열이름 변경 (MySQL의 경우)
      ```SQL
      ALTER TABLE 테이블명
      CHANGE COLUMN 컬럼명 새로운컬럼명 새로운데이터타입;
      ```
   5. RENAME 테이블 이름 변경
      ```SQL
      ALTER TABLE 테이블명
      RENAME TO 새로운테이블명;
      ```

## CONSTRAINT 제약조건명 (제약조건 이름 명시하기)
- 제약조건은 생성시 이름을 생략하고 만들 수 있음
- 생략하고 만들 경우 자동으로 제약조건의 이름이 부여 됨
- 생성 시 'CONSTRAINT 제약조건명'이 부여되면, 제약조건 이름을 명시할 수 있음
- 제약조건의 이름을 확인하기 위해서는 DB객체나 DDL을 확인하면 됨.

```sql
-- 1. information_schema 오브젝트를 통해 확인
   -- CONTRAINT_NAME 필드 : 제약조건의 이름
   SELECT * FROM information_schema.table_constraints
   WHERE table_name = '테이블명';  -- 테이블명

-- 2. DDL을 통해 확인
-- SHOW CREATE TABLE 스키마명.테이블명;
-- 워크벤치의 경우 open value in viewer
   SHOW CREATE TABLE employees;
```

## DML (데이터 조작어)

### INSERT (데이터 삽입)
- DB의 테이블에 새로운 데이터 행을 추가하는데 사용하는 SQL
- 문법
```sql
-- 컬럼을 지정하는 방식
-- INSERT문에 명시된 열의 순서대로 값을 입력.
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
VALUES (값1, 값2, ...)

-- 컬럼을 지정하지 않는 방식
-- 테이블 정의(DDL)에 명시된 열의 순서대로 값을 입력해야 됨.
INSERT INTO 테이블명
VALUES (값1, 값2, ...)

-- 여러 행을 동시에 삽입하기 (콤마로 구분)
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
VALUES (값1, 값2, ...), -- 첫번째 행
       (값1, 값2, ...), -- 두번째 행
       ...              -- N번째 행
```
- 주의사항
   - 해당 열의 데이터 타입 또는 제약조건을 준수하지 않으면 삽입할 수 없음.
   - NOT NULL : 반드시 값을 입력해야 함.
   - UNIQUE : 중복값을 넣을 수 없음.
   - AUTO_INCREMENT : 값을 명시하지 않아도 자동 값 할당
   - 데이터 무결성을 유지

- 대량의 샘플 데이터 삽입
```SQL
INSERT INTO 테이블명 (칼럼명1, 칼럼명2, ...)
  SELECT문
```
  - SELECT문으로 조회한 다른 테이블의 데이터를 대량으로 입력
  - 테이블의 컬럼과 SELECT문으로 조회한 컬럼의 데이터타입이 일치해야 함.

## WHERE 절
  - SQL 쿼리에서 데이커를 필터링하기 위해 사용되는 조건절
  - condition (조건문) 및 논리, 비교 연산자를 사용해서 특정 기준 만족하는 데이터만 선택

  1. 비교 연산자
    - '=' : 같다
    - '!=' 또는 '<>': 같지 않다.
    - '>', '>=' : 크다, 크거나 같다.
    - '<', '<=' : 작다, 작거나 같다.
  2. 논리 연산자
    - AND : 모든 조건 참이면 참 (조건1 AND 조건2)
    - OR : 조건 하나라도 참이면 참 (조건1 OR 조건2)
    - NOT : 조건 결과 반전  (NOT 조건1)

### UPDATE
  - 테이블에서 기존 행(튜플)에서, 하나 이상의 열(속성) 데이터를 수정할 때 사용
  - 문법
   ```SQL
   UPDATE 테이블명
   SET 컬럼명1=값1, 컬럼명=값2, ....
   WHERE 조건문
   ```

   - SET : 하나 이상의 열(속성) 데이터를 수정, 콤마로 구분
   - WHERE절 : 어떤 행을 수정할지 결정
   - WHERE절을 생략하면 테이블의 모든 행이 수정됨 (주의)
   - 데이터 수정 작업을 진행할 때에도, 데이터 타입과, 제약 조건들을 준수하여 무결성 위반되지 않게 해야 함

### DELETE (삭제)
  - 테이블에서 특정 조건을 만족하는 행을 삭제
  ```SQL
  DELETE FROM 테이블명
  WHERE 조건문
  ```
  - WHERE절을 생략하면 테이블의 모든 행이 상제됨. (주의)
  - 정확한 조건을 지정하지 않으면 의도하지 않은 데이터가 삭제
  - 한 번 삭제된 데이터는 복구되지 않으므로 데이터 백업에 주의
  - 참조 무결성 제약조건을 위배할 경우 데이터 삭제에 실패하거나,
  - 연쇄적(CASCADE 레퍼런스 옵션)으로 삭제될 수 있음.

## DQL (데이터 질의어, Data Query Language)
- DB에서 데이터를 조회하는 데 사용
- 데이터를 조작하거나 수정하지는 않음.
- DB 서버에 Data를 요청하는 것
### SELECT
- 기본 구조
```sql
-- 특정 열 선택 : Projection (π) Attribute
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명;

-- 테이블의 모든 데이터 조회
SELECT *
FROM 테이블명;

-- 특정 조건 선택 : Selection (σ) Condtion 
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명
WHERE 조건식;

```
- * (asterisk) : 테이블의 모든 열을 선택하겠다.
- 셀렉션 (컨디션)
   - σ 가격 > 8000 (상품) : 가격이 8000원 이상인 행들만 선택
      `SELECT * FROM 상품 WHERE 가격 > 8000;`
- 프로젝션 (애트리뷰트)
   - π 이름, 주소 (고객) : 고객 테이블에서 이름 주소 속성만 선택
      `SELECT 이름, 주소 FROM 고객`

- 별칭 (AS) 사용하기
   `SELECT 컬럼명 AS 별칭 FROM 테이블명 AS 별칭`
   1. 컬럼명에 별칭을 지정하면 쿼리 결과의 헤더로 사용
   2. 테이블명에 별칭을 사용하면 쿼리문의 테이블을 간결하게 사용할 수 있음 -> 조인문에 사용
   3. AS 생략 가능

- BETWEEN ... AND
   - 특정 범위 내 값을 찾기
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 BETWEEN 범위1 AND 범위2;
   ```
   - 특정 컬럼의 범위를 조회하고 범위1, 범위2값 모두 포함
   - 날짜, 숫자, 문자열 등 사용가능

- IN
   - 주어진 목록 안의 값들 중 하나와 일치하는 행 => OR 조건
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 IN (값1, 값2, ...);
   ```
   - IN : 컬럼 = 값1 OR 컬럼 = 값2;
   - NOT IN : 컬럼 !=값1 AND 컬럼 !=값2;

- LIKE
   - 문자열 패턴 매칭
   - '%' 0개 이상의 아무 문자, '_' : 정확한 한 문자 대신
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 LIKE '패턴'
   ```
   - A로 시작하는 경우 'A%'
   - A를 포함하는 경우 '%A%'

 - ORDER BY
   - 단일열 또는 두 개 이상의 열을 기준으로 오름차순 또는 내림차순으로 정렬
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   ORDER BY 컬럼명 ASC|DESC, ....
   ```

 - LIMIT 
    - 출력 결과 수 제한
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   LIMIT 제한할 행개수
   OFFSET 시작할 행번호
   ```
    - OFFSET과 함께 사용하면 대량의 데이터 페이지네이션에 사용

  - DISTINCT
    - 중복된 결과 제거하고, 유일하고 고유한 값만 남기기 위해 사용
   ```SQL
   SELECT DISTINCT 컬럼명, ...
   FROM 테이블명
   ```

### 집계 함수
  - 데이터베이스에서 여러 행으로부터 단일 결과 값을 도출하는 데 사용
  - 데이터 분석, 요약 등에 유용하게 활용
  - COUNT, SUM, AVG, MIN, MAX 등

  - GROUP BY
  ```SQL
  SELECT 그룹기준컬럼명 ..., 집계함수(집계컬럼)
  FROM 테이블명
  [WHERE 조건식]
  GROUP BY 그룹기준컬럼명 ...
  [HAVING 그룹 조건식]
  [ORDER BY 정렬기준컬럼]
  ```
    - 그룹기준컬럼명 : 그룹화를 할 기준이 되는 열
    - 집계컬럼 : 그룸에 적용할 집계함수의 대상이 되는 열

    - WITH ROLLUP
      총합 또는 중간 합계가 필요할 때 GROUP BY 절과 함께 사용
      ```SQL
      SELECT 그룹기준컬럼명 ...., 집계함수(집계컬럼)
      FROM 테이블명
      GROUP BY 그룹기준컬럼명 ...
      WITH ROLLUP
      ```

### JOIN 데이터 결합
- JOIN
  - 두 개 이상의 테이블을 묶어서(결합) 새로운 결과의 집합(result set)을 만들어내는 것
- JOIN의 종류
  1. INNER JOIN : 두 테이블의 교집합
    - 양쪽 테이블에 모두 존재하는 데이터(일반적으로 기본키와 외래키)를 결합
  2. OUTER JOIN : 다른 테이블과 결이 매칭되지 않는 경우도 데이터 포함
    1. LEFT OUTER JOIN
    2. RIGHT OUTER JOUN
    3. FULL OUTER JOIN
  3. SELF JOIN
    - 같은 테이블을 두 번 참조하여 결합
  4. CROSS JOIN
    - 두 테이블 간의 가능한 모든 조합
    - Cartesian Product
  
  - 명시적 JOIN, 암시적 JOIN
    - 암시적 조인 (Implicit join)
      - WHERE절에 JOIN 컨디션을 명시하는 방식
      - 오래된 조인 문법, 복잡한 쿼리 작성 시 실수 가능함
    - 명시적 조인 (Explicit join)
      - JOIN 키워드를 사용해서 테이블을 결합
      - ON 키워드에 JOIN 컨디션을 명시
      - 가독성 및 유지보수성 향상

- 기본문법
```sql
SELECT 컬럼명, ..
FROM 테이블명1
[INNER|LEFT|RIGHT] JOIN 테이블명2 ON 테이블1.공동컬럼 = 테이블2.공동컬럼
```
  - JOIN 다음에 결합한 테이블명
  - ON 다음에 (join condition)
  - 일반적으로 테이블명을 줄인 약칭을 사용
  - JOIN키워드 앞에 [INNER|LEFT|RIGHT] 생략할 경우 INNER JOIN

  - 등가 조인(equi join)과 비등가 조인(non-equi join)
    - 등가 조인 : 등호(=)을 동해서 2개 이상의 테이블 결합
    - 비등가 조인 : 등호를 제외한 비교연산자를 통해 테이블 결합

  - USING 구문과 NATURAL JOIN
    - USING 두 테이블에서 공통된 열 이름이 있을 때 유용
    - NATURAL JOIN 공통 열이 존재할 때 조건 명시 없이 사용
    - 가독성 및 간결성 향상
    - 주의사항
      - 서로 다른 테이블의 JOIN 조건과 별개의 동일이름 동일타입이 존재할 경우, 예측 불가능한 결과를 가져올 수 있음
      - 예) 직원 테이블의 NAME = 직원이름, 문자열
            부서 테이블의 NAME = 부서명, 문자열

### SubQuery, 서브쿼리, 부속질의
  - 다른 SQL 쿼리 내부에 포함되어 있는 쿼리
    - 주 쿼리 (Main Quqry) 
    - 부 쿼리 (Sub Quqry)
  - 서브쿼리는 괄호 (...) 내부에 작성이 되어 주 쿼리와 구분됨
  - 서브쿼리의 결과는 단일 행 또는 다중 행 결과를 반환
  - 서브쿼리는 주 쿼리보다 먼저 실행되고, 서브쿼리의 결과 주 쿼리에 사용
  - 서브쿼리 사용처
    - WHERE절, SELECT절, FROM절, HAVING절 등...
    - WHERE절 : 데이터 필터링을 하기 위해 사용

  1. 단일 행(single row) 서브쿼리
    - 반드시 하나의 행만 반환해야 함
    - 하나의 결과값만 나오는 쿼리를 서브쿼리로 작성하거나
    - 집계함수 등을 사용하여 반드시 하나의 행이 결과값으로 갖도록 보장해야 함
    - 단일 행 서브쿼리는 =, >, < 등의 비교령산자와 함께 사용
    ```SQL
    SELECT 컬럼명.. FROM 테이블명 WHERE 조건 = (서브쿼리)
    ```

  2. 다중 행(multi row) 서브쿼리
    - 쿼리 실행 결과로 여러 행을 반환하는 서브쿼리
    - IN, ANY, ALL, EXISTS 등의 연산자와 함께 사용
    ```SQL
    SELECT 컬럼명, .. FROM 테이블명 WHERE IN ( 서브쿼리 );
    ```

    1. IN(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 하나라도 동일하면 참.
    2. ANY(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 하나라도 동일하면 참.
      - IN은 비교연산자를 사용하지 않고, ANY는 비교 연산자를 사용한다.
    3. ALL(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 모두 동일하면 참.
      - 비교연산자 사용
      - 비교조건 < ALL (10, 20, 30) : 최소값 (10보다 작은)
      - 비교조건 > ALL (10, 20, 30) : 최대값 (30보다 큰)
    4. EXISTS(서브쿼리) : 서브쿼리의 결과가 하나라도 존재하면 참.

    - 서브쿼리를 사용하는 위치에 따라 분류
      1. WHERE절 : 특정 기준에 맞는 데이터 필터링을 위해 서브쿼리 사용
      2. SELECT절 : 서브쿼리를 사용한 결과 값을, 메인쿼리의 결과에 포함
        - 단일 행을 반환하여 사용
        - 데이터베이스에 따라 성능 및 비용 문제가 발생할 수 있음 (많은 양의 행일 경우 그 행 만큼 서브쿼리가 반복실행 되기 때문.)
        - 쿼리의 결과를 유연하게 동적으로 표현하고 싶을때 사용
      3. FROM절 : 인라인 뷰(Inline View)
        - 서브쿼리가 임시 테이블처럼 동작하게 하여 메인 쿼리에 사용

### 내장함수
  - MySQL에서 사용자 정의 변수 사용하기
    - 사용자 정의 변수는 '@' 기호로 시작
    - 변수 설정
    ```sql
    SET @변수이름 = 값;     -- 변수 선언
    SELECT @변수이름        -- 변수 사용
    ```

  1. 제어흐름 함수 (IF, CASE, IFNULL, NULLIF ...)
  2. 문자열 함수 (CONCAT, SUBSTRING, LENGTH ...)
  3. 수학 함수 (ABS, CEIL, ROUND, FLOOR, SQRT, RAND ...)
  4. 날짜시간 함수 (NOW, CURDATE, CURTIME, DATE, TIME)
  5. 시스템 정보 함수 (USER, DATABASE ...)

## 뷰 View
  - 하나 이상의 테이블에서 가져온 가상의 테이블
  - 일반 사용자 입장에서는 테이블과 동일하게 사용하는 객체

  - 뷰의 특성
    - 기본적으로 읽기 전용의 객체
    - SQL 쿼리문을 저장하는 형태로 DB내에 정의
    - 복잡한 쿼리를 간단하게 재사용 (단순화)
    - 필요한 데이터를 선별적으로 노출 (보안)

  - 뷰의 생성
    ```SQL
    CREATE VIEW 뷰이름 AS
    SELECT 컬럼... FROM 테이블명 WHERE 조건...
    ```

  - 뷰의 작동 방식
    1. 사용자가 뷰를 조회 
    2. 뷰(SELECT문)의 쿼리문이 실행 => 테이블
    3. 쿼리의 결과가 반환
    4. 사용자에세 전달


# 데이터베이스 설계

## 데이터베이스 설계과정
  - 프로젝트의 진행단계
    - 폭포수(waterfall 모델)
      - 소프트웨어 공하에서 전통적으로 사용되는 모델
      - 각 단계를 순차적으로 진행 : 앞 단계가 끝나면 다음 단계 수행
        1. 프로젝트 계획
        2. 업무분석
        3. 시스템 설계
        4. 프로그램 구현
        5. 테스트
        6. 유지보수
  - 데이터 베이스의 생명 주기
    1. 요구사항 분석
      - 실제 사용자들의 요구사항을 듣고, 관리해야할 데이터의 종류를 이해하고, 분석해서 DB 구축의 범위 지정
    2. 설계
      - 분석된 요구사항을 기초로 데이터베이스 스키마를 도출
      1. 개념적 모델링 : 요구사항에서 중요한 개념을 Entity로 도출하여 Entity 와 Relation의 도면 => ERD(ERDiagram)
      2. 논리적 모델링 : 각 개념(Entity)을 관계 데이터 데이블로 구체화 매핑(mapping)
      3. 물리적 모델링 : DB의 객체, 인덱스, 뷰 등을 정의
    3. 구현
      - 실제 스키마를 DBMS에서 생성
    4. 테스트
      - 생성된 데이터베이스가 요구사항을 만족시키는지 검증, 필요한 경우 설계 수정
    5. 유지보수
      - 데이터베이스를 운영하고, 운영 중 발생하는 사항에 대해 변경, 최적화, 모니터링 등...

## 요구사항 분석
  - 담당자와 인터뷰를 하거나 설문조사 등을 통하여 요구사항을 수집
  - 실제 문서를 수집하여 분석
  - 기존에 존재하는 DB를 분석
  - 워크숍을 열어서 사용자, 개발자, 분석가(이해관계자) 등이 참여하여 요구사항을 정의하여 합의
  - 업무와 연관된 모든 부분을 살펴보고 분석

## 설계 - 개념적 모델링
  - 수집되고 분석된 요구사항에서 업무의 핵심개념을 추출
  - ER(Entity - Relation) 모델
  - 실습 [draw.io](https//diagram.net)

  1. 엔티티(Entity)
    - 개체를 추출 : 요구사항 분석에서 수집된 중요한 명사들을 찾아서 엔티티 후보로 선정
    - 특징
      - 유일한 식별자에 의해 식별이 가능하다
      - 업무 프로세스에 사용하는 개념이어야 함
      - 실제로 존재하거나 추상적인 것 모두를 포함
      - 다른 엔티티와 구별되어야 함
      - 자신의 특징을 나타내는 속성을 포함해야 함 
    - 이름
      - 가능하면 현업에서 사용하는 용어를 사용
      - 가능하면 약어를 사용하지 않음
  2. Attribute
    - 엔티티를 설명하는데 사용되는 자료
    - 단순 속성 : 더 이상 분할되지 않는 속성 (ex : 이름)
    - 복합 속성 : 여러개의 단순 속성으로 구성된 속성 (ex : first_name, last_name)
    - 유고 속성 : 다른 속성으로부터 계산되는 속성
    - 다중 속성 : 하나의 엔티티가 여러개 값을 가질 수 있는 속성
    - 관계 추출
      - 반드시 비즈니스에 필요하고 저장, 관리해야 하는 정보
      - 하나의 속성은 하나의 값만 가지게 해야 함
  3. Relationdhip (일대일, 일대다, 다대다 등)
    - 엔티티 간의 상호 연관이 있는 상태
    - 요구사항 문장에서 개체(명사, 개념)간에 의미있는 '동사'를 찾음

## 설계 - 논리적 모델링
  - 개념적 모델링에서 만든 ER 다이어그램을 DBMS에 맞게 매핑하여
  - 실제 데이터베이스에 구현하기 위한 모델을 만드는 과정
    - 개념적 모델링에서 추출하지 않은 상게 속성들을 모두 추출
    - 정규화, 표준화 등을 수행
  - 논리적 모델링 연습
  - 온라인 도구 (무료)
    - [ERD cloud](https://www.erdcloud.com/)
    - [dbdiagram](https://dbdiagram.io/home/), (https://app.diagrams.net/)
  - MySQL 워크벤치 모델링 도구

## 설계 - 물리적 모델링
  - 모델링된 논리적 설계를 바탕으로 실제 데이터베이스 시스템에서 사용될 물리적 구조 설계
  - 연습
    - MySQL 워크벤치 모델링 도구
      - 1. 새 모델 생성 : File - new model
      - 2. 다이어그램 생성 : add diagram
      - 3. 다이어그램 작성 및 테이블 작성: ER 다이어그램 작성하기
      - 4. 테이블 생성 : Database - Forward Engineer

## 정규화(Nomarlization)
  - 데이터베이스의 설계 기법
    - 데이터베이스의 중복을 최소화 -> (중복 감소)
    - 무결성을 유지하기 위해 -> (삽입, 삭제, 갱신이상 제거)
    - 데이터를 구조화하는 과정 -> (구조 개선)

  - 이상현상 (Anomaly)
    - 잘못 설계된 테이블에서 데이터 조작(삽입, 삭제, 갱신)을 하게 될 경우
    - 테이블의 일관성이 훼손되고, 무결성이 깨지는 현상
      
    1. 삽입 이상 (Insertion Anomaly)
      - 튜플(행)을 삽입시 부득이하게 null 값이 입력되거나, 중복 데이터 삽입
    2. 갱신(수정) 이상 (Update Anomaly)
      - 데이터베이스 속성의 최신 상태가 반영이 되지 않아 일관성이 깨짐
    3. 삭제 이상 (Delettion Anomaly)
      - 튜플(행)을 삭제 시 항목에 연결된 유용한 데이터까지 연쇄 삭제

### 함수 종속성(Functional Dependency)
  - 한 속성의 값이, 다른 속성의 값에 의해 결정될 수 있음
  - 어떤 속성 A의 값을 알면 다른 속성 B의 값이 유일하게 정해지는 의존 관계
    - "속성 A는 속성 B를 결정한다."
      - A -> B (표기)
      - A는 B의 결정자(Determine)
      - 예시 
        - 학번 -> 이름, 주소, 학과
        - 학과 -> 학과 사무실
        - 강좌 -> 강의실

  - 힘수 종속성의 종류
    1. 완전 함수 종속
      - 속성 B(종속자)가 속성 A(결정자)에 함수적으로 종속되어 있고, B의 어떤 부분집합으로도 A를 결정할 수 없을 때
      - A -> B, 또는 {A, B} -> C
        - 예시
          1. 학과 -> 학과 사무실
          2. 학번, 강좌 -> 성적

    2. 부분 함수 종속
      - 종속자(비 기본키)가 결정자(기본키)가 아닌 다른 속성에 종속되거나, 결정자를 구성하는 속성(복합키) 중 일부에만 종속된 경우
      - {A, B} -> C 일때, A -> C 성립 *또는* B -> C가 성립하는 경우
        - 예시
          1. {학과, 학과 사무실} -> 학과 전화번호
          2. 학과 -> 학과 전화번호
          3. 학과 사무실 -> 학과 전화번호

    3. 이행 함수 종속
      - 한 속성이 다른 속성에 간접적으로 종속되어 있는 상황
      - A -> B, B -> C, 가 성립할때 A -> C에 이행적 종속
        - 예시
          1. 학번 -> 학과
          2. 학과 -> 학과 사무실
          3. 학번 -> 학과 사무실

    4. 결정자 함수 종속
      - 함수 종속의 결정자가 후보키가 아닌 경우
      - (A, B, C) : A -> B, C -> A 가 성립하면 A와 C 결정자 두 속성 모두 후보키가 아니고, 후보키의 일부가 됨.
    
    (5, 6번의 종속경우 보다 1~4번의 경우가 더 많음)
    5. 다중값 종속
      - 한 속성이 다른 속성에 대해 여러 값을 독립적으로 가질 수 있을 경우
    6. 조인 종속
      - 릴레이션을 분해했다가, 다시 결합했을 때 원래의 릴레이션으로 복워 가능한 경우

  
### 제 1 정규형(1NF : 1st Nomal form)
  1. 모든 속성이 `원자값`을 가져야 한다
    - 원자값 : 분할이 불가능한 기본 데이터 단위
    (2 ~ 4는 SQL 시스템에서 기본적으로 걸러진다)
  2. 모든 컬럼은 유일한 이름을 가져야 한다
  3. 한 컬럼 내의 모든 데이터는 같은 데이터 타입이어야 함
  4. 테이블 내 각 행(튜플)은 고유해야 하고, 고유한 식별자(기본키)가 사용됨


### 제 2 정규형(2NF)
  - 릴레이션이 1정규형을 만족해야 한다.
  - 기본 키가 아닌 속성이 기본키에 완전 함수 종속일 때 제2정규형
  - (부분 함수 종속성을 제거)
    - 부분 함수 : {A, B} -> C 일때, A -> C 성립 *또는* B -> C가 성립하는 경우

### 제 3 정규화(3NF)
  - 릴레이션이 2정규형을 만족해야 한다.
  - 기본키가 아닌 속성이 기본키에 비 이행적으로 종속할 때 제 3 정규형
  - (이행 함수 종속성을 제거)
    - 이행 함수 : A -> B, B -> C, 가 성립할때 A -> C에 이행적 종속

### Boyce-Codd 정규형 (BCNF), 보이스 코드 정규형
  - 3 정규형의 특병한 케이스, 3 정규형 보다 조금 더 엄격함
  - 릴레이션이 3 정규형을 만족해야 함
  - 모든 결정자가 후보키여야 함

### 정규화의 한계
  - 설계 및 구현 복잡성 증가 : 유지보수 및 실사용이 어려워짐
  - 조회 성능 저하 : 정규화를 동한 테이블 분해에서 정보를 얻기 위해 여러 테이블을 조인해야 함. 조인 과정에서 복잡도가 증가되고 성능 저하
  - 비정규화
    - 정규화의 한계를 극복하기 위해
    - 의도적으로 중복을 허용하거나
    - 테이블 구조를 단순화하는 과정
    - 적절하게 사용하면 성능을 향상시킬수 있으나, 데이터 무결성 문제가 발생할 수 있음
    - 개발자나 DBA가 비정규화 테이블을 사용하고자 하는 유혹이 있지만, 적절하고 신중하게 잘 결정해야 함 (trade - off 존재)

  - 일반적으로 3정규형 또는 BCNF정규형까지 정규화함
  - 4정규형 : 다치 종속성 제거
  - 5정규형 : 조인 종속성 제거


## 트랜잭션 (Transaction)
  - DBMS에서 데이터를 다루는 논리적 작업 단위
  - 단일 SQL문이거나, 여러개의 SQL문으로 구성
  
  - 작업 단위는 모두 함께 성공적으로 완료되거나,
  - 아무것도 수행되지 않은 상태가 되어야 함. (All or Nothing)

  - 여러 작업들이 있을 때, 작업 분리 단위, 데이터 복구 작업 단위

  - 은행 계좌간에 금액을 이체하는 상황
    - A계좌에서 B계좌로 10,000원을 전송
      - 작업단위
         1. A계좌에서 10,000원 인출
         2. B계좌에 10,000원 입금
      - 반드시 작업단위 2개가 다 성공적으로 완료되거나
      - 아예 수행이 되지 않아야 함.

   - 트랜잭션의 4가지 성질 (ACID)
      1. Atomicity (원자성) : 모든 작업은 하나의 단위로 처리
        - All or Nothing, 쪼개지지 않아야 함
      2. Consistency (일관성) : DB 상태가 작업 전후로 일관성 유지
        - 트랜잭션이 완료된 후 DB의 모든 무결성 제약조건 만족
      3. Isolation (고립성) : 각 트랜잭션은 독립적
        - 각 작업단위는 서로 영향을 주지 않고, 중간 단위를 볼 수 없음
      4. Durability (지속성) : 성공적인 트랜잭션은 영구적으로 유지
        - 시스템 장애가 나더라도 완료된 작업단위는 영구 반영

### TCL (Transaction Control Language)
  - DBMS에서 트랜잭션을 관리하는 SQL문
    1. COMMIT : 트랜잭션 종료, 변경사항 영구적 반영
    2. ROLLBACK : 트랜잭션을 마지막 COMMIT 상태로 복원
    3. SAVEPOINT  : 트랜잭션 내 중간지점을 설정
                  - 해당 중간지점까지 ROLLBACK가능
    - 트랜잭션의 시작을 알리는 명령어
      - START TRANSACTION
    - 트랜잭션의 끝
      - COMMIT 또는 ROLLBACK => 종료
      - DDL(CREATE, ALTER, DROP ...)문을 만나면 자동으로 종료 (COMMIT과 같은 효과가 되어 버리기에 신경써야 함)
    
    - autocommit
      - SQL문을 실행할 때 자동으로 COMMIT을 수행
      - 활성화 되어 있으면 각 SQL문이 별도의 트랜잭션으로 간주
      - 즉시 데이터베이스에 영구적인 변경을 적용

### 동시성과 Lock
  - 트랜잭션이 동시에 실행될 때 데이터베이스의 일관성을 해치지 않도록 데이터의 접근을 제어하는 기능
  - 락
    - 트랜잭션이 데이터를 읽거나 변경할 때 데이터에 표시하는 잠금장치
    - 다른 트랜잭션이 접근하지 못하도록 막아 대기 상태로 만듬
  - 락의 종류
    1. 공유 락 (Shared Lock)
      - 여러 트랜잭션이 동시에 데이터를 읽을 수 있도록 허용
      - 공유 락이 걸린 데이터는 다른 트랜잭션도 읽을 수 있지만, 수정 불가
    2. 배타 락 (Exclusive Lock)
      - 락을 건 해당 트랜잭션만 접근과 수정 가능
      - 다른 트랜잭션은 읽기만 가능하거나, 읽기, 수정 둘 다 불가
        
        ```sql
        -- 다른 트랜잭션은 읽기만 가능
        LOCK TABLE 테이블명 READ;
        -- 락 해제
        UNLOCK TABLES;
        ```
        ```sql
        -- 다른 트랜잭션은 읽기, 수정 둘 다 불가
        LOCK TABLE 테이블명 WRITE;
        -- 락 해제
        UNLOCK TABLES;
        ```

### 트랜잭션 고립 수준
  - 여러 트랜잭션이 동시에 DB에 접근할 때 관리 방법을 정의
  ```sql
  -- 고립 수준 확인 하기
  SELECT @@transaction_isolation;
  ```
  
  - 고립 수준 종류 (고립 수준이 올라갈수록 유연성이 떨어짐)
    1. READ UNCOMMITED
      - 가장 낮은 수준
      - 커밋되지 않은 변경사항을 다른 트랜잭션이 읽을 수 있음
      - Dirty Read
    2. READ COMMITED
      - 커밋된 데이터만 읽을 수 있음
      - 다른 트랜잭션에서 데이터를 수정하고 커밋하고 현재 트랜잭션에서 다시 조회하면 다른 데이터가 읽어짐
    3. REPEATABLE READ
      - MySQL의 기본 고립 수준
      - 트랜잭션이 시작되어 종료될때 까지
      - 처음 읽은 데이터의 일관성이 보장
    4. SERIALIZABLE
      - 가장 높은 고립 수준
      - 모든 트랜잭션이 순차적으로 실행되는 것처럼 보장

    ```sql
    -- 고립 수준 변경하기
    SET TRANSACTION ISOLATION LEVEL 고립 수준 명;
    START TRANSACTION;
    -- 끝내려면 COMMIT
    COMMIT;
    ```

  - 고립 수준에 따라 데이터 일관성의 trade-off발생
  - 일반적으로 고립수준이 높을수록 동시성이 감소하고, 성능에 부정적 영향을 미침, 높은 일관성
  - 고립수준이 낮을수록 일관성에 문제가 발생

## 인덱스 (Index)
  - DB에서 검색을 빠르게 하기 위해 사용되는 데이터 구조
  - 하나 이상의 컬럼(속성)에 적용하여 해당 열을 기준으로 데이터를 빠르게 검색
  - 일반적으로 B-Tree 데이터 구조를 사용
  - 성능 최적화, 쿼리 최적화 
    - 실제 데이터베이스에서 인덱스 튜닝을 하면 즉각적으로 성능 효과를 보고, 빠른 응답속도를 얻어낼 수 있음.
  - 인덱그 생성, 유지 관리에 자원이 소모되어
    - 데이터 조작 작업(INSERT, UPDATE, DELETE) 작업 시 추가 작업이 필요함
    - 데이터가 변경될 떄마다 인덱스도 변경되어야 함
    - 조작(쓰기) 작업이 많은 DB에서는 오히려 인덱스의 성능이 감소

### 클러스터형 인덱스와 보조 인덱스
  1. 클러스터 인덱스 (Clustered Index)
    - 테이블 생성 시 기본 키를 지정하면 기본키에 대한 클러스터 인덱스를 생성
    - 물리적 데이터베이스가 클러스터 인덱스를 기준으로 정렬되어 저장됨
      - 예시 : 
      - 1, 2, 3, 7 으로 인덱스를 저장하다가 그 다음 4를 저장하면 자동으로 7 앞으로 저장되어1,2,3,4,7을 바뀐다.
      - 그리고 이렇게 바뀐상태로 보조기억장치에 저장이 된다.
    - *물리적 데이터베이스*가 클러스터 인덱스를 기준으로 정렬되어 저장됨
    - *한 테이블 당 하나*만 생성할 수 있음
  2. 보조 인덱스 (Secondary Index)
    - 데이터의 물리적 정렬 순서를 변경하지 않음.
    - 클러스터 인덱스와는 별개로 하나 이상의 컬럼에 대한 참조 인덱스 제공
    -  데이터에 포인터를 사용해서 간접적으로 접근
    - 하나의 테이블에는 여러개의 보조인덱스가 존재할 수 있음.
  
### MySQL에서 자동으로 생성되는 인덱스
  - 기본 키 인덱스
    - 테이블의 고유 식별, 클러스터 인덱스가 생성
  - 외래 키 인덱스
    - 외래 키 제약조건이 있는 컬럼을 기준
    - 참조 무결성, 조인 연산 속도 향상을 위해 자동 생성
  - 유니크 인덱스
    - 고유 제약 조건을 설정하면 자동으로 인덱스 생성

  1. PRIMARY KEY로 지정한 열은 클러스터형 인덱스가 생성
  2. UNIQYE NOT NULL 지정한 열은 클러스터형 인덱스가 생성
  3. UNIQYE 지정한 열은 보조 인덱스가 생성
  4. FOREIGN KEY 지정한 열은 보조 인덱스가 생성
  5. PRIMARY KEY와 UNIQUE NOT NULL 지정한 열이 있으면 기본 키 지정한 열에 우선하여 클러스터형 인덱스 생성
  6. 물리적 DB는 PRIMARY KEY 지정한 열로 데이터 오름차순 정렬

### 인덱스의 내부작동 BTREE
  - 데이터베이스 테이블을 효율적으로 관리하는 인덱스 자료구조
  - 기본 개념 정의
    1. 노드(Node) : 트리의 기본 단위
    2. key : 노드 내에서 데이터를 정렬하는데 사용되는 요소
    3. 루트 노드 (Root Node) : 트리의 최상위 노드
    4. 리프 노드 (Leaf Node) : 트리의 가장 하단에 위치하는 노드들, 실제 데이터의 주소나 데이터 자체를 포함할 수 있음
    5. 내부 노드 (Internal Node) : 루트 노드와 리프 노드 사이에 있는 노드

  - ![B-tree 그림](./인덱스/b-tree.png)
  - Btree의 파라미터
    1. M : 각 노드의 최대 자녀수 (최대 M개의 자녀를 가질수 있는 M차 Btree)
    2. M-1 : 각 노드의 최대 키 수
    3. M/2 : 각 노드의 최소 자녀 노드 수
    4. (M/2)-1 : 각 노드의 최소 key 수

  - 내부 노드의 key 수가 x개라면 자녀 노드 수는 언제나 x+1개
  - 몇 차 Btree의 별개로 인터널 노드는 반드시 최소 2개의 자녀를 가진다.
  - 삽입은 항상 Leaf 노드에 한다.
  - 노드가 넘치면 가운데 Key 기준으로 좌우 Key를 분할하고 가운데 Key 승진

  - [B 트리 시각화](https://www.cs.usfca.edu/~galles/visualization/BTree.html)

    - 모든 leaf 노드는 같은 레벨에 존재하게 됨
      - 동일한 횟수의 경로를 가지게 됨

  - Btree 의 이점
    - 트리의 깊이가 낮다 : 각 노드에서 많은 수의 자식을 가질수 있기 때문에, 트리 깊이가 낮아짐 (트리 깊이 = 디스트(보조 저장 장치) 접근 횟수)
    - 디스크 I/O 최적화 : 보조기억장치의 디스크 블록 크기와 일치하도록 노드 크기를 설정할 수 있음. 한 번의 읽기/쓰기 노드(페이지) 하나를 전체로 읽거나 쓸 수 있음
    - 분할 및 병합이 효율적임 : 노드(페이지)가 가득찼을 때 분할하거나 병합될 때 효율적인 알고리즘을 가지고 있음

### 인덱스 생성, 병경, 삭제
  - 인덱스 기본 생성 문법
   ```sql
   -- 인덱스를 추가할 테이블의 이름과 컬럼 기준으로 인덱스 생성
   CREATE INDEX 인덱스이름 ON 테이블이름 (컬럼이름);

   -- 복합 인덱스 생성
   CREATE INDEX 인덱스이름 ON 테이블이름 (컬럼이름1, 컬럼이름2, ...);

   -- 고유 인덱스 생성 (중복된 값 허용 안되는 인덱스)
   CREATE UNIQUE INDEX 인덱스이름 ON 테이블이름 (컬럼이름);

   -- 인덱스 삭제
   DROP INDEX 인덱스이름 ON 테이블이름;

   -- 인덱스 정보조회
   SHOW INDEX FROM 테이블명;

   -- 쿼리 실행계획 확인
   EXPLAIN SELECT 컬럼명 FROM 테이블명 WHERE 조건;

   -- 인덱스 수정
   ALTER INDEX 이전인덱스명 RENAME TO 새인덱스명;

   -- 인덱스 컬럼 추가
   ALTER INDEX 인덱스명 ADD 새컬럼명;

   -- 인덱스 컬럼 제거
   ALTER INDEX 인덱스명 DROP 컬럼명;

   -- 테이블 업데이트 및 분석
   ANALYZE TABLE 테이블명;

   -- 테이블 상태 확인하기
   SHOW TABLE STATUS;
   SHOW TABLE STATUS LIKE '테이블명';
   ```

### 인덱스 성능 향상
  1. 인덱스는 열(컬럼) 단위로 생성
  2. WHERE 절에서 자주 사용되는 컬럼에 인덱스를 생성
  3. 자주 정렬(SORT)되거나 그룹화(GROUP BY)가 필요한 쿼리에 인덱스 생성시 성능 향상
  4. 다른 테이블과 자주 조인되는 컬럼에 인덱스 사용
  5. 특정 범위로 검색하는 쿼리에 인덱스를 사용
  6. 고유성을 유지해야하는 필드에 인덱스를 사용
  7. 사용하지 않는 인덱스는 제거하는 것이 성능 향상에 도움
  8. 쓰기 작업은 적고, 읽기 작업이 많은 테이블에 인덱스 생성
    
  - 인덱스를 사용하면 성능 향상이 안되는 경우
    1. 데이터가 자주 변경되는 테이블 (쓰기 작업이 많은 테이블)
      - 데이터 변경 작업이 일어날때마다 인덱스들도 같이 변경 작업 필요
    2. 데이터 양이 적은 집합
      - 데이터가 적을 경우 오히려 성능을 저하시킬 수 있음
    3. 고유값의 수가 낮은 컬럼
      - 인덱스를 설정해도 거의 효과가 없음
    4. 퀴리가 대부분의 테이블의 데이터를 반환해야 할 경우
      - 전테 테이블을 반환해야 한다면 Full Table Scan이 유리
    5. 데이터 크기가 큰 필드(컬럼) (BLOB, TEXT)
      - 크기가 큰 이진파일이나, 내용이 매우 긴 텍스트 인덱스는 비효율

## 스토어드 프로그램
  - MySQL 안에서 프로그래밍 언어와 같은 기능을 제공하는 것
  - 일반 쿼리를 묶어주거나 프로그래밍 기능을 제공

### 스토어드 프로시저(Stored Procedure)
  - SQL 명령어들을 미리 모아서 저장해두고 필요할 때 호출해서 사용할 수 있는 코드 블록
  
  - 기본 구조
    - 프로시저 이름 : 식별자
    - 매개 변수
      - IN : 입력매개변수
      - OUT : 출력 매개변수 (호출 결과 전달)
      - INOUT : 입력된 값을 변경하여 호출 결과로 반환
    - SQL문
    - 조건문, 반복문, 예외처리 등이 사용 가능
    - 프로시저 시작과 종료
    - 구분자 변경

```SQL
-- 프로시저 내의 구분자(;)를 변경
DELIMITER $$

CREATE PROCEDURE 프로시저이름 (
  [IN/OUT] 매개변수1 타입,        -- 입력 또는 출력 매개변수
  [IN/OUT] 매개변수1 타입......
)
BEGIN   -- 프로시저 시작
  -- SQL 본문.... (;)
  -- SQL 본문.... 또는 제어문
END$$     -- 프로시저 종료

-- 구분자를 원래대로 복원
DELIMITER ;
```

### 동적 SQL
  - 실행 시점의 SQL문을 미리 생성하고 실행하는 기술
  - 사용자의 입력에 따라 SQL문이 변경되어야 할 때 유용하게 사용
  
  - 구문
    - PREPARE : 문자열로 생성된 쿼리를 실행 준비 상태로 만듬
    - EXECUTE : 준비된 쿼리를 실행
    - DEALLOCATE PREPARE : 준비된 쿼리를 메모리에서 해제

## 스토어드 함수
  - MySQL에서 사용하는 내장 함수처럼 사용자가 직접 함수를 만들어 사용할 수 있음
```SQL
DELIMITER $$
CREATE FUNCTION 함수명(매개변수명1 타입, 매개변수명2 타입, .....)
  RETURN 리턴함수
BEGIN
  -- 함수 본문.....
  RETURN 반환값;
END$$
DELIMITER ;
```

### 커서
  - 데이터베이서의 쿼리 결과를 순회하고 조작하기 위한 개체
  - 커서 사용 방법
    1. 커서 선언 : DECLARE CURSOR
    2. 반복 조건 선언 : DECLARE CONTINUE HANDLER
    3. 커서 열기 : OPEN
      - LOOP 반복 구간 지정
    4. 커서에서 데이터 가져오기 : FETCH
    5. 데이터 처리 : 가져온 데이터로 원하는 작업 수행
      - END LOOP 반복 종료
    6. 커서 닫기 : CLOSE

### 트리거
  - 테이블과 관련하여 DML의 이벤트가 발생될 때 작동하는 DB 개체
  - 트리거의 종류
    - AFTER 트리거
      - DML(INSERT, UPDATE, DELETE) 작업이 작동했을 때 작동하는 트리거
    - BEFORE 트리거
      - DML 이벤트가 발생하기 전에 작동하는 트리거

  - 문법
    ```sql
    CREATE TRIGGER 트리거이름
      BEFORE|AFTER INSERT|UPDATE|DELETE  -- 시점과 이벤트
      ON 테이블명    -- 이벤트가 발생할 테이블
      FOR EACH ROW
    BEGIN
      트리거 본문
    END
    ```
  - 주의점
    - 무한 루프를 방지해야 함(트리거가 테이블A에 작동하고 작동한 트리거에서 테이블A를 조작할 경우 등)
    - 트리거는 너무 복잡하게 작성하면 안됨.
    - 다른 작업 티어에서 트리거를 인지하기 어려울 수 있음.