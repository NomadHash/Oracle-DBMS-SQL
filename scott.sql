
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
 
 
 
 



 
 
 
 
 
 
 

