--1 Combine Green Card and Permanent Resident into Permanent Resident Card
--1a Change Green Card to Permenant Resident Card
UPDATE DBO_TC.SYS_PROP_VALUE 
  SET PROP_VALUE='Permanent Resident Card', ABBR='Permanent Resident Card' 
  WHERE PROP_VALUE='Green Card' AND SYS_PROP_ID=(SELECT SYS_PROP_ID FROM DBO_TC.SYS_PROPERTY where SYS_PROP_NAME='IMMIGRATION_STATUS'); 
  
--1b update all current perminant residents to the new permanant resedent card  
UPDATE DBO_TC.WORK_ELIGIBILITY 
  SET WORK_ELIG_TYPE_NAME_ID=(
    SELECT spv.PROP_ID 
    FROM DBO_TC.SYS_PROP_VALUE spv 
    JOIN DBO_TC.SYS_PROPERTY sp ON spv.SYS_PROP_ID=sp.SYS_PROP_ID 
    WHERE spv.PROP_VALUE='Permanent Resident Card' AND sp.SYS_PROP_NAME='IMMIGRATION_STATUS')
  WHERE WORK_ELIG_TYPE_NAME_ID=(
      SELECT spv.PROP_ID 
      FROM DBO_TC.SYS_PROP_VALUE spv 
      JOIN DBO_TC.SYS_PROPERTY sp ON spv.SYS_PROP_ID=sp.SYS_PROP_ID 
      WHERE spv.PROP_VALUE='Permanent Resident' AND sp.SYS_PROP_NAME='IMMIGRATION_STATUS');

--1c remove the perminant resedent from the admin_sys_prop_value table      
DELETE DBO_TC.ADMIN_SYS_PROP_VALUE WHERE CODE_ID=(SELECT spv.PROP_ID 
      FROM DBO_TC.SYS_PROP_VALUE spv 
      JOIN DBO_TC.SYS_PROPERTY sp ON spv.SYS_PROP_ID=sp.SYS_PROP_ID 
      WHERE spv.PROP_VALUE='Permanent Resident' AND sp.SYS_PROP_NAME='IMMIGRATION_STATUS');    

--id remove permnanant resedent from the sys_prop_value table      
DELETE DBO_TC.SYS_PROP_VALUE WHERE PROP_VALUE='Permanent Resident' and SYS_PROP_ID=(SELECT SYS_PROP_ID FROM DBO_TC.SYS_PROPERTY where SYS_PROP_NAME='IMMIGRATION_STATUS');

--Update Naturalized to Naturalized Citizen
UPDATE DBO_TC.SYS_PROP_VALUE 
  SET PROP_VALUE='Naturalized Citizen', ABBR='Naturalized Citizen' 
  WHERE PROP_VALUE='Naturalized' AND SYS_PROP_ID=(SELECT SYS_PROP_ID FROM DBO_TC.SYS_PROPERTY where SYS_PROP_NAME='IMMIGRATION_STATUS'); 

--update Emp Auth Card to Employment Authroization Card. 
UPDATE DBO_TC.SYS_PROP_VALUE 
  SET PROP_VALUE='Employment Authorization Card', ABBR='Employment Authorization Card' 
  WHERE PROP_VALUE='Emp Auth Card' AND SYS_PROP_ID=(SELECT SYS_PROP_ID FROM DBO_TC.SYS_PROPERTY where SYS_PROP_NAME='IMMIGRATION_STATUS'); 

  COMMIT;