CREATE TABLE dbo_tc.PARTIES_UPDATED
  ( ID NUMBER NOT NULL,
  PARTY_ID NUMBER(38,0) NOT NULL,
   PRIMARY KEY (id)
  ); 
  
  CREATE SEQUENCE DBO_TC.SEQ_PARTIES_UPDATED_ID  MINVALUE 1 MAXVALUE 999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;
  
  ------------- Create synonyms
  
  CREATE OR REPLACE SYNONYM APP_TC.PARTIES_UPDATED FOR DBO_TC.PARTIES_UPDATED;
  grant all on DBO_TC.PARTIES_UPDATED to APP_TC;
  
 
CREATE OR REPLACE SYNONYM APP_TC.SEQ_PARTIES_UPDATED_ID FOR DBO_TC.SEQ_PARTIES_UPDATED_ID;
grant all on DBO_TC.SEQ_PARTIES_UPDATED_ID to APP_TC; 
  
create or replace TRIGGER "DBO_TC"."PARTY_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_TC.PARTY
   FOR EACH ROW
BEGIN
      insert into DBO_TC.PARTIES_UPDATED values (DBO_TC.SEQ_PARTIES_UPDATED_ID.nextval,:new.PARTY_ID);

END;