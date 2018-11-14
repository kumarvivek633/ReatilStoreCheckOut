
DECLARE 
  cnt NUMBER;
  BEGIN
  
        
    SELECT count(*) into cnt  FROM DBO_MP.ROLE_PERMISSIONS WHERE ROLE_ID = (select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Production Admin') and permission_id = (select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW');
    IF cnt = 0 THEN
    Insert into DBO_MP.ROLE_PERMISSIONS (ROLE_PERMISSION_ID,ROLE_ID,PERMISSION_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) values (dbo_mp.seq_role_permission_id.nextval,(select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Production Admin'),(select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW'),systimestamp,'flyway');
    END IF;
    
    SELECT count(*) into cnt  FROM DBO_MP.ROLE_PERMISSIONS WHERE ROLE_ID = (select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Production Admin') and permission_id = (select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW.CASTING');
    IF cnt = 0 THEN
    Insert into DBO_MP.ROLE_PERMISSIONS (ROLE_PERMISSION_ID,ROLE_ID,PERMISSION_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) values (dbo_mp.seq_role_permission_id.nextval,(select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Production Admin'),(select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW.CASTING'),systimestamp,'flyway');
    END IF;
    
    SELECT count(*) into cnt  FROM DBO_MP.ROLE_PERMISSIONS WHERE ROLE_ID = (select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Prod Admin Assistant') and permission_id = (select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW');
    IF cnt = 0 THEN
    Insert into DBO_MP.ROLE_PERMISSIONS (ROLE_PERMISSION_ID,ROLE_ID,PERMISSION_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) values (dbo_mp.seq_role_permission_id.nextval,(select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Prod Admin Assistant'),(select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW'),systimestamp,'flyway');
    END IF;
    
    SELECT count(*) into cnt  FROM DBO_MP.ROLE_PERMISSIONS WHERE ROLE_ID = (select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Prod Admin Assistant') and permission_id = (select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW.PRODUCTION');
    IF cnt = 0 THEN
    Insert into DBO_MP.ROLE_PERMISSIONS (ROLE_PERMISSION_ID,ROLE_ID,PERMISSION_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) values (dbo_mp.seq_role_permission_id.nextval,(select role_id from DBO_MP.USER_ROLE where ROLE_NAME = 'Prod Admin Assistant'),(select PERMISSION_ID from DBO_MP.PERMISSIONS where name = 'TALENT.VIEW.PRODUCTION'),systimestamp,'flyway');
    END IF;
    
  commit;  
  END;
  
