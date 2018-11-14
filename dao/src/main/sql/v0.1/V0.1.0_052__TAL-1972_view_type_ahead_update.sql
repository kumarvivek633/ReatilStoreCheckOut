DECLARE
   v_cnt   NUMBER := 0;
   V_QRY  VARCHAR2(4000);
   P_TABLE_NAME VARCHAR2(1000):='PARTY_AKAS';
   v_s_cnt   NUMBER := 0;
BEGIN
   SELECT COUNT (*)
    INTO v_cnt
     FROM ALL_TABLES
    WHERE TABLE_NAME = 'PARTY_AKAS' AND owner = 'DBO_TC';

   IF v_cnt = 0
   THEN
       
         EXECUTE IMMEDIATE 'create table DBO_TC.PARTY_AKA (   ID                     NUMBER(11,0)          NOT NULL,
                                                              PARTY_ID               NUMBER(11,0)          NOT NULL,
                                                              AKA_NAME               VARCHAR2(500 BYTE)    NOT NULL,
                                                              AKA_IND                CHAR(1 BYTE)   DEFAULT ''Y'' ,
                                                              FIRST_NAME             VARCHAR2(100), 
                                                              LAST_NAME              VARCHAR2(300) NOT NULL,
                                                              LAST_UPDATED_USER      VARCHAR2(50 BYTE)     NOT NULL,
                                                              LAST_UPDATED_TS        TIMESTAMP(9) DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                                              IS_CURRENT        CHAR(1 BYTE)   DEFAULT ''Y'' NOT NULL,

                                                            CONSTRAINT PK_PARTY_AKA PRIMARY KEY (ID)
                                                            )';  
