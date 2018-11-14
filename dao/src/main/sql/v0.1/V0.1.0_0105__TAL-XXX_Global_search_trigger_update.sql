

create or replace TRIGGER "DBO_TC"."G_SEARCH_PARTY_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_TC.PARTY
   FOR EACH ROW
  declare  v_count number;
BEGIN

select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PARTY_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PARTY_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_PART_UPDTE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_DP.PARTICIPANTS
   FOR EACH ROW
   declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.DEAL_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.DEAL_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SEARCH_DEAL_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_DP.DEALS
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.DEAL_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.DEAL_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_PROJ_TIT_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_MP.PROJECT_TITLE
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PROJECT_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PROJECT_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_PROJ_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_MP.project
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PROJECT_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PROJECT_ID);
end if;
END;
/
declare 
v_cont number;
begin
select count(*) into v_cont from SYS.ALL_TABLES where TABLE_NAME = 'FC_DEAL' and owner = 'DBO_FC';
if v_cont <> 0 then
execute immediate 'create or replace TRIGGER "DBO_TC"."G_SRCH_FCDEAL_UPDTE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_FC.FC_DEAL
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.ID);
end if;
END;';
end if; 
end;
/


create or replace TRIGGER "DBO_TC"."G_SRCH_P_AKA_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_TC.party_aka
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PARTY_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PARTY_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_SCRIPT_TAL_UPDT_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_MP.PROJECT_SCRIPT_TALENT
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PROJECT_SCRIPT_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PROJECT_SCRIPT_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_PROJ_SCRPT_UPDT_TRIG" 
AFTER insert or UPDATE
   ON DBO_MP.PROJECT_SCRIPT
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PROJECT_SCRIPT_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PROJECT_SCRIPT_ID);
end if;
END;
/
create or replace TRIGGER "DBO_TC"."G_SRCH_PROJ_TAL_UPDATE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_MP.PROJECT_TALENT
   FOR EACH ROW
declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.PROJECT_ID;
if(v_count = 0) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.PROJECT_ID);
end if;
END;
