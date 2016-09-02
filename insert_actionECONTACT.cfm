<html> 
<head> <title>Input form</title> </head> 
<body> 
<cfinsert datasource="test_1" tablename="EmployeeContact"> 

<h1>EMPLOYEE CONTACT DETAILS ADDED</h1> 
<cfoutput> You have added details to the EMPLOYEE contact database. 
</cfoutput> 
 

  
 <cfmail to="#form.email#"
	from="shraddheyp@gmail.com"
	subject="Welcome to School"
	type="text"
	server="HSC-342Z6BS">
	Dear #form.teacherid#

	We, here at schoolhouse, would like to thank you for joining.

	Best wishes
	shraddhey
</cfmail>
 
 
 
 <table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</table>
 
</body> 
</html>

