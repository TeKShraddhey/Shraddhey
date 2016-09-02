<!DOCTYPE html>
<html>
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

#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}

#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}

#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>
</head>
<body>

<div id="header">
<h1>FILTER PAGE</h1>
</div>

<div id="section">

<cfif #form.class# eq "NONE">

<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
        ON student1.student_id=StudentContact1.student_id;
		
</CFQUERY>

<cfquery dbtype="query" name="in">
select *
from Info 
where FirstName LIKE  '#form.FirstName#%' AND    LastName LIKE '#form.LastName#%' 

</cfquery>

<table>
<th>Student_id</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Class</th>
<th>JoiningDate</th>
<th>Telephone</th>
<th>Email</th>
<th>Adress</th>

<CFLOOP QUERY="in" >
 <cfoutput>
<TR>
    
	<TD>#Student_id#</TD>
	<TD>#FirstName#</TD>
	<TD>#LastName#</TD>
	<TD>#class#</TD>
    <TD>#JoiningDate#</TD>
	<TD>#Telephone#</TD>
	<TD>#Email#</TD>
	<TD>#Address#</TD>
</TR> 
</cfoutput>
 </cfloop>
 
 </table>






<cfelseif  #form.class# eq "1">

<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
        ON student1.student_id=StudentContact1.student_id;
		
</CFQUERY>

<cfquery dbtype="query" name="in">
select *
from Info 
where FirstName LIKE  '#form.FirstName#%' AND LastName LIKE '#form.LastName#%' AND class LIKE '#form.class#'

</cfquery>

<table>
<th>Student_id</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Class</th>
<th>JoiningDate</th>
<th>Telephone</th>
<th>Email</th>
<th>Adress</th>

<CFLOOP QUERY="in" >
 <cfoutput>
<TR>
    
	<TD>#Student_id#</TD>
	<TD>#FirstName#</TD>
	<TD>#LastName#</TD>
	<TD>#class#</TD>
    <TD>#JoiningDate#</TD>
	<TD>#Telephone#</TD>
	<TD>#Email#</TD>
	<TD>#Address#</TD>
</TR> 
</cfoutput>
 </cfloop>
 </table>







<cfelse>
<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
        ON student1.student_id=StudentContact1.student_id;
		
</CFQUERY>

<cfquery dbtype="query" name="in">
select *
from Info 
where FirstName LIKE  '#form.FirstName#%' AND LastName LIKE '#form.LastName#%' AND class LIKE '#form.class#%' 

</cfquery>

<table>
<th>Student_id</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Class</th>
<th>JoiningDate</th>
<th>Telephone</th>
<th>Email</th>
<th>Adress</th>

<CFLOOP QUERY="in" >
 <cfoutput>
<TR>
    
	<TD>#Student_id#</TD>
	<TD>#FirstName#</TD>
	<TD>#LastName#</TD>
	<TD>#class#</TD>
    <TD>#JoiningDate#</TD>
	<TD>#Telephone#</TD>
	<TD>#Email#</TD>
	<TD>#Address#</TD>
</TR> 
</cfoutput>
 </cfloop>
 </table>




</cfif>


 
 
<form action="testfilter.cfm" method="post" autocomplete="on">
 
  
  NO. OF RECORDS PER PAGE:<br>
  <select name= "selclassteacher" id ="selclassteacher">
    <cfloop from="1" to="50" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	
  <input type="submit" value="Submit">
  <br>
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
  <cfoutput>
  <input type ="hidden"  name = "FirstName" value= "#form.FirstName#">
  </cfoutput>
  <cfoutput>
  <input type ="hidden"  name = "LastName" value= "#form.LastName#">
  </cfoutput>
  <cfoutput>
  <input type ="hidden"  name = "class" value= "#form.class#">
  </cfoutput>
</form>

 </div>
 <div id="footer">
Copyright © 
</div>

</body>
</html>
