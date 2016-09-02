 <!doctype html>
<html>
<body>
<script>
function call() {
    alert("The form was submitted");
}
</script>
</body>
<head>
<table>
<form action="login.cfm" method="post" autocomplete="on" onsubmit="call()">
<tr>
<td>User Name</td>
<td><input type="text" name="username" size="25" maxlength="25"  required autofocus></td>
<tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password" size="25" maxlength="25" required></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="Submit" value="Submit">&nbsp;<input type="Reset"
value="Clear Form"></td>
</tr>
</head>
</html>