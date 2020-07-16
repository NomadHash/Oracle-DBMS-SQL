
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
   
   --ex1) 
   SELECT SAL, MOD(SAL,30)
   FROM EMP
   ORDER BY SAL DESC;
   
   /* 4. ROUND function (n의 자리에서 반올림)
    stntax // ROUND(column1,n) */
   SELECT ROUND(1.1634,1) --//소숫점 첫째 자리 뒤 값으로 반올림.
   FROM DUAL; --// 1.2
   
   /* 5. TRUNC function (소숫점 버림)
      syntax TRUNC(column1,n)*/
      SELECT TRUNC(456.789,2) -- 소숫점 기준으로 두칸까지 출력
      FROM DUAL; --// 456.78
      
      ----------------------------------------
      
      -- Date, time function
      SELECT SYSDATE -- 날짜
      FROM DUAL;
      
      --ex1)
      SELECT SYSDATE 날짜, SYSDATE +1 내일
      FROM DUAL; --// 연산 가능
      
      --ex2)
      SELECT ENAME 이름, TRUNC((SYSDATE-HIREDATE)/365)년차 
      FROM EMP;
      
      SELECT SYSTIMESTAMP --날짜 및 시간
      FROM DUAL;
      
      /*1. MONTHS_BETWEEN function
      syntax// MONTHS_BETWEEN(data1,data2)
            ex) MONTHS_BETWEEN(SYSDATE,HIREDATA)
                data1과 data2 사이의 시간 */
    
    --ex1)          
    SELECT ENAME, HIREDATE,
    TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) T_BET
    FROM EMP
    WHERE DEPTNO = 10
    ORDER BY MONTHS_BETWEEN(SYSDATE,HIREDATE) DESC;
    
    --ex2)
    SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE,-5) A_MON
    FROM EMP
    WHERE DEPTNO = 10
    ORDER BY ADD_MONTHS(HIREDATE,5) DESC;
    
    --ex3)
    SELECT ENAME 이름, HIREDATE 입사일,
    TRUNC(SYSDATE-HIREDATE,0)"전체 일자",
    TRUNC((SYSDATE-HIREDATE)/7,0) 주,
    ROUND(MOD((SYSDATE - HIREDATE),7),0) DAYS
    FROM EMP
    ORDER BY SYSDATE-HIREDATE DESC;
    /* SYSDATE-HIREDATE = 현재 날짜로부터 
    해당 날짜 까지의 일 */
    
   
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD,(AM)DY HH24:MI:SS'),
    'YYYY/MM/DD,(AM)DY HH24:MI:SS'
    FROM DUAL;

SELECT ENAME 이름, HIREDATE 입사일, SAL 급여
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='09'; --//9월에 입사한 사람 탐색


SELECT ENAME 이름, HIREDATE 입사일, SAL 급여
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YY')='81'--//81년도에 입사한 사람 탐색
ORDER BY TO_CHAR(HIREDATE, 'MM');

--EMP 테이블의 10번 부서중 입사일자를 '~년 ~월 ~일 로 출력

SELECT ENAME,HIREDATE, TO_CHAR(HIREDATE,'YYYY"년" MM"월" DD"일"')입사일
FROM EMP
WHERE DEPTNO =10;


SELECT ENAME, JOB,SAL, TO_CHAR(SAL,'$999,999')
FROM EMP
WHERE DEPTNO =20
ORDER BY SAL DESC;

--TO NUMBER
SELECT TO_NUMBER('1234'+100)
FROM DUAL;



/* CASE function 
   해당 컬럼을 기준으로 새로운 컬럼 생성*/
   
-- ex1)
SELECT EMPNO, ENAME, JOB, SAL "전 급여",
CASE JOB WHEN 'ANALYST' THEN SAL * 1.1
         WHEN 'CLERK' THEN SAL * 1.2
         WHEN 'MANAGER' THEN SAL * 1.3
         WHEN 'PRESIDENT' THEN SAL * 1.4
         WHEN 'SALESMAN' THEN SAL * 1.5
END "후 급여"
FROM EMP;

-- ex)2
SELECT EMPNO 사원번호, ENAME 이름, JOB 직책, SAL 급여,
CASE WHEN SAL >=0 AND SAL <=1000 THEN 'E'
     WHEN SAL >1000 AND SAL <=2000 THEN 'D' 
     WHEN SAL >2000 AND SAL <=3000 THEN 'C' 
     WHEN SAL >3000 AND SAL <=4000 THEN 'B' 
     WHEN SAL >4000 AND SAL <=5000 THEN 'A'
END 등급
FROM EMP
ORDER BY 등급;

