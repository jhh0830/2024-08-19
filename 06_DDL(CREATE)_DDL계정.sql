
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

INSERT INTO MEM_COM_NM VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '�踻��'
                            , '��'
                            , NULL
                            , NULL);
SELECT * FROM MEM_COM_NM;
--> GENDER �÷��� '��' �Ǵ� '��' �� ���� �ϰ����
-----------------------------------------------------
/*
    3. CHECK ��������
    
    �÷��� ��ϵ� �� �ִ� ���� ���� "���ǽ�" �� �������� ���ִ�.
    
    [ ǥ���� ]
    CHECK(���ǽ�)
    
*/

-- ���� ���̺��� �����ؼ� ���� �ڸ��� '��' �Ǵ� '��' �� ���� �����ϵ���
-- ���̺� MEM_CHECK ���̺� ����
CREATE TABLE MEM_CHECK (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3)  CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE NOT NULL
    
    
);

INSERT INTO MEM_CHECK VALUES(1
                            , 'user01'
                            , 'pass01'
                            , 'ȫ�浿'
                            , '��'
                            , '010-1234-1234'
                            , 'user01@naver.com'
                            , SYSDATE);
SELECT * FROM MEM_CHECK;
                            
INSERT INTO MEM_CHECK VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '�谩��'
                            , NULL
                            , NULL
                            , NULL
                            , SYSDATE);
SELECT * FROM MEM_CHECK;

--> CHECK �������ǿ� NULL ���� ���� ������!!
-- ����, NULL���� �������� ���� �ʹٸ�
-- NOT NULL �� ���� �ο��ϸ� ��!!

INSERT INTO MEM_CHECK VALUES(3
                            , 'user03'
                            , 'pass03'
                            , '�ڸ���'
                            , '��'
                            , NULL
                            , NULL
                            , SYSDATE);     
--> CHECK ���� ���� ���� ����Ǿ��� ��
-- �������Ǹ����θ� ������ �˷���!!

--> ȸ���������� �׻� STSDATE ������ �ް� ���� ��쿡��?

/*
    * Ư�� �÷��� ���� ���� ���� "�⺻��" ���� ����
    DEFAULT ���� (���������� �ƴ�!!)
*/

-- ������ ������� MEM_CHECK ���̺� ���� �� �����
-- DROP TABLE ���̺��;
DROP TABLE MEM_CHECK;


-- ȸ�������Ͽ� �׻� SYSDATE�� �⺻������ ���� �� �ְԲ�
-- ������ ���̺� MEM_CHECK ���̺� ����
DROP TABLE MEM_CHECK;
CREATE TABLE MEM_CHECK (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL --�ڷ��� �ڿ��� ���� �������ǵڿ��� ��� �Ұ� ���� �߿�
    
);

/*
    *������ ���� �� �Ϻ� �����͸� �����ؼ� �ִ� ���
    INSERT INTO ���̺��(�÷���1, �÷���2, �÷���3)
                VALUES(��1,��2,��3);
*/


INSERT INTO MEM_CHECK(MEM_NO
                    , MEM_ID
                    , MEM_PWD
                    , MEM_NAME)
                    VALUES(1
                        , 'user01'
                        , 'pass01'
                        , '��浿');
                        
SELECT * FROM MEM_CHECK;

--> DEFAULT �� �������� ���� �÷��� �⺻������
-- ��������� INSERT ���� ������ NULL ���� ���Ե�����,
-- DEFAULT �� ������ �÷���
-- NULL �� �ƴ� DEFAULT ������ ���Եǰ� �ȴ�!!

-- DEFAULT �� ���������� �ƴ� ����!!
INSERT INTO MEM_CHECK(MEM_NO
                    , MEM_ID
                    , MEM_PWD
                    , MEM_NAME
                    , MEM_DATE)
                    VALUES(2
                    , 'user02'
                    , 'pass02'
                    , '�谨��'
                    , '17/11/09');
                    
SELECT * FROM MEM_CHECK;
--> DEFAULT ������ �ߴٰ� �ؼ� 
-- ������ DEFAULT ���� ����� ���� ����!!
-- �׷��� ������������ ��޵��� �ʰ� �Ϲ� �������� ��޵�!!

-----------------------------------------------------------------------

