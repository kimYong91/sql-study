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
  - 애플리케이션이 접근하는 VIew, 최종 사용자, 응용프로그램 개발자가 다루는 영역

# SQL (Struectured Query Language)
 - 관계형 데이터베이스(RDBMS)에서 데이터를 관리하기 위해 사용하는 표준화된 언어
 - 데이터 정의 언어 (Data Definition Language) : DDL
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
 - 데이터 조작 언어 (Data Manipulation Language) : DML
  - INSERT, UPDATE, DELETE
 - 데이터 질의 언어 (Data Query Language) : DQL
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

- 도메인 무결성
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