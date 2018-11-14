declare 
cnt number;
begin

select count(*) into cnt from DBO_MP.LOOKUP where LOOKUP_NAME = 'WARNER BROS.' and LOOKUP_TYPE_ID = (select LOOKUP_TYPE_ID from DBO_MP.LOOKUP_TYPE where LOOKUP_TYPE_NAME = 'STUDIO');
if(cnt = 0) then
Insert into DBO_MP.LOOKUP (LOOKUP_ID,LOOKUP_NAME,DISPLAY_ORDER,MNEMONIC_CODE,LOOKUP_TYPE_ID,LAST_UPDATE_TS,LAST_UPDATE_USER) 
values (dbo_mp.SEQ_LOOKUP_ID.nextval,'WARNER BROS.',null,null,4,SYSTIMESTAMP,'JeffreyL');
end if;


update DBO_MP.PERMISSIONS set name = 'TALENT.CASTING.VIEW' where name = 'TALENT.VIEW.CASTING';
update DBO_MP.PERMISSIONS set description = 'TALENT.CASTING.VIEW' where description = 'TALENT.VIEW.CASTING';


update DBO_MP.PERMISSIONS set name = 'TALENT.CREATIVE_BUSINESS.VIEW' where name = 'TALENT.VIEW.CREATIVE_BUSINESS';
update DBO_MP.PERMISSIONS set description = 'TALENT.CREATIVE_BUSINESS.VIEW' where description = 'TALENT.VIEW.CREATIVE_BUSINESS';


update DBO_MP.PERMISSIONS set name = 'TALENT.PRODUCTION.VIEW' where name = 'TALENT.VIEW.PRODUCTION';
update DBO_MP.PERMISSIONS set description = 'TALENT.PRODUCTION.VIEW' where description = 'TALENT.VIEW.PRODUCTION';
commit;
end;