  CREATE OR REPLACE FORCE VIEW "DBO_TC"."VIEW_CONTACT_DETAILS" ("PARTY_ID", "FIRST_NAME", "LAST_NAME", "DESIGNATION", "PHONE_NO", "COMPANY", "PHONE_UPDATED_ON", "WEB_CONTACT", "COMPANY_ID", "DISPLAY_NAME", "UPDATED_DATE", "TA_DISPLAY_NAME", "DATASET_ID") AS 
  (
SELECT  p.party_id,
        per.first_name,
        per.last_name,
        ct.designation,
        pn1.phone_no,
        p2.display_name Company,
        p.updated_date phone_updated_on,
        wc1.contact_value web_contact,
        p2.party_id Company_id,
        p.display_name display_name,
        p.updated_date updated_date,
        p.ta_display_name ta_display_name,
        P.Dataset_Id
  From dbo_tc.Contact Ct
  LEFT OUTER JOIN(SELECT * FROM dbo_tc.party_relation WHERE relation_type='CONTACT_COMPANY' and Primary_Flag='Y') pr
       On Ct.Party_Id=Pr.Parent_Id
  Inner Join Dbo_Tc.Person Per On Ct.Party_Id=Per.Party_Id
  Inner Join Dbo_Tc.Party P On Ct.Party_Id=P.Party_Id
  LEFT OUTER JOIN dbo_tc.company cy ON cy.party_id=pr.child_id
  Left Outer Join
       (Select * From Dbo_Tc.Party_Contact Where Primary_Flag='Y'And Contact_Type='PHONE') Pc1 On Pc1.Party_Id=P.Party_Id
  LEFT OUTER JOIN dbo_tc.phone pn1 ON pc1.contact_id=pn1.contact_id
  Left Outer Join
       (Select * From Dbo_Tc.Party_Contact Where Primary_Flag='Y'And Contact_Type='EMAIL') Pc2 On Pc2.Party_Id=P.Party_Id
  Left Outer Join Dbo_Tc.Web_Contact Wc1 On Pc2.Contact_Id=Wc1.Contact_Id
  LEFT OUTER JOIN dbo_tc.party p2 ON p2.party_id=pr.child_id
)
 ;
