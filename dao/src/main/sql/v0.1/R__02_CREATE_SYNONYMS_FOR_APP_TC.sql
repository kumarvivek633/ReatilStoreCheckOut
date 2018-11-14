declare
  CURSOR c1
  IS
    --Generic for all Schemas
    SELECT object_name, owner
    FROM all_objects
    WHERE object_type NOT IN ('EDITION', 'INDEX PARTITION', 'TABLE SUBPARTITION', 'CONSUMER GROUP', 'TABLE PARTITION', 'SCHEDULE', 'OPERATOR', 'DESTINATION', 'WINDOW', 'JAVA RESOURCE', 'XML SCHEMA', 'JOB CLASS', 'MATERIALIZED VIEW', 'TRIGGER', 'INDEX', 'SYNONYM', 'JAVA CLASS', 'INDEXTYPE', 'CLUSTER', 'EVALUATION CONTEXT')
    AND owner             IN ('DBO_MP','DBO_DP','DBO_FC');
  ---Grant for Procedure/Function/Package
  CURSOR c2
  IS
    SELECT object_name, owner
    FROM all_objects
    WHERE object_type IN ('FUNCTION','PROCEDURE','PACAKAGE','PACKAGE BODY')
    AND owner         IN ('DBO_MP','DBO_DP','DBO_FC');
  ---Grant for Table/View/Sequence
  CURSOR c3
  IS
    SELECT object_name, owner
    FROM all_objects
    WHERE object_type IN ('TABLE','VIEW','SEQUENCE')
    AND owner         IN ('DBO_MP','DBO_DP','DBO_FC')
                AND object_name not like 'schema%';
                
    cmd varchar2(4000);
begin
  for i in c1 loop
     cmd := 'create or replace synonym APP_TC.'||i.object_name||' for '||i.owner||'.'||i.object_name;
     execute immediate cmd;
  end loop;
  for j in c2 loop
     cmd := 'grant execute on '||j.owner||'.'||j.object_name||' to APP_TC';
     execute immediate cmd;
  end loop;  
  for k in c3 loop
     cmd := 'grant all on '||k.owner||'.'||k.object_name||' to APP_TC';
     execute immediate cmd;
  end loop;
end;
/
