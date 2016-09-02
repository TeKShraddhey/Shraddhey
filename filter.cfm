<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="table.css">


 <meta charset="utf-8" />
 
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
<style>


</style>






</head>
<body>

<div id="header">
<h1>FILTER PAGE</h1>
</div>

<div id="nav">
   
<form action="http://localhost:8500/bmi/index.cfm?event=resultfilter" method="post" autocomplete="on">
  From Date :
  <input type="Text" id="datepicker" name="JoiningDate" size="25" maxlength="25" >

  First name:<br>
  <input type="text" name="FirstName" >
 
  <br>
  Last name:<br>
  <input type="text" name="LastName" >

  <br>
  Class:
   <select name= "class" id ="class">
    <option value = "NONE" default >NONE</option>
	<cfloop from="1" to="12" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	<br>
    <input type="submit"  value=Submit">
    <br>
    No Of Records Per Page:
    <select name= "records" id ="records">
    <option value = "5" default >5</option>
	<cfloop from="1" to="50" index="i">
	<cfif i eq "5">
	<cfcontinue>
	</cfif>
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
  
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
  
  
  
</form>
</div>






<div id="section">
<cfparam name="URL.PageIndex" default="0">
<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id
		 
		 
         
</CFQUERY>



<cfset RecordsPerPage = 3 >

<cfif (Info.Recordcount%RecordsPerPage) eq 0>
<cfset TotalPages = (Info.Recordcount/RecordsPerPage)>
<cfset StartRow = (URL.PageIndex*RecordsPerPage)+1>
<cfset EndRow = StartRow+RecordsPerPage-1>

<table>
<tr>

<th>student id  <a href="SORT1.CFM">
  <img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" >
</a> 
</th>
<th>firstname  <a href="S1.CFM"><img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" ></th>
<th>lastname  <a href="S2.CFM"><img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" ></th>
<th>joining date</th>
<th>telephone </th>
<th>email</th>
<th>class </th>
<th>address</th>

</tr>

<cfoutput>
   <cfloop query="Info">
   <cfif CurrentRow gte StartRow >
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
   </cfif>
   <cfif CurrentRow eq EndRow>
      <cfbreak>
   </cfif>
   </cfloop>
</cfoutput>


<tr>
      <td colspan="10">
	  Showing page :
      <cfloop index="Pages" from="0" to="#TotalPages-1#">
      <cfoutput>
          
         <cfset DisplayPgNo = Pages+1>
        
         <cfif URL.PageIndex eq pages>
            <strong>#DisplayPgNo#</strong>
         <cfelse>
            #DisplayPgNo#
         </cfif>
         |
      </cfoutput>
      </cfloop>
      </td>
   </tr>



  </table>
   
   <cfelse>
   <cfset TotalPages = (Info.Recordcount/RecordsPerPage)>
<cfset StartRow = (URL.PageIndex*RecordsPerPage)+1>
<cfset EndRow = StartRow+RecordsPerPage-1>

<table>
<tr>

<th>student id  <a href="SORT1.CFM">
  <img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" >
</a> 
</th>
<th>firstname  <a href="S1.CFM"><img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" ></th>
<th>lastname  <a href="S2.CFM"><img src="" ALT="&#8595;" style="width:42px;height:42px;border:0" ></th>
<th>joining date</th>
<th>telephone </th>
<th>email</th>
<th>class </th>
<th>address</th>

</tr>

<cfoutput>
   <cfloop query="Info">
   <cfif CurrentRow gte StartRow >
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
   </cfif>
   <cfif CurrentRow eq EndRow>
      <cfbreak>
   </cfif>
   </cfloop>
</cfoutput>


<tr>
      <td colspan="10">
	  Showing page :
      <cfloop index="Pages" from="0" to="#TotalPages#">
      <cfoutput>
          
         <cfset DisplayPgNo = Pages+1>
        
         <cfif URL.PageIndex eq pages>
            <strong>#DisplayPgNo#</strong>
         <cfelse>
            #DisplayPgNo#
         </cfif>
         |
      </cfoutput>
      </cfloop>
      </td>
   </tr>



  </table>
   </cfif>
   
 <cfinvoke component="pagination"  method="pagination"> 
 <cfinvokeargument name="num" value="#RecordsPerPage#">
 <cfinvokeargument name="Info"  value="#Info#">
</cfinvoke>  

</div>



</body>
</html>
