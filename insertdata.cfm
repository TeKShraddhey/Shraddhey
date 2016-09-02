<html> 
<head><title>Input form</title> </head> 
<body> 

<cfquery name = "data" datasource="test_1">
insert into class(class, teacher_id)
values (#form.class# , #form.teacherid#)
</cfquery>
<h1>Classteacher Added</h1> 
<p> You have added data to the classteacher database. 
</p> </br>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr> 
</body> 
</html>