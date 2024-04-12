SELECT M.NAME, C.class_name FROM member M
	JOIN enrollment E ON M.Member_ID = E.Member_ID
    JOIN class C ON E.Class_NO = C.Class_NO;
    
	