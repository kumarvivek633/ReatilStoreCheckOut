
UPDATE dbo_dp.user_role
SET ROLE_NAME   = 'BA Admin Executive'
WHERE ROLE_NAME = 'Business Affairs Admin Executive';

--Set Roles and PERMISSIONS  
DECLARE
  role_id         NUMBER;
  role_name       VARCHAR(100);
  permission_id   NUMBER;
  permission_name VARCHAR(200);
  u_no number;
BEGIN


DELETE
FROM DBO_MP.ROLE_PERMISSIONS
WHERE role_id IN
  (SELECT ROLE_ID
  FROM dbo_mp.user_role
  WHERE role_name IN ('BA Admin Executive')
  )AND
  permission_id in (select permission_id from DBO_MP.permissions where Name like '%Talent%');
  

  FOR rec1 IN
  (SELECT ROLE_ID AS role_id,
    ROLE_NAME     AS role_name
  FROM dbo_mp.user_role
  WHERE role_name IN ('BA Admin Executive')
  )
  LOOP
    FOR rec2 IN
    (SELECT permission_id AS permission_id,
      name                AS permission_name
    FROM DBO_MP.PERMISSIONS where name like 'Talent%'
	AND name<>'Talent.PII')
    LOOP
      IF rec1.role_name = 'BA Admin Executive' THEN
        INSERT
        INTO DBO_MP.ROLE_PERMISSIONS
          (
            ROLE_PERMISSION_ID,
            ROLE_ID,
            PERMISSION_ID,
            LAST_UPDATE_TS,
            LAST_UPDATE_USER
          )
          VALUES
          (
            DBO_MP.SEQ_ROLE_PERMISSION_ID.nextval,
            rec1.role_id,
            rec2.permission_id,
            systimestamp,
            'flyway'
          );
      END IF;
    END LOOP;
  END LOOP;
  
  --commit;
END;