/*
    4. PRIMARY KEY (�⺻Ű) ��������
    
    ���̺��� �� ����� ������ "����" �ϰ� "�ĺ�" �� �� �ִ�
    �÷��� �ο��ϴ� ��������
    �� ����� ������ �� �ִ� �ĺ����� ����
    (HASHMAP ���� ������ KEY ���� ����)
    ��) ȸ����ȣ, �ֹ���ȣ, ���, �й�, �����ȣ, ....
    
    => �ߺ����� �ʰ� ���� �����ؾ߸� �ϴ� �÷���
        FRIMARY KEY ���������� �ο��ϴ� ���� ����!
        (NOT NULL + UNIQUE ��ģ ����)
    
    => ��, �� ���̺� �� �Ѱ��� ���� ����!! (�ּҼ�)
    
      
*/

-- ���� ���̺��� �����Ͽ� PRIMARY KEY ���������� �߰��� ���̺�
-- MEM_PRIMARYKEY1 ���̺� ����
CREATE TABLE MEM_PRIMARYKEY1(
    MEM_NO NUMBER CONSTRAINT MEM_PK PRIMARY KEY, -- �÷��������
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
   --CONSTRAINT MEM_PK PRIMARY KEY(MEN_NO) --���̺� ���� ���
    
);

INSERT INTO MEM_PRIMARYKEY1 VALUES(1
                                , 'user01'
                                , 'pass01'
                                , 'ȫ�浿'
                                , '��'
                                , NULL
                                , NULL);

SELECT * FROM MEM_PRIMARYKEY1;

INSERT INTO MEM_PRIMARYKEY1 VALUES(1
                                , 'user02'
                                , 'pass02'
                                , '�ڸ���'
                                , NULL
                                , NULL
                                , NULL
                                );
                    
--> PRIMARY KEY �÷��� �ߺ����� ���� ����
-- ORA-00001: unique constraint (DDL.MEM_PK) violated

INSERT INTO MEM_PRIMARYKEY1 VALUES(NULL
                                , 'user02'
                                , 'pass02'
                                , '�谩��'
                                , NULL
                                , NULL
                                , NULL
);

--> PRIMARY KEY �÷��� NULL ������ ���� ����
-- ORA-01400: cannot insert NULL into ("DDL"."MEM_PRIMARYKEY1"."MEM_NO")

INSERT INTO MEM_PRIMARYKEY1 VALUES(2
                                 , 'user02'
                                 , 'pass02'
                                 , '�谩��'
                                 , NULL
                                 , NULL
                                 , NULL
                                 );

SELECT * FROM MEM_PRIMARYKEY1;

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) PRIMARY KEY,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
    
);
--> PRIMARY KEY �� �� ���̺� �ΰ��� �� �� ����.
-- ORA-02260: table can have only one primary key

-- ��,  �ΰ� �̻��� �÷��� "�ϳ���" ��� PRIMARY KEY
-- �ϳ��� ������ �����ϴ�!! (����Ű)

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER, 
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    PRIMARY KEY(MEM_NO,MEM_ID)
    -- �÷��� �ϳ��� ��� PRIMARY KEY �ϳ��� ���� (����Ű)
    -- ����Ű�� ���̺�����Ĺۿ� �ȵ�!!
    
);

INSERT INTO MEM_PRIMARYKEY2 VALUES(1
                                 , 'user01'
                                 , 'pass01'
                                 , 'ȫ�浿'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);

SELECT *FROM MEM_PRIMARYKEY2;

INSERT INTO MEM_PRIMARYKEY2 VALUES(1
                                 , 'user02'
                                 , 'pass02'
                                 , '�谩��'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);

SELECT * FROM MEM_PRIMARYKEY2;
INSERT INTO MEM_PRIMARYKEY2 VALUES(2
                                 , 'user02'
                                 , 'pass03'
                                 , '�ڸ���'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);
SELECT * FROM MEM_PRIMARYKEY2;
--> ����Ű�� ��� ���� �������� �÷����� ��� ��ġ�ؾ��� 
-- �ߺ� �Ǻ��� �ȴ�!!
INSERT INTO MEM_PRIMARYKEY2 VALUES(3
                                 , NULL
                                 , 'pass04'
                                 , '�̼���'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);
