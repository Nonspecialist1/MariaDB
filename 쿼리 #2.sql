-- 1. 테이블 만들기 실습 --
-- 2. 수정하기, 삭제하기 실습 --
-- 3. 오늘 했지만 다음시간에 gruop by, select count 많이 할거임--
-- 테이블수정은 ALTER문 => 이건 직접 공부하기  
create TABLE t_product(
	iproduct INT PRIMARY KEY AUTO_INCREMENT,
	nm VARCHAR(15) NOT NULL,
	price INT(8) unsigned,
	company VARCHAR(15)
);

SELECT * FROM t_product;
-- DROP TABLE t_product;

INSERT INTO t_product
(nm, price, company)
VALUES
('맥북프로', 4100000000, 'apple'),
('갤럭시S21', 40000000, 'samsung'),
('버즈', 30000000, 'samsung'),
('에어팟', 300000, 'apple');

INSERT INTO t_product
(nm, price, company)
VALUES
('에어팟', '300000', 'apple');

SELECT nm FROM t_product
WHERE company = 'apple';

SELECT * FROM t_product
WHERE company = 'apple';

UPDATE t_product 
SET price = 250000
WHERE nm = '버즈';

-- IN을 사용해서 수정하는 방법
UPDATE t_product
SET company = '삼성'
WHERE iproduct IN (2,3);

DELETE FROM t_product WHERE iproduct = 4;

-- 다양한 함수들 대표적으로 5가지 / count 제외하고 모두 숫자형 타입을 받음   
-- count는 레코드의 갯수   
-- sum은 칼럼의 합계, avg는 평균값, max는 최댓값, min은 최솟값  
-- group by가 없을때는 전체레코드 기준, 있을때는 선언된 레코드 기준으로 계산, 차이점 알기  
SELECT COUNT(nm), SUM(price), AVG(price), MAX(price), MIN(price)
FROM t_product;

SELECT company, COUNT(nm), SUM(price), AVG(price), MAX(price), MIN(price)
FROM t_product
GROUP BY company
HAVING SUM(price) > 2000000; -- group by 절에서 조건식은 having 

-- 외부에서 root 계정 접속 가능한지 체크하기  
-- UTF8 꼭 체크하기  
-- koreait, 3308

-- 앞으로 배울 것 java, sql, Android, JSP, HTML, CSS , JS 

