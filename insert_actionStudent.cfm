<html> 
<head> <title>Input form</title> </head> 
 
<body> 
<cfinsert datasource="test_1" tablename="student1"> 
 
<h1>Student Added</h1> 
<cfoutput> You have added data to the student database. 
</cfoutput> 
</br>
<CFQUERY NAME="GetInfo" DATASOURCE="test_1">
         SELECT Student_id
         FROM student1
         ORDER BY Student_id DESC 
</CFQUERY>
<CFloop QUERY="GetInfo">
<cfoutput>
GENERATED ID: #Student_id#</br>
</cfoutput>

<cfbreak>
</cfloop>
</form>
	
<table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</table>
 
</body> 
</html>