--  
        EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA ADD CONSTRAINT FK_PARTY_AKA_ID FOREIGN KEY(PARTY_ID) REFERENCES         DBO_TC.PARTY(PARTY_ID)';                                                        
      --
        EXECUTE IMMEDIATE 'CREATE SEQUENCE DBO_TC.SEQ_PARTY_AKA_ID  MINVALUE 1 MAXVALUE 
        999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE';
        --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_TC';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_MP';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_DP';
         --
          EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.PARTY_AKA FOR DBO_TC.PARTY_AKA';
          EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_TC';

          EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.PARTY_AKA FOR DBO_TC.PARTY_AKA';
          EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_MP';
         --
          EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.PARTY_AKA FOR DBO_TC.PARTY_AKA';
           EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_DP';
  ELSE
  --
       EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKAS rename to   PARTY_AKA';
    --
       EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA ADD FIRST_NAME VARCHAR2(100)';
       --
       EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA ADD LAST_NAME VARCHAR2(300)';
       --
        EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA ADD AKA_IND  CHAR(1 BYTE)   DEFAULT ''Y''';
       --
       EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA RENAME COLUMN IS_CURRENTUSER TO IS_CURRENT' ;
       --
      ---- EXECUTE IMMEDIATE 'ALTER TABLE DBO_TC.PARTY_AKA ADD CONSTRAINT FK_PARTY_AKA_ID FOREIGN KEY(PARTY_ID) REFERENCES      --DBO_TC.PARTY(PARTY_ID);';
       --
        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.PARTY_AKA FOR DBO_TC.PARTY_AKA';
        EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_TC';

        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.PARTY_AKA FOR DBO_TC.PARTY_AKA';
        EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_MP';
         --
        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.PARTY_AKA FOR DBO_TC.PARTY_AKA';
        EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO APP_DP';
           --
        EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM DBO_MP.PARTY_AKA FOR DBO_TC.PARTY_AKA';
        EXECUTE IMMEDIATE 'GRANT ALL ON DBO_TC.PARTY_AKA TO DBO_MP';
        
		--
		select count(*) into v_s_cnt  from all_synonyms where owner = 'APP_MP'   and synonym_name = 'PARTY_AKAS';
		if v_s_cnt <> 0 then
			EXECUTE IMMEDIATE 'DROP SYNONYM APP_MP.PARTY_AKAS';
		End If;
           --
		select count(*) into v_s_cnt  from all_synonyms where owner = 'DBO_MP'   and synonym_name = 'PARTY_AKAS';
		if v_s_cnt <> 0 then
			EXECUTE IMMEDIATE 'DROP SYNONYM DBO_MP.PARTY_AKAS';
		End If;
        --
		select count(*) into v_s_cnt  from all_synonyms where owner = 'APP_TC'   and synonym_name = 'PARTY_AKAS';
		if v_s_cnt <> 0 then
			EXECUTE IMMEDIATE 'DROP SYNONYM APP_TC.PARTY_AKAS';
		End If;
        
        --
		select count(*) into v_s_cnt  from all_synonyms where owner = 'APP_DP'   and synonym_name = 'PARTY_AKAS';
		if v_s_cnt <> 0 then
			EXECUTE IMMEDIATE 'DROP SYNONYM APP_DP.PARTY_AKAS';
		End If;
         
   END IF;
   COMMIT;
END;
/


DECLARE
   v_seq_cnt   NUMBER := 0;
   V_QRY  VARCHAR2(4000);
   P_TABLE_NAME VARCHAR2(1000):='PARTY_AKAS';
    v_seq_min_value   NUMBER := 0;
BEGIN
   SELECT COUNT (*)
    INTO v_seq_cnt
     FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'SEQ_PARTY_AKAS_ID' AND SEQUENCE_OWNER = 'DBO_TC';

   IF v_seq_cnt = 0
   THEN
       
        --
        EXECUTE IMMEDIATE 'CREATE SEQUENCE DBO_TC.SEQ_PARTY_AKA_ID  MINVALUE 1 MAXVALUE 
        999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE';
        --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_TC';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_MP';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_DP';
        
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM DBO_MP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to DBO_MP';
          --
        
  ELSE
		select COALESCE(max(ID), 0) into v_seq_min_value from DBO_TC.PARTY_AKA;
		v_seq_min_value := v_seq_min_value + 1;
		EXECUTE IMMEDIATE 'DROP sequence dbo_tc.SEQ_PARTY_AKAS_ID';
       EXECUTE IMMEDIATE 'CREATE SEQUENCE DBO_TC.SEQ_PARTY_AKA_ID  MINVALUE ' || v_seq_min_value  || 'MAXVALUE 
        999999999999999 INCREMENT BY 1 START WITH ' || v_seq_min_value ||  ' CACHE 20 NOORDER  NOCYCLE';
    --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_TC.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_TC';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_MP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_MP';
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM APP_DP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to APP_DP';
         
           --
         EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM DBO_MP.SEQ_PARTY_AKA_ID FOR DBO_TC.SEQ_PARTY_AKA_ID';
         EXECUTE IMMEDIATE 'grant all on DBO_TC.SEQ_PARTY_AKA_ID to DBO_MP';
          --
         
   END IF;
  COMMIT;
END;
/



Declare
	indexcount number;
	Cursor person_Cur Is
		Select P1.Party_Id, P1.First_Name, P1.Last_Name From Dbo_Tc.Person P1
		Left Outer Join Dbo_Tc.Party_Aka P2 On P1.Party_Id = P2.Party_Id And P2.Is_Current = 'Y'
		where p2.Party_Id is null;
Begin
FOR per_rec in person_Cur
Loop
	dbms_output.put_line ('Party Id: ' || Per_Rec.Party_Id);
	Insert Into Dbo_Tc.Party_Aka(Id, Party_Id, Aka_Name, Last_Updated_User,Last_Updated_Ts, Is_Current, First_Name, Last_Name, Aka_Ind)
	Values(Dbo_Tc.Seq_Party_Aka_Id.Nextval, Per_Rec.Party_Id, Per_Rec.First_Name || ' ' || Per_Rec.Last_Name, 'JeffreyL', Systimestamp, 'Y', 
	Per_Rec.first_name, Per_Rec.last_name, 'N');
	indexcount := indexcount+1;

	If (indexcount = 1000) then
		Commit;
		indexcount := 0;
	End If;
      
End Loop;
Commit;
end;

/

Declare
	Indexcount Number;
	Cursor comp_Cur Is
		Select p1.Party_Id, P1.Company_Name From Dbo_Tc.company P1
		Left Outer Join Dbo_Tc.Party_Aka P2 On P1.Party_Id = P2.Party_Id And P2.Is_Current = 'Y'
		where p2.Party_Id is null;
Begin
FOR comp_rec in comp_Cur
Loop
	dbms_output.put_line ('Party Id: ' || comp_rec.Party_Id);
	insert into DBO_TC.PARTY_AKA(ID, PARTY_ID, AKA_NAME, LAST_UPDATED_USER,LAST_UPDATED_TS, IS_CURRENT, FIRST_NAME, LAST_NAME, AKA_IND)
	Values(Dbo_Tc.Seq_Party_Aka_Id.Nextval,comp_rec.Party_Id, comp_rec.Company_Name, 'JeffreyL', Systimestamp, 'Y', Null, comp_rec.Company_Name, 'N');

	indexcount := indexcount+1;
	If (indexcount = 1000) then
		Commit;
		indexcount := 0;
	End If;
      
End Loop;
Commit;
end;


         



