
DECLARE
CURSOR C1 IS  SELECT phone_no,contact_id, phone_id
FROM DBO_TC.PHONE
WHERE regexp_like( phone_no, '^[[:digit:]]*$')
and length(phone_no)=10;

BEGIN
FOR I IN C1
loop
update dbo_tc.phone
set phone_no='('||substr(phone_no,1,3)||')'||'-'||substr(phone_no,4,3)||'-'||substr(phone_no,7)
where phone_id=i.phone_id;
end loop;
commit;
end;
