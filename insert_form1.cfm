<html>
<head>
<title>Insert Data Form</title>
 <meta charset="utf-8" />
 
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
<style>
#nav {
    
    line-height:30px;
    background-color:#eeeeee;
    height:200px;
    width:450px;
    float:left;
    padding:5px;	      
}
</style>
</head>

<body>
<h2>Insert Data Form : STUDENT</h2>

<table>
<form action="insert_actionStudent.cfm" method="post" autocomplete="on">

<tr>
<td>FirstName:</td>
<td><input type="Text" name="FIRSTNAME" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>LastName:</td>
<td><input type="Text" name="LastName" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>JoiningDate:</td>
<td><input type="Text" id="datepicker" name="JoiningDate" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>Class</td>
<td><input type="text" name="class" size="25" maxlength="25" required>
</tr>

<td>&nbsp;</td>
<td><input type="Submit" value="Submit">&nbsp;
<input type="Reset" value="Clear Form"></td>
</tr>

</form>
</table>

<table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>
</table>
</div>



</body>
</html>