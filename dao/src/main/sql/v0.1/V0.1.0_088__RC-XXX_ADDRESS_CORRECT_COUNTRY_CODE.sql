Declare

Cursor Cur_Code Is
	Select Ad.Address_Id,Ad.First_Line, Ad.Country, P1.Abbr, P1.Prop_Value, C1.Country_Code, C1.Country_Name From Dbo_Tc.Address Ad
	Inner Join Dbo_Tc.Sys_Prop_Value P1 On P1.Abbr = Ad.Country
	Inner Join Dbo_Tc.Sys_Property P2 On P2.Sys_Prop_Id = P1.Sys_Prop_Id And P2.Sys_Prop_Name = 'COUNTRIES'
	inner join DBO_TC.Countries c1 on C1.Country_Name = P1.Prop_Value and C1.Country_Code != P1.Abbr;
Begin

For Rec In Cur_Code
loop

  Update Dbo_Tc.Address Set Country = Rec.Country_Code Where Address_Id = Rec.Address_Id;

end loop;

end;