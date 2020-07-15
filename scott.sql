
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
 
 
 
 --***그룹 함수******************************************
 
/* 1. INITCAP function
    SELECT문의 칼럼에 적용할 수 있으며, 출력시 해당 칼럼의 데이터값의 
    맨 앞 문자열을 대문자로 변환해준다.
 */
 SELECT DEPTNO, INITCAP(DNAME), INITCAP(LOC)
 FROM DEPT;
 --------------------------------------------------------------
 
 /* 2. LOWER or UPPER function
    해당 문자열 전체를 소문자, 대문자로 변환한다.
 */
 SELECT EMPNO, ENAME 이름, LOWER(JOB) 직업
 FROM EMP
 WHERE LOWER(ENAME) = 'scott';
 
  SELECT EMPNO, ENAME 이름, LOWER(JOB) 직업
 FROM EMP
 WHERE ENAME = UPPER('scott');
 --------------------------------------------------------------
 
 /* 3.CONCAT function
    두개의 문자열 데이터를 합쳐서 하나의 문자열을 반환. 
    SELECT 단에서 사용할 수 있다.*/
    SELECT EMPNO, ENAME, JOB, CONCAT(ENAME, JOB) 
    FROM EMP
    WHERE EMPNO = 7369;
--------------------------------------------------------------

/* 4. LPAD function // LPAD(coulum, n, 'string')
   데이터 값 왼쪽에 문자열을 추가해준다. 인자는 (컬럼, 크기, 문자열)*/
   
   SELECT ENAME, LPAD(ENAME,10,'*'),SAL
   FROM EMP
   WHERE DEPTNO = 10;
   
/* 5. SUBSTR function // SUBSTR(coulum, m,n)
   */
   SELECT ENAME, SUBSTR(ENAME,1,3) HIREDATE
   FROM EMP;
   ------------------------
   -- ex2)
   SELECT SUBSTR(HIREDATE,1,2) 입사년도
   FROM EMP;
   
   --ex3) 
   SELECT (SUBSTR('970903-1111111',1,2)) 
   FROM DUAL; --//return '97'
   
   --ex4)
   SELECT (SUBSTR('970903-1111111',8)) 
   FROM DUAL; --//return '1111111'
   
   --ex5)
   SELECT SUBSTR('970903-1111111',1,7) || '*******'
   FROM DUAL; --//return 970903-*******
   
   ------------------------------------------------------
   
/* 6. LENGTH function // 문자열의 길이를 숫자값으로 RETURN*/
    SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
    FROM EMP
    WHERE DEPTNO = 20
    ORDER BY LENGTH(ENAME) ASC; -- RETURN 후 오름차순 정렬
    
/* 7. REPLACE function // 특정 문자열 변경 
     REPLACE(문자열, 바꿀 문자열, 바뀔 문자열)*/

     SELECT REPLACE('970903-1111111',SUBSTR('970903-1111111',9)
     ,'******')
     FROM DUAL;
---------------------------------------------------------------
/* 8. LTRIM function // LTRIM(컬럼, 문자열) */

    SELECT ENAME, JOB, LTRIM(JOB,'A'), SAL, LTRIM(SAL, 1)
       FROM EMP; 


/* 9. TRIM function //앞 뒤 문자열 혹은 공백 제거 
TRIM(LEADING | TRAILING | BOTH + 문자열 + FROM 컬럼)*/

    SELECT EMPNO, JOB, 
    TRIM(LEADING 'S' FROM JOB) AS LEADING,
    TRIM(TRAILING 'N' FROM JOB) AS TRAILING
    FROM EMP
    WHERE EMPNO = 7844;
    
    --ex2) // 인자값이 없을시 문자열을 제외한 나머지 공백을 제거함.
    SELECT LTRIM('     MILER     '), LENGTH(LTRIM('     MILER     '))
    FROM DUAL; --//length = 10
 
    SELECT TRIM('     MILER     '), LENGTH(TRIM('     MILER     '))
    FROM DUAL; --//length = 5
    
---DUMMY TABLE (API) -------------------------
    
    SELECT SYSDATE FROM DUAL; --시간조회
    SELECT 123*456 FROM DUAL;
    
    
--*** 실습 문제 ********************************************

-- 5. 입학 정원이 20명 이상, 30명 이하인 학과 이름과 계열을 출력하시오.

   --ex1) Between and 문
   SELECT DEPARTMENT_NAME 학과, CATEGORY 계열
   FROM TB_DEPARTMENT
   WHERE CAPACITY BETWEEN 20 AND 30;
   
   --ex2) &&문
   SELECT DEPARTMENT_NAME 학과, CATEGORY 계열
   FROM TB_DEPARTMENT
   WHERE CAPACITY >= 20
   AND CAPACITY <=30;
   ---------------------------------------------------------
   
   /* 6.총장을 제외하고 모두 소속학과를 가지고있다. 기술대학교 총장의 이름을
   알아 낼수있는 SQL문장을 작성하시오. */
   -- WHERE (컬럼) IS NULL; 사용
   
   SELECT PROFESSOR_NAME 이름
   FROM TB_PROFESSOR
   WHERE DEPARTMENT_NO IS NULL;
   ---------------------------------------------------------
   
   /* 7. 전산상의 착오로 학과가 지정되지않은 학생의 이름을 검색하시오. */
   
   
   /* 8.춘 대학에는 어떤 계열이 있는지 조회하시오.*/
   -- 중복제거 메서드 'DISTINCT' 사용
   SELECT DISTINCT CATEGORY AS 계열
   FROM TB_DEPARTMENT;
   
   
   
   -- Math function -----------------------------------------
   
   /* 1. CEIL function (올림 값)
    stntax // CEIL(column1) */
   SELECT CEIL(10.1)
   FROM DUAL; --// 11
   
    /* 2. FLOOR function (내림 값)
    stntax // FLOOR(column1) */
   SELECT FLOOR(10.7)
   FROM DUAL; --// 11
   
    /* 3. MOD function (% 와 동일)
    stntax // MOD(column1) */
   SELECT MOD(3,2)
   FROM DUAL; --// 1
   
   
   
   
   
   
  
   
   
   
   
   
   
   
    
