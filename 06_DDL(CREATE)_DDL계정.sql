
/*
    * DDL (DATA DEFINITION LANGUAGE)
    
    데이터 정의 언어
    오라클에서 제공하는 객체  (OBJECT) 를 
    새로이 만들고 (CREATE) , 구조를 변경하고 (ALTER),
    구조 자체를 삭제한 (DROP) 하는 명령문
    즉, 데이터베이스를 이루고 있는 구조물 자체를 정의하는 언어로,
    주로 DB 관리자, 설계자 사용함
    
    * 오라클의 객체 (OBJECT)
    오라클 데이터베이스를 이루고 있는 "구조물"
    
    [ 종류 ]
    테이블 (TABLE), 뷰 (VIEW), 시퀀스 (SEQUENCE),
    인덱스 (INDEX), 패키지 (PACKAGE), 트리거 (TRIGGER),
    프로시저 (PROCEDURE), 함수 (FUNCTION)
    동의어 (SYNONYM), 사용자 (USER)
        
*/

/*
    < CREATE TABLE>
    * 테이블 (TABLE)
    행 (ROW), 열 (COLUMN) 로 구성되는
    "가장 기본적인" 데이터베이스의 객체 (구조물)
    모든 데이터는 항상 테이블을 통해서 테이블에 저장됨
    즉, 데이터를 보관하고자 한다면 테이블을 무조건 만들어야 함!!
    
    [ 표현법 ]
    CREATE TABLE 테이블명 (
        컬럼명 자료형,
        컬럼명 자료형,
        ...
    );
        
   < 자료형 >
   - 문자 (CHAR(크기) / VARCHAR2(크기))
   : 크기는 BYTE 단위로 지정한다.
     숫자, 영문자, 특수문자 => 한글자 당 1BYTE 로 취급
     한글                 => 한글자 당 3BYTE 로 취급
     CHAR(바이트수) : 최대 2000BYTE 까지 지정 가능
                     고정길이 (아무리 적은 값이 들어와도 공백으로 채워서
                     처음 할당한 크리를 유지하겠다.)
                     주로 들오올 값의 글자수가 딱 정해져 있을 경우
                     예) 성별 : '남' / '여' 또는 'M' / 'F'
                        전화번호 : 010-XXXX-XXXX
                        주민번호 : YYMMDD-GXXXXXX
                                            
     VARCHAR2(바이트수) : 최대 4000BYTE 까지 지정 가능
                         가변길이
                         (적은 값이 들어오면 그 담긴 값에 맞춰서
                          저장 공간의 크기가 줄어둠)
                        주로 글자 수 또는 데이터의 용량이 가늠이 되지 않을 경우
                        예) 게시글 제목, 게시글 내용
                        (VAR 는 가변, 2 는 사이즈 2배를 의미함)
                        
     
   - 숫자 (NUMBER)
   : 정수, 실수 상관없이 모두 다 보관 가능
   
   - 날짜 (DATE)
   : 년, 월, 일, 시, 분, 초를 모두 다 포함한 자료형
   
        
*/

-->> 회원들의 데이터 (아이디, 비밀번호, 이름, 회원가입일)
--   를 담기 위한 테이블 MEMBER 테이블 생성하기
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20),
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_DATE DATE
    
);
--> 대소문자 구분 X, 낙타표기법 사용 불가!! (언다바로 구분)
--> VARCHAR2 라도 사이즈를 오버해서 담을수는 없기 때문에
-- 다소 넉넉하게 사이즈 지정하는게 좋다!!

-- 테이블이 잘 만들어졌나 확인
SELECT * FROM MEMBER;
--> 단순 SELECT 문을 활용하거나 접속탭에서 확인 가능

-- 데이터 딕셔너리를 이용하여 테이블 확인 가능
-- 데이터 딕셔너리 : 다양한 객체들의 정보를 저장하고 있는
--                 시스템 테이블 (오직 조회 용도)
-- USER_TABLES : 현재 이 계정이 가지고 있는 테이블들의 
--               전반적인 구조를 확인할 수 있는 데이터 딕셔너리
SELECT* FROM USER_TABLES;

