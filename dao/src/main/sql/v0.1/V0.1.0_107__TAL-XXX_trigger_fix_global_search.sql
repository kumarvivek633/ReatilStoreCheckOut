create or replace TRIGGER "DBO_TC"."G_SRCH_PART_UPDTE_TRIGGER" 
AFTER insert or UPDATE
   ON DBO_DP.PARTICIPANTS
   FOR EACH ROW
   declare  v_count number;
BEGIN
select count(*) into v_count from DBO_TC.GLOBAL_SEARCH_DATA_UPDATE where ENTITY_ID = :new.DEAL_ID;
if(v_count = 0 and :new.DEAL_ID is not null) then
      insert into DBO_TC.GLOBAL_SEARCH_DATA_UPDATE values (dbo_tc.SEQ_G_SEARCH_DATA_UPDATE_ID.nextVal,:new.DEAL_ID);
end if;
END;