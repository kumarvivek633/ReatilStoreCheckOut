CREATE OR REPLACE FORCE VIEW "DBO_TC"."VIEW_NAME_TYPEAHEAD" ("PARTY_ID", "PARTY_TYPE", "FIRST_NAME", "ENTITY_NAME", "END_CHARS_OF_SSN", "OCCUPATION", "TYPE_AHEAD_DISPLAY_NAME", "PRIMARY_NAME", "PRIMARY_DISPLAY_NAME","AKA_ID", "TEAM_MEMBERS","IS_COMPANY","IS_CONTACT","IS_TALENT", "DATASET_ID") AS 
 

SELECT
          aka.party_id AS PARTY_ID,
          case when aka.is_current = 'N' then
          party.party_type || '_' || 'AKA'
          else party.party_type end AS PARTY_TYPE,
          aka.FIRST_NAME            AS FIRST_NAME,
          aka.LAST_NAME       AS ENTITY_NAME,
          person.ssn_end_chars         AS END_CHARS_OF_SSN,
          (SELECT LISTAGG(prop_value.prop_value, ' , ') WITHIN GROUP (ORDER BY prop_value.prop_value) 
              FROM DBO_TC.OCCUPATION occupation
              INNER join dbo_tc.sys_prop_value prop_value
             ON occupation.occu_name_id = prop_value.prop_id
          WHERE occupation.PARTY_ID=aka.party_Id) AS OCCUPATION,
         aka.AKA_NAME AS TYPE_AHEAD_DISPLAY_NAME, 
         case when aka.is_current = 'N' then
         case when person.first_name is not null then person.first_name || ' ' || person.last_name else person.last_name end end AS PRIMARY_NAME,
          case when aka.is_current = 'N' then
          aka.AKA_NAME else null end AS PRIMARY_DISPLAY_NAME,
          
        
        aka.ID       AS AKA_ID,
        (SELECT LISTAGG(COALESCE(team_c.COMPANY_NAME, NVL2(team_p.FIRST_NAME, team_p.FIRST_NAME || ' ' || team_p.LAST_NAME, team_p.LAST_NAME), pft.DISPLAY_NAME), ', ') WITHIN GROUP (ORDER BY pft.DISPLAY_NAME) 
              FROM DBO_TC.PARTY pft
              LEFT JOIN DBO_TC.PARTY_TEAM tfpt ON tfpt.CHILD_PARTY_ID=pft.PARTY_ID
              LEFT JOIN DBO_TC.PERSON team_p ON pft.PARTY_ID = team_p.PARTY_ID
              LEFT JOIN DBO_TC.COMPANY team_c ON pft.PARTY_ID = team_c.PARTY_ID
          WHERE tfpt.PARENT_PARTY_ID=aka.PARTY_ID) as TEAM_MEMBERS,
         case when company.party_id is not null then
        'Y' else 'N' end as IS_COMPANY,
         case when contact.party_id is not null then
        'Y' else 'N' end as IS_CONTACT,
        case when sttalent.party_id is not null then
        'Y' else 'N' end as IS_TALENT,
		party.DATASET_ID AS DATASET_ID
        
      FROM dbo_tc.party_aka aka
          LEFT JOIN dbo_tc.party party 
            ON aka.party_id = party.PARTY_ID
          LEFT JOIN dbo_tc.person person
            ON aka.party_id = person.party_id
          LEFT JOIN dbo_tc.company company
            ON aka.party_id = company.party_id
          LEFT JOIN dbo_tc.contact contact
            ON aka.party_id = contact.party_id
          LEFT JOIN dbo_tc.st_talent sttalent
            ON aka.party_id = sttalent.party_id;
            

 