-- USER_TAB_COLUMNS : 현재 이 계정이 가지고 있는 테이블들의
--                    모든 컬럼의 정보들을 조회할 수 있는 데이터 딕셔너리
SELECT * FROM USER_TAB_COLUMNS;
--------------------------------------------------------

/*
     * 컬럼에 주석 달기 (컬럼에 대한 설명)
     
     COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
     
     
*/

COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
-- 회원비밀번호, 회원이름, 회원가입일
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.MEMBER_DATE IS '회원가입일';
--> 권장사항!! 가독성이 좋아지고 분업이나 다른사람들이 테이블을 볼때 더 편해짐

-- 만들어진 MEMBER 테이블에 데이터 넣어보기
-- 데이터를 추가할 수 있는 구문 : INSERT문 
-- (한 행 단위로 추가, 값의 순서가 중요!!)
-- INSERT INTO 테이블명 VALUES (첫번째 컬럼값,두번째 컬럼값....마지막 컬럼값)
INSERT INTO MEMBER VALUES('user01'
                        , 'pass01'
                        , '홍길동'
                        , '2021-02-01');
INSERT INTO MEMBER VALUES('user02'
                        , 'pass02'
                        , '김말똥'
                        , ' 21/02/02');
INSERT INTO MEMBER VALUES('user03'
                        , 'pass03'
                        , '김갑생'
                        , SYSDATE);
INSERT INTO MEMBER VALUES(NULL
                        , NULL
                        , NULL
                        , SYSDATE);
-- 아이디, 비밀번호, 이름에 NULL 값이 존재해서는 안됨

INSERT INTO MEMBER VALUES('user03'
                        , 'pass04'
                        , '박말순'
                        , SYSDATE);
-- 중복된 아이디는 존재해서는 안됨

-- 위의 NULL 값이나 중복된 아이디값은 유효하지 않은 값들이다.
-- 유효한 데이터값들을 유지하기 위해서 "제약조건" 을 걸어줘야 한다.
-----------------------------------------------------------
/*
    < 제약조건 CONSTRACINTS>
    원하는 데이터값만 항상 유지하기 위해서 (보관하기 위해서)
    특정 컬럼마다 설정하는 제약 (데이터 무결성 보장을 목적으로)
    => 제약조건이 부여된 컬럼에 들어올 데이터에
    문제가 있는지 없는지 자동으로 검사할 목적
    (애초에 데이터에 문제가 있다면 INSERT 되지 않음)
    
    [ 종류 ]
    NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGH KEY

    - 컬럼에 제약조건을 부여하는 방식
    : 컬럼레벨방식 / 테이블레벨방식
    
*/

/*
    1. NOT NULL 제약조건
    해당 컬럼에 반드시 값이 존재해야 하는 경우 사용
    (즉, NULL 값이 절대 들어와서는 안되는 컬럼에 부여)
    
    단,  NOT NULL 제약조건은 컬럼레벨방식밖에 안됨!1
*/

-- 위에서생선한 MEMBER 테이블을 보완 MEM_NOTNULL 테이블 생성
-- NOT NULL 제약조건을 추가한 형태로 새로 생성해보기
-- 컬럼레벨방식
-- : 컬럼명 자료형 제약조건
--   제약조건을 부여하고자 하는 컬럼 뒤에 곧바로 기술함
CREATE TABLE MEM_NOTNULL (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
);
--> 테이블명은 한 계정 내에서 중복 불가
--> 컬럼명은 한 테이블 내에서 중복 불가

SELECT * FROM MEM_NOTNULL;

-- 회원 정보 INSERT 해보기
INSERT INTO MEM_NOTNULL VALUES(1
                            , 'user01'
                            , 'pass01'
                            , '홍길동'
                            , '남'
                            , '010-1234-1234'
                            , 'user01@naver.com');
INSERT INTO MEM_NOTNULL VALUES(2
                            , NULL
                            , NULL
                            , NULL
                            , NULL
                            , NULL
                            , NULL);    
                            
-- NOT NULL 제약조건에 위배되어 오류 발생

INSERT INTO MEM_NOTNULL VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '김갑생'
                            , NULL
                            , NULL
                            , NULL);
-- NOT NULL 제약조건이 부여되어있는 컬럼에는 반드시 값이 존재해야함                            

INSERT INTO MEM_NOTNULL VALUES(3
                            , 'user01'
                            , 'pass03'
                            , '박말순'
                            , '여'
                            , NULL
                            , NULL);
