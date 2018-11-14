update DBO_TC.PARTY_AKA set LAST_NAME = AKA_NAME where LAST_NAME is null;
commit;