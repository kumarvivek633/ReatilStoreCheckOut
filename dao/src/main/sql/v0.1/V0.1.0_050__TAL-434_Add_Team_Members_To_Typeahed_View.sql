
  CREATE OR REPLACE FORCE VIEW "DBO_TC"."VIEW_NAME_TYPEAHEAD" ("PARTY_ID", "PARTY_TYPE", "FIRST_NAME", "ENTITY_NAME", "END_CHARS_OF_SSN", "OCCUPATION", "AGENCY", "TYPE_AHEAD_DISPLAY_NAME", "PRIMARY_NAME", "PRIMARY_DISPLAY_NAME", "TEAM_MEMBERS") AS 
  SELECT
          party.party_id AS PARTY_ID,
          party.party_type             AS PARTY_TYPE,
          person.first_name            AS FIRST_NAME,
          COALESCE(person.last_name, company.company_name, party.display_name)       AS ENTITY_NAME,
          person.ssn_end_chars         AS END_CHARS_OF_SSN,
          prop_value.prop_value        AS OCCUPATION,
      ( select agency.company_name from dbo_tc.company agency where
            agency.party_id = party_relation.child_id ) AS AGENCY,
          party.DISPLAY_NAME
                AS TYPE_AHEAD_DISPLAY_NAME,
          NULL AS PRIMARY_NAME,
          NULL AS PRIMARY_DISPLAY_NAME, 
          (SELECT LISTAGG(COALESCE(team_c.COMPANY_NAME, NVL2(team_p.FIRST_NAME, team_p.FIRST_NAME || ' ' || team_p.LAST_NAME, team_p.LAST_NAME), pft.DISPLAY_NAME), ', ') WITHIN GROUP (ORDER BY pft.DISPLAY_NAME) 
              FROM DBO_TC.PARTY pft
              LEFT JOIN DBO_TC.PARTY_TEAM tfpt ON tfpt.CHILD_PARTY_ID=pft.PARTY_ID
              LEFT JOIN DBO_TC.PERSON team_p ON pft.PARTY_ID = team_p.PARTY_ID
              LEFT JOIN DBO_TC.COMPANY team_c ON pft.PARTY_ID = team_c.PARTY_ID
          WHERE tfpt.PARENT_PARTY_ID=party.PARTY_ID ) AS TEAM_MEMBERS
    FROM dbo_tc.party party
          LEFT JOIN dbo_tc.person person
            ON party.party_id = person.party_id
          LEFT JOIN dbo_tc.company company
            ON party.party_id = company.party_id
          LEFT JOIN dbo_tc.occupation occupation
            ON party.party_id = occupation.party_id
          LEFT JOIN dbo_tc.sys_prop_value prop_value
             ON occupation.occu_name_id = prop_value.prop_id
      LEFT OUTER JOIN dbo_tc.party_relation party_relation
            ON party.party_id = party_relation.parent_id AND party_relation.relation_type = 'CONTACT_COMPANY'
UNION
    SELECT
          aka.party_id AS PARTY_ID,
          party.party_type || '_' || 'AKA' AS PARTY_TYPE,
          NULL            AS FIRST_NAME,
          aka.AKA_NAME       AS ENTITY_NAME,
          person.ssn_end_chars         AS END_CHARS_OF_SSN,
          prop_value.prop_value        AS OCCUPATION,
         ( select agency.company_name from dbo_tc.company agency where
            agency.party_id = party_relation.child_id ) AS AGENCY,
          aka.AKA_NAME AS TYPE_AHEAD_DISPLAY_NAME, 
         
         CASE  WHEN person.FIRST_Name IS NOT NULL THEN (person.First_Name || ' ' ) END
          || person.LAST_NAME AS PRIMARY_NAME,
          party.DISPLAY_NAME as PRIMARY_DISPLAY_NAME,
         (SELECT LISTAGG(COALESCE(team_c.COMPANY_NAME, NVL2(team_p.FIRST_NAME, team_p.FIRST_NAME || ' ' || team_p.LAST_NAME, team_p.LAST_NAME), pft.DISPLAY_NAME), ', ') WITHIN GROUP (ORDER BY pft.DISPLAY_NAME) 
              FROM DBO_TC.PARTY pft
              LEFT JOIN DBO_TC.PARTY_TEAM tfpt ON tfpt.CHILD_PARTY_ID=pft.PARTY_ID
              LEFT JOIN DBO_TC.PERSON team_p ON pft.PARTY_ID = team_p.PARTY_ID
              LEFT JOIN DBO_TC.COMPANY team_c ON pft.PARTY_ID = team_c.PARTY_ID
          WHERE tfpt.PARENT_PARTY_ID=party.PARTY_ID ) AS TEAM_MEMBERS
      FROM dbo_tc.party_akas aka
          LEFT JOIN dbo_tc.party party 
            ON aka.party_id = party.PARTY_ID
          LEFT JOIN dbo_tc.person person
            ON aka.party_id = person.party_id
          LEFT JOIN dbo_tc.company company
            ON aka.party_id = company.party_id
          LEFT JOIN dbo_tc.occupation occupation
            ON aka.party_id = occupation.party_id
          LEFT JOIN dbo_tc.sys_prop_value prop_value
             ON occupation.occu_name_id = prop_value.prop_id
      LEFT OUTER JOIN dbo_tc.party_relation party_relation
            ON aka.party_id = party_relation.parent_id AND party_relation.relation_type = 'CONTACT_COMPANY';
