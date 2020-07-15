
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
 
 
 /* ORDER문 
    WHERE문 아래에 위치하며, 검색이 종료된 출력값을 오름차,내림차 순으로 정렬한다.
    컬럼의 뒤에 'ASC','DESC' 속성값을 통해 내림차, 오름차 순으로 정렬할수있다.*/
    
 SELECT EMPNO 사원번호, ENAME 이름, HIREDATE 입사일, SAL 급여 
 FROM EMP
 ORDER BY SAL DESC; -- OR ORDER BY SAL ASC; (내림차순)
 
 
 SELECT ENAME 이름, SAL *12 급여
 FROM EMP
 ORDER BY 급여 DESC;
-- // 컬럼에 alias 지정시 ORDER의 타겟으로 alias값을 지정해줄 수 있다.

 SELECT ENAME, SAL * 12 ANNUAL, EMPNO FROM EMP
 ORDER BY SAL DESC,EMPNO;
 -- // SAL값으로 내림차  정렬 후 EMPNO값으로 재정렬.
 
 


 
 
 
 



 
 
 
 
 
 
 

