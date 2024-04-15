USE nomarlization;

-- 제 1 정규형 (1NF)
CREATE TABLE Students (
	StudentId INT PRIMARY KEY,	-- 학번
    Name VARCHAR(50),			-- 이름
    Courses VARCHAR(255)		-- 과정들
);

INSERT INTO Students VALUES
	(1, '홍길동', '수학, 과학'),
    (2, '임꺽정', '국어'),
    (3, '전우치', '사회, 국어, 영어');
    
-- 릴레이션의 속성 값은 반드시 원자값이어야 한다 => 1정규화에 위배
SELECT * FROM Students;


CREATE TABLE Students_1NF (
	StudentCoursesId INT PRIMARY KEY AUTO_INCREMENT,	-- 기본키
	StudentId INT,						-- 학번
    Name VARCHAR(50),					-- 이름
    Courses VARCHAR(255)				-- 과정들
);

INSERT INTO Students_1NF (StudentId, Name, Courses) VALUES
	(1, '홍길동', '수학'),
    (1, '홍길동', '과학');
INSERT INTO Students_1NF (StudentId, Name, Courses) VALUES
	(2, '임꺽정', '국어');
INSERT INTO Students_1NF (StudentId, Name, Courses) VALUES
	(3, '전우치', '사회'),
    (3, '전우치', '국어'),
    (3, '전우치', '영어');

-- Courses 속성이 원자값으로 변경되어 1정규형을 만족
SELECT * FROM Students_1NF;




-- 제 2 정규형(2NF)
-- 제 1 정규형을 기본적으로 만족되어야 한다.
CREATE TABLE CoursesRegist (
    StudentId INT,
    CoursesId INT,
    InsturctorName VARCHAR(255),
    CoursesName VARCHAR(255),
    PRIMARY KEY (StudentId, CoursesId)	-- 복합 기본키
);

INSERT INTO CoursesRegist VALUES
	(1, 101, '홍길동', '데이터베이스'),
    (1, 102, '이영희', '자료구조'),
    (2, 101, '홍길동', '데이터베이스'),
    (2, 103, '김철수', '알고리즘');
    
SELECT * FROM CoursesRegist;