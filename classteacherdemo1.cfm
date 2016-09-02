
<head>
<style>
table {
   width: 100%;
}
table, th, td {
    border: 1px solid black;
}
th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
th
{background-color: #4CAF50;
color:white;
font-family:arial;
}
tr:hover{background-color:#f5f5f5} 
</style>
<heads>
<html>

<html>
<h1>SEARCH DATABASE BY CLASS:</h1>
<table>
<form action="insert1.cfm" method="post" autocomplete="on">
<th>CLASS:</th>
<th><select name= "selclassteacher" id ="selclassteacher">
    <cfloop from="1" to="12" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
</th>

<tr>
<td>&nbsp;</td>
<td ><input type="Submit" value="Submit">&nbsp;</td>
</tr>

 </table>
</form>
 <tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>

 