---------------------------------------------------------------
/*
    2. UNIQUE 제약조건
    
    컬럼에 중복값을 제한하는 제약조건
    삽입 / 수정 시 기존에 해당 컬럼값 중에 중복값이 있을 경우
    추가 또는 수정이 되지 않게 제약
    
    컬럼레벨 / 테이블레벨방식 둘 다 가능
    
*/

-- 위의 MEM_NOTNULL 테이블을 보완한 테이블 MEM_UNIQUE 테이블 생성
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE, -- 컬럼레벨방식
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
);
--> 한 컬럼에 여러개의 제약조건을 걸 수 있다.
--  컬럼레벨방식의 경우 띄어쓰기 (공백) 으로 구분하여 나열한다.

SELECT * FROM MEM_UNIQUE;

-- MEM_UNIQUE 테이블 삭제 후 테이블레벨방식으로 재생성
-- DROP TABLE 테이블명;
DROP TABLE MEM_UNIQUE;

-- 테이블레벨방식
-- 컬럼명들을 모두 나열 후 마지막에 어느 컬럼에 어느 제약조건을 걸건지
-- 계속 연이어서 나열하는 방식

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30), -- 여기까지는 컬럼을 나열한 부분
    UNIQUE(MEM_ID) -- 테이블레벨 방식
    
);
INSERT INTO MEM_UNIQUE VALUES(1
                            , 'user01'
                            , 'pass01'
                            , '홍길동'
                            , '남'
                            , '010-1234-1234'
                            , 'user01@naver.com');
INSERT INTO MEM_UNIQUE VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '김갑생'
                            , NULL
                            , NULL
                            , NULL);                            
                            
INSERT INTO MEM_UNIQUE VALUES(3
                            , 'user02'
                            , 'pass03'
                            , '박말순'
                            , NULL
                            , NULL
                            , NULL);   
-- UNIQUE 제약조건에 위배되었으므로 INSERT 실패
-- ORA-00001: unique constraint (DDL.SYS_C007060) violated
-- 오류 구문으로 제약조건에 위배되었다고 알려주는 주지만
-- 아까 NOT NULL 제약조건이 위배됬을 때 처럼
-- 정확하게 어느 계정의 어느 테이블의 어느 컬럼에서 제약조건이
-- 위배되었는지는 안알려줌!!
-- 단, 제약조건 명을 통해서 어느 부분에서 오류가 났는지는 알려줌
-- DDL.SYS_C007060 (DDL 계정을 SYS_C007060 이름의 제약조건)
-- => 제약조건 부여 시 직접 제약조건 명을 지정해주지 않으면
--    오라클 시스템에서 알아서 임의의 제약조건명을 부여해줌
--    SYS_C~

/*
    * 제약조건 부여 시 제약조건명도 지정하는 표현식
    
    > 컬럼레벨방식
    CREATE TABLE 테이블명 (
        컬럼명 자료형 CONSTRAINT 제약조건명 제약조건,
        컬럼명 자료형,
        ...
    }'
    
    > 테이블레벨방식
    CREATE TABLE 테이블명(
        컬럼명 자료형,
        컬럼명 자료형,
        CONSTRAINT 제약조건명 제약조건(컬럼명)
    
    
    );
    
    이 때, 두 방식 모두  CONSTRAINT 제약조건명은 생략 가능
    단, 생략 시 제약조건명이 임의로 SYS_C~로 붙음!!
    
    제약조건명 지을때 팁!!
    테이블명_컬럼명_제약조건약자
*/

-- 위의 MEM_UNIQUE 테이블을 보완한 테이블 MEM_COM_NM 테이블 생성
-- MEM_UNIQUE 테이블의 구조는 그대로되,
-- 제약조건에 이름을 붙이는 형식으로 보완!!
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
                            , '홍길동'
                            , NULL
                            , NULL
                            , NULL);   
                            
INSERT INTO MEM_COM_NM VALUES(2
                            , 'user01'
                            , 'pass02'
                            , '박말순'
                            , NULL
                            , NULL
                            , NULL);  


