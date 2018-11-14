--TAL-1673 STARTS
--Inserting entries in Sys_property table for picklist types.
insert into DBO_TC.SYS_PROPERTY values ( DBO_TC.SEQ_SYS_PROP_ID.nextval, 'STATES' );
insert into DBO_TC.SYS_PROPERTY values ( DBO_TC.SEQ_SYS_PROP_ID.nextval, 'COUNTRIES' );
insert into DBO_TC.SYS_PROPERTY values ( DBO_TC.SEQ_SYS_PROP_ID.nextval, 'GENRE' );
insert into DBO_TC.SYS_PROPERTY values ( DBO_TC.SEQ_SYS_PROP_ID.nextval, 'TALENT_STATUS' );

-- Remaining picklist values for RACE/Ethnicity
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, (select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where SYS_PROP_NAME = 'RACE'), 'Black', NULL, 6);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, (select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where SYS_PROP_NAME = 'RACE'), 'Asian/Pacific', NULL, 7);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, (select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where SYS_PROP_NAME = 'RACE'), 'American/Indian', NULL, 8);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, (select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where SYS_PROP_NAME = 'RACE'), 'Unknown', NULL, 9);


-- Picklist values for COUNTRIES
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'United States', 'USA', 1);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Canada', 'Can', 2);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Australia', 'Aus', 3);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'United Kingdom', 'UK', 4);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Japan', 'Jap', 5);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Scotland', 'SCT', 6);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Ireland', 'IR', 7);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Hong Kong', 'HK', 8);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'France', 'Fr', 9);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'China', 'Ch', 10);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'England', NULL, 11);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Spain', NULL, 12);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Puerto Rico', NULL, 13);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Russia', NULL, 14);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'South Africa', NULL, 15);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Israel', NULL, 16);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Netherlands', NULL, 17);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'South Korea', NULL, 18);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Syria', NULL, 19);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'United Arab Emirates', NULL, 20);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Morocco', NULL, 21);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Argentina', NULL, 22);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Korea', NULL, 23);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Bulgaria', NULL, 24);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Belgium', NULL, 25);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Switzerland', NULL, 26);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Hungary', NULL, 27);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Egypt', NULL, 28);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Thailand', NULL, 29);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'South Australia', NULL, 30);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Czech Republic', NULL, 31);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Sweden', NULL, 32);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Slovakia', NULL, 33);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Brazil', NULL, 34);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Greece', NULL, 35);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Denmark', NULL, 36);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Greenland', NULL, 37);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Romania', NULL, 38);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Namibia', NULL, 39);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Ukraine', NULL, 40);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Finland', NULL, 41);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Poland', NULL, 42);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Lithuania', NULL, 43);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Malta', NULL, 44);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'South Wales', NULL, 45);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Canary Islands', NULL, 46);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'French Polynesia', NULL, 47);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Holland', NULL, 48);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Iceland', NULL, 49);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Nigeria', NULL, 50);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Mexico', 'Mex', 51);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'New Zealand', 'NZ', 52);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Wales', 'Wls', 53);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Italy', 'It', 54);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'COUNTRIES'), 'Germany', 'Ger',55);


