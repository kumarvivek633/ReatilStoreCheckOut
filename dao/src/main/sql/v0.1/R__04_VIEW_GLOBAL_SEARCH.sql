declare
v_table number;
v_col number;
begin

select count(*) into v_table from SYS.ALL_TABLES where TABLE_NAME = 'FC_DEAL' and owner = 'DBO_FC';

SELECT count(*) into v_col FROM sys.ALL_TAB_COLUMNS where TABLE_NAME = 'PROJECT_SCRIPT' and COLUMN_NAME = 'DEAL_DATE' and OWNER = 'DBO_MP';

if v_table <> 0 and v_col <> 0 then

execute immediate 'grant all on DBO_TC.ST_TALENT to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_TC.party_aka to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_DP.PARTICIPANTS to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_DP.DEALS to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_TITLE to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.lookup to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_FC.FC_DEAL to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_SCRIPT to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_SCRIPT_TALENT to DBO_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_TALENT to DBO_TC WITH GRANT OPTION';

execute immediate 'grant all on DBO_DP.PARTICIPANTS to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_DP.DEALS to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_TITLE to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.lookup to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_FC.FC_DEAL to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_SCRIPT to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_SCRIPT_TALENT to APP_TC WITH GRANT OPTION';
execute immediate 'grant all on DBO_MP.PROJECT_TALENT to APP_TC WITH GRANT OPTION';

execute immediate 'CREATE OR REPLACE VIEW "DBO_TC"."VIEW_GLOBAL_SEARCH" ("ENTITY_ID", "ENTITY_TYPE", "SEARCH_NAME", "DISPLAY_NAME", "LAST_MODIFIED_TS", "ENTITY_SOURCE") AS
SELECT deal.deal_id AS entity_id,
  ''DEAL''            AS entity_type,
  paka.AKA_NAME     AS Entity_NAME,
  deal.TITLE        AS TYpe_AHEAD_DISPLAY_NAME,
  deal.LAST_MODIFIED_TS,
  ''DP'' AS Source
FROM DBO_TC.ST_TALENT st
INNER JOIN dbo_tc.party_aka paka
ON st.party_id = paka.party_id
INNER JOIN
  (SELECT d.deal_id,
    d.LAST_MODIFIED_TS,
    pt.TITLE,
    pt.AKA_IND,
    participant.party_id,
    pt.project_id,
    DENSE_RANK() OVER (PARTition BY d.project_id,participant.PARTY_ID ORDER BY COALESCE(d.LAST_MODIFIED_TS, d.DEAL_DATE), d.deal_id DESC) AS rnk
  FROM DBO_DP.PARTICIPANTS participant
  INNER JOIN DBO_DP.DEALS d
  ON d.DEAL_ID = participant.DEAL_ID
  INNER JOIN DBO_MP.PROJECT_TITLE pt
  ON d.PROJECT_ID         = pt.PROJECT_ID and pt.AKA_IND = ''N''
  ) deal ON deal.party_id = st.PARTY_ID
AND deal.rnk              = 1
union
SELECT DISTINCT pt.PROJECT_Id AS entity_id,
  ''PROJECT''  AS ENTITY_TYPE,
  pt.TITLE   AS ENTITY_NAME,
  pt.TITLE   AS TYpe_AHEAD_DISPLAY_NAME,
  FIRST_VALUE(COALESCE(d.LAST_MODIFIED_TS, d.DEAL_DATE, p.UPDATED_DATE) ) OVER (PARTITION BY d.PROJECT_ID ORDER BY d.LAST_MODIFIED_TS, d.DEAL_DATE, p.UPDATED_DATE, d.deal_id DESC) AS LAST_MODIFIED_TS
  , ''DP'' AS Source
FROM dbo_mp.project p
INNER JOIN DBO_MP.PROJECT_TITLE pt
ON p.PROJECT_ID = pt.PROJECT_ID
LEFT JOIN DBO_DP.DEALS d
ON d.PROJECT_ID  = pt.PROJECT_ID
left join dbo_mp.lookup lookup on p.CREATED_BY_APP = lookup.LOOKUP_ID
WHERE (d.DEAL_ID IS NOT NULL or lookup.lookup_name = ''DealPoint'')
union
SELECT deal.id AS entity_id,
  ''DEAL''            AS entity_type,
  paka.AKA_NAME     AS Entity_NAME,
  deal.TITLE        AS TYpe_AHEAD_DISPLAY_NAME,
  deal.LAST_MODIFIED_TS,
  ''FC'' AS Source
