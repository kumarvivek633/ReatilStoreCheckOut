-- Create the gender plays table
CREATE SEQUENCE DBO_TC.SEQ_GENDER_PLAYS_ID  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE DBO_TC.GENDER_PLAYS (
  ID NUMBER(11,0) NOT NULL ENABLE,
  PARTY_ID NUMBER(11,0) NOT NULL ENABLE,
  GENDER_SYS_PROP_VAL_ID NUMBER(11,0) NOT NULL ENABLE,
  CONSTRAINT PK_GENDER_PLAYS_ID PRIMARY KEY (ID)
);

ALTER TABLE DBO_TC.GENDER_PLAYS ADD CONSTRAINT FK_GENDER_PARTY_ID FOREIGN KEY (PARTY_ID) REFERENCES DBO_TC.PARTY(PARTY_ID);
ALTER TABLE DBO_TC.GENDER_PLAYS ADD CONSTRAINT FK_GENDER_SYS_PROP_VAL_ID FOREIGN KEY (GENDER_SYS_PROP_VAL_ID) REFERENCES DBO_TC.SYS_PROP_VALUE(PROP_ID);

CREATE OR REPLACE SYNONYM APP_TC.SEQ_GENDER_PLAYS_ID FOR DBO_TC.SEQ_GENDER_PLAYS_ID;
GRANT ALL ON DBO_TC.SEQ_GENDER_PLAYS_ID TO APP_TC;

CREATE OR REPLACE SYNONYM APP_TC.GENDER_PLAYS FOR DBO_TC.GENDER_PLAYS;
GRANT ALL ON DBO_TC.GENDER_PLAYS TO APP_TC;

-- Create the race plays table. 
CREATE SEQUENCE DBO_TC.SEQ_RACE_PLAYS_ID  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

CREATE TABLE DBO_TC.RACE_PLAYS (
  ID NUMBER(11,0) NOT NULL ENABLE,
  PARTY_ID NUMBER(11,0) NOT NULL ENABLE,
  RACE_SYS_PROP_VAL_ID NUMBER(11,0) NOT NULL ENABLE,
  CONSTRAINT PK_RACE_PLAYS_ID PRIMARY KEY (ID)
);

ALTER TABLE DBO_TC.RACE_PLAYS ADD CONSTRAINT FK_RACE_PARTY_ID FOREIGN KEY (PARTY_ID) REFERENCES DBO_TC.PARTY(PARTY_ID);
ALTER TABLE DBO_TC.RACE_PLAYS ADD CONSTRAINT FK_RACE_SYS_PROP_VAL_ID FOREIGN KEY (RACE_SYS_PROP_VAL_ID) REFERENCES DBO_TC.SYS_PROP_VALUE(PROP_ID);

CREATE OR REPLACE SYNONYM APP_TC.SEQ_RACE_PLAYS_ID FOR DBO_TC.SEQ_RACE_PLAYS_ID;
GRANT ALL ON DBO_TC.SEQ_RACE_PLAYS_ID TO APP_TC;

CREATE OR REPLACE SYNONYM APP_TC.RACE_PLAYS FOR DBO_TC.RACE_PLAYS;
GRANT ALL ON DBO_TC.RACE_PLAYS TO APP_TC;

ALTER TABLE DBO_TC.PERSON ADD DOD DATE ;

COMMIT;