-- ORA-00001: unique constraint (DDL.MEM_ID_UQ) violated
-- 제약조건명을 지정한 후 오류 구문을 보면
-- 컬럼명 + 제약조건 키워드 등을 조합해서 지었기 때문에
-- 어디서 오류가 발생했는지 대강 바로 알아차릴 수 있음!!

SELECT * FROM MEM_COM_NM;

INSERT INTO MEM_COM_NM VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '김말똥'
                            , '가'
                            , NULL
                            , NULL);
SELECT * FROM MEM_COM_NM;
--> GENDER 컬럼에 '남' 또는 '여' 만 들어가게 하고싶음
-----------------------------------------------------
/*
    3. CHECK 제약조건
    
    컬럼에 기록될 수 있는 값에 대한 "조건식" 을 설정해줄 수있다.
    
    [ 표현법 ]
    CHECK(조건식)
    
*/

-- 위의 테이블을 보완해서 성별 자리에 '남' 또는 '여' 만 저장 가능하도록
-- 테이블 MEM_CHECK 테이블 생성
CREATE TABLE MEM_CHECK (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3)  CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE NOT NULL
    
    
);

INSERT INTO MEM_CHECK VALUES(1
                            , 'user01'
                            , 'pass01'
                            , '홍길동'
                            , '남'
                            , '010-1234-1234'
                            , 'user01@naver.com'
                            , SYSDATE);
SELECT * FROM MEM_CHECK;
                            
INSERT INTO MEM_CHECK VALUES(2
                            , 'user02'
                            , 'pass02'
                            , '김갑생'
                            , NULL
                            , NULL
                            , NULL
                            , SYSDATE);
SELECT * FROM MEM_CHECK;

--> CHECK 제약조건에 NULL 값도 존재 가능함!!
-- 만약, NULL값을 못들어오게 막고 싶다면
-- NOT NULL 도 같이 부여하면 됨!!

INSERT INTO MEM_CHECK VALUES(3
                            , 'user03'
                            , 'pass03'
                            , '박말순'
                            , '가'
                            , NULL
                            , NULL
                            , SYSDATE);     
--> CHECK 제약 조건 또한 위배되었을 때
-- 제약조건명으로만 오류를 알려줌!!

--> 회원가입일을 항상 STSDATE 값으로 받고 싶을 경우에는?

/*
    * 특정 컬럼에 들어올 값에 대한 "기본값" 지정 가능
    DEFAULT 설정 (제약조건은 아님!!)
*/

-- 위에서 만들었던 MEM_CHECK 테이블 삭제 후 재생성
-- DROP TABLE 테이블명;
DROP TABLE MEM_CHECK;


-- 회원가입일에 항상 SYSDATE를 기본값으로 넣을 수 있게끔
-- 보완한 테이블 MEM_CHECK 테이블 생성
DROP TABLE MEM_CHECK;
CREATE TABLE MEM_CHECK (
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL --자료형 뒤에만 쓰고 제약조건뒤에는 사용 불가 서순 중요
    
);

/*
    *데이터 삽입 시 일부 데이터만 지정해서 넣는 방법
    INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3)
                VALUES(값1,값2,값3);
*/


INSERT INTO MEM_CHECK(MEM_NO
                    , MEM_ID
                    , MEM_PWD
                    , MEM_NAME)
                    VALUES(1
                        , 'user01'
                        , 'pass01'
                        , '고길동');
                        
SELECT * FROM MEM_CHECK;

--> DEFAULT 가 지정되지 않은 컬럼은 기본적으로
-- 명시적으로 INSERT 하지 않으면 NULL 값이 삽입되지만,
-- DEFAULT 가 지정된 컬럼은
-- NULL 이 아닌 DEFAULT 값으로 삽입되게 된다!!

-- DEFAULT 가 제약조건이 아닌 이유!!
INSERT INTO MEM_CHECK(MEM_NO
                    , MEM_ID
                    , MEM_PWD
                    , MEM_NAME
                    , MEM_DATE)
                    VALUES(2
                    , 'user02'
                    , 'pass02'
                    , '김감생'
                    , '17/11/09');
                    
SELECT * FROM MEM_CHECK;
--> DEFAULT 설정을 했다고 해서 
-- 무조건 DEFAULT 값만 들어가라는 법은 없음!!
-- 그래서 제약조건으로 취급되지 않고 일반 설정으로 취급됨!!