FROM DBO_TC.ST_TALENT st
INNER JOIN dbo_tc.party_aka paka
ON st.party_id = paka.party_id
INNER JOIN
  (SELECT d.id,
    COALESCE(d.UPDATE_DATE,d.deal_date) as LAST_MODIFIED_TS,
    pt.TITLE,
    pt.AKA_IND,
    d.PERFORMER_PARTY_ID ,
    pt.project_id,
    DENSE_RANK() OVER (PARTition BY d.project_id,d.PERFORMER_PARTY_ID ORDER BY COALESCE(d.UPDATE_DATE, d.DEAL_DATE), d.id DESC) AS rnk
  FROM DBO_FC.FC_DEAL d
  INNER JOIN DBO_MP.PROJECT_TITLE pt
  ON d.PROJECT_ID         = pt.PROJECT_ID and pt.AKA_IND = ''N''
  ) deal ON deal.PERFORMER_PARTY_ID = st.PARTY_ID
AND deal.rnk              = 1
union
SELECT DISTINCT pt.PROJECT_Id AS entity_id,
  ''PROJECT''  AS ENTITY_TYPE,
  pt.TITLE   AS ENTITY_NAME,
  pt.TITLE   AS TYpe_AHEAD_DISPLAY_NAME,
  FIRST_VALUE(COALESCE(d.UPDATE_DATE, d.DEAL_DATE, p.UPDATED_DATE) ) OVER (PARTITION BY d.PROJECT_ID ORDER BY d.UPDATE_DATE, d.DEAL_DATE, p.UPDATED_DATE, d.id DESC) AS LAST_MODIFIED_TS
  , ''FC'' AS Source
FROM dbo_mp.project p
INNER JOIN DBO_MP.PROJECT_TITLE pt
ON p.PROJECT_ID = pt.PROJECT_ID
LEFT JOIN DBO_FC.fc_DEAL d
ON d.PROJECT_ID  = pt.PROJECT_ID
left join dbo_mp.lookup lookup on p.CREATED_BY_APP = lookup.LOOKUP_ID
WHERE (d.id IS NOT NULL or lookup.lookup_name = ''Feature Casting'')
union
SELECT deal.PROJECT_SCRIPT_ID AS entity_id,
  ''DEAL''            AS entity_type,
  paka.AKA_NAME     AS Entity_NAME,
  deal.TITLE        AS TYpe_AHEAD_DISPLAY_NAME,
  deal.deal_date,
  ''ST'' AS Source
FROM DBO_TC.ST_TALENT st
INNER JOIN dbo_tc.party_aka paka
ON st.party_id = paka.party_id
INNER JOIN
  (SELECT ps.PROJECT_SCRIPT_ID,
    ps.deal_date,
    pt.TITLE,
    pt.AKA_IND,
    pst.TALENT_ID,
    pt.project_id,
    DENSE_RANK() OVER (PARTition BY ps.project_id,pst.TALENT_ID ORDER BY ps.DEAL_DATE, ps.PROJECT_SCRIPT_ID DESC) AS rnk
  FROM DBO_MP.PROJECT_SCRIPT_TALENT pst
  INNER JOIN DBO_MP.PROJECT_SCRIPT ps
  on pst.project_script_id = ps.project_script_id  
  INNER JOIN DBO_MP.PROJECT_TITLE pt
  ON ps.PROJECT_ID         = pt.PROJECT_ID and pt.AKA_IND = ''N'') deal ON deal.TALENT_ID = st.PARTY_ID
AND deal.rnk              = 1
union
SELECT DISTINCT pt.PROJECT_Id AS entity_id,
  ''PROJECT''  AS ENTITY_TYPE,
  pt.TITLE   AS ENTITY_NAME,
  pt.TITLE   AS TYpe_AHEAD_DISPLAY_NAME,
  FIRST_VALUE(COALESCE(d.DEAL_DATE, p.UPDATED_DATE) ) OVER (PARTITION BY d.PROJECT_ID ORDER BY d.DEAL_DATE, p.UPDATED_DATE, d.PROJECT_SCRIPT_ID DESC) AS LAST_MODIFIED_TS
  , ''ST'' AS Source
