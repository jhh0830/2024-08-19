
/*
    * DDL (DATA DEFINITION LANGUAGE)
    
    ������ ���� ���
    ����Ŭ���� �����ϴ� ��ü  (OBJECT) �� 
    ������ ����� (CREATE) , ������ �����ϰ� (ALTER),
    ���� ��ü�� ������ (DROP) �ϴ� ��ɹ�
    ��, �����ͺ��̽��� �̷�� �ִ� ������ ��ü�� �����ϴ� ����,
    �ַ� DB ������, ������ �����
    
    * ����Ŭ�� ��ü (OBJECT)
    ����Ŭ �����ͺ��̽��� �̷�� �ִ� "������"
    
    [ ���� ]
    ���̺� (TABLE), �� (VIEW), ������ (SEQUENCE),
    �ε��� (INDEX), ��Ű�� (PACKAGE), Ʈ���� (TRIGGER),
    ���ν��� (PROCEDURE), �Լ� (FUNCTION)
    ���Ǿ� (SYNONYM), ����� (USER)
        
*/

/*
    < CREATE TABLE>
    * ���̺� (TABLE)
    �� (ROW), �� (COLUMN) �� �����Ǵ�
    "���� �⺻����" �����ͺ��̽��� ��ü (������)
    ��� �����ʹ� �׻� ���̺��� ���ؼ� ���̺� �����
    ��, �����͸� �����ϰ��� �Ѵٸ� ���̺��� ������ ������ ��!!
    
    [ ǥ���� ]
    CREATE TABLE ���̺�� (
        �÷��� �ڷ���,
        �÷��� �ڷ���,
        ...
    );
        
   < �ڷ��� >
   - ���� (CHAR(ũ��) / VARCHAR2(ũ��))
   : ũ��� BYTE ������ �����Ѵ�.
     ����, ������, Ư������ => �ѱ��� �� 1BYTE �� ���
     �ѱ�                 => �ѱ��� �� 3BYTE �� ���
     CHAR(����Ʈ��) : �ִ� 2000BYTE ���� ���� ����
                     �������� (�ƹ��� ���� ���� ���͵� �������� ä����
                     ó�� �Ҵ��� ũ���� �����ϰڴ�.)
                     �ַ� ����� ���� ���ڼ��� �� ������ ���� ���
                     ��) ���� : '��' / '��' �Ǵ� 'M' / 'F'
                        ��ȭ��ȣ : 010-XXXX-XXXX
                        �ֹι�ȣ : YYMMDD-GXXXXXX
                                            
     VARCHAR2(����Ʈ��) : �ִ� 4000BYTE ���� ���� ����
                         ��������
                         (���� ���� ������ �� ��� ���� ���缭
                          ���� ������ ũ�Ⱑ �پ��)
                        �ַ� ���� �� �Ǵ� �������� �뷮�� ������ ���� ���� ���
                        ��) �Խñ� ����, �Խñ� ����
                        (VAR �� ����, 2 �� ������ 2�踦 �ǹ���)
                        
     
   - ���� (NUMBER)
   : ����, �Ǽ� ������� ��� �� ���� ����
   
   - ��¥ (DATE)
   : ��, ��, ��, ��, ��, �ʸ� ��� �� ������ �ڷ���
   
        
*/

-->> ȸ������ ������ (���̵�, ��й�ȣ, �̸�, ȸ��������)
--   �� ��� ���� ���̺� MEMBER ���̺� �����ϱ�
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_DATE DATE
    
);
--> ��ҹ��� ���� X, ��Ÿǥ��� ��� �Ұ�!! (��ٹٷ� ����)
--> VARCHAR2 �� ����� �����ؼ� �������� ���� ������
-- �ټ� �˳��ϰ� ������ �����ϴ°� ����!!

-- ���̺��� �� ��������� Ȯ��
SELECT * FROM MEMBER;
--> �ܼ� SELECT ���� Ȱ���ϰų� �����ǿ��� Ȯ�� ����

-- ������ ��ųʸ��� �̿��Ͽ� ���̺� Ȯ�� ����
-- ������ ��ųʸ� : �پ��� ��ü���� ������ �����ϰ� �ִ�
--                 �ý��� ���̺� (���� ��ȸ �뵵)
-- USER_TABLES : ���� �� ������ ������ �ִ� ���̺���� 
--               �������� ������ Ȯ���� �� �ִ� ������ ��ųʸ�
SELECT* FROM USER_TABLES;

-- USER_TAB_COLUMNS : ���� �� ������ ������ �ִ� ���̺����
--                    ��� �÷��� �������� ��ȸ�� �� �ִ� ������ ��ųʸ�
SELECT * FROM USER_TAB_COLUMNS;
--------------------------------------------------------