-----------------------------------------------------------------------

/*
    4. PRIMARY KEY (기본키) 제약조건
    
    테이블에서 각 행들의 정보를 "유일" 하게 "식별" 할 수 있는
    컬럼에 부여하는 제약조건
    각 행들을 구분할 수 있는 식별자의 역할
    (HASHMAP 으로 따지면 KEY 같은 존재)
    예) 회원번호, 주문번호, 사번, 학번, 예약번호, ....
    
    => 중복되지 않고 값이 존재해야만 하는 컬럼에
        FRIMARY KEY 제약조건을 부여하는 것이 좋다!
        (NOT NULL + UNIQUE 합친 느낌)
    
    => 단, 한 테이블 당 한개만 지정 가능!! (최소성)
    
      
*/

-- 위의 테이블을 보완하여 PRIMARY KEY 제약조건이 추가된 테이블
-- MEM_PRIMARYKEY1 테이블 생성
CREATE TABLE MEM_PRIMARYKEY1(
    MEM_NO NUMBER CONSTRAINT MEM_PK PRIMARY KEY, -- 컬럼레벨방식
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
   --CONSTRAINT MEM_PK PRIMARY KEY(MEN_NO) --테이블 레벨 방식
    
);

INSERT INTO MEM_PRIMARYKEY1 VALUES(1
                                , 'user01'
                                , 'pass01'
                                , '홍길동'
                                , '남'
                                , NULL
                                , NULL);

SELECT * FROM MEM_PRIMARYKEY1;

INSERT INTO MEM_PRIMARYKEY1 VALUES(1
                                , 'user02'
                                , 'pass02'
                                , '박말순'
                                , NULL
                                , NULL
                                , NULL
                                );
                    
--> PRIMARY KEY 컬럼에 중복으로 인한 오류
-- ORA-00001: unique constraint (DDL.MEM_PK) violated

INSERT INTO MEM_PRIMARYKEY1 VALUES(NULL
                                , 'user02'
                                , 'pass02'
                                , '김갑생'
                                , NULL
                                , NULL
                                , NULL
);

--> PRIMARY KEY 컬럼에 NULL 값으로 인한 오류
-- ORA-01400: cannot insert NULL into ("DDL"."MEM_PRIMARYKEY1"."MEM_NO")

INSERT INTO MEM_PRIMARYKEY1 VALUES(2
                                 , 'user02'
                                 , 'pass02'
                                 , '김갑생'
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
    GENDER CHAR(3) CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
    
);
--> PRIMARY KEY 가 한 테이블에 두개가 될 수 없다.
-- ORA-02260: table can have only one primary key

-- 단,  두개 이상의 컬럼을 "하나로" 묶어서 PRIMARY KEY
-- 하나로 설정은 가능하다!! (복합키)

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER, 
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    PRIMARY KEY(MEM_NO,MEM_ID)
    -- 컬럼을 하나로 묶어서 PRIMARY KEY 하나로 설정 (복합키)
    -- 복합키는 테이블레벨방식밖에 안됨!!
    
);

INSERT INTO MEM_PRIMARYKEY2 VALUES(1
                                 , 'user01'
                                 , 'pass01'
                                 , '홍길동'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);

SELECT *FROM MEM_PRIMARYKEY2;

INSERT INTO MEM_PRIMARYKEY2 VALUES(1
                                 , 'user02'
                                 , 'pass02'
                                 , '김갑생'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);

SELECT * FROM MEM_PRIMARYKEY2;
INSERT INTO MEM_PRIMARYKEY2 VALUES(2
                                 , 'user02'
                                 , 'pass03'
                                 , '박말순'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);
SELECT * FROM MEM_PRIMARYKEY2;
--> 복합키일 경우 묶인 여러개의 컬럼값이 모두 일치해야지 
-- 중복 판별이 된다!!
INSERT INTO MEM_PRIMARYKEY2 VALUES(3
                                 , NULL
                                 , 'pass04'
                                 , '이순신'
                                 , NULL
                                 , NULL
                                 , NULL
                                 
);
-- 복합키로 설정되어있는 컬럼들에는 하나라도 NULL 값이
-- 들어갈 수 없다.

SELECT * FROM MEM_PRIMARYKEY2;

