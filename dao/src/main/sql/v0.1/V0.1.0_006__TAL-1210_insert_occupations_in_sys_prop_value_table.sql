--TAL-1210 inserting values for Occupations starts
Insert into DBO_TC.SYS_PROP_VALUE (PROP_ID,SYS_PROP_ID,PROP_VALUE,ABBR,SORT_ORDER)
	values (DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval,(select sys_prop_id from DBO_TC.sys_property where sys_prop_name='STAFF_LEVEL'),'Assoc. Producer',null,1);

Insert into DBO_TC.SYS_PROP_VALUE (PROP_ID,SYS_PROP_ID,PROP_VALUE,ABBR,SORT_ORDER)
	values (DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval,(select sys_prop_id from DBO_TC.sys_property where sys_prop_name='STAFF_LEVEL'),'Producing Company',null,1);

Insert into DBO_TC.SYS_PROP_VALUE (PROP_ID,SYS_PROP_ID,PROP_VALUE,ABBR,SORT_ORDER)
	values (DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval,(select sys_prop_id from DBO_TC.sys_property where sys_prop_name='STAFF_LEVEL'),'Steadicam Assistant',null,1);

--TAL-1210 ends

commit;