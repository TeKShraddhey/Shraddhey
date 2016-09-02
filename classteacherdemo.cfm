
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
<h1>SEARCH DATABASE BY TEACHER NAME:</h1>
<table>
<form action="insert1.cfm" method="post" autocomplete="on">
<cfquery name=getalltecahers datasource=test_1>
 select teacherid, FirstName, LastName 
 from employee
</cfquery>


<th>CLASS TEACHER</th>
 
<th><select name= "selclassteacher" id ="selclassteacher">
    <cfloop query=getalltecahers>
	<option value = <cfoutput>#teacherid#</cfoutput> ><cfoutput>#FirstName# #LastName#</cfoutput></option>
	</cfloop>
</th>

<tr>

<td colspan="2"><input type="Submit" value="Submit">&nbsp;</td>
</tr>

 </table>
</form>
 <tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>

 

