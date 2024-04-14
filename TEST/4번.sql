INSERT INTO member (Member_ID, Name, Address, Phonenumber)
VALUES (1, '김지수', '서울시 강남구 역삼동', '010-1234-5678');
INSERT INTO member (Member_ID, Name, Address, Phonenumber)
VALUES (2, '이태민', '서울시 서초구 반포동', '010-8765-4321');

INSERT INTO trainer (ID_number, Trainer_name, specialty)
VALUES (1, '박서준', '필라테스');
INSERT INTO trainer (ID_number, Trainer_name, specialty)
VALUES (2, '최유리', '에어로빅');

INSERT INTO class (Class_NO, class_name, StartTime, EndTime, ID_number)
VALUES (1, '오전 요가', '9:00', '10:00', '1');
INSERT INTO class (Class_NO, class_name, StartTime, EndTime, ID_number)
VALUES (2, '저녁 웨이트 트레이닝', '20:00', '21:00', '2');
INSERT INTO class (Class_NO, class_name, StartTime, EndTime, ID_number)
VALUES (3, '오후 요가', '9:00', '10:00', '1');
INSERT INTO class (Class_NO, class_name, StartTime, EndTime, ID_number)
VALUES (4, '아침 웨이트 트레이닝', '20:00', '21:00', '2');

INSERT INTO enrollment (Member_ID, Class_NO)
VALUES (1, 1);
INSERT INTO enrollment (Member_ID, Class_NO)
VALUES (2, 2);