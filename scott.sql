
-- �ǽ� ���� -------------------------------------------

/* 1. �а� �̸��� �迭�� ǥ���Ͻÿ�, �� ����� 
   "�а���", "�迭"�� ǥ��(TB_DEPARTMENT)*/  
SELECT DEPARTMENT_NAME "�а� ��", CATEGORY �迭
FROM TB_DEPARTMENT;
------------------------------------------------

/* 2.������ ��°��� ���ڿ� ��ġ��*/
SELECT DEPARTMENT_NAME ||'�� ������'||CAPACITY||'�Դϴ�.' 
AS "�а��� ����"
FROM TB_DEPARTMENT;
------------------------------------------------

/* 3. ���� �����а��� �ٴϴ� �л� �� ���� �������� ���л��� �˻�
 (TB_DEPARTMENT)*/
 
 SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE DEPARTMENT_NO = 001
 AND ABSENCE_YN = 'Y';
 ------------------------------------------------
 
 /* 4. ������ ��� ��ü�ڸ� ã�� �̸��� �Խ��� ����� �й��� ������ ����.
 A513079, A513091, A513110*/
 SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE STUDENT_NO IN ('A513079', 'A513091', 'A513110')
 ------------------------------------------------
 ----------------------------------------------------------------------
 
 
-- LIKE�� ------------------------------------------------------------

 SELECT STUDENT_NAME 
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '��%';
-- �˻� �� �������� ù �ε����� '��'�� �����͸� ��ȯ

 SELECT STUDENT_NAME 
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '%��%';
-- ���ڿ��� ����� �ε������� '��'�� �����͸� ��ȯ

SELECT STUDENT_NAME
 FROM TB_STUDENT
 WHERE STUDENT_NAME LIKE '_��%';
 -- '_'�� ���� �˻� �� �������� ù �ε����������� Ž�� ������ �ٲ��ټ��ִ�
 ----------------------------------------------------------
 
 -- &&, ||�� �ǽ� --
 SELECT ENAME, JOB, SAL, COMM
 FROM EMP
 WHERE (JOB = 'CLERK' OR JOB = 'ANALYST')
 AND COMM IS NULL
 AND SAL >= 1000
 AND SAL <= 3000;
 
 
 /* ORDER�� 
    WHERE�� �Ʒ��� ��ġ�ϸ�, �˻��� ����� ��°��� ������,������ ������ �����Ѵ�.
    �÷��� �ڿ� 'ASC','DESC' �Ӽ����� ���� ������, ������ ������ �����Ҽ��ִ�.*/
    
 SELECT EMPNO �����ȣ, ENAME �̸�, HIREDATE �Ի���, SAL �޿� 
 FROM EMP
 ORDER BY SAL DESC; -- OR ORDER BY SAL ASC; (��������)
 
 
 SELECT ENAME �̸�, SAL *12 �޿�
 FROM EMP
 ORDER BY �޿� DESC;
-- // �÷��� alias ������ ORDER�� Ÿ������ alias���� �������� �� �ִ�.

 SELECT ENAME, SAL * 12 ANNUAL, EMPNO FROM EMP
 ORDER BY SAL DESC,EMPNO;
 -- // SAL������ ������  ���� �� EMPNO������ ������.
 
 
 
 --***�׷� �Լ�******************************************
 
/* 1. INITCAP function
    SELECT���� Į���� ������ �� ������, ��½� �ش� Į���� �����Ͱ��� 
    �� �� ���ڿ��� �빮�ڷ� ��ȯ���ش�.
 */
 SELECT DEPTNO, INITCAP(DNAME), INITCAP(LOC)
 FROM DEPT;
 --------------------------------------------------------------
 
 /* 2. LOWER or UPPER function
    �ش� ���ڿ� ��ü�� �ҹ���, �빮�ڷ� ��ȯ�Ѵ�.
 */
 SELECT EMPNO, ENAME �̸�, LOWER(JOB) ����
 FROM EMP
 WHERE LOWER(ENAME) = 'scott';
 
  SELECT EMPNO, ENAME �̸�, LOWER(JOB) ����
 FROM EMP
 WHERE ENAME = UPPER('scott');
 --------------------------------------------------------------
 
 /* 3.CONCAT function
    �ΰ��� ���ڿ� �����͸� ���ļ� �ϳ��� ���ڿ��� ��ȯ. 
    SELECT �ܿ��� ����� �� �ִ�.*/
    SELECT EMPNO, ENAME, JOB, CONCAT(ENAME, JOB) 
    FROM EMP
    WHERE EMPNO = 7369;
