--TAL-1751 starts
Declare
  studio_code_id NUMBER;
begin
select l.LOOKUP_ID  into studio_code_id from  DBO_MP.LOOKUP l where LOOKUP_NAME like 'Warner Bros' and l.LOOKUP_TYPE_ID = ( select LOOKUP_TYPE_ID from  DBO_MP.LOOKUP_TYPE where LOOKUP_TYPE_NAME = 'PRODUCTION_COMPANY');

for i in ( select prop_id, sort_order from DBO_TC.SYS_PROP_VALUE where sys_prop_id in (
select Sys_prop_id from DBO_TC.SYS_PROPERTY where Sys_prop_name in ('RACE', 'GENDER','IMMIGRATION_STATUS','STATES','COUNTRIES','PHONE_TYPE','GENRE','TALENT_STATUS')))
    loop
        insert into DBO_TC.ADMIN_SYS_PROP_VALUE(ID, STUDIO_LOOKUP_ID, CODE_ID, DISABLED_FLAG, ORDER_NUM, LAST_UPDATED_USER, LAST_UPDATED_TS ) values(DBO_TC.SEQ_ADMIN_SYS_PROP_VALUE_ID.nextval,studio_code_id,
        i.prop_id, 'N', i.sort_order, 'flyway',SYSTIMESTAMP
        );
end loop;
commit;
end;
--TAL-1751 ends