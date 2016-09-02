<html>
<head>
<title>Insert Data Form</title>
</head>

<body>
<h2>CONTACT DETAILS OF STUDENT:<h2>

<table>
<form action="insert_actionSTUDENTCONTACT.cfm" method="post" autocomplete="on">
<tr>
<td>Student_id</td>
<td><input type="text" name="Student_id" size="25" maxlength="25"  required autofocus></td>
<tr>
<tr>
<td>TELEPHONE:</td>
<td><input type="tel" name="telephone" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>EMAIL:</td>
<td><input type="email" name="email" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>ADDRESS</td>
<td><input type="Text" name="ADDRESS" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="Submit" value="Submit">&nbsp;<input type="Reset"
value="Clear Form"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</form>
<!--- end html form --->
</table>

</body>
</html>