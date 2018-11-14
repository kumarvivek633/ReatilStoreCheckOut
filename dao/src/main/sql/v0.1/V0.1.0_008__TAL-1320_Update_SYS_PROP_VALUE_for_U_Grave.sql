--Updating Value for U as Both values are inserted in small letters.
Update DBO_TC.SYS_PROP_VALUE set PROP_VALUE='Ù' where PROP_VALUE = 'ù' and ABBR = 'Grave' and SORT_ORDER = 2;
COMMIT;