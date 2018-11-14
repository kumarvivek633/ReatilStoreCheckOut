DECLARE
   v_cnt   NUMBER := 0;
   V_QRY  VARCHAR2(4000);
   P_TABLE_NAME VARCHAR2(1000):='APP_FEATURE_SETTING';
   v_s_cnt   NUMBER := 0;
   v_cnt2 NUMBER := 0;
   
BEGIN
       
    SELECT COUNT (*)
    INTO v_cnt
     FROM ALL_TABLES
    WHERE TABLE_NAME = 'APP_FEATURE_SETTING' AND owner = 'DBO_MP';

   IF v_cnt = 0 
   THEN
       --
         EXECUTE IMMEDIATE 'create table DBO_MP.APP_FEATURE_SETTING ( ID                     NUMBER          NOT NULL,
                                                                      DEPARTMENT_ID               NUMBER,
                                                                       FEATURE_ID               NUMBER,
                                                                       VALUE                VARCHAR2(20),
                                                                      CONSTRAINT FEATURE_PK PRIMARY KEY (ID),
                                                                      CONSTRAINT feature_set
                                                                      FOREIGN KEY (DEPARTMENT_ID)
                                                                      REFERENCES DBO_MP.DEPARTMENT(DEPARTMENT_ID),
                                                                      CONSTRAINT FEATURE_ID
                                                                      FOREIGN KEY (FEATURE_ID)
                                                                      REFERENCES DBO_MP.LOOKUP(LOOKUP_ID)
                                                            )';  
	 EXECUTE IMMEDIATE 'CREATE SEQUENCE DBO_MP.SEQ_APP_FEATURE_SETTING_ID  MINVALUE 1 MAXVALUE 
	999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE';
		 
   END IF;
   
	EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.APP_FEATURE_SETTING FOR DBO_MP.APP_FEATURE_SETTING';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.APP_FEATURE_SETTING to APP_TC';
	   --
	 EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.APP_FEATURE_SETTING FOR DBO_MP.APP_FEATURE_SETTING';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.APP_FEATURE_SETTING to APP_MP';
	   
	 EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.APP_FEATURE_SETTING FOR DBO_MP.APP_FEATURE_SETTING';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.APP_FEATURE_SETTING to APP_DP';
	 --
	 
	--
	 EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.SEQ_APP_FEATURE_SETTING_ID FOR DBO_MP.SEQ_APP_FEATURE_SETTING_ID';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.SEQ_APP_FEATURE_SETTING_ID to APP_TC';
	   --
	 EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.SEQ_APP_FEATURE_SETTING_ID FOR DBO_MP.SEQ_APP_FEATURE_SETTING_ID';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.SEQ_APP_FEATURE_SETTING_ID to APP_MP';
	   --
	 EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.SEQ_APP_FEATURE_SETTING_ID FOR DBO_MP.SEQ_APP_FEATURE_SETTING_ID';
	 EXECUTE IMMEDIATE 'grant all on DBO_MP.SEQ_APP_FEATURE_SETTING_ID to APP_DP';
--
   COMMIT;
END;
/