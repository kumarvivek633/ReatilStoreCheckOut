Delete From Dbo_Mp.User_Preferences Where Lookup_Type_Id=(Select Lookup_Type_Id From Dbo_Mp.Lookup_Type Where Lookup_Type_Name = 'CALLSHEET_STATUS')
and lookup_id in (Select distinct Lookup_Id From Dbo_Mp.User_Preferences Where Lookup_Type_Id=(Select Lookup_Type_Id From Dbo_Mp.Lookup_Type Where Lookup_Type_Name = 'CALLSHEET_STATUS')
And Lookup_Id Not In
(Select Lookup_Id From Dbo_Mp.Lookup Where Lookup_Type_Id=21));
commit;