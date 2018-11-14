CREATE TABLE DBO_TC.ADMIN_SYS_PROP_VALUE
(
  ID                     NUMBER(11,0)          NOT NULL,
  STUDIO_LOOKUP_ID       NUMBER(11,0),
  CODE_ID                NUMBER(11,0),
  DISABLED_FLAG          CHAR(1 BYTE) DEFAULT 'N' NOT NULL,
  ORDER_NUM              NUMBER DEFAULT 1      NOT NULL,
  LAST_UPDATED_TS        TIMESTAMP(9) DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LAST_UPDATED_USER      VARCHAR2(50 BYTE)     NOT NULL,

  CONSTRAINT PK_ADMIN_SYS_PROP_VALUE PRIMARY KEY (ID)
);

ALTER TABLE DBO_TC.ADMIN_SYS_PROP_VALUE ADD CONSTRAINT FK_ADMN_SYS_PROP_VAL_CODE_ID FOREIGN KEY(CODE_ID) REFERENCES DBO_TC.SYS_PROP_VALUE(PROP_ID);

CREATE SEQUENCE DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;

------------- Create synonyms
CREATE OR REPLACE SYNONYM APP_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID FOR DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID;
grant all on DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID to APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.SEQ_ADMIN_SYS_PROP_VALUE_ID FOR DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID;
grant all on DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID to APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.SEQ_ADMIN_SYS_PROP_VALUE_ID FOR DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID;
grant all on DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID to APP_DP;

--Create Synonyms for APP_MP
CREATE OR REPLACE SYNONYM APP_TC.ADMIN_SYS_PROP_VALUE FOR DBO_TC.ADMIN_SYS_PROP_VALUE;
GRANT ALL ON DBO_TC.ADMIN_SYS_PROP_VALUE TO APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.ADMIN_SYS_PROP_VALUE FOR DBO_TC.ADMIN_SYS_PROP_VALUE;
GRANT ALL ON DBO_TC.ADMIN_SYS_PROP_VALUE TO APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.ADMIN_SYS_PROP_VALUE FOR DBO_TC.ADMIN_SYS_PROP_VALUE;
GRANT ALL ON DBO_TC.ADMIN_SYS_PROP_VALUE TO APP_DP;

COMMIT;