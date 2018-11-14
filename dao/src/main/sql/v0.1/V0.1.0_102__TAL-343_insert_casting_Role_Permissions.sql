--Set Roles and PERMISSIONS  
DECLARE
  v_cnt   NUMBER := 0;
  role_id         NUMBER;
  role_name       VARCHAR(100);
  permission_id   NUMBER;
  permission_name VARCHAR(200);
  u_no number;
BEGIN

SELECT COUNT (*)
    INTO v_cnt
    FROM DBO_MP.USER_ROLE
    WHERE ROLE_NAME = 'Feature Casting Administrator';

 IF v_cnt = 1
   THEN
		DELETE
		FROM DBO_MP.ROLE_PERMISSIONS
		WHERE role_id IN
		  (SELECT ROLE_ID
		  FROM dbo_mp.user_role
		  WHERE role_name IN ('Feature Casting Administrator')
		  )AND
		  permission_id in (select permission_id from DBO_MP.permissions where Name like '%Talent%');
		  

		  FOR rec1 IN
		  (SELECT ROLE_ID AS role_id,
			ROLE_NAME     AS role_name
		  FROM dbo_mp.user_role
		  WHERE role_name IN ('Feature Casting Administrator')
		  )
		  LOOP
			FOR rec2 IN
			(SELECT permission_id AS permission_id,
			  name                AS permission_name
			FROM DBO_MP.PERMISSIONS where name like 'Talent%'
			AND name<>'Talent.PII')
			LOOP
			  IF rec1.role_name = 'Feature Casting Administrator' THEN
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
	END IF; 
  --commit;
END;