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
<script>
function assignVal(a,b){
	document.getElementById('pageIndex').value = a;
	document.frm.submit()
}
</script>
</head>
<body>

<div id="header">
<h1>FILTER PAGE</h1>
</div>


<div id="nav">
   
<form name="frm" action="resultfilter.cfm" method="post" autocomplete="on">
  From Date :
  <input type="Text" id="datepicker" name="JoiningDate" size="25" maxlength="25" value="<cfoutput>#form.JoiningDate#</cfoutput>" >
  
  First name:<br>
  <input type="text" name="FirstName" value="<cfoutput>#form.FirstName#</cfoutput>"  >
 
  <br>
  Last name:<br>
  <input type="text" name="LastName"  value="<cfoutput>#form.LastName#</cfoutput>">

  <br>
  Class:
   <select name= "class" id ="class">
    <option value="<cfoutput>#form.class#</cfoutput>" default ><cfoutput>#form.class#</cfoutput></option>
	<cfloop from="1" to="12" index="i">
	<cfif i eq "<cfoutput>#form.class#</cfoutput>" >
	<cfcontinue>
	</cfif>
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	<br>
    <input type="button" onClick="location.href='newfilter.cfm'" value='GO BACK TO FILTER'></td>
    <br>
    No Of Records Per Page:
    <select name= "records" id ="records">
    <option value="<cfoutput>#form.records#</cfoutput>" default ><cfoutput>#form.records#</cfoutput></option>
	<cfloop from="1" to="50" index="i">
	<cfif i eq "<cfoutput>#form.records#</cfoutput>" >
	<cfcontinue>
	</cfif>
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
  <input type="hidden" name="pageIndex" id="pageIndex" value="">
  
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
  
  
  
</form>

</div>

<div id="section">

<cfif #form.class# eq "NONE">


<cfparam name="url.pageSize" default="10">
<cfform name="logForm">
<cfgrid format="html" name="courseGrid" 
pagesize="#Form.records#"
 selectmode="row" 
 height="280" 
 width="1000"
bind="cfc:cfgrid.getCourses1({cfgridpagesize},{cfgridpage},{cfgridsortcolumn},{cfgridsortdirection})">
<cfgridcolumn name="Student_id" width="100" header="Student_id " headerbold="true" />
<cfgridcolumn name="FirstName" width="180" header="FirstName " headerbold="true" />
<cfgridcolumn name="LastName" width="180" header="LastName" headerbold="true" />
<cfgridcolumn name="class" width="180" header="class" headerbold="true" />
<cfgridcolumn name="JoiningDate" width="180" header="JoiningDate" headerbold="true" />
<cfgridcolumn name="telephone" width="180" header="telephone" headerbold="true" />
<cfgridcolumn name="email" width="180" header="emial" headerbold="true" />
<cfgridcolumn name="address" width="180" header="address" headerbold="true" />
</cfgrid>
</cfform>

<cfelse>



<cfparam name="form.PageIndex" default="0">


   
<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
        ON student1.student_id=StudentContact1.student_id
		 where FirstName LIKE  '#form.FirstName#%' AND    LastName LIKE '#form.LastName#%'  
AND JoiningDate  >= '<cfoutput>#dateformat(form.JoiningDate,"yyyy-mm-dd")#</cfoutput>' AND class LIKE '#form.class#'
</CFQUERY>

<cfquery dbtype="query" name="in">
select *
from Info 
where FirstName LIKE  '#form.FirstName#%' AND LastName LIKE '#form.LastName#%' AND class LIKE '#form.class#' 

</cfquery>



<cfset RecordsPerPage = '#form.records#'>

<cfset TotalPages = (Info.Recordcount/RecordsPerPage)>
<cfset StartRow = (form.PageIndex*RecordsPerPage)+1>
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
      <td colspan="10">
	  Showing page :
      <cfloop index="Pages" from="0" to="#TotalPages#">
      <cfoutput>
          
         <cfset DisplayPgNo = Pages+1>
        
         <cfif form.PageIndex eq pages>
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

 
 

<cfset intPagesToLinkTo =(#Info.Recordcount# / #RecordsPerPage#)+1>

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
 
 
  
  <cfloop from="#variables.intMinLinkToShow#" to="#variables.intMaxLinkToShow#"index="i">
    <div style="float:left;font-weight:bold;margin:5px;padding:5px;border:1px solid black;">
      <cfoutput>
        <cfif intCurrentPage eq i>
         <a href="##" onClick="assignVal(0,#intItemsPerPage#);">#i#</a>
        <cfelse>
		  <a href="##" onClick="assignVal(#i-1#,#intItemsPerPage#);">#i#</a>
          
        </cfif>
      </cfoutput>
    </div>
  </cfloop>
 
 
</div>
<div style="clear:both;"></div>





<div style="clear:both;"></div>
   
   
 </br>



 
 
 
 


</cfif>



 </div>
 

</body>
</html>