-- Picklist values for STATES
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Alabama', 'AL', 1);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Alaska', 'AK', 2);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Arizona', 'AZ', 3);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Arkansas', 'AR', 4);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'California', 'CA', 5);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Colorado', 'CO', 6);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Connecticut', 'CT', 7);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Delaware', 'DE', 8);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Florida', 'FL', 9);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Georgia', 'GA', 10);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Hawaii', 'HI', 11);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Idaho', 'ID', 12);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Illinois', 'IL', 13);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Indiana', 'IN', 14);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Iowa', 'IA', 15);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Kansas', 'KS', 16);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Kentucky', 'KY', 17);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Louisiana', 'LA', 18);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Maine', 'ME', 19);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Maryland', 'MD', 20);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Massachusetts', 'MA', 21);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Michigan', 'MI', 22);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Minnesota', 'MN', 23);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Mississippi', 'MS', 24);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Missouri', 'MO', 25);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Montana', 'MT', 26);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Nebraska', 'NE', 27);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Nevada', 'NV', 28);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'New Hampshire', 'NH', 29);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'New Jersey', 'NJ', 30);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'New Mexico', 'NM', 31);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'New York', 'NY', 32);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'North Carolina', 'NC', 33);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'North Dakota', 'ND', 34);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Ohio', 'OH', 35);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Oklahoma', 'OK', 36);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Oregon', 'OR', 37);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Pennsylvania', 'PA', 38);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Rhode Island', 'RI', 39);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'South Carolina', 'SC', 40);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'South Dakota', 'SD', 41);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Tennesee', 'TN', 42);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Texas', 'TX', 43);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Utah', 'UT', 44);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Vermont', 'VT', 45);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Virginia', 'VA', 46);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Washington', 'WA', 47);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Washington D.C.', 'DC', 48);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'West Virginia', 'WV', 49);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Wisconsin', 'WI', 50);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'STATES'), 'Wyoming', 'WY', 51);


-- Picklist values for GENRE
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Action', NULL, 1);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Adventure', NULL, 2);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Animated', NULL, 3);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Autobiography', NULL, 4);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Biography', NULL, 5);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Black Comedy', NULL, 6);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Buddy', NULL, 7);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Classic', NULL, 8);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Comedy', NULL, 9);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Crime', NULL, 10);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Disaster', NULL, 11);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Documentary', NULL, 12);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Drama', NULL, 13);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Family', NULL, 14);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Fantasy', NULL, 15);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Future', NULL, 16);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Historical', NULL, 17);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Horror', NULL, 18);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Juvenile', NULL, 19);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Melodrama', NULL, 20);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Musical', NULL, 21);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Mystery', NULL, 22);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Non-Fiction', NULL, 23);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Period', NULL, 24);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Political', NULL, 25);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Religious', NULL, 26);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Romantic', NULL, 27);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Satire', NULL, 28);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Science', NULL, 29);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Science-Fiction', NULL, 30);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Sports', NULL, 31);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Supernatural', NULL, 32);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Suspense', NULL, 33);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Thriller', NULL, 34);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'War', NULL, 35);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Western', NULL, 36);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'GENRE'), 'Young Adult', NULL, 37);


-- Picklist values for TALENT_STATUS
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), '', NULL, 1);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Out To', NULL, 2);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'On Deck', NULL, 3);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Priority', NULL, 4);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Consider', NULL, 5);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Group A', NULL, 6);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Group B', NULL, 7);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Group C', NULL, 8);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Other Ideas', NULL, 9);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Not Avail', NULL, 10);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'TALENT_STATUS'), 'Passed', NULL, 11);

--inserting new fresh entries for Phone_Type
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Home',NULL , 12);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Office', NULL, 13);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Foreign', NULL, 14);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Cell', NULL, 15);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Fax', NULL, 16);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'E-mail',NULL, 17);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Pager', NULL, 18);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Service', NULL, 19);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Other 1', NULL, 20);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Fax (Home)', NULL, 21);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Voice Mail', NULL, 22);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Home/Fax', NULL, 23);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Website',NULL , 24);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Assistant', NULL, 25);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Office/Fax', NULL, 26);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'E-mail 2', NULL, 27);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Attorney', NULL, 28);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Agent',NULL, 29);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Assistant 2', NULL, 30);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Manager', NULL, 31);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Publicist', NULL, 32);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Foreign 2', NULL, 33);
insert into DBO_TC.SYS_PROP_VALUE values ( DBO_TC.SEQ_SYS_PROP_VALUE_ID.nextval, ( select SYS_PROP_ID from DBO_TC.SYS_PROPERTY where  SYS_PROP_NAME = 'PHONE_TYPE'), 'Business Mgr', NULL, 34);

COMMIT;

