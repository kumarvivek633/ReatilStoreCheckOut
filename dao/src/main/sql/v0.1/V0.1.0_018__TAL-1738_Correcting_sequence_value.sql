--TAL-1738 STARTS

Declare
  difference INTEGER;
  sqlstmt varchar2(255);
  sequenceValue Number;
begin
sqlstmt := 'ALTER SEQUENCE DBO_TC.SEQ_SYS_PROP_ID INCREMENT BY ';
select DBO_TC.SEQ_SYS_PROP_ID.NEXTVAL into sequenceValue from dual;
select  (nvl(Max(SYS_PROP_ID),0) - sequenceValue)+1 into difference from DBO_TC.SYS_PROPERTY;
if difference > 0 then
  EXECUTE IMMEDIATE sqlstmt || difference;
  select  DBO_TC.SEQ_SYS_PROP_ID.NEXTVAL INTO sequenceValue from dual;
  EXECUTE IMMEDIATE sqlstmt || 1;
end if;
COMMIT;
end;

--TAL-1738 ENDS


