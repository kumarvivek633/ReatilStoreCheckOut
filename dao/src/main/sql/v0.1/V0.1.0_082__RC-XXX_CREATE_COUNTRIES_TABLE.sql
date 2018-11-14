DECLARE
   v_cnt   NUMBER := 0;
   V_QRY  VARCHAR2(4000);
   P_TABLE_NAME VARCHAR2(1000):='COUNTRIES';
   v_s_cnt   NUMBER := 0;
   v_cnt2 NUMBER := 0;
   
BEGIN
       
    SELECT COUNT (*)
    INTO v_cnt
     FROM ALL_TABLES
    WHERE TABLE_NAME = 'COUNTRIES' AND owner = 'DBO_TC';

   IF v_cnt = 0 
   THEN
       --
         EXECUTE IMMEDIATE 'create table DBO_TC.COUNTRIES ( COUNTRY_CODE VARCHAR2(10 BYTE) NOT NULL,
															COUNTRY_NAME VARCHAR2(255 BYTE), 
															DISPLAY_ORDER NUMBER,
  
															CONSTRAINT PK_COUNTRY_CODE PRIMARY KEY (COUNTRY_CODE)
                                                            )';  
--  
        
         EXECUTE IMMEDIATE 'Create Or Replace Synonym App_Tc.Countries For Dbo_Tc.Countries';
         EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.COUNTRIES TO APP_TC';
		 
		 EXECUTE IMMEDIATE 'Create Or Replace Synonym DBO_MP.Countries For Dbo_Tc.Countries';
         EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.COUNTRIES TO DBO_MP';
       
		 
   END IF;
--
   COMMIT;
END;
/