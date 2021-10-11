-- DDL (데이터정의어), DCL, DML(우리가 주로 다루는 것) -- 외울필요는 없음
-- 제약조건은 잘못된 값이 들어가지 않도록하기 위한 것  
CREATE TABLE t_student (  -- 쿼리문은 대소문자 구분하지 않으므로 create여도 상관없음
-- unsigned는 int형 중 양의 정수만 받을 때, 수용가능한  데이터 양은 똑같음  
	pk INT unsigned PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY는 모든 테이블에 필요(중요), 없어도 자동 생성되며 
	-- 꼭 한 컬럼에만 주는 것은 아님, 값조합할 때 중복불가, unique,  not null, index 설정 3가지가 들어감  
	nm VARCHAR(5) NOT NULL, --  VARCHAR는 데이 --터값만큼 메모리를 사용하지만, 속도는 더 느림  
	ph CHAR(13) NULL, -- CHAR는 메모리를 무조건 사용, 데이터가 일률적인 형식일 때 사용  
	addr VARCHAR(40),
	gender CHAR(1) NOT NULL DEFAULT('남') CHECK(gender IN('남','여')), -- check는 그 안의 값만 설정 가능한 제약조건
	rdt DATETIME DEFAULT NOW()
);

INSERT INTO t_student
(nm, ph, addr)
VALUES
('가', '010-3333-0000', '대구시');

SELECT * from t_student;

DROP TABLE t_student2;

-- SQL은 RDB의 표준어
-- CRUD, DML 데이터 조작어
/*
CREATE : insert
READ : select(2가지 종류)
UPDATE : update
DELETE : delete
*/

INSERT INTO t_student
(nm, ph, addr)
VALUES
('가', '010-0000-0000', '상인동'); -- 여기서 세미콜론 없으면 values 다음 insert into가 나오는 문법오류로 실행 에러

INSERT INTO t_student
(nm, ph, addr)
VALUES
('나', '010-0000-0001', '대명동'), 
('다', '010-0000-0002', '범어동'),
('라', '010-0000-0003', '산격동');

DELETE FROM t_student;
DELETE FROM t_student WHERE nm = '가';
-- transation(트랜잭션) delete문을 실행했을 때 상태를 보여줌  
-- commit 상태를 보고 지우기를 확정   
-- rollback 지우기를 취소   

SELECT nm FROM t_student;
SELECT nm, ph FROM t_student;

SELECT nm, ph, addr FROM t_student
WHERE nm = '가' OR addr = '대구시';

SELECT nm, ph, addr FROM t_student
WHERE nm = '가' AND addr = '상인동';

UPDATE t_student
SET addr = '범어동', ph = '010-2222-3333'
WHERE nm = '다';

/* 쿼리문은 사이공백은 얼마든 상관없음, 붙이지만 마라
SELECT 컬럼명or와일드카드* 
FROM 테이블명 
--- 옵션---
WHERE (조건식)
GROUP BY (컬럼영)
HAVING (조건식)
ORDER BY (컬럼명)
LIMIT 10, 
====================
ISERT INTO 테이블명 
(컬럼명) -- 칼럼명이 없으면 모든 열에 순서에 따라 값을 모두 작성해야함(오류방지를 위해 무조건 작성하기)
VALUES (값)
====================
DELETE FROM 테이블명 
WHERE 조건식 
====================
UPDATE 테이블명 
SET 컬럼명 = 수정할 값
WHERE 조건식 
*/