-------------------------------------------------------------------------------------

/*
    5. FOREIGN KEY (외래키) 제약조건
    
    해당 컬럼에 다른 테이블에 존재하는 값이 들어와야 할 경우
    그 컬럼에 부여하는 제약조건
    
    => 다른 테이블 (부모 테이블) 을 "참조" 한다 라고 표현
    => 즉, 참조된 다른 테이블이 제공하고 있는
    컬럼값만 들어갈 수 있다.
    =>  FOREIGN KEY 제약조건으로 다른 테이블 간의 
        "관계" 를 형성할 수 있음 (즉, JOIN 이 가능해짐)
        
        
    예) KH 계정의
    EMPLOYEE 테이블의 DEPT_CODE 컬럼에는 
    'D1'~'D9' 까지의 값만 들어갈 수 있다.
    'D1'~'D9' 까지의 값은
    DEPARYMENT 테이블의 DEPT_ID 컬럼에 들어있음!!
    
    EMPLOYEE 테이블의 JOB_CODE 컬럼에는
    'J1' ~ 'J7' 까지의 값만 들어갈 수 있다.
    'J1' ~ 'J7' 까지의 값은
    JOB 테이블의 JOB_CODE 컬럼에 들어있음!!
    
    
    [ 표현법 ]
    - 컬럼레벨방식
    컬럼명 자료형 CONSTRAINT 제약조건명 REFERENCES 참조할부모테이블명(참조할컬럼명)
    
    - 테이블레벨방식
    CONSTRAINT 제약조건명 FORIGN KEY(컬럼명) REFERENCES 참조할부모테이블명(참조할컬럼명)
    
    
    두 방식 모두 CONSTRAINT 제약조건명 생략가능!!
    (생략 시  기본적으로 SYS_C~~~ 이렇게 제약조건명이 잡힘)
    두방식 모두 (참조할컬럼명) >> 생략 가능!!
    이 경우 기본적으로 참조할부모테이블의 PRIMARY KEY 제약조건 컬럼값으로
    참조할 컬럼명이 잡히게 됨!!
    
*/

-- 명심할 사항 : 항상 부모테이블을 먼저 생성해야함!!
-- 부모테이블 : 회원 등급에 대한 데이터 (등급코드, 등급명) 보관하는 테이블
CREATE TABLE MEM_GRADE(
        GRADE_CODE CHAR(2) PRIMARY KEY,
        GRADE_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO MEM_GRADE VALUES('G1','일반회원');
INSERT INTO MEM_GRADE VALUES('G2','우수회원');
INSERT INTO MEM_GRADE VALUES('G3','특별회원');

SELECT * FROM MEM_GRADE;
-- 자식 테이블 : 기존 회원 정보에 등급 정보까지 포함한 테이블
-- MEM 테이블 생성

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GRADE_ID CHAR(2) REFERENCES MEM_GRADE(GRADE_CODE), --컬럼레벨 방식
    GENDER CHAR(3) CHECK(GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30)
    --FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE)-- 테이블레벨
);
INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , '홍길동'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
SELECT * FROM MEM;                     

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '김갑생'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '박말순'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               
SELECT * FROM MEM;    

INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '김말똥'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
                     SELECT * FROM MEM;
                     
--> 외래키 제약조건이 걸려있는 컬럼에는 기본적으로 NULL 값이 들어갈 수 있다.
-- 만약, NULL 값이 못들어오게 하고 싶다면 NOT NULL 제약조건도 추가한다.

INSERT INTO MEM VALUES(5
                    , 'user05'
                    , 'pass05'
                    , '이순신'
                    , 'G4'
                    , NULL
                    , NULL
                    , NULL);
--> 부모 테이블로부터 없는 데이터를 INSERT 하고자 할경우
-- PARENT KEY NOT FOUND 오류 발생!!
-- MEM_GRADE 테이블에 'G4' 라는 데이터가 없는데도 불구하고
-- 외래키 제약조건인 GRADE_ID 컬럼에 넣으려고 해서 오류가 발생하는것

SELECT * FROM MEM;