/*
     * �÷��� �ּ� �ޱ� (�÷��� ���� ����)
     
     COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�����';
     
     
*/

COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵�';
-- ȸ����й�ȣ, ȸ���̸�, ȸ��������
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.MEMBER_DATE IS 'ȸ��������';
--> �������!! �������� �������� �о��̳� �ٸ�������� ���̺��� ���� �� ������

-- ������� MEMBER ���̺� ������ �־��
-- �����͸� �߰��� �� �ִ� ���� : INSERT�� 
-- (�� �� ������ �߰�, ���� ������ �߿�!!)
-- INSERT INTO ���̺�� VALUES (ù��° �÷���,�ι�° �÷���....������ �÷���)
INSERT INTO MEMBER VALUES('user01'
                        , 'pass01'
                        , 'ȫ�浿'
                        , '2021-02-01');
INSERT INTO MEMBER VALUES('user02'
                        , 'pass02'
                        , '�踻��'
                        , ' 21/02/02');
INSERT INTO MEMBER VALUES('user03'
                        , 'pass03'
                        , '�谩��'
                        , SYSDATE);
INSERT INTO MEMBER VALUES(NULL
                        , NULL
                        , NULL
                        , SYSDATE);
-- ���̵�, ��й�ȣ, �̸��� NULL ���� �����ؼ��� �ȵ�

INSERT INTO MEMBER VALUES('user03'
                        , 'pass04'
                        , '�ڸ���'
                        , SYSDATE);
-- �ߺ��� ���̵�� �����ؼ��� �ȵ�

-- ���� NULL ���̳� �ߺ��� ���̵��� ��ȿ���� ���� �����̴�.
-- ��ȿ�� �����Ͱ����� �����ϱ� ���ؼ� "��������" �� �ɾ���� �Ѵ�.
-----------------------------------------------------------
/*
    < �������� CONSTRACINTS>
    ���ϴ� �����Ͱ��� �׻� �����ϱ� ���ؼ� (�����ϱ� ���ؼ�)
    Ư�� �÷����� �����ϴ� ���� (������ ���Ἲ ������ ��������)
    => ���������� �ο��� �÷��� ���� �����Ϳ�
    ������ �ִ��� ������ �ڵ����� �˻��� ����
    (���ʿ� �����Ϳ� ������ �ִٸ� INSERT ���� ����)
    
    [ ���� ]
    NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGH KEY

    - �÷��� ���������� �ο��ϴ� ���
    : �÷�������� / ���̺������
    
*/

/*
    1. NOT NULL ��������
    �ش� �÷��� �ݵ�� ���� �����ؾ� �ϴ� ��� ���
    (��, NULL ���� ���� ���ͼ��� �ȵǴ� �÷��� �ο�)
    
    ��,  NOT NULL ���������� �÷�������Ĺۿ� �ȵ�!1
*/

-- ������������ MEMBER ���̺��� ���� MEM_NOTNULL ���̺� ����
-- NOT NULL ���������� �߰��� ���·� ���� �����غ���
-- �÷��������
-- : �÷��� �ڷ��� ��������
--   ���������� �ο��ϰ��� �ϴ� �÷� �ڿ� ��ٷ� �����
CREATE TABLE MEM_NOTNULL (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
);
--> ���̺���� �� ���� ������ �ߺ� �Ұ�
--> �÷����� �� ���̺� ������ �ߺ� �Ұ�

SELECT * FROM MEM_NOTNULL;

-- ȸ�� ���� INSERT �غ���
INSERT INTO MEM_NOTNULL VALUES(1
                            , 'user01'
                            , 'pass01'
                            , 'ȫ�浿'
                            , '��'
                            , '010-1234-1234'
                            , 'user01@naver.com');
INSERT INTO MEM_NOTNULL VALUES(2
                            , NULL
                            , NULL
                            , NULL
                            , NULL
                            , NULL
                            , NULL);    
                            
-- NOT NULL �������ǿ� ����Ǿ� ���� �߻�

INSERT INTO MEM_NOTNULL VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '�谩��'
                            , NULL
                            , NULL
                            , NULL);
-- NOT NULL ���������� �ο��Ǿ��ִ� �÷����� �ݵ�� ���� �����ؾ���                            

INSERT INTO MEM_NOTNULL VALUES(3
                            , 'user01'
                            , 'pass03'
                            , '�ڸ���'
                            , '��'
                            , NULL
                            , NULL);
