

<cfsetting enablecfoutputonly="Yes"> 
 

<cfquery name="GetEmps" datasource="test_1"> 
    SELECT * FROM student1 
</cfquery> 
 
 
<cfcontent type="application/msexcel"> 
 
 
 

<cfheader name="Content-Disposition" value="filename=Employees.xls"> 
 

<cfoutput> 
    <table >
<tr>
<td>Student_id</td>
<td>FirstName</td>
<td>LastName</td>
<td>Class</td>	  
</td> 
        <cfloop query="GetEmps"> 
            <tr> 
                <td>#Student_id#</td> 
                <td>#FirstName#</td> 
                <td>#LastName#</td> 
				<td>#Class#</td>
            </tr> 
        </cfloop> 
    </table> 
</cfoutput>
