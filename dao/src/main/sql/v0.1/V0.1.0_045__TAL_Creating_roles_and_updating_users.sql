DECLARE 
  cnt NUMBER;
  primary_key number;
  BEGIN
  
    --Project Related--
    select max(GROUP_ID) into primary_key from DBO_MP.USER_GROUP;
    
    SELECT count(*) into cnt  FROM DBO_MP.USER_GROUP WHERE GROUP_NAME = 'Prod Administration';
    IF cnt = 0 THEN
    
      primary_key := primary_key+1;
      Insert into DBO_MP.USER_GROUP (GROUP_ID,GROUP_NAME,DISPLAY_ORDER,SELECTED_IND,LAST_UPDATE_TS,LAST_UPDATE_USER) values (primary_key,'Prod Administration',null,'N',systimestamp,'flyway');
    END IF;
    
    select max(role_id) into primary_key from DBO_MP.USER_ROLE;
    SELECT count(*) into cnt  FROM DBO_MP.USER_ROLE WHERE ROLE_NAME = 'Production Admin';
    IF cnt = 0 THEN
      primary_key := primary_key+1;
      Insert into dbo_mp.USER_ROLE (ROLE_ID,GROUP_ID,ROLE_NAME,DISPLAY_ORDER,SELECTED_IND,LAST_UPDATE_TS1,LAST_UPDATE_USER1) values (primary_key,(select GROUP_ID from DBO_MP.USER_GROUP where GROUP_NAME = 'Prod Administration'),'Production Admin',2,'N',systimestamp,'flyway');
    END IF;
    
    SELECT count(*) into cnt  FROM DBO_MP.USER_ROLE WHERE ROLE_NAME = 'Prod Admin Assistant';
    IF cnt = 0 THEN
      primary_key := primary_key+1; 
      Insert into dbo_mp.USER_ROLE (ROLE_ID,GROUP_ID,ROLE_NAME,DISPLAY_ORDER,SELECTED_IND,LAST_UPDATE_TS1,LAST_UPDATE_USER1) values (primary_key,(select GROUP_ID from DBO_MP.USER_GROUP where GROUP_NAME = 'Prod Administration'),'Prod Admin Assistant',2,'N',systimestamp,'flyway');
    END IF;
    
    update DBO_MP.USERS set USER_ROLE_ID = (select role_id from DBO_MP.USER_ROLE where role_name = 'BA Admin Executive') where USER_ID = 'talbuisnesscreative';
    update DBO_MP.USERS set USER_ROLE_ID = (select role_id from DBO_MP.USER_ROLE where role_name = 'Production Admin') where USER_ID = 'talcasting';
    update DBO_MP.USERS set USER_ROLE_ID = (select role_id from DBO_MP.USER_ROLE where role_name = 'Prod Admin Assistant') where USER_ID = 'talproduction';
    update DBO_MP.USERS set USER_ROLE_ID = (select role_id from DBO_MP.USER_ROLE where role_name = 'Others') where USER_ID = 'taljustviewaccess';
  commit;  
  END;