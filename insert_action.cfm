<html> 
<head> <title>Input form</title> </head> 
 
<body> 

<cfinsert datasource="test_1" tablename="employee"> 

 
<h1>Employee Added</h1> 
<cfoutput> You have added data to the employee database. 
</cfoutput> </br>
<CFQUERY NAME="GetInfo" DATASOURCE="test_1">
         SELECT teacherid
         FROM employee
         ORDER BY teacherid DESC
         
</CFQUERY>
<CFloop QUERY="GetInfo">
<cfoutput>
GENERATED ID: #teacherid#</br>

</cfoutput>

<cfbreak>
</cfloop>

<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
 
</body> 
</html>