## DDL 데이터 정의어 (테이블의 관계의 구조를 생성)
```
CREATE TABLE 테이블명(
  id INT AUTO_INCREMENT NOT NULL PRIMART KEY,
  name CHAR(20) NOT NULL,
  age INT NOT NULL
);

ALTER TABLE 테이블명 ADD(컬럼, 타입);
ALTER TABLE 테이블명 MODIFY(컬럼, 타입);
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALter TABLE 테이블명 RENAME TO 새로운테이블명;

DROP TABLE 테이블명;

TRUNCATE TABLE 테이블명; -> 초기에 생성된 설정을 제외하고 전부 삭제
```
   
## DML 데이터 조작어 (테이블에 데이터 검색, 삽입, 수정)  
```
SELECT [ALL|DISTINCT] 속성리스트 FROM 테이블리스트
  [WHERE 조건]
  [GROUP BY 속성리스트 [HAVING 조건]]
  [ORDER BY 속성리스트 [ASC|DESC]];

ex) 회원 그룹끼리 각 평균 구매금액이 1000원이 넘는 그룹만 조회
selct id "회원ID", sum(price amount) "총 구매금액"
from buy group by id
having sum(price amount) > 1000;


SELECT * FROM 테이블명;
SELECT 컬럼, 컬럼2 FROM 테이블명;
SELECT DISTINCT 컬럼1 FROM 테이블명; -> 중복없이 추출
SELECT 컬럼1 AS a, 컬럼2 AS b FROM 테이블명 -> 서로 이름 변경

INSERT INTO 테이블명 VALUES (값1,값2,...);
INSERT INTO 테이블명 (컬럽1, 컬럼2) VALUES (값1, 값2...);
INSERT INTO 테이블명 SELECT * FROM 같은형태의 테이블;

UPDATE 테이블명 SET 수정할 컬럼 = 변경데이터 WHERE 변경조건;

DELETE FROM 테이블명 WHERE 삭제조건;
```

### DML 처리 순서
FROM   
ON   
JOIN   
WHERE   
GROUP BY   
HAVING   
SELECT   
DISTINCT   
ORDER BY   
TOP   

## DCL 데이터 제어어 (사용 권한을 관리)
```
Commit;
더이상 수정내용이 없을 때 사용하며 ROLLBACK 시점으로 적용된다.

ROLLBACK;
데이터 수정하다 원상 복구시 사용

GRANT or REVOKE 옵션 TO 사용자명;
데이터베이스 사용자에게 권한 부여 혹은 회수

```
