<CFQUERY NAME="Info" DATASOURCE="test_1">
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id;
         
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

<th>student id</th>
<th>firstname</th>
<th>lastname</th>
<th>joining date</th>
<th>telephone</th>
<th>email</th>
<th>address</th>


<CFLOOP QUERY="Info" endrow="1000000">
 <cfoutput>
<TR>
    <TD>#student_id#</TD>
    <TD>#firstname#</TD>
	<TD>#lastname#</TD>
	<TD>#JoiningDate#</TD> 
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







<h3>ValueList Example</h3> 
 

<cfquery name = "GetDepartments" datasource = "test_1"> 
    SELECT * FROM student1
   
</cfquery> 

 <cfset temp=ValueList(GetDepartments.FirstName)>
<cfoutput> 
#ValueList(GetDepartments.FirstName,"--")#<br>  
</cfoutput> 
<p>original list is</p>
<cfoutput>#temp#</cfoutput>

<cfset array=ListToArray(temp)>
<cfoutput>#Arraylen(array)#</cfoutput>
<p>/br></p>








<cffunction name="getDescription"> 
    <cfargument name="id" type="numeric" required="true"> 
    <cfquery name="Description" datasource="test_1"> 
        SELECT FirstName FROM student1 
        WHERE Student_id = '#id#' 
    </cfquery> 
    <cfreturn Description.FirstName> 
</cffunction>

<cfoutput>#getDescription(90000)#</cfoutput>