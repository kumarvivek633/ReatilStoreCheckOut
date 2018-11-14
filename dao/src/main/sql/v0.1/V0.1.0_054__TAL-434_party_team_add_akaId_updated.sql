DECLARE
  v_column_script_id_exists number := 0;
  v_column_proj_sc_id_exists NUMBER := 0;
BEGIN

SELECT COUNT(1) INTO v_column_script_id_exists
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'PARTY_TEAM'
AND COLUMN_NAME = 'SCRIPT_ID'
AND OWNER = 'DBO_TC';

SELECT COUNT(1) INTO v_column_proj_sc_id_exists
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'PARTY_TEAM'
AND COLUMN_NAME = 'PROJECT_SCRIPT_ID'
AND OWNER = 'DBO_TC';

  IF (v_column_script_id_exists = 1) THEN
      EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_TEAM DROP (SCRIPT_ID)';
  END IF;

  IF (v_column_proj_sc_id_exists = 1) THEN
      EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_TEAM DROP (PROJECT_SCRIPT_ID)';
  END IF;

  EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_TEAM ADD TEAM_MEMBERSHIP_NAME_ID NUMBER(11 ,0)';
  EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_TEAM ADD CONSTRAINT FK_TEAM_MEMBERSHIP_NAME_ID FOREIGN KEY(TEAM_MEMBERSHIP_NAME_ID) REFERENCES DBO_TC.PARTY_AKA(ID)';

END;