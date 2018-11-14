Declare
V_Sql1 Long;
v_sql2 LONG;
begin

v_sql1:='CREATE TABLE "DBO_TC"."SYS_PROP_RC" 
   (	"SYS_PROP_VALUE" VARCHAR2(100 BYTE), 
	"SYS_PROPERTY" Varchar2(100 Byte)
   )';
v_sql2:='GRANT ALL ON DBO_TC.SYS_PROP_RC TO DBO_MP';
execute immediate v_sql1;

EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE = -955 THEN
        NULL; -- suppresses ORA-00955 exception
      Else
         execute immediate v_sql2;
         RAISE;
      End If;
END;

--DROP TABLE DBO_TC.SYS_PROP_RC;
--REVOKE ALL ON DBO_TC.SYS_PROP_RC FROM DBO_MP;