--------------------------------------------------------------

/* 4. LPAD function // LPAD(coulum, n, 'string')
   ������ �� ���ʿ� ���ڿ��� �߰����ش�. ���ڴ� (�÷�, ũ��, ���ڿ�)*/
   
   SELECT ENAME, LPAD(ENAME,10,'*'),SAL
   FROM EMP
   WHERE DEPTNO = 10;
   
/* 5. SUBSTR function // SUBSTR(coulum, m,n)
   */
   SELECT ENAME, SUBSTR(ENAME,1,3) HIREDATE
   FROM EMP;
   ------------------------
   -- ex2)
   SELECT SUBSTR(HIREDATE,1,2) �Ի�⵵
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
   
/* 6. LENGTH function // ���ڿ��� ���̸� ���ڰ����� RETURN*/
    SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
    FROM EMP
    WHERE DEPTNO = 20
    ORDER BY LENGTH(ENAME) ASC; -- RETURN �� �������� ����
    
/* 7. REPLACE function // Ư�� ���ڿ� ���� 
     REPLACE(���ڿ�, �ٲ� ���ڿ�, �ٲ� ���ڿ�)*/

     SELECT REPLACE('970903-1111111',SUBSTR('970903-1111111',9)
     ,'******')
     FROM DUAL;
---------------------------------------------------------------
/* 8. LTRIM function // LTRIM(�÷�, ���ڿ�) */

    SELECT ENAME, JOB, LTRIM(JOB,'A'), SAL, LTRIM(SAL, 1)
       FROM EMP; 


/* 9. TRIM function //�� �� ���ڿ� Ȥ�� ���� ���� 
TRIM(LEADING | TRAILING | BOTH + ���ڿ� + FROM �÷�)*/

    SELECT EMPNO, JOB, 
    TRIM(LEADING 'S' FROM JOB) AS LEADING,
    TRIM(TRAILING 'N' FROM JOB) AS TRAILING
    FROM EMP
    WHERE EMPNO = 7844;
    
    --ex2) // ���ڰ��� ������ ���ڿ��� ������ ������ ������ ������.
    SELECT LTRIM('     MILER     '), LENGTH(LTRIM('     MILER     '))
    FROM DUAL; --//length = 10
 
    SELECT TRIM('     MILER     '), LENGTH(TRIM('     MILER     '))
    FROM DUAL; --//length = 5
    
---DUMMY TABLE (API) -------------------------
    
    SELECT SYSDATE FROM DUAL; --�ð���ȸ
    SELECT 123*456 FROM DUAL;
    
    
--*** �ǽ� ���� ********************************************

