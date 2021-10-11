SHOW DATABASES;
USE test;
SHOW TABLES;
-- index 설정하는 문법
CREATE INDEX idx_student_age
ON t_student2 (age);

DROP INDEX idx_student_age
ON t_student2;

SHOW INDEX FROM t_student2;
/*
primary key는 기본적으로 아래 3개가 설정됨 
- unique
- not null
- indexprsprs
*/

CREATE TABLE t_temp_1(
	id INT UNSIGNED PRIMARY KEY,
	nm VARCHAR(5) NOT NULL
);

CREATE TABLE t_temp_2(
	id INT UNSIGNED PRIMARY KEY,
	tid INT UNSIGNED, 
	nm VARCHAR(5) NOT NULL
);

INSERT INTO t_temp_1
(id, nm)
VALUES 
(1, '가'),
(2, '나'),
(3, '다');

INSERT INTO t_temp_2
(id, tid, nm)
VALUES 
(1, 1, 'A'),
(2, 1, 'B'),
(3, 3, 'C'),
(4, 4, 'D');

SELECT * FROM t_temp_1;
-- INNER JOIN 은 둘다 있는 값만 나온다.
SELECT * FROM t_temp_2 A
INNER JOIN t_temp_1 B
ON A.tid = B.id;
-- left join은 공통값포함 왼쪽값은 모두 나온다.
SELECT 
A.*, B.tid, B.nm
FROM t_temp_1 A
LEFT JOIN t_temp_2 B
ON A.id = B.tid
ORDER BY A.id;

SELECT 
A.*,
ifnull(B.id, 0) AS id, 
ifnull(B.nm, '값 없음') AS nm
FROM t_temp_2 A LEFT JOIN t_temp_1 B
ON A.tid = B.id
ORDER BY A.tid;

-- 서브쿼리, like문 between, 주로 쓰는 함수, UNION, CASE문, ERD