/* DECODE function */
   SELECT EMPNO, ENAME, JOB, SAL 급여,
     DECODE(JOB, 'ANALYST' , SAL*1.1,
                 'CLERK' , SAL*1.2,
                 'MANAGER' , SAL*1.3,
                 'PRESIDENT' , SAL*1.4,
                 'SALESMAN' , SAL*1.5, SAL) "후 급여"
   FROM EMP;
   
   /*SIGN function //주어진 숫자가 양수인지 음수인지 0인지 구하는 함수
   
   --=== 실습 문제 =====================================================
   
   /* 1. 사원테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일 검색하시오 */
   SELECT EMPNO 사번, ENAME 사원명, HIREDATE 입사일
   FROM EMP
   WHERE TO_CHAR(HIREDATE, 'MM')='12';
   
   /* 2. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오.*/
   SELECT EMPNO, ENAME, LPAD(SAL,10,'*') "급여"
   FROM EMP;
   
   /* 3. 다음과 같은 결과를 검색할수있는 SQL 문장을 작성하시오.*/
   

   SELECT EMPNO, ENAME, COMM, 
   CASE WHEN COMM IS NULL THEN '일반사원'
        ELSE '영업사원'
   END "사원 종류"
   FROM EMP;
   
    SELECT LOC,
     DECODE(LOC, 'NEW YORK' , 'EAST', 
                 'DALLAS', 'CENTER',
                 'CHICAGO', 'CENTER',
                 'BOSTON', 'EAST',
                 LOC) AREA
   FROM DEPT;
   
   
    SELECT EMPNO, ENAME, JOB, SAL 급여,
     DECODE(JOB, 'ANALYST' , SAL*1.1,
                 'CLERK' , SAL*1.2,
                 'MANAGER' , SAL*1.3,
                 'PRESIDENT' , SAL*1.4,
                 'SALESMAN' , SAL*1.5, SAL) "후 급여"
    FROM EMP;
   
   
   SELECT STUDENT_NO,STUDENT_NAME, STUDENT_SSN
   FROM TB_STUDENT
   WHERE STUDENT_ADDRESS LIKE '전주%'
   AND ABSENCE_YN = 'N'
   AND STUDENT_NO LIKE 'A2%';
   
   
   -- Group Function
   SELECT SUM(SAL), ROUND(AVG(SAL)), MAX(SAL), MIN(SAL)
   FROM EMP;
   
   SELECT MAX(HIREDATE), MIN(HIREDATE)
   FROM EMP;
   
   SELECT COUNT(ENAME), COUNT(COMM)
   FROM EMP;
   
   SELECT COUNT(JOB), COUNT(DISTINCT JOB)
   FROM EMP;
   
   SELECT COUNT(*)
   FROM EMP;
   
   SELECT AVG(SAL), MAX(SAL), MIN(SAL), SUM(SAL)
   FROM EMP
   WHERE JOB LIKE 'SAL%';
   
 
  /* GROUP BY 
      전체 테이블이 아닌 특정 그룹으로 묶을 때 사용. */
      --WHERE 절에는 그룹 함수가 올 수 없다.
      
      SELECT DEPTNO, AVG(SAL)
      FROM EMP
      GROUP BY DEPTNO;
      -- DEPTNO의 항목별로 SAL의 평균값을 출력.
      
      SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL)),MIN(SAL),MAX(SAL)
      FROM EMP
      GROUP BY DEPTNO;
      
        SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL)),MIN(SAL),MAX(SAL)
        , SUM(SAL)
      FROM EMP
      GROUP BY DEPTNO
      ORDER BY SUM(SAL) DESC;
      
      SELECT DEPTNO, JOB, COUNT(*), AVG(SAL),SUM(SAL)
      FROM EMP
      GROUP BY DEPTNO, JOB;
      
     -- HAVING //GROUP BY의 조건식
     
     SELECT DEPTNO, SUM(SAL)
     FROM EMP
     GROUP BY DEPTNO
     HAVING SUM(SAL) >9000;
     
     SELECT DEPTNO, SUM(SAL)
     FROM EMP
     WHERE SAL >800
     GROUP BY DEPTNO
     HAVING SUM(SAL) >9000;
     
     SELECT DEPTNO, AVG(SAL), SUM(SAL)
     FROM EMP
     GROUP BY DEPTNO
     HAVING MAX(SAL)> 2900;
     
     SELECT JOB, AVG(SAL), SUM(SAL)
     FROM EMP
     GROUP BY JOB
     HAVING AVG(SAL) >=3000;
     
     SELECT JOB, SUM(SAL) PAYROLL
     FROM EMP
     WHERE JOB NOT LIKE 'SALE%'
     GROUP BY JOB
     HAVING SUM(SAL) > 5000
     ORDER BY SUM(SAL) DESC;
     
     SELECT DEPTNO , AVG(SAL)
     FROM EMP
     GROUP BY DEPTNO;
     
     SELECT DEPTNO, COUNT(DEPTNO)
     FROM EMP
     GROUP BY DEPTNO
     HAVING COUNT(DEPTNO) >= 6;
     
     SELECT DEPTNO, MAX(SAL), JOB 
     FROM EMP
     GROUP BY DEPTNO,JOB
     HAVING MAX(SAL)>=5000;
     
     
     SELECT TO_CHAR(HIREDATE,'YYYY') 년, TO_CHAR(HIREDATE,'MM') 월, SUM(SAL)
     FROM EMP
     GROUP BY TO_CHAR(HIREDATE,'YYYY'), TO_CHAR(HIREDATE,'MM')
     ORDER BY 년;
     
     
     SELECT COUNT(DEPARTMENT_NO) 학생수
     FROM TB_STUDENT
     WHERE ENTRANCE_DATE LIKE '01%'
     AND DEPARTMENT_NO = 003;
    
    
    SELECT CATEGORY 계열, DEPARTMENT_NAME 학과이름, CAPACITY 정원
    FROM TB_DEPARTMENT
    WHERE CATEGORY = '공학'
    AND CAPACITY BETWEEN 20 AND 30
    ORDER BY DEPARTMENT_NAME ASC;
    
    
    SELECT CATEGORY 계열, COUNT(CATEGORY) 학과수 
      FROM TB_DEPARTMENT
      GROUP BY CATEGORY
      HAVING CATEGORY LIKE '%학%'
      ORDER BY 학과수 DESC;
      

    
    
    
     
     
     
     
    
     
    
    aabbcc
    for(let i=1; i<s.length/2; i++){
    s.substr(i,i)
    }
    
 
   
   
   
   

   



  
  
  
   
   
   
   
   
   
   

   
  
   
   
   
   
   
   
   
    
