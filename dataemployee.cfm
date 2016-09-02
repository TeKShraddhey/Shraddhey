<CFQUERY NAME="GetEmployee" DATASOURCE="test_1">
        SELECT *
        FROM employee
        RIGHT JOIN EmployeeContact
        ON employee.teacherid=EmployeeContact.teacherid;
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

<th>Teacherid</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Departmentid</th>
<th>Start date</th>
<th>class</th>
<th>Salary</th>
<th>Telephone</th>
<th>Email</th>
<th>Address</th>


<CFLOOP QUERY="GetEmployee" endrow="1000000">
 <cfoutput>
<TR>
    <TD>#teacherid#</TD>
    <TD>#FirstName#</TD>
	<TD>#LastName#</TD>
    <TD>#Dept_ID#</TD>
	<TD>#StartDate#</TD>
	<TD>#class#</TD>
    <TD>#Salary#</TD>
	<TD>#telephone#</TD>
	<TD>#email#</TD>
	<TD>#address#</TD>
</TR> 

</cfoutput>
 </cfloop>
 </table>
<tr>
<td>&nbsp;</td>
<td><input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</tr>



