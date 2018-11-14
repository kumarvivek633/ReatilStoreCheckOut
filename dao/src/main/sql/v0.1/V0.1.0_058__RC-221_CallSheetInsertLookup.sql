

--Insert status and priority
declare
st_id number;
pr_id number;
begin
select LOOKUP_TYPE_ID into st_id from dbo_mp.lookup_type where lookup_type_name='CALLSHEET_STATUS';
select LOOKUP_TYPE_ID into pr_id from dbo_mp.lookup_type where lookup_type_name='CALLSHEET_PRIORITY';

--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Left Word',1,'Left Word',st_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'No Answer',2,'No Answer',st_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Mark as Complete',3,'Completed',st_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Returning',4,'Returning',st_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Need to Call',5,'Need to Call',st_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'New',6,' ',st_id,sysdate,'JeffreyL',null);
Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Completed',7,'Completed',st_id,sysdate,'JeffreyL',null);
Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Blank - No default',8,'Blank - No default',st_id,sysdate,'JeffreyL',null);

--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Next to Call',1,'NTC',pr_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'New',2,' ',pr_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'High',3,'High',pr_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Medium',4,'Medium',pr_id,sysdate,'JeffreyL',null);
--Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Low',5,'Low',pr_id,sysdate,'JeffreyL',null);
Insert into dbo_mp.lookup(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER,IS_ACTIVE) values (DBO_MP.seq_lookup_id.nextval,'Blank - New',6,'Blank - New',pr_id,sysdate,'JeffreyL',null);
commit;
end;
/