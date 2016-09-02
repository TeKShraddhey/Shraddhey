<html> 
<head> <title>Input form</title> </head> 
 
<body> 

<cfinsert datasource="test_1" tablename="StudentContact1"> 
 
<h1>STUDENT CONTACT DETAILS ADDED</h1> 
<cfoutput> You have added details to the student contact database. 
</cfoutput> 


<cfmail to="#form.email#"
	from="shraddheyp@gmail.com"
	subject="Welcome to School"
	type="text"
	server="HSC-342Z6BS">
	Dear #form.Student_id#

	We, here at schoolhouse, would like to thank you for joining.

	Best wishes
	shraddhey
</cfmail>
<cfoutput>
    <p>Thank you  for registering.
    We have just sent you an email.</p>
</cfoutput>
 <table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</table>
</body> 
</html>