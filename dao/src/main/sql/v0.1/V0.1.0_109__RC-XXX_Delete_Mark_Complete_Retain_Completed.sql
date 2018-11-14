Declare
completestatusid Number;
markascompletestatusid number;
Begin

Select Lookup_Id Into Markascompletestatusid From Dbo_Mp.Lookup Where Lookup_Name = 'Mark as Complete' And Lookup_Type_Id = (Select Lookup_Type_Id From Dbo_Mp.Lookup_Type Where Lookup_Type_Name = 'CALLSHEET_STATUS');
select Lookup_Id into completestatusid from DBO_MP.Lookup where Lookup_Name = 'Completed' and Lookup_Type_Id = (select Lookup_Type_Id from DBO_MP.Lookup_Type where lookup_type_name = 'CALLSHEET_STATUS');

Update Dbo_Mp.Callsheet set Status_Id = completestatusid Where Status_Id = Markascompletestatusid;
commit;

Update Dbo_Mp.User_Preferences set Lookup_Id = completestatusid Where Lookup_Id = Markascompletestatusid;
commit;

Delete From Dbo_Mp.Lookup Where Lookup_Name = 'Mark as Complete' And Lookup_Id = Markascompletestatusid;
commit;

end;