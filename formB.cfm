<cfform name = "form1" action="" method="Post"> 
<cfoutput>
#form.email#
</cfoutput>
<cfoutput>
#form.LocationName#
</cfoutput>
<cfoutput>
#form.cell#
</cfoutput>
</cfform> 


<!---
<cfquery datasource="test_1" name="test">

INSERT INTO [test].[dbo].[MOC_Admin_EMails]
           ([LocationName]
           ,[CellID]
           ,[EmailList])
     VALUES
           ('#form.LocationName#'
           ,#form.cell#
           ,'#form.email#')



</cfquery>
--->