-- MEM_GRADE 테이블로부터 GRADE_CODE 가 'G1' 인 데이터를 지운다면?
-- 데이터를 삭제하는 구문 : DELETE
-- DELETE FROM 테이블명 WHERE 조건식;
DELETE
FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';
-- ORA-02292: integrity constraint (DDL.SYS_C007114) violated - child record found
--> 자식데이터가 있는 상황에서 부모데이터를 지우는 상황에서는
-- CHILD RECORD FOUND 오류 발생!!
-- MEM 테이블 중에 GRADE_ID 컬럼에서 G1 을 사용하고 있기 때문에
-- MEM_GRADE 테이블로부터 G1 데이터를 삭제할 수 없음!!

/*
    * 자식 테이블 생성 시 (외래키 제약조건 부여 시)
    부모데이터가 삭제되었을 때 자식데이터를 어떻게 처리할건지
    "옵션" 으로 지정해놓을 수 있음!!
    
    * FOREIGN KEY 삭제 옵션
    삭제 옵션을 별도로 제시하지 않으면
    기본적으로 "ON DELETE RESTRICTED" 로 기본적으로 지정됨
                (삭제 제한)
    
    1) ON DELETE SET NULL : 부모데이터 삭제시 해당 데이터를 사용하고 있는
                            자식데이터를 모두 NULL로 변경시키는 옵션
    2) ON DELETE CASCADE : 부모데이터 삭제 시 해당 데이터를 사용하고 있는
                            자식데이터도 같이 삭제시키는 옵션
*/

-- 1) ON DELETE SET NULL
DROP TABLE MEM;

