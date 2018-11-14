DECLARE
  cnt NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO cnt
  FROM sys.ALL_TABLES
  WHERE table_name = 'FC_DEAL'
  AND owner        = 'DBO_FC';
  IF cnt          <> 0 THEN
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.FC_DEAL FOR DBO_FC.FC_DEAL';
    EXECUTE Immediate 'grant all on DBO_FC.FC_DEAL to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.FC_DEAL FOR DBO_FC.FC_DEAL';
    EXECUTE Immediate 'grant all on DBO_FC.FC_DEAL to DBO_TC WITH GRANT OPTION';
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.FC_DEAL FOR DBO_FC.FC_DEAL';
    EXECUTE Immediate 'grant all on DBO_FC.FC_DEAL to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.PROJECT FOR DBO_MP.PROJECT';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT to DBO_TC WITH GRANT OPTION';
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.PROJECT FOR DBO_MP.PROJECT';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.PROJECT_TITLE FOR DBO_MP.PROJECT_TITLE';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT_TITLE to DBO_TC WITH GRANT OPTION';
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.PROJECT_TITLE FOR DBO_MP.PROJECT_TITLE';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT_TITLE to APP_TC WITH GRANT OPTION';
    
    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW "DBO_TC"."VIEW_TALENTS_DEAL" ("PROJECT_ID", "PROJECT_NAME","PARTY_ID", "ROLE", "DEAL_DATE", "STUDIO_ID","UPDATED_DATE")
                          AS
SELECT distinct pt.PROJECT_ID              AS PROJECT_ID, pt.TITLE              AS PROJECT_NAME,
                              pn.party_id           AS PARTY_ID,
                              FIRST_VALUE(fcdeal.PERFORMER_ROLE) 
                              OVER (PARTITION BY fcdeal.PROJECT_ID,fcdeal.PERFORMER_PARTY_ID ORDER BY fcdeal.UPDATE_DATE desc, fcdeal.id asc) AS role,
                              FIRST_VALUE(fcdeal.deal_date) 
                              OVER (PARTITION BY fcdeal.PROJECT_ID,fcdeal.PERFORMER_PARTY_ID ORDER BY fcdeal.UPDATE_DATE desc, fcdeal.id asc) AS created_date,
                              pro.STUDIO as studio_id,
                              NVL(FIRST_VALUE(fcdeal.update_date) 
                              OVER (PARTITION BY fcdeal.PROJECT_ID,fcdeal.PERFORMER_PARTY_ID ORDER BY fcdeal.UPDATE_DATE desc, fcdeal.id asc),  FIRST_VALUE(fcdeal.CREATE_DATE) 
                              OVER (PARTITION BY fcdeal.PROJECT_ID,fcdeal.PERFORMER_PARTY_ID ORDER BY fcdeal.UPDATE_DATE desc, fcdeal.id asc)) AS updated_date
                              
                  
                            FROM DBO_MP.PROJECT pro
                            INNER JOIN DBO_MP.PROJECT_TITLE pt
                            ON pro.PROJECT_ID = pt.PROJECT_ID
                            and pt.AKA_IND = ''N''
                            INNER JOIN dbo_fc.fc_deal fcdeal
                            ON pro.project_id = fcdeal.project_id
                            INNER JOIN dbo_tc.person pn
                            ON pn.party_id = fcdeal.PERFORMER_PARTY_ID';
       EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.VIEW_TALENTS_DEAL FOR DBO_TC.VIEW_TALENTS_DEAL';
       EXECUTE Immediate 'grant all on DBO_TC.VIEW_TALENTS_DEAL to APP_TC WITH GRANT OPTION';
  END IF;
END; 

