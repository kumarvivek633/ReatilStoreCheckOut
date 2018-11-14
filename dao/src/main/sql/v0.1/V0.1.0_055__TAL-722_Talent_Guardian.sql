DECLARE
  v_cnt NUMBER := 0;
BEGIN
  SELECT COUNT (*)
  INTO v_cnt
  FROM ALL_TABLES
  WHERE TABLE_NAME = 'PARTY_RELATION_OB'
  AND owner        = 'DBO_TC';
  IF v_cnt         > 0 THEN
    EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_RELATION_OB MODIFY RELATION_TYPE VARCHAR2(25 BYTE)';
  END IF;
  EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_RELATION MODIFY RELATION_TYPE VARCHAR2(25 BYTE)';
  EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_RELATION ADD RELATION_NAME VARCHAR2(100 CHAR)';
  COMMIT;
END;
/