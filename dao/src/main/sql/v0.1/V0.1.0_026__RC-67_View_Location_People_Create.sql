CREATE OR REPLACE FORCE VIEW "DBO_TC"."VIEW_LOCATION_PEOPLE" ("PARTY_ID", "FIRST_NAME", "LAST_NAME", "DESIGNATION", "DISPLAY_NAME", "TA_DISPLAY_NAME", "DATASET_ID", "LOCATIONID") AS 
(
  Select 
  P.Party_Id, 
  Per.First_Name, 
  Per.Last_Name, 
  Con.Designation, 
  P.Display_Name, 
  P.Ta_Display_Name, 
  P.Dataset_Id,
  Cr.Child_Contact_Id As "LOCATIONID"
From Dbo_Tc.Contact_Relation Cr
  Inner Join Dbo_Tc.Party_Contact Pc On Pc.Contact_Id = Cr.Parent_Contact_Id
  Inner Join Dbo_Tc.Party P On P.Party_Id = Pc.Party_Id
  Inner Join Dbo_Tc.Person Per On Per.Party_Id = P.Party_Id
  Inner Join Dbo_Tc.Contact Con On Con.Party_Id = P.Party_Id
  Inner Join Dbo_Tc.Address Addr On Addr.Contact_Id = Cr.Parent_Contact_Id And Addr.Address_Type = 'Suite'
where Cr.Relation_Type = 'SUITE_ADDRESS'
);

------------- Create synonyms for VIEW_LOCATION_PEOPLE -------------------------
CREATE OR REPLACE SYNONYM APP_TC.VIEW_LOCATION_PEOPLE FOR DBO_TC.VIEW_LOCATION_PEOPLE;
grant all on DBO_TC.VIEW_LOCATION_PEOPLE to APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.VIEW_LOCATION_PEOPLE FOR DBO_TC.VIEW_LOCATION_PEOPLE;
grant all on DBO_TC.VIEW_LOCATION_PEOPLE to APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.VIEW_LOCATION_PEOPLE FOR DBO_TC.VIEW_LOCATION_PEOPLE;
grant all on DBO_TC.VIEW_LOCATION_PEOPLE to APP_DP;
--------------------------------------------------------------------------------

commit;

