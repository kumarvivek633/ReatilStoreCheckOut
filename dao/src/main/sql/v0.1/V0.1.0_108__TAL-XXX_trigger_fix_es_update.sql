create or replace TRIGGER "DBO_TC"."PARTY_UPDATE_TRIGGER" AFTER
  INSERT OR
  Update On Dbo_Tc.Party For Each Row 
  Declare V_Count Number;
  Lookup_Name Varchar(30);
  defaultTab varchar(20);
  V_Count2 Number;
  BEGIN
    SELECT COUNT(*)
    INTO V_Count
    FROM dbo_tc.PARTIES_UPDATED
    WHERE PARTY_ID = :new.PARTY_ID;
    
    If V_Count              = 0  Then
      If :new.Updated_By_App Is Not Null Then
        SELECT COUNT(*)
        INTO V_Count2
        FROM DBO_MP.LOOKUP
        WHERE LOOKUP_ID = :new.Updated_By_App;
        If V_Count2              > 0 then
          SELECT l.Lookup_name
          INTO Lookup_name
          FROM DBO_MP.LOOKUP l where
          L.Lookup_Id = :new.Updated_By_App;
        end if;  
      End If;
      
      If Lookup_Name Is Null Or Lookup_Name Not In ('Talent2', 'RollCall2') Then
          INSERT INTO DBO_TC.PARTIES_UPDATED VALUES
          ( Dbo_Tc.Seq_Parties_Updated_Id.Nextval, :New.Party_Id);
        end if;
    End If;
  END;