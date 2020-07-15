
-- 실습 문제 -------------------------------------------

/* 1. 학과 이름과 계열을 표시하시오, 단 헤더는 
   "학과명", "계열"로 표시(TB_DEPARTMENT)*/  
SELECT DEPARTMENT_NAME "학과 명", CATEGORY 계열
FROM TB_DEPARTMENT;
------------------------------------------------

/* 2.데이터 출력값과 문자열 합치기*/
SELECT DEPARTMENT_NAME ||'의 정원은'||CAPACITY||'입니다.' 
AS "학과별 정원"
FROM TB_DEPARTMENT;
------------------------------------------------

/* 3. 국어 국문학과에 다니는 학생 중 현재 휴학중인 여학생을 검색
 (TB_DEPARTMENT)*/
 
 SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE DEPARTMENT_NO = 001
 AND ABSENCE_YN = 'Y';
 ------------------------------------------------
 
 /* 4. 도서관 장기 연체자를 찾아 이름을 게시함 대상자 학번은 다음과 같다.
 A513079, A513091, A513110*/
 SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE STUDENT_NO IN ('A513079', 'A513091', 'A513110')
 ------------------------------------------------
 ----------------------------------------------------------------------
 
 
-- LIKE문 ------------------------------------------------------------

 SELECT STUDENT_NAME 
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '김%';
-- 검색 할 데이터의 첫 인덱스가 '김'인 데이터를 반환

 SELECT STUDENT_NAME 
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '%김%';
-- 문자열중 가운데의 인덱스값이 '김'인 데이터를 반환

SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '_아%';
 -- '_'를 통해 검색 할 데이터의 첫 인덱스기준으로 탐색 순서를 바꿔줄수있다
 ----------------------------------------------------------
 
 -- &&, ||문 실습 --
 SELECT ENAME, JOB, SAL, COMM
 FROM EMP
 WHERE (JOB = 'CLERK' OR JOB = 'ANALYST')
 AND COMM IS NULL
 AND SAL >= 1000
 AND SAL <= 3000;
 
 
 
 



 
 
 
 
 
 
 