-- 5. ���� ������ 20�� �̻�, 30�� ������ �а� �̸��� �迭�� ����Ͻÿ�.

   --ex1) Between and ��
   SELECT DEPARTMENT_NAME �а�, CATEGORY �迭
   FROM TB_DEPARTMENT
   WHERE CAPACITY BETWEEN 20 AND 30;
   
   --ex2) &&��
   SELECT DEPARTMENT_NAME �а�, CATEGORY �迭
   FROM TB_DEPARTMENT
   WHERE CAPACITY >= 20
   AND CAPACITY <=30;
   ---------------------------------------------------------
   
   /* 6.������ �����ϰ� ��� �Ҽ��а��� �������ִ�. ������б� ������ �̸���
   �˾� �����ִ� SQL������ �ۼ��Ͻÿ�. */
   -- WHERE (�÷�) IS NULL; ���
   
   SELECT PROFESSOR_NAME �̸�
   FROM TB_PROFESSOR
   WHERE DEPARTMENT_NO IS NULL;
   ---------------------------------------------------------
   
   /* 7. ������� ������ �а��� ������������ �л��� �̸��� �˻��Ͻÿ�. */
   
   
   /* 8.�� ���п��� � �迭�� �ִ��� ��ȸ�Ͻÿ�.*/
   -- �ߺ����� �޼��� 'DISTINCT' ���
   SELECT DISTINCT CATEGORY AS �迭
   FROM TB_DEPARTMENT;
   
   
   
   -- Math function -----------------------------------------
   
   /* 1. CEIL function (�ø� ��)
    stntax // CEIL(column1) */
   SELECT CEIL(10.1)
   FROM DUAL; --// 11
   
    /* 2. FLOOR function (���� ��)
    stntax // FLOOR(column1) */
   SELECT FLOOR(10.7)
   FROM DUAL; --// 11
   
    /* 3. MOD function (% �� ����)
    stntax // MOD(column1) */
   SELECT MOD(3,2)
   FROM DUAL; --// 1
   
   --ex1) 
   SELECT SAL, MOD(SAL,30)
   FROM EMP
   ORDER BY SAL DESC;
   
   /* 4. ROUND function (n�� �ڸ����� �ݿø�)
    stntax // ROUND(column1,n) */
   SELECT ROUND(1.1634,1) --//�Ҽ��� ù° �ڸ� �� ������ �ݿø�.
   FROM DUAL; --// 1.2
   
   /* 5. TRUNC function (�Ҽ��� ����)
      syntax TRUNC(column1,n)*/
      SELECT TRUNC(456.789,2) -- �Ҽ��� �������� ��ĭ���� ���
      FROM DUAL; --// 456.78
      
      ----------------------------------------
      
      -- Date, time function
      SELECT SYSDATE -- ��¥
      FROM DUAL;
      
      --ex1)
      SELECT SYSDATE ��¥, SYSDATE +1 ����
      FROM DUAL; --// ���� ����
      
      --ex2)
      SELECT ENAME �̸�, TRUNC((SYSDATE-HIREDATE)/365)���� 
      FROM EMP;
      
      SELECT SYSTIMESTAMP --��¥ �� �ð�
      FROM DUAL;
      
      /*1. MONTHS_BETWEEN function
      syntax// MONTHS_BETWEEN(data1,data2)
            ex) MONTHS_BETWEEN(SYSDATE,HIREDATA)
                data1�� data2 ������ �ð� */
    
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
    SELECT ENAME �̸�, HIREDATE �Ի���,
    TRUNC(SYSDATE-HIREDATE,0)"��ü ����",
    TRUNC((SYSDATE-HIREDATE)/7,0) ��,
    ROUND(MOD((SYSDATE - HIREDATE),7),0) DAYS
    FROM EMP
    ORDER BY SYSDATE-HIREDATE DESC;
    /* SYSDATE-HIREDATE = ���� ��¥�κ��� 
    �ش� ��¥ ������ �� */
    
   
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD,(AM)DY HH24:MI:SS'),
    'YYYY/MM/DD,(AM)DY HH24:MI:SS'
    FROM DUAL;

SELECT ENAME �̸�, HIREDATE �Ի���, SAL �޿�
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='09'; --//9���� �Ի��� ��� Ž��


SELECT ENAME �̸�, HIREDATE �Ի���, SAL �޿�
FROM EMP
WHERE TO_CHAR(HIREDATE, 'YY')='81'--//81�⵵�� �Ի��� ��� Ž��
ORDER BY TO_CHAR(HIREDATE, 'MM');

--EMP ���̺��� 10�� �μ��� �Ի����ڸ� '~�� ~�� ~�� �� ���

SELECT ENAME,HIREDATE, TO_CHAR(HIREDATE,'YYYY"��" MM"��" DD"��"')�Ի���
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
   �ش� �÷��� �������� ���ο� �÷� ����*/
   
-- ex1)
SELECT EMPNO, ENAME, JOB, SAL "�� �޿�",
CASE JOB WHEN 'ANALYST' THEN SAL * 1.1
         WHEN 'CLERK' THEN SAL * 1.2
         WHEN 'MANAGER' THEN SAL * 1.3
         WHEN 'PRESIDENT' THEN SAL * 1.4
         WHEN 'SALESMAN' THEN SAL * 1.5
END "�� �޿�"
FROM EMP;

-- ex)2
SELECT EMPNO �����ȣ, ENAME �̸�, JOB ��å, SAL �޿�,
CASE WHEN SAL >=0 AND SAL <=1000 THEN 'E'
     WHEN SAL >1000 AND SAL <=2000 THEN 'D' 
     WHEN SAL >2000 AND SAL <=3000 THEN 'C' 
     WHEN SAL >3000 AND SAL <=4000 THEN 'B' 
     WHEN SAL >4000 AND SAL <=5000 THEN 'A'
