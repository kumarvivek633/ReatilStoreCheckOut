declare
v_dataset_id number :=0;

cursor C1 is select PARTY_ID from DBO_TC.PARTY where DATASET_ID is null ;
 type PARTY_TYP is table of DBO_TC.PARTY.PARTY_ID%type INDEX BY PLS_INTEGER;
 party_tab party_typ;
begin

open C1 ;
FETCH C1 bulk collect into PARTY_TAB ;
close C1;

select LOOKUP_ID into V_DATASET_ID
							from DBO_MP.LOOKUP 
							where LOOKUP_NAME = 'MP/TV Creative' 
							  and lookup_type_id = (select lookup_type_id 
													  from DBO_MP.LOOKUP_TYPE 
													where LOOKUP_TYPE_NAME = 'ROLLCALL_DATASET');
                          
                 
  for I in 1..PARTY_TAB.COUNT LOOP
    update dbo_tc.party set dataset_id = v_dataset_id where party_id = party_tab(i);
    commit;
  end loop;

end;
/