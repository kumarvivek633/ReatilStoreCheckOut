
DECLARE
CURSOR C1 IS  SELECT CALLSHEET_ID,WEBCONTACT_VALUE
From Dbo_Mp.Callsheet
Where Regexp_Like( WEBCONTACT_VALUE, '^[[:digit:]]*$')
and length(WEBCONTACT_VALUE)=10;

BEGIN
FOR I IN C1
loop
update dbo_MP.Callsheet
set WEBCONTACT_VALUE='('||substr(WEBCONTACT_VALUE,1,3)||')'||'-'||substr(WEBCONTACT_VALUE,4,3)||'-'||substr(WEBCONTACT_VALUE,7)
where CALLSHEET_ID=i.CALLSHEET_ID;
end loop;
commit;
end;
