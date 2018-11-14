insert into DBO_MP.LOOKUP(LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) values(dbo_mp.seq_lookup_id.nextval, 'Talent2',null,'Talent2',(select lookup_type_id from DBO_MP.LOOKUP_TYPE where LOOKUP_TYPE_NAME = 'DEFAULT_TAB'),SYSTIMESTAMP, 'JeffreyL');

commit;




CREATE OR REPLACE TRIGGER "DBO_TC"."PARTY_UPDATE_TRIGGER" AFTER
  INSERT OR
  UPDATE ON DBO_TC.PARTY FOR EACH ROW DECLARE v_count NUMBER;
  lookup_id NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM dbo_tc.PARTIES_UPDATED
    WHERE PARTY_ID = :new.PARTY_ID;
    SELECT l.LOOKUP_ID
    INTO lookup_id
    FROM DBO_MP.LOOKUP l
    INNER JOIN DBO_MP.LOOKUP_TYPE lt
    ON l.LOOKUP_TYPE_ID     = lt.LOOKUP_TYPE_ID
    AND lt.LOOKUP_TYPE_NAME ='DEFAULT_TAB'
    AND l.LOOKUP_NAME                                                                       IN ('Talent2');
    IF v_count              = 0 AND (:new.UPDATED_BY_APP IS NULL OR :new.UPDATED_BY_APP NOT IN (lookup_id)) THEN
      INSERT
      INTO DBO_TC.PARTIES_UPDATED VALUES
        (
          DBO_TC.SEQ_PARTIES_UPDATED_ID.nextval,
          :new.PARTY_ID
        );
    END IF;
  END;
