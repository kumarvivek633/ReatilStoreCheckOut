DELETE
FROM DBO_MP.ROLE_PERMISSIONS
WHERE role_id IN
  (SELECT ROLE_ID
  FROM dbo_mp.user_role
  WHERE role_name IN ('BA Admin Executive')
  )AND
  permission_id in (select permission_id from DBO_MP.permissions where Name like '%Talent.PII%');
 