CREATE TABLE MEM (
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GRADE_ID CHAR(2),
    GENDER CHAR(3) CHECK(GENDER IN('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE SET NULL
    -- 테이블레벨
);

INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , '홍길동'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
                  

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '김갑생'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '박말순'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               


INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '김말똥'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
SELECT * FROM MEM;

-- 부모 테이블로부터 G1 지워보기
DELETE
FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM;
--> 부모 데이터가 문제 없이 삭제됨
--  자식테이블의 데이터 해당 부분이 모두 NULL 로 대체됨

-- 데이터 복구 명령어
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
    GENDER CHAR(3) CHECK(GENDER IN('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    UNIQUE(MEM_ID),
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE CASCADE
    -- 테이블레벨(여러개 기술 가능)
);

INSERT INTO MEM VALUES(1
                     , 'user01'
                     , 'pass01'
                     , '홍길동'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                     
                  

INSERT INTO MEM VALUES(2
                     , 'user02'
                     , 'pass02'
                     , '김갑생'
                     , 'G2'
                     , NULL
                     , NULL
                     , NULL);
                     

INSERT INTO MEM VALUES(3
                     , 'user03'
                     , 'pass03'
                     , '박말순'
                     , 'G1'
                     , NULL
                     , NULL
                     , NULL);
                               


INSERT INTO MEM VALUES(4
                     , 'user04'
                     , 'pass04'
                     , '김말똥'
                     , NULL
                     , NULL
                     , NULL
                     , NULL);
                     
SELECT * FROM MEM;
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
--> 부모데이터가 문제 없이 잘 삭제됨

-- > ON DELETE CASCADE 옵션은 권장사항까지는 아님!!

-- 전체 회원의 아이디, 비밀번호, 이름, 등급명 조회

-->> 오라클 전용 구문
SELECT MEM_ID, MEM_PWD, MEM_NAME, NVL(GRADE_NAME,'없음')
FROM MEM, MEM_GRADE 
WHERE GRADE_ID = GRADE_CODE(+);

-->> ANSI 구문
SELECT MEM_ID,MEM_PWD, MEM_NAME,NVL(GRADE_NAME,'없음')
FROM MEM
LEFT JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

--> 외래키 제약조건이 걸린 컬럼은 부모테이블과 조인 시
-- 연결고리 컬럼 역할을 한다!!

-- 굳이 외래키 제약조건이 걸려있지 않더라도 JOIN 가능함!!
-- 단, 두 컬럼에 동일한 의미의 데이터가 담겨있어야함!!
-- 예) KH 계정의
-- EMPLOYEE 테이블에 DEPT_CODE, JOB_CODE 컬럼에는
-- 외래키 제약조건이 걸려있지 않음!!
-- 그런데도 JOIN이 잘만되었음

ROLLBACK;

DROP TABLE MEM;

--------------------------------------------------------------------------

/*
    ----- 여기서부터 실행은 KH 계정에서! ------
    
    * SUBQUERY를 이용한 테이블 생성
    
    메인 SQL문 을 보조 역할 해주는 SELECT 문을 서브쿼리라 함!!
    메인 SQL문의 종류는 SELECT 문 뿐만 아니라 CREATE 문도 될수 있음!!
    
    
    [ 표현법 ]
    CREATE TABLE 테이블명 
        AS (서브쿼리);
    
    즉, 해당 서브쿼리를 수행한 결과를 통해
    새로이 테이블을 생성하는 개념 (테이블 복사 개념)
*/

-- EMPLOYEE 테이블을 복제한 새로운 테이블을 생성 (EMPLOYEE_COPY)
CREATE TABLE EMPLOYEE_COPY
AS (SELECT * FROM EMPLOYEE);
SELECT * FROM EMPLOYEE_COPY;
--> 컬럼들, 조회결과의 데이터들이 복사됨
--> 또한, 제약조건 같은 경우 NOT NULL 만 복사됨!!

-- EMPLOYEE 테이블에 있는 컬럼의 구조만 복사하고 싶을 경우?
-- (데이터값은 필요 없는 경우)
CREATE TABLE EMPLOYEE_COPY2 
AS (SELECT * FROM EMPLOYEE
        WHERE 1 = 0); -- 1= 0 는 무조건 FALSE 를 의미해서 데이터값을 제외한 컬럼의 구조만 가져온다 (뽑아오는 데이터가없기때문에)
        SELECT * FROM EMPLOYEE_COPY2;
-- 전체사원들 중 급여가 300만원 이상인 사원들의
-- 사번, 이름, 부서코드, 급여 컬럼만 복제
CREATE TABLE EMPLOYEE_COPY3
AS(SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
        FROM EMPLOYEE WHERE SALARY >= 3000000);

SELECT * FROM EMPLOYEE_COPY3;

-- 전체사원의 사번, 사원명, 급여, 연봉 조회 결과를 테이블로 생성
CREATE TABLE EMPLOYEE_COPY4
AS (SELECT EMP_ID, EMP_NAME, SALARY, SALARY * 12 AS "연봉"
            FROM EMPLOYEE);
            SELECT *FROM EMPLOYEE_COPY4;
--> 서브쿼리의 SELECT 절에 연산식또는 함수식이 포함될 경우
-- 반드시 별칭을 부여하고 넘어가야함

/*
    * 테이블이 다 생성된 후 뒤늦게 제약조건을 추가하고자 한다면?
    
    ALTER TABLE 테이블명 XXXX(변경할내용);
    
    - PRIMARY KEY : ADD PRIMARY KEY(컬럼명);
    - FOREIGN KEY : ADD FOREING KEY(컬럼명) REFERENCES 참조할부모테이블명(참조할컬럼명);
    - UNIQUE : ADD UNIQUE(컬럼명);
    - CHECK : ADD CHECK(컬럼에대한조건식);
    - NOT NULL : MODIFY 컬럼명 NOT NULL;
*/

-- EMPOLOYEE_COPY 테이블에 없는 PRIMARY KEY 제약조건 추가
-- (EMP_ID 컬럼)
ALTER TABLE EMPLOYEE_COPY ADD PRIMARY KEY(EMP_ID);

-- EMPLOYEE_COPY 테이블의 
-- DEPT_CODE 컬럼에 외래키 제약조건 추가
-- (DEPARTMENT 테이블의 DEPT_ID 컬럼을 참조)
ALTER TABLE EMPLOYEE_COPY ADD FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID);

-- EMPLOYEE_COPY 테이블의
-- DEPT_CODE 컬럼에 외래키 제약조건 추가
-- (JOB 테이블의 JOB_CODE 컬럼을 참조)
ALTER TABLE EMPLOYEE_COPY ADD FOREIGN KEY(JOB_CODE) REFERENCES JOB(JOB_CODE);

-- DEPARTMNET 테이블의 LOCATION_ID 컬럼에
-- 외래키 제약조건 추가
-- (LOCATION 테이블의 LOCAL_CODE 컬럼을 참조)
ALTER TABLE DEPARTMENT
ADD FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION(LOCAL_CODE);