FROM dbo_mp.project p
INNER JOIN DBO_MP.PROJECT_TITLE pt
ON p.PROJECT_ID = pt.PROJECT_ID
LEFT JOIN DBO_MP.PROJECT_SCRIPT d
ON d.PROJECT_ID  = pt.PROJECT_ID
left join dbo_mp.lookup lookup on p.CREATED_BY_APP = lookup.LOOKUP_ID
WHERE (d.PROJECT_SCRIPT_ID IS NOT NULL or lookup.lookup_name = ''Submissions'')
union
select 
st.party_id AS entity_id,
  ''TALENT''  AS ENTITY_TYPE,
  paka.AKA_NAME   AS ENTITY_NAME,
  paka.AKA_NAME   AS TYpe_AHEAD_DISPLAY_NAME,
  p.UPDATED_DATE as LAST_MODIFIED_TS
  , ''TALENT2'' AS Source
from DBO_TC.ST_TALENT st inner join DBO_TC.PARTY_AKA paka on st.PARTY_ID = paka.PARTY_ID inner join dbo_tc.party p on st.party_id = p.party_id
union
select 
c.party_id AS entity_id,
  ''CONTACT''  AS ENTITY_TYPE,
  paka.AKA_NAME   AS ENTITY_NAME,
  paka.AKA_NAME   AS TYpe_AHEAD_DISPLAY_NAME,
  p.UPDATED_DATE as LAST_MODIFIED_TS
  , ''ROLLCALL2'' AS Source
from DBO_TC.CONTACT c inner join DBO_TC.PARTY_AKA paka on c.PARTY_ID = paka.PARTY_ID inner join dbo_tc.party p on c.party_id = p.party_id
union
select 
c.party_id AS entity_id,
  ''COMPANY''  AS ENTITY_TYPE,
  paka.AKA_NAME   AS ENTITY_NAME,
  paka.AKA_NAME   AS TYpe_AHEAD_DISPLAY_NAME,
  p.UPDATED_DATE as LAST_MODIFIED_TS
  , ''ROLLCALL2'' AS Source
from DBO_TC.COMPANY c inner join DBO_TC.PARTY_AKA paka on c.PARTY_ID = paka.PARTY_ID inner join dbo_tc.party p on c.party_id = p.party_id
union
SELECT ptl.PROJECT_ID AS entity_id,
  ''PROJECT''            AS entity_type,
  paka.AKA_NAME     AS Entity_NAME,
  ptl.TITLE        AS TYpe_AHEAD_DISPLAY_NAME,
  coalesce(ptalent.UPDATED_DATE,ptalent.CREATED_DATE),
  ''HL'' AS Source
FROM DBO_TC.ST_TALENT st
INNER JOIN dbo_tc.party_aka paka
ON st.party_id = paka.party_id
INNER JOIN DBO_MP.PROJECT_TALENT ptalent on st.PARTY_ID = ptalent.TALENT_ID
inner join dbo_mp.project_title ptl on ptl.project_id = ptalent.PROJECT_ID and ptl.AKA_IND = ''N''
union
SELECT DISTINCT pt.PROJECT_Id AS entity_id,
  ''PROJECT''  AS ENTITY_TYPE,
  pt.TITLE   AS ENTITY_NAME,
  pt.TITLE   AS TYpe_AHEAD_DISPLAY_NAME,
  FIRST_VALUE(COALESCE(ptalent.UPDATED_DATE,ptalent.CREATED_DATE, p.UPDATED_DATE) ) OVER (PARTITION BY ptalent.PROJECT_ID ORDER BY ptalent.UPDATED_DATE,ptalent.CREATED_DATE, p.UPDATED_DATE, ptalent.PROJECT_TALENT_ID desc) AS LAST_MODIFIED_TS
  , ''HL'' AS Source
FROM dbo_mp.project p
INNER JOIN DBO_MP.PROJECT_TITLE pt
ON p.PROJECT_ID = pt.PROJECT_ID
LEFT JOIN DBO_MP.PROJECT_TALENT ptalent
ON ptalent.PROJECT_ID  = pt.PROJECT_ID
left join dbo_mp.lookup lookup on p.CREATED_BY_APP = lookup.LOOKUP_ID
WHERE (ptalent.PROJECT_TALENT_ID IS NOT NULL or lookup.lookup_name = ''Hitlist'')';



execute immediate 'CREATE OR REPLACE SYNONYM APP_TC.VIEW_GLOBAL_SEARCH FOR DBO_TC.VIEW_GLOBAL_SEARCH';
execute immediate 'grant all on DBO_TC.VIEW_GLOBAL_SEARCH to APP_TC WITH GRANT OPTION';

end if;
commit;
end;