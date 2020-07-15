/* 연산자 사용
   SELECT EMPNO, ENAME, SAL * 연산자 FROM EMP;
   SELECT EMPNO, ENAME, SAL * 1.1 FROM EMP; // SAL +100
   SELECT SAL /2 FROM EMP; // SAL/2 
*/


/*  별칭(alias)사용.
    SELECT ENAME AS 사번, SAL AS 급여 FROM EMP; // 사번, 급여 
    SELECT  DNAME AS 부서명, LOC AS 주소지 FROM DEPT;// 부서 이름, 주소지
    SELECT SAL 급여 FROM EMP; // 'AS' 생략가능.
*/

/* null값을 가진 컬럼은 NVL함수를 통해 임의의 값 또는 연산을 수행할수있다. 
   NVL은 인자로 (컬럼명,기본값), NVL2는 (컬럼명, A,B) => 
   true === A, false === B 
   -------------------------------------------------------------
   SELECT EMPNO, ENAME, COMM, NVL(COMM,0)FROM EMP;
   // null ? null === 0; 
   SELECT EMPNO, ENAME, COMM, NVL2(COMM,1,2)FROM EMP;
   // null ? COMM === 2 : COMM ===1; 
*/

/*  연결 연산자 // '||' or 연산자를 통해 여러 개의 문자열을 연결하여 
    하나의 문자열로 생성.      
    --------------------------------------------------------
    SELECT ENAME || SAL AS "이름 급여" FROM EMP; 

SELECT ENAME||'의 직급은 '||JOB||'이다'AS "사원별 직급" FROM EMP
출력 시 문자열과 컬럼의 조합은 || 

SELECT ENAME ||'의 급여는'||SAL||'입니다' AS "급여" FROM EMP;*/

/*전체 테이블 탐색
DESC EMP;*/ 

/*중복 제거*/
SELECT DISTINCT JOB FROM EMP;
  
--  WHERE 문
--   SELECT * FROM EMP
--   WHERE SAL BETWEEN 1000 AND 2000;
   
   /*
     SELECT *
     FROM EMP
     WHERE MGR IS NOT NULL;
       // NULL 값이 아닌 값만 출력
   */
   
--   다중 조건
   SELECT EMPNO "사원 번호", ENAME 이름, JOB 직업, SAL 급여 FROM EMP
   WHERE (JOB,DEPTNO) IN (('MANAGER',20),('CLERK',30));
   
--   AND(&&)연산자
   SELECT ENAME 이름, JOB 직업, SAL 급여, DEPTNO 등급
   FROM EMP
   WHERE JOB = 'SALESMAN'
   AND DEPTNO >= 20;
   
--   OR (||) 연산자 
   SELECT * 
   FROM EMP
   WHERE JOB = 'SALESMAN'
   OR SAL > 1500;
   
   
   
   
   

    
    
    
    











