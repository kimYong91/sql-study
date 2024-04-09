-- JOIN 연습문제
-- sakila 데이터베이스에서 조회하세요.
USE sakila;
SELECT * FROM customer;
SELECT * FROM rental;
SELECT * FROM film;
SELECT * FROM inventory;

-- 문제 1: 고객(customer)의 이름과 그들이 대여(rental)한 영화(film)의 제목을 조회하세요.
-- 사용 테이블: customer(customer_id, first_name, last_name),
-- rental(rental_id, customer_id, inventory_id), film(film_id, title),
-- inventory(inventory_id, film_id)
SELECT C.customer_ID, C.FIRST_NAME, C.LAST_NAME, R.rental_DATE, F.title
	FROM CUSTOMER C 
		JOIN rental R ON C.customer_ID = R.customer_ID
			join inventory I on R.inventory_id = I.inventory_id
				JOIN film F ON I.film_id = F.film_id;

-- 문제 2: 각 영화(film)의 제목과 해당 영화가 속한 카테고리(category)의 이름을 조회하세요.
SELECT F.TITLE, C.NAME FROM film F 
	JOIN film_category FC ON F.film_id = FC.film_id
		JOIN category C ON FC.category_id = C.category_id;

SELECT * from film;
SELECT * from film_category;
SELECT * from category;
-- 문제 3: 각 영화(film)에 대해 몇 명의 배우(actor)가 출연했는지, 영화 제목과 함께 조회하세요.
SELECT F.TITLE, COUNT(A.actor_id) FROM film F
	JOIN film_actor FA ON F.film_id = FA.film_id
		JOIN actor A ON FA.actor_id = A.actor_id GROUP BY F.TITLE; -- 타이틀이 중복이 될 가능성이 있어 고유키인 film_id 를 쓰는게 안전함

SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;
-- 문제 4: 모든 대여(rental) 정보에 대해, 해당 대여가 이루어진 스토어(store)의 ID와 직원(staff)의 이름을 조회하세요.
SELECT ST.store_id, S.staff_id, S.FIRST_NAME, S.LAST_NAME, R.* FROM rental R
	JOIN staff S ON R.staff_id = S.staff_id
		JOIN store ST ON S.store_id = ST.store_id;

SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;
-- 문제 5: 가장 많이 대여된 영화 5개의 제목과 대여 횟수를 조회하세요.
SELECT COUNT(R.rental_id), F.TITLE FROM film F 
	JOIN inventory I ON F.film_id = I.film_id
		JOIN rental R ON I.inventory_id = R.inventory_id
			GROUP BY F.film_id ORDER BY COUNT(R.rental_id) DESC LIMIT 5;

SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM rental;
-- 문제 6: 각 고객(customer)별로 그들이 지불한 총 금액(payment)을 조회하세요.
SELECT C.customer_id, C.first_name, C.last_name, SUM(P.amount) FROM customer C
	JOIN payment P ON C.customer_id = P.customer_id 
		GROUP BY C.customer_id;

SELECT * FROM customer;
SELECT * FROM payment;
-- 문제 7: 각 카테고리(category)별로 대여된 영화의 총 수를 조회하세요.
SELECT C.NAME, COUNT(R.rental_id) FROM rental R
	JOIN inventory I ON R.inventory_id = I.inventory_id
		JOIN film F ON I.film_id = F.film_id
			JOIN film_category FC ON F.film_id = FC.film_id
				JOIN category C ON C.category_id = FC.category_id
					GROUP BY C.NAME;

SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * from category;
-- 문제 8: 2005년 7월에 대여된 모든 영화의 제목과 대여 날짜를 조회하세요.
SELECT F.TITLE, R.return_date FROM film F
	JOIN inventory I ON F.film_id = I.film_id
		JOIN rental R ON I.inventory_id = R.inventory_id 
			WHERE R.rental_date BETWEEN '2005-07-01' AND '2005-07-31'; 		-- 8월도 나옴 (수정 필요)

SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM rental;
-- 문제 9: 'Comedy' 카테고리에 속하는 영화들의 평균 대여 기간(rental_duration)을 조회하세요.
SELECT C.NAME, AVG(F.rental_duration) FROM category C
	JOIN film_category FC ON C.category_id = FC.category_id
		JOIN film F ON FC.film_id = F.film_id
			AND C.NAME = 'Comedy';

SELECT * from category;
SELECT * FROM film_category;
SELECT * FROM film;
-- 문제 10: 모든 배우(actor)의 이름과 그들이 출연한 영화(film)의 수를 조회하세요. (LEFT JOIN 사용)

