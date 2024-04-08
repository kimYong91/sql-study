-- 그룹화 연습문제 (world 스키마)
USE WORLD;
SELECT * FROM Country;
-- 문제 1: Country 테이블에서 각 대륙(Continent)별 국가 수를 계산하세요.
SELECT COUNT(*), Continent FROM Country GROUP BY Continent;

-- 문제 2: Country 테이블에서 각 대륙별 총 인구수(Population)를 계산하고,
-- 총 인구수가 많은 대륙부터 내림차순으로 정렬하세요.
SELECT SUM(Population) 총인구수, Continent FROM Country GROUP BY Continent ORDER BY 총인구수 DESC;

-- 문제 3: City 테이블에서 각 국가 코드(CountryCode)별로 가장 인구가 많은 도시의 인구수를 조회하세요. 상위 5개 결과만 보여주세요.
SELECT MAX(Population) 도시별인구수 FROM City GROUP BY CountryCode ORDER BY 도시별인구수 DESC LIMIT 5;

-- 문제 4: CountryLanguage 테이블에서 각 언어(Language)가 사용되는 국가 수를 계산하고, 
-- 가장 많이 사용되는 언어부터 내림차순으로 정렬하여 상위 3개 언어를 조회하세요.
SELECT Language, COUNT(*) FROM CountryLanguage ORDER BY COUNT(*) DESC LIMIT 3;

-- 문제 5: Country 테이블에서 모든 국가의 총 인구수(Population)를 계산하세요.
SELECT SUM(Population) FROM Country;

-- 문제 6: Country 테이블에서 GDP(국내 총생산, GNP * Population)가 가장 높은 상위 5개 국가를 조회하세요.
SELECT NAME, GNP * Population GDP FROM Country ORDER BY GDP DESC LIMIT 5;

-- 문제 7: Country 테이블에서 정부 형태(GovernmentForm)별 평균 생명 기대치(LifeExpectancy)를 계산하고, 생명 기대치가 높은 순으로 정렬하세요.
SELECT AVG(LifeExpectancy) 평균생명기대치, GovernmentForm FROM Country GROUP BY GovernmentForm ORDER BY 평균생명기대치 DESC;

-- 문제 8: Country 테이블에서 각 대륙별로 평균 인구수가 5000만 이상인 대륙과 해당 평균 인구수를 조회하세요.
SELECT Continent 대륙, ROUND(AVG(Population)) 평균인구수 FROM Country GROUP BY Continent HAVING 평균인구수 >= 50000000;

-- 문제 9: CountryLanguage 테이블에서 언어별로 사용하는 국가 수가 5개 이상인 언어와 해당 국가 수를 조회하세요.
SELECT * FROM CountryLanguage;
SELECT Language, COUNT(*) FROM CountryLanguage GROUP BY Language HAVING COUNT(*) >= 5;

-- 문제 10: Country 테이블에서 각 대륙별로 총 GNP가 100만 이상인 대륙과 해당 총 GNP를 조회하세요.
SELECT Continent, SUM(GNP) FROM Country GROUP BY Continent HAVING SUM(GNP) >= 1000000;

-- 문제 11: Country 테이블에서 대륙(Continent)과 정부 형태(GovernmentForm)별로 국가 수를 집계하고, 
-- 대륙별 국가 수 및 전체 국가 수를 포함한 결과를 조회하세요.
SELECT Continent, GovernmentForm, COUNT(*) FROM Country GROUP BY Continent, GovernmentForm WITH ROLLUP;
