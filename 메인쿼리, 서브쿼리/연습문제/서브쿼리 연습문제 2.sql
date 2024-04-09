-- 서브쿼리 문제
-- sakila 데이터베이스 사용
USE sakila;
-- 문제1. 총 결제 금액이 $100을 초과하는 모든 고객의 이름과 성을 조회하세요.
-- 사용 테이블: customer (customer_id, first_name, last_name), payment (payment_id, customer_id, amount)
SELECT SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(AMOUNT) > 100;

SELECT C.first_name, C.last_name, SUM(P.AMOUNT) FROM customer C
	JOIN payment P ON C.customer_id = P.customer_id
		GROUP BY C.customer_id
			HAVING SUM(P.AMOUNT) IN (SELECT SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(AMOUNT) > 100);
-- 문제2. 5개 이상의 영화를 대여한 모든 고객의 이름과 성을 조회하세요.
-- 사용 테이블: customer (customer_id, first_name, last_name), rental (rental_id, customer_id)
SELECT COUNT(rental_id) FROM rental GROUP BY customer_id HAVING COUNT(rental_id) > 5;

SELECT C.first_name, C.last_name, COUNT(R.rental_id) FROM customer C
	JOIN rental R ON C.customer_id = R.customer_id
		GROUP BY R.customer_id
			HAVING COUNT(R.rental_id) IN (SELECT COUNT(rental_id) FROM rental GROUP BY customer_id HAVING COUNT(rental_id) > 5);
-- 문제3. 5편 이상의 영화에 출연한 모든 배우의 이름과 성을 조회하세요.
-- 사용 테이블: actor (actor_id, first_name, last_name), film_actor (actor_id, film_id)


-- 문제4. 평균 영화 길이보다 긴 모든 영화의 제목을 조회하세요.
-- 사용 테이블: film (film_id, title, length)

-- 문제5. 평균 대여 비용보다 높은 대여 비용을 가진 모든 영화의 제목과 대여 비용을 조회하세요.
-- 사용 테이블: film (film_id, title, rental_rate)

-- 문제6. 각 영화에 출연한 배우의 수와 함께 영화 제목을 조회하세요. (SELECT절 사용)
-- 사용 테이블: film (film_id, title), film_actor (actor_id, film_id)

-- 문제7. 단일 고객이 가장 많이 대여한 영화 수를 조회하세요. (FROM절 사용)
-- 사용 테이블: rental (rental_id, customer_id)