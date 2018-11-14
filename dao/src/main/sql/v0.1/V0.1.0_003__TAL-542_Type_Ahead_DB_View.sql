
CREATE OR REPLACE FORCE VIEW "DBO_TC"."VIEW_NAME_TYPEAHEAD" ("PARTY_ID", "PARTY_TYPE", "FIRST_NAME", "MIDDLE_NAME", "ENTITY_NAME", "SUFFIX", "END_CHARS_OF_SSN", "OCCUPATION", "AGENCY", "TYPE_AHEAD_DISPLAY_NAME") AS
  SELECT
      	  party.party_id AS PARTY_ID,
		  party.party_type             AS PARTY_TYPE,
		  person.first_name            AS FIRST_NAME,
		  person.middle_name           AS MIDDLE_NAME,
		  COALESCE(person.last_name, company.company_name)       AS ENTITY_NAME,
		  person.suffix                AS SUFFIX,
      	  person.ssn_end_chars         AS END_CHARS_OF_SSN,
		  prop_value.prop_value        AS OCCUPATION,
      ( select agency.company_name from dbo_tc.company agency where
  			agency.party_id = party_relation.child_id ) AS AGENCY,
		  TRIM ( COALESCE(person.last_name, company.company_name) || ' ' || COALESCE( FIRST_NAME, '') || ' ' || COALESCE(MIDDLE_NAME, '') || ' ' || COALESCE(SUFFIX, ''))
  				AS TYPE_AHEAD_DISPLAY_NAME
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
		  party.party_id AS PARTY_ID,
   		 ( select party1.party_type || '_' || 'AKA' from dbo_tc.party party1 where party1.party_id =party.party_id )             AS PARTY_TYPE,
		  NULL            AS FIRST_NAME,
		  NULL           AS MIDDLE_NAME,
		  party.AKA_NAME       AS ENTITY_NAME,
		  person.suffix                AS SUFFIX,
     	  person.ssn_end_chars         AS END_CHARS_OF_SSN,
		  prop_value.prop_value        AS OCCUPATION,
     	 ( select agency.company_name from dbo_tc.company agency where
  			agency.party_id = party_relation.child_id ) AS AGENCY,
   		  party.AKA_NAME AS TYPE_AHEAD_DISPLAY_NAME
  	FROM dbo_tc.party_akas party
		  LEFT JOIN dbo_tc.person person
		    ON party.party_id = person.party_id
		  LEFT JOIN dbo_tc.company company
		    ON party.party_id = company.party_id
		  LEFT JOIN dbo_tc.occupation occupation
		    ON party.party_id = occupation.party_id
		  LEFT JOIN dbo_tc.sys_prop_value prop_value
		     ON occupation.occu_name_id = prop_value.prop_id
      LEFT OUTER JOIN dbo_tc.party_relation party_relation
    		ON party.party_id = party_relation.parent_id AND party_relation.relation_type = 'CONTACT_COMPANY';


--Create Synonyms for APP_MP, APP_TC and APP_DP
CREATE OR REPLACE SYNONYM APP_TC.VIEW_NAME_TYPEAHEAD FOR DBO_TC.VIEW_NAME_TYPEAHEAD;
GRANT ALL ON DBO_TC.VIEW_NAME_TYPEAHEAD TO APP_TC;

CREATE OR REPLACE SYNONYM APP_MP.VIEW_NAME_TYPEAHEAD FOR DBO_TC.VIEW_NAME_TYPEAHEAD;
GRANT ALL ON DBO_TC.VIEW_NAME_TYPEAHEAD TO APP_MP;

CREATE OR REPLACE SYNONYM APP_DP.VIEW_NAME_TYPEAHEAD FOR DBO_TC.VIEW_NAME_TYPEAHEAD;
GRANT ALL ON DBO_TC.VIEW_NAME_TYPEAHEAD TO APP_DP;

COMMIT;
