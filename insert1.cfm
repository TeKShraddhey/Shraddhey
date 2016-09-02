
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
<cfquery name="data" datasource="test_1">
SELECT teacher_id
FROM class
where class= #form.selclassteacher#
</cfquery>

<table>
<th>CLASS TEACHER ID</th>

<CFLOOP QUERY="data" >
 <cfoutput>
<TR>
    <TD>#teacher_id#</TD>
</TR> 
</cfoutput>
 </cfloop>
 </table>


 
<CFQUERY NAME="data" DATASOURCE="test_1">
     SELECT FirstName, LastName
     FROM employee
	 where teacherid =   <CFLOOP QUERY="data" >
                         <cfoutput>#teacher_id#</cfoutput></cfloop>
 
</cfquery>

<table>
<th>Class Teacher Firstname</th>
<th>Class Teacher Lastname</th>
<CFLOOP QUERY="data" endrow="1000000">
 <cfoutput>
<TR>
    <TD>#FirstName#</TD>
	<TD>#LastName#</TD>
</TR> 
</cfoutput>
 </cfloop>
 </table>

<CFQUERY NAME="data" DATASOURCE="test_1">
     SELECT Student_id ,FirstName, LastName
     FROM student1
	 where class = #form.selclassteacher#
</cfquery>

<table>
<th>STUDENT ID</th>
<th>Firstname</th>
<th>Lastname</th>
<CFLOOP QUERY="data" endrow="1000000">
 <cfoutput>
<TR>
    <TD>#Student_id#</TD>
    <TD>#FirstName#</TD>
	<TD>#LastName#</TD>
</TR> 
</cfoutput>
 </cfloop>
 </table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>