-- ����Ű�� �����Ǿ��ִ� �÷��鿡�� �ϳ��� NULL ����
-- �� �� ����.

SELECT * FROM MEM_PRIMARYKEY2;

-------------------------------------------------------------------------------------

/*
    5. FOREIGN KEY (�ܷ�Ű) ��������
    
    �ش� �÷��� �ٸ� ���̺� �����ϴ� ���� ���;� �� ���
    �� �÷��� �ο��ϴ� ��������
    
    => �ٸ� ���̺� (�θ� ���̺�) �� "����" �Ѵ� ��� ǥ��
    => ��, ������ �ٸ� ���̺��� �����ϰ� �ִ�
    �÷����� �� �� �ִ�.
    =>  FOREIGN KEY ������������ �ٸ� ���̺� ���� 
        "����" �� ������ �� ���� (��, JOIN �� ��������)
        
        
    ��) KH ������
    EMPLOYEE ���̺��� DEPT_CODE �÷����� 
    'D1'~'D9' ������ ���� �� �� �ִ�.
    'D1'~'D9' ������ ����
    DEPARYMENT ���̺��� DEPT_ID �÷��� �������!!
    
    EMPLOYEE ���̺��� JOB_CODE �÷�����
    'J1' ~ 'J7' ������ ���� �� �� �ִ�.
    'J1' ~ 'J7' ������ ����
    JOB ���̺��� JOB_CODE �÷��� �������!!
    
    
    [ ǥ���� ]
    - �÷��������
    �÷��� �ڷ��� CONSTRAINT �������Ǹ� REFERENCES �����Һθ����̺��(�������÷���)
    
    - ���̺������
    CONSTRAINT �������Ǹ� FORIGN KEY(�÷���) REFERENCES �����Һθ����̺��(�������÷���)
    
    
    �� ��� ��� CONSTRAINT �������Ǹ� ��������!!
    (���� ��  �⺻������ SYS_C~~~ �̷��� �������Ǹ��� ����)
    �ι�� ��� (�������÷���) >> ���� ����!!
    �� ��� �⺻������ �����Һθ����̺��� PRIMARY KEY �������� �÷�������
    ������ �÷����� ������ ��!!
    
*/

-- ����� ���� : �׻� �θ����̺��� ���� �����ؾ���!!
-- �θ����̺� : ȸ�� ��޿� ���� ������ (����ڵ�, ��޸�) �����ϴ� ���̺�
CREATE TABLE MEM_GRADE(
        GRADE_CODE CHAR(2) PRIMARY KEY,
        GRADE_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO MEM_GRADE VALUES('G1','�Ϲ�ȸ��');
INSERT INTO MEM_GRADE VALUES('G2','���ȸ��');
INSERT INTO MEM_GRADE VALUES('G3','Ư��ȸ��');

SELECT * FROM MEM_GRADE;
-- �ڽ� ���̺� : ���� ȸ�� ������ ��� �������� ������ ���̺�
-- MEM ���̺� ����

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GRADE_ID CHAR(2) REFERENCES MEM_GRADE(GRADE_CODE), --�÷����� ���
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
    --FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE)-- ���̺���
);
INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , 'ȫ�浿'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
SELECT * FROM MEM;                     

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '�谩��'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '�ڸ���'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               
SELECT * FROM MEM;    

INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '�踻��'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
                     SELECT * FROM MEM;
                     
--> �ܷ�Ű ���������� �ɷ��ִ� �÷����� �⺻������ NULL ���� �� �� �ִ�.
-- ����, NULL ���� �������� �ϰ� �ʹٸ� NOT NULL �������ǵ� �߰��Ѵ�.

INSERT INTO MEM VALUES(5
                    , 'user05'
                    , 'pass05'
                    , '�̼���'
                    , 'G4'
                    , NULL
                    , NULL
                    , NULL);
--> �θ� ���̺�κ��� ���� �����͸� INSERT �ϰ��� �Ұ��
-- PARENT KEY NOT FOUND ���� �߻�!!
-- MEM_GRADE ���̺� 'G4' ��� �����Ͱ� ���µ��� �ұ��ϰ�
-- �ܷ�Ű ���������� GRADE_ID �÷��� �������� �ؼ� ������ �߻��ϴ°�

SELECT * FROM MEM;

