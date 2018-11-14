delete from 
    SYS_PROP_VALUE a 
where 
   a.rowid > 
   any (select b.rowid
   from 
      SYS_PROP_VALUE b
   where 
     a.SYS_PROP_ID = b.SYS_PROP_ID
     and a.SYS_PROP_ID = (select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where sys_prop_name = 'STAFF_LEVEL')
  and
    trim(a.PROP_VALUE) = (b.PROP_VALUE)
   )  ;
   
   commit;