-- create statements

    -- Type-1
    -- here in this type we define a table with column names and data types and their sizes
CREATE TABLE ALL_TEST1(
    TEST_CODE VARCHAR2(10),
    TST_TYPE CHAR(10));

CREATE TABLE Test_TBL1 (
    TEST_ID INT,
    TEST_NAME VARCHAR2(20),
    TEST_CODE VARCHAR2(10),
    TEST_STATE CHAR(2),
    TEST_SUBJ_CODE CHAR(4),
    TEST_SUBJ_MARK INT
);

    -- Type-2
    -- here we write some constraints for the columns and also we can define the primary key and foreign key constraints   

CREATE TABLE Test_TBL2 (
    TEST_ID INT CONSTRAINT PK_TEST_TBL2 PRIMARY KEY,
    TEST_NAME VARCHAR2(20),
    TEST_CODE VARCHAR2(10),
    TEST_STATE CHAR(2),
    TEST_SUBJ_CODE CHAR(4),
    TEST_SUBJ_MARK INT,
    CONSTRAINT FK_TEST_TBL2 FOREIGN KEY (TEST_SUBJ_CODE) REFERENCES SUBJECT_TBL(SUBJ_CODE)
);

CREATE TABLE ALL_TEST2 (
    TEST_CODE VARCHAR2(10) PRIMARY KEY,
    TEST_DOMAIN VARCHAR(20) NOT NULL,
    TEST_TYPE CHAR(10) NOT NULL
);

CREATE TABLE TEST_TBL2 (
    TEST_ID INT PRIMARY KEY,
    TEST_NAME VARCHAR(20) NOT NULL,
    TEST_CODE VARCHAR2(10) REFERENCES ALL_TEST2(TEST_CODE), -- HERE WE TAKING REFERENCE FROM PRIMARY KEY IN PREVIOUS TABLE
    TEST_STATE CHAR(2),
    TEST_SUBJ_CODE CHAR(4) UNIQUE,
    TEST_SUBJ_MARK INT CHECK(TEST_SUBJ_MARK < 100) -- HERE WE ARE USING CHECK CONSTRAINT, check constraints are used for adding conditions to the columns   
    -- here marks less than 100 is the condition
);

    -- Type-3
    -- same as previous type but we are giving name for the constraints

CREATE TABLE ALL_TEST3 (
    TEST_CODE VARCHAR2(10) CONSTRAINT TC_PK PRIMARY KEY,
    TEST_DOMAIN VARCHAR2(20) CONSTRAINT TD_NN NOT NULL,
    TEST_TYPE CHAR(4) CONSTRAINT TT_NN NOT NULL
);


CREATE TABLE TEST_TBL3 (
    TEST_ID INT CONSTRAINT TID_PK PRIMARY KEY,
    TEST_NAME VARCHAR2(20) CONSTRAINT TNM_NN NOT NULL,
    TEST_CODE VARCHAR2(10) CONSTRAINT TC_REF REFERENCES ALL_TEST3(TEST_CODE),
    TEST_STATE CHAR(3),
    TEST_SUBJ_CODE CHAR(4) CONSTRAINT TSCD_UNQ UNIQUE,
    TEST_SUBJ_MARK INT CONSTRAINT TMRK_CHK CHECK ( TEST_SUBJ_MARK < 100 )
);

    -- naming a constraint is not mandatory but it is a good practice to name the constraint 
    -- and it will be us to alter or disable or delete or modify the constraint
    -- *NOT NULL constraints are under the type of "check" means they will check if it's null or not




    -- Type-4
    -- these create statements are used when you have to take a backup of a table, used mostly in real time
    CREATE TABLE TEST4 AS SELECT * FROM ALL_TEST3;
    -- selecting a existing table and recreating a bakcup table with the same data and structure
    