---------------------------------------------------------------
/*
    2. UNIQUE ��������
    
    �÷��� �ߺ����� �����ϴ� ��������
    ���� / ���� �� ������ �ش� �÷��� �߿� �ߺ����� ���� ���
    �߰� �Ǵ� ������ ���� �ʰ� ����
    
    �÷����� / ���̺������ �� �� ����
    
*/

-- ���� MEM_NOTNULL ���̺��� ������ ���̺� MEM_UNIQUE ���̺� ����
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE, -- �÷��������
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
);
--> �� �÷��� �������� ���������� �� �� �ִ�.
--  �÷���������� ��� ���� (����) ���� �����Ͽ� �����Ѵ�.

SELECT * FROM MEM_UNIQUE;

-- MEM_UNIQUE ���̺� ���� �� ���̺���������� �����
-- DROP TABLE ���̺��;
DROP TABLE MEM_UNIQUE;

-- ���̺������
-- �÷������ ��� ���� �� �������� ��� �÷��� ��� ���������� �ɰ���
-- ��� ���̾ �����ϴ� ���

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30), -- ��������� �÷��� ������ �κ�
    UNIQUE(MEM_ID) -- ���̺��� ���
    
);
INSERT INTO MEM_UNIQUE VALUES(1
                            , 'user01'
                            , 'pass01'
                            , 'ȫ�浿'
                            , '��'
                            , '010-1234-1234'
                            , 'user01@naver.com');
INSERT INTO MEM_UNIQUE VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '�谩��'
                            , NULL
                            , NULL
                            , NULL);                            
                            
INSERT INTO MEM_UNIQUE VALUES(3
                            , 'user02'
                            , 'pass03'
                            , '�ڸ���'
                            , NULL
                            , NULL
                            , NULL);   
-- UNIQUE �������ǿ� ����Ǿ����Ƿ� INSERT ����
-- ORA-00001: unique constraint (DDL.SYS_C007060) violated
-- ���� �������� �������ǿ� ����Ǿ��ٰ� �˷��ִ� ������
-- �Ʊ� NOT NULL ���������� ������� �� ó��
-- ��Ȯ�ϰ� ��� ������ ��� ���̺��� ��� �÷����� ����������
-- ����Ǿ������� �Ⱦ˷���!!
-- ��, �������� ���� ���ؼ� ��� �κп��� ������ �������� �˷���
-- DDL.SYS_C007060 (DDL ������ SYS_C007060 �̸��� ��������)
-- => �������� �ο� �� ���� �������� ���� ���������� ������
--    ����Ŭ �ý��ۿ��� �˾Ƽ� ������ �������Ǹ��� �ο�����
--    SYS_C~

/*
    * �������� �ο� �� �������Ǹ� �����ϴ� ǥ����
    
    > �÷��������
    CREATE TABLE ���̺�� (
        �÷��� �ڷ��� CONSTRAINT �������Ǹ� ��������,
        �÷��� �ڷ���,
        ...
    }'
    
    > ���̺������
    CREATE TABLE ���̺��(
        �÷��� �ڷ���,
        �÷��� �ڷ���,
        CONSTRAINT �������Ǹ� ��������(�÷���)
    
    
    );
    
    �� ��, �� ��� ���  CONSTRAINT �������Ǹ��� ���� ����
    ��, ���� �� �������Ǹ��� ���Ƿ� SYS_C~�� ����!!
    
    �������Ǹ� ������ ��!!
    ���̺��_�÷���_�������Ǿ���
*/

-- ���� MEM_UNIQUE ���̺��� ������ ���̺� MEM_COM_NM ���̺� ����
-- MEM_UNIQUE ���̺��� ������ �״�ε�,
-- �������ǿ� �̸��� ���̴� �������� ����!!
CREATE TABLE MEM_COM_NM(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) CONSTRAINT MEM_NAME_NN NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    CONSTRAINT MEM_ID_UQ UNIQUE(MEM_ID)
);
INSERT INTO MEM_COM_NM VALUES(1
                            , 'user01'
                            , 'pass01'
                            , 'ȫ�浿'
                            , NULL
                            , NULL
                            , NULL);   
                            
INSERT INTO MEM_COM_NM VALUES(2
                            , 'user01'
                            , 'pass02'
                            , '�ڸ���'
                            , NULL
                            , NULL
                            , NULL);  
-- ORA-00001: unique constraint (DDL.MEM_ID_UQ) violated
-- �������Ǹ��� ������ �� ���� ������ ����
-- �÷��� + �������� Ű���� ���� �����ؼ� ������ ������
-- ��� ������ �߻��ߴ��� �밭 �ٷ� �˾����� �� ����!!

SELECT * FROM MEM_COM_NM;
