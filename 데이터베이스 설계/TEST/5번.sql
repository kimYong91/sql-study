SELECT M.NAME, C.class_name FROM member M
	JOIN enrollment E ON M.Member_ID = E.Member_ID
    JOIN class C ON E.Class_NO = C.Class_NO;
    
-- 5-2. 트레이너별로 담당하는 강습 클래스의 수를 조회하세요.
-- 각 트레이너가 담당하는 강습의 수를 계산합니다.
-- 결과는 트레이너 이름과 그들이 담당하는 강습 수로 구성됩니다.
-- 결과는 강습 수에 따라 내림차순으로 정렬합니다.
SELECT * FROM CLASS;
SELECT T.Trainer_name, COUNT(C.ID_number) FROM Trainer T
	JOIN Class C ON T.ID_number = C.ID_number GROUP BY T.Trainer_name;

SELECT T.Trainer_name, COUNT(C.Class_NO) AS Class_Count
FROM Trainer T
JOIN Class C ON T.ID_number = C.ID_number
GROUP BY T.Trainer_name;

 -- 5-3 현재 등록된 모든 강습 중에서 오전에 시작하는 강습들만 조회하세요.
-- 시작 시간이 '12:00' 이전인 강습만 선택합니다.
-- 결과는 클래스명, 시작 시간, 종료 시간으로 구성됩니다.
-- 결과는 시작 시간에 따라 오름차순으로 정렬합니다.
SELECT class_name, StartTime, EndTime FROM class
	WHERE StartTime < 12 ORDER BY StartTime;


-- 5-4. 각 회원이 등록한 강습 클래스 중 가장 늦게 시작하는 클래스의 이름과 시작 시간을 조회하세요.
-- 결과는 회원 이름, 클래스명, 그리고 해당 클래스의 시작 시간으로 구성됩니다.
SELECT M.Name, C.class_name, MAX(C.StartTime) FROM Member M
	JOIN Enrollment E ON M.Member_ID = E.Member_ID
		JOIN Class C ON E.Class_NO = C.Class_NO
			GROUP BY C.class_name;