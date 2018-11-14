
declare
cnt number;
begin

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'ST_TALENT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.ST_TALENT drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'ST_TALENT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.ST_TALENT_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'TALENT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.TALENT drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'TALENT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.TALENT_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PERSON' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PERSON drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PERSON_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PERSON_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PARTY' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PARTY_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'COMPANY' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.COMPANY drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'COMPANY_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.COMPANY_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'CONTACT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.CONTACT drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'CONTACT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.CONTACT_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'OCCUPATION' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.OCCUPATION drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'OCCUPATION_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.OCCUPATION_AUDIT drop COLUMN party_id_ver';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PARTY_CONTACT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_CONTACT drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_ID_VER' and table_name = 'PARTY_CONTACT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_CONTACT_AUDIT drop COLUMN party_id_ver';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'PARTY_CONTACT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_CONTACT drop COLUMN PARTY_CONTACT_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'PARTY_CONTACT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_CONTACT_AUDIT drop COLUMN PARTY_CONTACT_ID_VER';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'VERSION' and table_name = 'PARTY_RELATION' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION drop COLUMN VERSION';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'VERSION' and table_name = 'PARTY_RELATION_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION_AUDIT drop COLUMN VERSION';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARENT_PARTY_ID_VER' and table_name = 'PARTY_RELATION' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION drop COLUMN PARENT_PARTY_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARENT_PARTY_ID_VER' and table_name = 'PARTY_RELATION_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION_AUDIT drop COLUMN PARENT_PARTY_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'CHILD_PARTY_ID_VER' and table_name = 'PARTY_RELATION' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION drop COLUMN CHILD_PARTY_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'CHILD_PARTY_ID_VER' and table_name = 'PARTY_RELATION_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PARTY_RELATION_AUDIT drop COLUMN CHILD_PARTY_ID_VER';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'PHONE' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PHONE drop COLUMN PARTY_CONTACT_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'PHONE_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.PHONE_AUDIT drop COLUMN PARTY_CONTACT_ID_VER';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'WEB_CONTACT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.WEB_CONTACT drop COLUMN PARTY_CONTACT_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'WEB_CONTACT_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.WEB_CONTACT_AUDIT drop COLUMN PARTY_CONTACT_ID_VER';
end if;

select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'ADDRESS' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.ADDRESS drop COLUMN PARTY_CONTACT_ID_VER';
end if;
select count(*) into cnt from ALL_TAB_COLUMNS where column_name = 'PARTY_CONTACT_ID_VER' and table_name = 'ADDRESS_AUDIT' and owner = 'DBO_TC';
if(cnt <> 0) then 
EXECUTE IMMEDIATE 'alter table DBO_TC.ADDRESS_AUDIT drop COLUMN PARTY_CONTACT_ID_VER';
end if;
commit;
end;
