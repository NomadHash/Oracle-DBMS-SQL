/* ������ ���
   SELECT EMPNO, ENAME, SAL * ������ FROM EMP;
   SELECT EMPNO, ENAME, SAL * 1.1 FROM EMP; // SAL +100
   SELECT SAL /2 FROM EMP; // SAL/2 
*/


/*  ��Ī(alias)���.
    SELECT ENAME AS ���, SAL AS �޿� FROM EMP; // ���, �޿� 
    SELECT  DNAME AS �μ���, LOC AS �ּ��� FROM DEPT;// �μ� �̸�, �ּ���
    SELECT SAL �޿� FROM EMP; // 'AS' ��������.
*/

/* null���� ���� �÷��� NVL�Լ��� ���� ������ �� �Ǵ� ������ �����Ҽ��ִ�. 
   NVL�� ���ڷ� (�÷���,�⺻��), NVL2�� (�÷���, A,B) => 
   true === A, false === B 
   -------------------------------------------------------------
   SELECT EMPNO, ENAME, COMM, NVL(COMM,0)FROM EMP;
   // null ? null === 0; 
   SELECT EMPNO, ENAME, COMM, NVL2(COMM,1,2)FROM EMP;
   // null ? COMM === 2 : COMM ===1; 
*/

/*  ���� ������ // '||' or �����ڸ� ���� ���� ���� ���ڿ��� �����Ͽ� 
    �ϳ��� ���ڿ��� ����.      
    --------------------------------------------------------
    SELECT ENAME || SAL AS "�̸� �޿�" FROM EMP; 

SELECT ENAME||'�� ������ '||JOB||'�̴�'AS "����� ����" FROM EMP
��� �� ���ڿ��� �÷��� ������ || 

SELECT ENAME ||'�� �޿���'||SAL||'�Դϴ�' AS "�޿�" FROM EMP;*/

/*��ü ���̺� Ž��
DESC EMP;*/ 

/*�ߺ� ����*/
SELECT DISTINCT JOB FROM EMP;
  
--  WHERE ��
--   SELECT * FROM EMP
--   WHERE SAL BETWEEN 1000 AND 2000;
   
   /*
     SELECT *
     FROM EMP
     WHERE MGR IS NOT NULL;
       // NULL ���� �ƴ� ���� ���
   */
   
--   ���� ����
   SELECT EMPNO "��� ��ȣ", ENAME �̸�, JOB ����, SAL �޿� FROM EMP
   WHERE (JOB,DEPTNO) IN (('MANAGER',20),('CLERK',30));
   
--   AND(&&)������
   SELECT ENAME �̸�, JOB ����, SAL �޿�, DEPTNO ���
   FROM EMP
   WHERE JOB = 'SALESMAN'
   AND DEPTNO >= 20;
   
--   OR (||) ������ 
   SELECT * 
   FROM EMP
   WHERE JOB = 'SALESMAN'
   OR SAL > 1500;
   
   
   
   
   

    
    
    
    