-- MEM_GRADE ���̺�κ��� GRADE_CODE �� 'G1' �� �����͸� ����ٸ�?
-- �����͸� �����ϴ� ���� : DELETE
-- DELETE FROM ���̺�� WHERE ���ǽ�;
DELETE
FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';
-- ORA-02292: integrity constraint (DDL.SYS_C007114) violated - child record found
--> �ڽĵ����Ͱ� �ִ� ��Ȳ���� �θ����͸� ����� ��Ȳ������
-- CHILD RECORD FOUND ���� �߻�!!
-- MEM ���̺� �߿� GRADE_ID �÷����� G1 �� ����ϰ� �ֱ� ������
-- MEM_GRADE ���̺�κ��� G1 �����͸� ������ �� ����!!

/*
    * �ڽ� ���̺� ���� �� (�ܷ�Ű �������� �ο� ��)
    �θ����Ͱ� �����Ǿ��� �� �ڽĵ����͸� ��� ó���Ұ���
    "�ɼ�" ���� �����س��� �� ����!!
    
    * FOREIGN KEY ���� �ɼ�
    ���� �ɼ��� ������ �������� ������
    �⺻������ "ON DELETE RESTRICTED" �� �⺻������ ������
                (���� ����)
    
    1) ON DELETE SET NULL : �θ����� ������ �ش� �����͸� ����ϰ� �ִ�
                            �ڽĵ����͸� ��� NULL�� �����Ű�� �ɼ�
    2) ON DELETE CASCADE : �θ����� ���� �� �ش� �����͸� ����ϰ� �ִ�
                            �ڽĵ����͵� ���� ������Ű�� �ɼ�
*/

-- 1) ON DELETE SET NULL
DROP TABLE MEM;

