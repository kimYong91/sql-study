-- 연습문제: 가격이 평균 이상인 제품 조회

-- products 테이블을 활용하여 가격이 평균 이상인 제품들의 목록을 조회하는 쿼리를 작성하세요.
-- 각 제품의 가격은 price 열을 기준으로 확인됩니다.
-- 가격이 평균 이상인 제품들의 정보는 product_name과 price 열만 포함되어야 합니다.


USE tcl;

SELECT product_name, price FROM products
	WHERE price > (SELECT avg(price) FROM products);