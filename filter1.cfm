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

<div id="nav">
   
<form action="resultfilter.cfm" method="post" autocomplete="on">

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
	
   <br>
	 
	
	
  <input type="submit" value="Submit">
  <br>
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


<cfif isDefined("form.selclassteacher")>
<cfset RecordsPerPage = #form.selclassteacher# >
<cfelse>
<cfset RecordsPerPage = #URL.selclassteacher# >
</cfif>
<cfset TotalPages = (Info.Recordcount/RecordsPerPage)>
<cfset StartRow = (URL.PageIndex*RecordsPerPage)+1>
<cfset EndRow = StartRow+RecordsPerPage-1>

<table>
<tr>
<th>student id <a href="s3.cfm" target="_parent">&#8609;</a> <a href="s4.cfm" target="_parent">&#8607;</a></</th>
<th>firstname <a href="s1.cfm" target="_parent">&#8609;</a> <a href="s5.cfm" target="_parent">&#8607;</a></th>
<th>lastname <a href="s2.cfm" target="_parent">&#8609;</a> <a href="s6.cfm" target="_parent">&#8607;</a></th>
<th>joining date</th>
<th>telephone </th>
<th>email</th>
<th>class <a href="s7.cfm" target="_parent">&#8609;</a> <a href="s8.cfm" target="_parent">&#8607;</a></th>
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
 <cfif (#Info.Recordcount# % #RecordsPerPage#) eq 0>
      <td colspan="8"> Showing Records From Page:
      <cfloop index="Pages" from="0" to="#TotalPages-1#">
      <cfoutput>
         
         <cfset DisplayPgNo = Pages+1>
        
         <cfif URL.PageIndex eq pages>
            <strong>#DisplayPgNo#</strong>
         <cfelse>
            <cfoutput>#DisplayPgNo#</cfoutput>
         </cfif>
         
      </cfoutput>
      </cfloop>
	  
      </td>
	  </cfif>
   </tr>

   
   <tr> 
 <cfif (#Info.Recordcount# % #RecordsPerPage#) neq 0 >
      <td colspan="8"> Showing Records From Page:
      <cfloop index="Pages" from="0" to="#TotalPages#">
      <cfoutput>
         
         <cfset DisplayPgNo = Pages+1>
        
         <cfif URL.PageIndex eq pages>
            <strong>#DisplayPgNo#</strong>
         <cfelse>
            <cfoutput>#DisplayPgNo#</cfoutput>
         </cfif>
         
      </cfoutput>
      </cfloop>
	  
      </td>
	  </cfif>
   </tr>

   
   </table>
   
 
<cfif (#Info.Recordcount# % #RecordsPerPage#) neq 0>
<cfset intPagesToLinkTo =(#Info.Recordcount# / #RecordsPerPage#)+1>
<cfelse>
<cfset intPagesToLinkTo =(#Info.Recordcount# / #RecordsPerPage#)>
</cfif>
<cfset intItemsPerPage = #RecordsPerPage#>

<cfset intNumberOfTotalItems = 100>

<cfif isdefined("url.page")>
  <cfset intCurrentPage = val(url.page)>
<cfelse>
  <cfset intCurrentPage = 1>
</cfif>
<cfset intMaxLinkToShow = ceiling(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo>
<cfset intMinLinkToShow = (int(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo)+1>
<cfif intMaxLinkToShow eq (int(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo)>
  <cfset intMinLinkToShow = intMaxLinkToShow - (intPagesToLinkTo - 1)>
</cfif>
<cfif intMaxLinkToShow gt intNumberOfTotalItems / intItemsPerPage>
  <cfset intMaxLinkToShow = ceiling(intNumberOfTotalItems / intItemsPerPage)>
</cfif>
<cfif intMaxLinkToShow - intPagesToLinkTo LTE 0>
  <cfset boolShowBackButton = 0>
<cfelse>
  <cfset boolShowBackButton = 1>
</cfif>
<cfif ceiling(intNumberOfTotalItems / intItemsPerPage) lte intMaxLinkToShow>
  <cfset boolShowForwardButton = 0>
<cfelse>
  <cfset boolShowForwardButton = 1>
</cfif>
<cfset intMinItemsToShow = (intItemsPerPage * (intCurrentPage - 1))+ 1>
<cfset intMaxItemsToShow = intMinItemsToShow + intItemsPerPage - 1>
<cfif intMaxItemsToShow gt intNumberOfTotalItems>
  <cfset intMaxItemsToShow = intNumberOfTotalItems>
</cfif>



<div style="clear:both; margin-top:10px;">
 
  <cfloop from="#variables.intMinLinkToShow#" to="#variables.intMaxLinkToShow#" index="i">
    <div style="float:left;font-weight:bold;margin:5px;padding:5px;border:1px solid black;">
      <cfoutput>
        <cfif intCurrentPage eq i>
         <a href="?PageIndex=0&selclassteacher=#RecordsPerPage#">#i#</a>
        <cfelse>
		  <a href="?PageIndex=#i-1#&selclassteacher=#RecordsPerPage#">#i#</a>
          
        </cfif>
      </cfoutput>
    </div>
  </cfloop>
 
</div>
<div style="clear:both;"></div>


<form action="filter1.cfm" method="post" autocomplete="on">
 
  
  NO. OF RECORDS PER PAGE:<br>
  <select name= "selclassteacher" id ="selclassteacher">
    <cfloop from="1" to="50" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	
  <input type="submit" value="Submit">
  <br>
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</form>

</div>



</body>
</html>
