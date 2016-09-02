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

<cfparam name="url.page" default="1">
<cfset page_links_shown = 5>
<cfset records_per_page = 5>
<cfset start_record = url.page * records_per_page - records_per_page>

<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id
		 
		 
         
</CFQUERY>


<table>
<th>Student_id</th>
<th>Firstname</th>
<th>Lastname</th>
<th>Class</th>
<th>JoiningDate</th>
<th>Telephone</th>
<th>Email</th>
<th>Adress</th>

<cfset total_pages = ceiling(Info.Recordcount / records_per_page)>
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


<cfif url.page EQ 1>
   Prev Page
<cfelse>
   <a href="pages.cfm?page=#url.page-1#">Prev Page</a>
</cfif>


<cfif url.page * records_per_page LT Info.Recordcount>
   <a href="pages.cfm?page=#url.page+1#">Next Page</a>
<cfelse>
   Next Page
</cfif>


<cfparam name="start_page" default="1">
<cfparam name="show_pages" default="#min(page_links_shown,total_pages)#">
<cfif url.page + int(show_pages / 2) - 1 GTE total_pages>
   <cfset start_page = total_pages - show_pages + 1>
<cfelseif url.page + 1 GT show_pages>
   <cfset start_page = url.page - int(show_pages / 2)>
</cfif>

 <cfset end_page = start_page + show_pages - 1>


<cfloop from="#start_page#" to="#end_page#" index="i">
    <cfif url.page EQ i>
       #i#
   <cfelse>
   <a href="?PageIndex=#i-1#&selclassteacher=#records_per_page#">#i#</a>
      
    </cfif>
</cfloop>


<a href="?PageIndex=0&selclassteacher=#records_per_page#"> First Page</a>
<a href="?PageIndex=#i-1#&selclassteacher=#records_per_page#"> Last Page</a>
 


</cfoutput>

