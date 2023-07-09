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
    TEST_COED VARCHAR2(10) CONSTRAINT TC_PK PRIMARY KEY,
    TEST_DOMAIN VARCHAR2(20) CONSTRAINT TD_NN NOT NULL,
    TEST_TYPE CHAR(4) CONSTRAINT TT_NN NOT NULL
);

