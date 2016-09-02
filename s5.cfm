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
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:500px;
    width:200px;
    float:left;
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

<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id
		order by FirstName desc;
</CFQUERY>


<table>
<th>student id  <a href="SORT1.CFM">
  <img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" >
</a> 
</th>
<th>firstname  <a href="S1.CFM"><img src="" ALT="&#8593;" style="width:42px;height:42px;border:0" ></th>
<th>lastname  <a href="SORT1.CFM"><img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" ></th>
<th>joining date</th>
<th>telephone </th>
<th>email</th>
<th>class </th>
<th>address</th>

</tr>

<cfoutput>
   <cfloop query="Info">
  
      <tr>
          <TD>#student_id#</TD>
          <TD>#firstname#</TD>
	      <TD>#lastname#</TD>
	      <TD>#JoiningDate#</TD> 
	      <TD>#telephone#</TD>
	      <TD>#email#</TD>
	      <TD>#class#</TD>
	      <TD>#address#</TD>
      </tr>
   
   
      
  
   </cfloop>
</cfoutput>

 
</table>
<input type="button" onClick="location.href='filter.cfm?'" value='Filter page'>
</div>

<div id="footer">
Copyright © 
</div>

</body>
</html>
