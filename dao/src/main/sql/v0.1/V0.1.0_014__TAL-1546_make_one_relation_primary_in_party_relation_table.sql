update dbo_tc.party_relation set PRIMARY_FLAG = 'Y'
where PARTY_RELATION_ID in ( select min(PARTY_RELATION_ID) from dbo_tc.party_relation group by PARENT_ID );

COMMIT;