END ���
FROM EMP
ORDER BY ���;

/* DECODE function */
   SELECT EMPNO, ENAME, JOB, SAL �޿�,
     DECODE(JOB, 'ANALYST' , SAL*1.1,
                 'CLERK' , SAL*1.2,
                 'MANAGER' , SAL*1.3,
                 'PRESIDENT' , SAL*1.4,
                 'SALESMAN' , SAL*1.5, SAL) "�� �޿�"
   FROM EMP;
   
   /*SIGN function //�־��� ���ڰ� ������� �������� 0���� ���ϴ� �Լ�
   
   --=== �ǽ� ���� =====================================================
   
   /* 1. ������̺��� �Ի����� 12���� ����� ���, �����, �Ի��� �˻��Ͻÿ� */
   SELECT EMPNO ���, ENAME �����, HIREDATE �Ի���
   FROM EMP
   WHERE TO_CHAR(HIREDATE, 'MM')='12';
   
   /* 2. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�.*/
   SELECT EMPNO, ENAME, LPAD(SAL,10,'*') "�޿�"
   FROM EMP;
   
   /* 3. ������ ���� ����� �˻��Ҽ��ִ� SQL ������ �ۼ��Ͻÿ�.*/
   

   SELECT EMPNO, ENAME, COMM, 
   CASE WHEN COMM IS NULL THEN '�Ϲݻ��'
        ELSE '�������'
   END "��� ����"
   FROM EMP;
   
    SELECT LOC,
     DECODE(LOC, 'NEW YORK' , 'EAST', 
                 'DALLAS', 'CENTER',
                 'CHICAGO', 'CENTER',
                 'BOSTON', 'EAST',
                 LOC) AREA
   FROM DEPT;
   
   
    SELECT EMPNO, ENAME, JOB, SAL �޿�,
     DECODE(JOB, 'ANALYST' , SAL*1.1,
                 'CLERK' , SAL*1.2,
                 'MANAGER' , SAL*1.3,
                 'PRESIDENT' , SAL*1.4,
                 'SALESMAN' , SAL*1.5, SAL) "�� �޿�"
    FROM EMP;
   
   
   SELECT STUDENT_NO,STUDENT_NAME, STUDENT_SSN
   FROM TB_STUDENT
   WHERE STUDENT_ADDRESS LIKE '����%'
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
      ��ü ���̺��� �ƴ� Ư�� �׷����� ���� �� ���. */
      --WHERE ������ �׷� �Լ��� �� �� ����.
      
      SELECT DEPTNO, AVG(SAL)
      FROM EMP
      GROUP BY DEPTNO;
      -- DEPTNO�� �׸񺰷� SAL�� ��հ��� ���.
      
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
      
     -- HAVING //GROUP BY�� ���ǽ�
     
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
     
     
     SELECT TO_CHAR(HIREDATE,'YYYY') ��, TO_CHAR(HIREDATE,'MM') ��, SUM(SAL)
     FROM EMP
     GROUP BY TO_CHAR(HIREDATE,'YYYY'), TO_CHAR(HIREDATE,'MM')
     ORDER BY ��;
     
     
     SELECT COUNT(DEPARTMENT_NO) �л���
     FROM TB_STUDENT
     WHERE ENTRANCE_DATE LIKE '01%'
     AND DEPARTMENT_NO = 003;
    
    
    SELECT CATEGORY �迭, DEPARTMENT_NAME �а��̸�, CAPACITY ����
    FROM TB_DEPARTMENT
    WHERE CATEGORY = '����'
    AND CAPACITY BETWEEN 20 AND 30
    ORDER BY DEPARTMENT_NAME ASC;
    
    
    SELECT CATEGORY �迭, COUNT(CATEGORY) �а��� 
      FROM TB_DEPARTMENT
      GROUP BY CATEGORY
      HAVING CATEGORY LIKE '%��%'
      ORDER BY �а��� DESC;
      

    
    
    
     
     
     
     
    
     
    
    aabbcc
    for(let i=1; i<s.length/2; i++){
    s.substr(i,i)
    }
    
 
   
   
   
   

   



  
  
  
   
   
   
   
   
   
   

   
  
   
   
   
   
   
   
   
    
