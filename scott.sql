
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
   
   
/* 6. LENGTH function // ���ڿ��� ���̸� ���ڰ����� RETURN*/
    SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
    FROM EMP
    WHERE DEPTNO = 20
    ORDER BY LENGTH(ENAME) ASC; -- RETURN �� �������� ����
    
/* 7. CEIL function // ���� �Լ�  
    
    