<CFQUERY NAME="GetInfo" DATASOURCE="test_1">
         SELECT FirstName,LastName ,classteacher
         FROM student 
         order by classteacher asc		 
</CFQUERY>


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

<table>

<th>CLASS TEACHER</th>
<th>STUDENT FIRSTNAME</th>
<th>STUDENT LASTNAME</th>



<CFLOOP QUERY="GetInfo" endrow="1000000">
 <cfoutput>
<TR>
    <TD>#classteacher#</TD>
    <TD>#FirstName#</TD>
	<TD>#LastName#</TD>
</cfoutput>
 
 </cfloop>
 </table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>





