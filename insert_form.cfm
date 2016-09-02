<html>
<head>
  <head>
  <meta charset="utf-8" />
 
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>


</head>
<title>Insert Data Form</title>
<style>
#nav {
    
    line-height:30px;
    background-color:#eeeeee;
    height:200px;
    width:250px;
    float:left;
    padding:5px;	      
}
</style>
</head>
<body>
<h2>Insert Data Form :EMPLOYEE</h2>

<table>
<form action="insert_action.cfm" method="post" autocomplete="on" >

<tr>
<td>First Name:</td>
<td><input type="Text" name="FirstName" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>Last Name:</td>
<td><input type="Text" name="LastName" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>Department Number:</td>
<td><select name="Dept_ID">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
  </select></td>
</tr>
<tr>
<td>Start Date:</td>
<td><input type="Text"  id="datepicker" name="StartDate" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>Class:</td>
<td><input type="Text" name="Class" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>Salary:</td>
<td><input type="Text" name="Salary" size="25" maxlength="25" required></td>
</tr>

<tr>
<td>&nbsp;</td>
<td><input type="Submit" value="Submit">&nbsp;<input type="Reset"
value="Clear Form"></td>
</tr>

</form>
</table>

<div id="nav"> 
<pre>
departmen no.   department name.
         1       SCIENCE
         2       COMMERCE
	 3       HINDI
         4       ENGLISH
		  
</pre>
<br>
<table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</table>
</div>

</body>
</html>