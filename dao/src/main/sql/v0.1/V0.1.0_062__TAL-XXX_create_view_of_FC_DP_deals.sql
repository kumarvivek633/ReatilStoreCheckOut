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
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.DEALS FOR DBO_DP.DEALS';
    EXECUTE Immediate 'grant all on DBO_DP.DEALS to DBO_TC WITH GRANT OPTION';
	 EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.DEALS FOR DBO_DP.DEALS';
    EXECUTE Immediate 'grant all on DBO_DP.DEALS to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.PARTICIPANTS FOR DBO_DP.PARTICIPANTS';
    EXECUTE Immediate 'grant all on DBO_DP.PARTICIPANTS to DBO_TC WITH GRANT OPTION';
	EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.PARTICIPANTS FOR DBO_DP.PARTICIPANTS';
    EXECUTE Immediate 'grant all on DBO_DP.PARTICIPANTS to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.PROJECT FOR DBO_MP.PROJECT';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT to DBO_TC WITH GRANT OPTION';
	EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.PROJECT FOR DBO_MP.PROJECT';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT to APP_TC WITH GRANT OPTION';
    
    EXECUTE Immediate 'CREATE OR REPLACE SYNONYM DBO_TC.PROJECT_TITLE FOR DBO_MP.PROJECT_TITLE';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT_TITLE to DBO_TC WITH GRANT OPTION';
	EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.PROJECT_TITLE FOR DBO_MP.PROJECT_TITLE';
    EXECUTE Immediate 'grant all on DBO_MP.PROJECT_TITLE to APP_TC WITH GRANT OPTION';
	
    EXECUTE IMMEDIATE 'CREATE OR REPLACE VIEW "DBO_TC"."VIEW_TALENTS_DEAL" ("DEAL_ID", "PROJECT_NAME","PARTY_ID", "ROLE", "DEAL_DATE", "SOURCE", "STUDIO_ID")
                          AS
                            SELECT fcdeal.id        AS deal_id,
                              pt.TITLE              AS PROJECT_NAME,
                              pn.party_id           AS PARTY_ID,
                              fcdeal.PERFORMER_ROLE AS role,
                              fcdeal.CREATE_DATE    AS created_date,
                               ''FC''                       AS source,
							    pro.STUDIO as studio_id
                            FROM DBO_MP.PROJECT pro
                            INNER JOIN DBO_MP.PROJECT_TITLE pt
                            ON pro.PROJECT_ID = pt.PROJECT_ID
							and pt.AKA_IND = ''N''
                            INNER JOIN dbo_fc.fc_deal fcdeal
                            ON pro.project_id = fcdeal.project_id
                            INNER JOIN dbo_tc.person pn
                            ON pn.party_id = fcdeal.PERFORMER_PARTY_ID
                            UNION
                            SELECT DISTINCT dpdeal.deal_Id AS deal_id,
                              pt.TITLE                     AS project_name,
                              pn.PARTY_ID                  AS PARTY_ID,
                              dpdeal.ACTOR_ROLE            AS role,
                              dpdeal.deal_date             AS created_date,
                               ''DP''                       AS source,
							    pro.STUDIO as studio_id
                            FROM DBO_MP.PROJECT pro
                            INNER JOIN DBO_MP.PROJECT_TITLE pt
                            ON pro.PROJECT_ID = pt.PROJECT_ID
							and pt.AKA_IND = ''N''
                            INNER JOIN DBO_DP.DEALS dpdeal
                            ON pro.project_id = dpdeal.project_id
                            INNER JOIN DBO_DP.PARTICIPANTS participant
                            ON dpdeal.deal_id = participant.deal_id
                            INNER JOIN dbo_tc.person pn
                            ON participant.PARTY_ID = pn.PARTY_ID';
       EXECUTE Immediate 'CREATE OR REPLACE SYNONYM APP_TC.VIEW_TALENTS_DEAL FOR DBO_TC.VIEW_TALENTS_DEAL';
       EXECUTE Immediate 'grant all on DBO_TC.VIEW_TALENTS_DEAL to APP_TC WITH GRANT OPTION';
  END IF;
END; 

