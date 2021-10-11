-- 정규화 문제 
-- 데이터 무결성 -> JOIN이 많을수록 읽기 속도저하  
-- 역정규화  
CREATE TABLE t_student2(
	sno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(5) NOT NULL,
	age INT NOT NULL,
	addr VARCHAR(20),
	PRIMARY KEY(sno) -- pk 주는 방법으로 추천, 2개 3개 부여할 때는  이 방법만 가능하므로 !  
);

CREATE TABLE t_hobby(
	hno INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10) NOT NULL,
	PRIMARY KEY(hno)
);

CREATE TABLE t_studenthobby (
	sno INT UNSIGNED,
	hno INT UNSIGNED,
	PRIMARY KEY (sno,hno),
	-- 포릔키는 해당데이터와  레퍼런스 데이터 타입,옵션이 서로 일치해야함 INT UNSIGNED 
	FOREIGN KEY (sno) REFERENCES t_student2 (sno), -- 포릔키 이름부여할 때는 앞에 constraint 이름 
	FOREIGN KEY (hno) REFERENCES t_hobby (hno)
);

SELECT * FROM t_studenthobby;
SELECT * FROM t_student2;
SELECT * FROM t_hobby;

INSERT INTO t_student2
(nm, age, addr)
VALUES
('홍길동', 20, '서울'),
('신사임당', 22, '대구'),
('강감찬', 24, '부산');

INSERT INTO t_hobby
(nm)
VALUES
('게임'),
('배타기'),
('수영'),
('등산'),
('명상'),
('붓글씨'),
('독서');

-- foreign key를 통해 조인할 테이블에 존재하는 값만 받아야함(데이터 무결성을 위해), JOIN은 관계없음 걸어도 가능  
INSERT INTO t_studenthobby
(sno, hno)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 6),
(2, 5),
(3, 2);

-- Alias 알리아스, 별명을 부여하는 것 as 생략가능
-- as는 select할때만 일시적으로 별명  
SELECT A.sno AS ss, A.hno AS hh 
FROM t_studenthobby A;
-- JOIN 방법은 3가지가 있는데 이것만 알아도 됌 
SELECT B.sno, B.nm, A.hno, C.nm
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby C
ON A.hno = C.hno;

SELECT B.nm AS snm, B.age, B.addr, D.nm AS hnm 
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby D
ON A.hno = D.hno;
-- ORDER BY B.nm; -- LIMIT 제외하고 무엇보다 가장 끝에 와야함 
-- view는 그 당시 데이터가 아니라 실시간 수정된 데이터를 보여준다, 실무에서는 잘 안씀 
CREATE VIEW view_joinresult
AS
SELECT B.sno, B.nm AS snm, A.hno, C.nm AS hnm 
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby C
ON A.hno = C.hno;

DROP VIEW view_joinresult;

SELECT * FROM view_joinresult;






-- ---------------------------------------------------
CREATE TABLE customer(
	id INT UNSIGNED NOT null,
	firnm VARCHAR(10) NOT NULL,
	surnm VARCHAR(10) NOT NULL,
	PRIMARY KEY(id) 
);
SELECT * FROM customer;

INSERT INTO customer
(id, firnm, surnm)
VALUES
(123, 'pooja', 'Singh'),
(456, 'San', 'Zhang'),
(789, 'John', 'Doe');

CREATE TABLE customer_phone(
	pkid INT UNSIGNED AUTO_INCREMENT,
	id 
	tel VARCHAR(20) NOT NULL,
	PRIMARY KEY(pkid) 
);
SELECT * FROM phone;

INSERT INTO phone
(tel)
VALUES
('555-861-502', '192-4665,789'),
('777-4684245'),
('123345-4745');








