DECLARE 
  cnt NUMBER;
  BEGIN
  
    --Project Related--
    SELECT count(*) into cnt  FROM ALL_TABLES WHERE table_name = 'DSYNC_LOCK' and owner = 'DBO_TC';
    IF cnt = 0 THEN
      EXECUTE IMMEDIATE 'CREATE TABLE dbo_tc.dsync_lock (
                          id CHAR(36) NOT NULL,
                          lock_name VARCHAR2(100 BYTE) NOT NULL ENABLE UNIQUE,
                          host_name VARCHAR2(255 BYTE),
                          is_locked NUMBER(1,0),
                          live_on TIMESTAMP DEFAULT SYSDATE NOT NULL ENABLE,
                          version NUMBER(19,0) DEFAULT 0 NOT NULL ENABLE,
                          PRIMARY KEY (id)
                          )';
      END IF;
    EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.DSYNC_LOCK FOR DBO_TC.DSYNC_LOCK';
    EXECUTE IMMEDIATE 'grant all on DBO_TC.DSYNC_LOCK to APP_TC';
   
  commit;
  END;
/  
grant change notification to app_tc;