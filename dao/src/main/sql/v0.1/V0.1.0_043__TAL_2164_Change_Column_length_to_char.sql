alter table 
   DBO_TC.PARTY_STUDIOS_ATTR
modify 
( 
   credits varchar2(3000 CHAR),
   notes varchar2(3000 CHAR)
);

commit;