
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
      

    
     /*(ORACLE) join 중복되는 컬럼을 가진 테이블 두개를 합친다.
     검색하고자 하는 컬럼이 한개의 테이블이 아닌, 여러개의 테이블에 존재하는 경우에
     사용되는 기술*/
     
     
     SELECT EMPNO, ENAME, JOB,DEPT.DEPTNO,DNAME, LOC
     FROM EMP,DEPT
     ORDER BY EMPNO;
     
     -- **** EQUI JOIN ***********************************
     
     SELECT EMPNO,ENAME,DNAME,LOC
     FROM EMP E,DEPT D
     WHERE E.DEPTNO = D.DEPTNO;
     
  /* EMPNO ENAME      DNAME          LOC          
------------- ---------- -------------- -------------
      7782 CLARK      ACCOUNTING     NEW YORK     
      7839 KING       ACCOUNTING     NEW YORK     
      7934 MILLER     ACCOUNTING     NEW YORK     
      7566 JONES      RESEARCH       DALLAS     .....*/
      
      
      SELECT EMPNO, ENAME, DNAME, LOC
      FROM EMP E, DEPT D
      WHERE E.DEPTNO = D.DEPTNO
      AND E.EMPNO = 7900;
  
  /*     EMPNO ENAME      DNAME          LOC          
---------- ---------- -------------- -------------
      7900 JAMES      SALES          CHICAGO          .....*/
      
      
      
      /*NON-EQII JOIN //테이블과 테이블 사이 중복되는 컬럼이 없을 시 */
      
      SELECT EMPNO, ENAME, JOB, SAL, GRADE LOSAL, HISAL
      FROM SALGRADE S, EMP E
      WHERE E.SAL BETWEEN S.LOSAL AND HISAL AND E.DEPTNO = 10;
      
   /*EMPNO ENAME      JOB              SAL      LOSAL      HISAL
---------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT       5000          5       9999
      7782 CLARK      MANAGER         2450          4       3000
      7934 MILLER     CLERK           1300          2       1400
   */
   
   
   /*OUTER JOIN 
     조인 조건을 만족하지 않는 컬럼은 결과에 나타나지않는다.
     즉 조건에 만족하지못하는 컬럼까지 출력하기위해 'OUTER JOIN'을 사용한다.*/
     
     
     /*EMP 테이블과 DEPT테이블에서 DEPT 테이블에 있는 모든 자료를 사원번호, 이름, 업무,
     EMP 테이블의 부서번호, DEPT테이블의 부서번호, 부서명, 근무지를 출력*/
     
     SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO
     FROM DEPT D, EMP E
     WHERE D.DEPTNO = E.DEPTNO(+);
     
     /*SELF JOIN 
       자기 자신을 참조하여 탐색 및 비교 / 하나의 컬럼의 동일한 값을  'ALIAS'를 통해 
       여러곳에서 참조할수있다.*/
    
    --ex1)
    SELECT A.ENAME 사원, B.ENAME 관리자
    FROM EMP A, EMP B
    WHERE A.MGR = B.EMPNO(+); 
    
    /*사원        관리자       
      ---------- ----------
      FORD       JONES     
      SCOTT      JONES     
      SMITH      FORD      
      KING       (null) .....*/
      
      
      
      
      -- (ANSI)JOIN 
      
      /*CROSS JOIN*/
      
      --ORACLE
      SELECT EMPNO, ENAME, DNAME
      FROM DEPT, EMP;
      
      --ANSI
      SELECT EMPNO, ENAME, DNAME
      FROM DEPT
      CROSS JOIN EMP;
      
      
      /*NATURAL JOIN // 전제조건 테이블과 테이블 사이 공통되는 컬럼이 하나씩만 있어야한다.*/
      
      --(ANSI)
      SELECT EMPNO, ENAME, DNAME, LOC
      FROM EMP
      NATURAL JOIN DEPT;
      
      --(ORACLE)
      SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC
      FROM EMP E, DEPT D
      WHERE E.DEPTNO = D.DEPTNO;
      
      
      /*USING(colum)
        동일 이름의 컬럼이 여러개인 경우 조인 컬럼을 지정.*/
        
        SELECT EMPNO, ENAME, DNAME, LOC
        FROM EMP
        JOIN DEPT
        USING (DEPTNO);
        -------------------------------------------------
     /* ON */
     
    --(ANSI)
       SELECT EMPNO, ENAME, DNAME, LOC
       FROM EMP E
       JOIN DEPT D
       ON E.DEPTNO = D.DEPTNO
       WHERE D.DEPTNO =10;
       
     --(ORACLE)
       SELECT EMPNO, ENAME, DNAME, LOC
       FROM EMP E, DEPT D
       WHERE E.DEPTNO = D.DEPTNO
       AND D.DEPTNO =10;
        
        
        
      --ex1)
      SELECT EMPNO, ENAME, DNAME, SAL, GRADE
      FROM EMP E
      JOIN DEPT D
      ON E.DEPTNO = D.DEPTNO
      JOIN SALGRADE S
      ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
      
      --ex2)
      SELECT EMPNO, ENAME, DNAME, SAL
      FROM EMP E
      JOIN DEPT D
      ON E.DEPTNO =D.DEPTNO
      WHERE SAL IN (800);
      
      /*//
      EMPNO ENAME      DNAME                 SAL
 ---------- ---------- -------------- ----------
      7369 SMITH      RESEARCH              800
      */
      
      SELECT E.ENAME 사원, M.ENAME 매니저
      FROM EMP E
      JOIN EMP M
      ON E.MGR = M.EMPNO;
      
      
      
      --OUTER JOIN
      SELECT EMPNO, ENAME, DNAME
      FROM DEPT LEFT OUTER JOIN EMP
      ON DEPT.DEPTNO = EMP.DEPTNO;
 /*     EMPNO ENAME      DNAME         
   ---------- ---------- --------------
        7900 JAMES      SALES         
        7698 BLAKE      SALES         
        7654 MARTIN     SALES         
                        OPERATIONS        */
       
       
       --INSERT **************              
       INSERT INTO EMP
       VALUES(1111, 'TEST', 'SALES', 1111, '90/01/01', 400, NULL, NULL);
      
       SELECT * FROM EMP;
       
       /*1.부서 테이블과 사원 테이블에서 사번, 사원명, 부서코드, 부서명을 검색하시오.
       (사원명 오름차순 정렬)*/
       
    SELECT E.EMPNO 사번, E.ENAME 사원명, E.DEPTNO 부서코드, D.DNAME 부서명
    FROM EMP E, DEPT D;
    
    
    
       /*2. 부서 테이블과 사원 테이블에서 사번, 사원명, 급여, 부서명을 검색하시오, 
       단, 급여가 2000이상인 사원에 대하여 급여 기준으로 내림차순 정렬*/
       
       SELECT E.EMPNO 사번, E.ENAME 사원명, E.SAL, D.DNAME 부서명
       FROM EMP E, DEPT D
       WHERE E.DEPTNO = D.DEPTNO
       AND SAL > 2000
       ORDER BY SAL DESC;
       
       
       /*3. 부서 테이블과 사원 테이블에서 사번, 사원명, 업무, 급여, 부서명
       을 검색하시오 단 업무가 MANAGER이며 급여가 2500이상인 
       사원에 대하여 사번을 기준으로 오름차순*/
       SELECT E.EMPNO 사번, E.ENAME 사원명, E.JOB 업무, E.SAL 급여, 
        D.DNAME 부서명
       FROM EMP E, DEPT D
       WHERE E.DEPTNO =D.DEPTNO AND E.JOB = 'MANAGER'
       AND E.SAL > 2500
       ORDER BY EMPNO ASC;
       
       
       /*4. 사원 테이블과 급여 등급 테이블에서 사번, 사원명, 급여, 등급을
       검색 하시오. 단, 등급은 급여가 하한값과 상한값 범위에 포함되고 
       등급이 4이며, 급여를 기준으로 내림차순 정렬 할것*/
       
       SELECT E.EMPNO 사번, E.ENAME 사원명, E.SAL 급여, S.GRADE 등급
       FROM EMP E, SALGRADE S
       WHERE E.SAL BETWEEN S.LOSAL AND HISAL AND S.GRADE = 4
       ORDER BY E.SAL DESC;
       
       
       /*5. 부서 테이블, 사원 테이블, 급여 등급 테이블에서 사번, 사원명, 부서명,
       급여, 등급을 검색하시오 단 등급은 급여가 하한값과 상한값 범위에 포함되며
       등급을 기준으로 내림차 정렬.*/
       SELECT E.EMPNO 사번, E.ENAME 사원명, D.DNAME 부서명, E.SAL 급여, 
       S.GRADE 등급
       FROM EMP E, DEPT D, SALGRADE S
       WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
       AND E.DEPTNO = D.DEPTNO
       ORDER BY 등급 DESC;
       
       /*6. 사원 테이블에서 사원명과 해당 사원의 관리자명을 검색하시오
       */
            SELECT E.ENAME 사원명, B.ENAME 관리자명
            FROM EMP E, EMP B
            WHERE E.MGR = B.EMPNO; 
            
            
      /*7. 사원 테이블에서 사원명, 해당사원의 관리자명, 해당 사원의 관리자의
      관리자명을 검색하시오 */
            SELECT E.ENAME 사원명, B.ENAME 관리자명, F.ENAME 관관리자
            FROM EMP E, EMP B, EMP F
            WHERE E.MGR = B.EMPNO
            AND B.MGR = F.EMPNO;
            

       
       --10. 커미션을 받는 사원의 이름, 커미션, 부서이름을 출력하시오.
       SELECT E.ENAME, E.COMM,D.DNAME
       FROM EMP E, DEPT D
       WHERE E.DEPTNO = D.DEPTNO
       AND COMM IS NOT NULL AND COMM NOT LIKE 0;
       
      --11. 이름에 'A'가 들어가는 사원들의 이름과 부서명 출력하기
      
       SELECT E.ENAME,D.DNAME
       FROM EMP E, DEPT D
       WHERE E.DEPTNO = D.DEPTNO
       AND E.ENAME LIKE '%A%';
       
       /*12. DALLAS에 근무하는 사원 중 급여 1500이상인 사원의 이름, 급여
       입사일 보너스를 출력하시오*/
       
       SELECT E.ENAME,E.SAL, E.HIREDATE, E.COMM
       FROM EMP E, DEPT D
       WHERE E.DEPTNO = D.DEPTNO
       AND D.LOC = 'DALLAS';
       
       /*13. 자신의 관리자보다 연봉을 많이 받는 사원의 이름과 연봉을 출력하시오
       */
        SELECT A.ENAME, B.SAL *12 연봉
       FROM EMP A, EMP B
       WHERE A.MGR = B.EMPNO
       AND A.SAL > B.SAL;
       
       
       /*14.직원 중 현재시간 기준으로 근무 개월 수가 30년(12*30개월)
       보다 많은 사람의 이름, 급여, 입사일, 부서명을 출력하시오*/
       
       SELECT A.ENAME, A.SAL, A.HIREDATE, D.DNAME
       FROM EMP A, DEPT D
       WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) >30
       AND A.DEPTNO = D.DEPTNO;
       
       
       /*15. 각 부서별로 1982년 이전에 입사한 직원들의 인원수를 구하시오
       */
       SELECT COUNT(A.ENAME)
       FROM EMP A, DEPT D
       WHERE A.DEPTNO = D.DEPTNO
       AND TO_CHAR(HIREDATE,'YYYY') <= 1982;
       
       
       --*** WORK SHOP ***********************************
       SELECT CATEGORY 학과이름, CAPACITY 현재정원,
       CASE WHEN CAPACITY >=40   THEN '대 강의실'
            WHEN CAPACITY >=30 THEN '중 강의실' 
            ELSE '소 강의실' 
       END 강의실크기
       FROM TB_DEPARTMENT
       WHERE CATEGORY = '예체능'
       ORDER BY 강의실크기, CAPACITY;
       
       
       /*현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 학인하자.
       (법학과의 학과코드는 학과 테이블에서 조회하여 찾아냄
       단 조인 사용*/
       SELECT P.PROFESSOR_NAME, P.PROFESSOR_SSN
       FROM TB_PROFESSOR P, TB_DEPARTMENT D
       WHERE P.DEPARTMENT_NO = D.DEPARTMENT_NO
       AND D.DEPARTMENT_NAME = '법학과'
       ORDER BY PROFESSOR_SSN DESC;
       
      --******************************************************
       
       /*서브쿼리 
       SELECT에 포함되어 있는 또 하나의 별도 SELECT.
       여러번의 SELECT문을 수행 해야 얻을 수 있는 결과를 하나의 중첩된 
       SELECT문으로 쉽게 얻을 수 있도록 해준다.*/
       
       --ex) 1
       SELECT ENAME
       FROM EMP
       WHERE SAL > (SELECT SAL
                    FROM EMP
                    WHERE ENAME = 'SCOTT');
                    
       --ex) 2             
      SELECT ENAME 
      FROM EMP
      WHERE DEPTNO = (SELECT DEPTNO
                      FROM EMP
                      WHERE ENAME = 'SCOTT');
                      
     --sal의 평균보다 월급이 더 높은사람들의 이름 리스트
     
     SELECT ENAME
     FROM EMP
     WHERE SAL > (SELECT AVG(SAL)
                      FROM EMP
                     );
    
     /*EMP 테이블에서 사원번호가 7521의 업무와 같고 급여가 사원번호 7934보다
     많은 사원의 사원번호, 이름, 담당 업무, 입사일자, 급여 출력*/
     
     SELECT EMPNO, ENAME, JOB, HIREDATE, SAL
     FROM EMP
     WHERE JOB = (SELECT JOB
                  FROM EMP 
                   WHERE EMPNO = 7521)
     AND 
           SAL > (SELECT SAL
                  FROM EMP
                  WHERE EMPNO = 7934);
                  
                  
    --EMP 테이블에서 급여의 평균보다 적은 사원의 사원번호, 업무, 급여, 부서번호 출력
    SELECT EMPNO, JOB, SAL ,DEPTNO
    FROM EMP
    WHERE SAL < (SELECT AVG(SAL)
                  FROM EMP);
                  
                  
    --SCOTT의 직업과 같은 직업인 사람 리스트
    SELECT * 
    FROM EMP 
    WHERE JOB = (SELECT JOB
                FROM EMP
                WHERE ENAME = 'SCOTT');
                
    /*사원 테이블에서 BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여를 검색*/
    SELECT EMPNO, ENAME, SAL 
    FROM EMP
    WHERE SAL > (SELECT SAL
                 FROM EMP
                 WHERE ENAME = 'BLAKE');
                 
    /*사원 테이블에서 MILLER 보다 늦게 입사한 사원의 사번, 이름, 입사일*/
    SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE > (SELECT HIREDATE
                      FROM EMP
                      WHERE ENAME = 'MILER');
    
    SELECT EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO
    FROM EMP
    WHERE SAL IN(SELECT MIN(SAL)
                 FROM EMP
                 GROUP BY JOB);
                 
   /* ALL // 조건으로 비교한 서브쿼리 값이 복수일때 복수 조건 모두를 고려하여
      비교할수있다.
   */
    SELECT EMPNO, ENAME, JOB
    FROM EMP 
    WHERE SAL < ALL (SELECT SAL 
    FROM EMP
    WHERE JOB = 'MANAGER');
    
    
    
    
  --4. 사원 테이블에서 부서별 최대 급여를 받는 사원들의 사번, 이름, 부서코드, 급여를 검색
  
  SELECT EMPNO 사번, ENAME 이름, DEPTNO 부서코드, SAL 급여
  FROM EMP
  WHERE SAL IN(SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
 --5.SALGRADE가 2등급인 사원들의 평균 급여보다 적게 받는 사원 정보를 검색하시오
  SELECT *
  FROM EMP 
  WHERE SAL <= (SELECT AVG(SAL)
                FROM EMP E JOIN SALGRADE S
                ON E.SAL BETWEEN S.LOSAL AND S.HISAL  
                WHERE S.GRADE = 2); 
  

                
                
                    
     
                    
       



       
      
       
       
    
       
       
       
       
       
       
       
    
       
       
      
      
     
     
   
   

   



  
  
  
   
   
   
   
   
   
   

   
  
   
   
   
   
   
   
   
    