CREATE TABLE MEM (
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GRADE_ID CHAR(2),
    GENDER CHAR(3) CHECK(GENDER IN('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE SET NULL
    -- ���̺���
);

INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , 'ȫ�浿'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
                  

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '�谩��'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '�ڸ���'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               


INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '�踻��'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
SELECT * FROM MEM;

-- �θ� ���̺�κ��� G1 ��������
DELETE
FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM;
--> �θ� �����Ͱ� ���� ���� ������
--  �ڽ����̺��� ������ �ش� �κ��� ��� NULL �� ��ü��

-- ������ ���� ��ɾ�
ROLLBACK;
SELECT * FROM MEM;
DROP TABLE MEM;
-- 2) DELETE CASCADE
CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GRADE_ID CHAR(2),
    GENDER CHAR(3) CHECK(GENDER IN('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    UNIQUE(MEM_ID),
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE CASCADE
    -- ���̺���(������ ��� ����)
);

INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , 'ȫ�浿'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
                  

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '�谩��'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '�ڸ���'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               


INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '�踻��'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
                     
SELECT * FROM MEM;
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
--> �θ����Ͱ� ���� ���� �� ������

-- > ON DELETE CASCADE �ɼ��� ������ױ����� �ƴ�!!

-- ��ü ȸ���� ���̵�, ��й�ȣ, �̸�, ��޸� ��ȸ

-->> ����Ŭ ���� ����
SELECT MEM_ID, MEM_PWD, MEM_NAME, NVL(GRADE_NAME,'����')
FROM MEM, MEM_GRADE 
WHERE GRADE_ID = GRADE_CODE(+);

-->> ANSI ����
SELECT MEM_ID,MEM_PWD, MEM_NAME,NVL(GRADE_NAME,'����')
FROM MEM
LEFT JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

--> �ܷ�Ű ���������� �ɸ� �÷��� �θ����̺�� ���� ��
-- ����� �÷� ������ �Ѵ�!!

-- ���� �ܷ�Ű ���������� �ɷ����� �ʴ��� JOIN ������!!
-- ��, �� �÷��� ������ �ǹ��� �����Ͱ� ����־����!!
-- ��) KH ������
-- EMPLOYEE ���̺� DEPT_CODE, JOB_CODE �÷�����
-- �ܷ�Ű ���������� �ɷ����� ����!!
-- �׷����� JOIN�� �߸��Ǿ���

ROLLBACK;

DROP TABLE MEM;

--------------------------------------------------------------------------

/*
    ----- ���⼭���� ������ KH ��������! ------
    
    * SUBQUERY�� �̿��� ���̺� ����
    
    ���� SQL�� �� ���� ���� ���ִ� SELECT ���� ���������� ��!!
    ���� SQL���� ������ SELECT �� �Ӹ� �ƴ϶� CREATE ���� �ɼ� ����!!
    
    
    [ ǥ���� ]
    CREATE TABLE ���̺�� 
        AS (��������);
    
    ��, �ش� ���������� ������ ����� ����
    ������ ���̺��� �����ϴ� ���� (���̺� ���� ����)
*/

-- EMPLOYEE ���̺��� ������ ���ο� ���̺��� ���� (EMPLOYEE_COPY)
CREATE TABLE EMPLOYEE_COPY
AS (SELECT * FROM EMPLOYEE);
SELECT * FROM EMPLOYEE_COPY;
--> �÷���, ��ȸ����� �����͵��� �����
--> ����, �������� ���� ��� NOT NULL �� �����!!

-- EMPLOYEE ���̺� �ִ� �÷��� ������ �����ϰ� ���� ���?
-- (�����Ͱ��� �ʿ� ���� ���)
CREATE TABLE EMPLOYEE_COPY2 
AS (SELECT * FROM EMPLOYEE
        WHERE 1 = 0); -- 1= 0 �� ������ FALSE �� �ǹ��ؼ� �����Ͱ��� ������ �÷��� ������ �����´� (�̾ƿ��� �����Ͱ����⶧����)
        SELECT * FROM EMPLOYEE_COPY2;
-- ��ü����� �� �޿��� 300���� �̻��� �������
-- ���, �̸�, �μ��ڵ�, �޿� �÷��� ����
CREATE TABLE EMPLOYEE_COPY3
AS(SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
        FROM EMPLOYEE WHERE SALARY >= 3000000);

SELECT * FROM EMPLOYEE_COPY3;

-- ��ü����� ���, �����, �޿�, ���� ��ȸ ����� ���̺�� ����
CREATE TABLE EMPLOYEE_COPY4
AS (SELECT EMP_ID, EMP_NAME, SALARY, SALARY * 12 AS "����"
            FROM EMPLOYEE);
            SELECT *FROM EMPLOYEE_COPY4;
--> ���������� SELECT ���� ����ĶǴ� �Լ����� ���Ե� ���
-- �ݵ�� ��Ī�� �ο��ϰ� �Ѿ����

/*
    * ���̺��� �� ������ �� �ڴʰ� ���������� �߰��ϰ��� �Ѵٸ�?
    
    ALTER TABLE ���̺�� XXXX(�����ҳ���);
    
    - PRIMARY KEY : ADD PRIMARY KEY(�÷���);
    - FOREIGN KEY : ADD FOREING KEY(�÷���) REFERENCES �����Һθ����̺��(�������÷���);
    - UNIQUE : ADD UNIQUE(�÷���);
    - CHECK : ADD CHECK(�÷����������ǽ�);
    - NOT NULL : MODIFY �÷��� NOT NULL;
*/

-- EMPOLOYEE_COPY ���̺� ���� PRIMARY KEY �������� �߰�
-- (EMP_ID �÷�)
ALTER TABLE EMPLOYEE_COPY ADD PRIMARY KEY(EMP_ID);

-- EMPLOYEE_COPY ���̺��� 
-- DEPT_CODE �÷��� �ܷ�Ű �������� �߰�
-- (DEPARTMENT ���̺��� DEPT_ID �÷��� ����)
ALTER TABLE EMPLOYEE_COPY ADD FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID);

-- EMPLOYEE_COPY ���̺���
-- DEPT_CODE �÷��� �ܷ�Ű �������� �߰�
-- (JOB ���̺��� JOB_CODE �÷��� ����)
ALTER TABLE EMPLOYEE_COPY ADD FOREIGN KEY(JOB_CODE) REFERENCES JOB(JOB_CODE);

-- DEPARTMNET ���̺��� LOCATION_ID �÷���
-- �ܷ�Ű �������� �߰�
-- (LOCATION ���̺��� LOCAL_CODE �÷��� ����)
ALTER TABLE DEPARTMENT
ADD FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION(LOCAL_CODE);



