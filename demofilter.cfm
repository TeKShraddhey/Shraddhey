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

</div>

<div id="section">



<cfparam name="url.page" default="1">
<cfset page_links_shown = 5>
<cfset records_per_page = 5>
<cfset start_record = url.page * records_per_page - records_per_page>
<cfquery name="get_count" datasource="test_1">
   SELECT COUNT(Student_id) AS records FROM student1
</cfquery>
<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id;
		  
         
</CFQUERY>
<cfset total_pages = ceiling(get_count.records / records_per_page)>
<cfoutput>

<hr>

<cfif url.page EQ 1>
   Prev Page
<cfelse>
   <a href="pages.cfm?page=#url.page-1#">Prev Page</a>
</cfif>
<hr>
<cfif url.page * records_per_page LT get_count.records>
   <a href="pages.cfm?page=#url.page+1#">Next Page</a>
<cfelse>
   Next Page
</cfif>
<hr>
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
       <a href="pages.cfm?page=#i#">#i#</a>	
    </cfif>
</cfloop>
<hr>
 <a href="pages.cfm?page=1">First Page</a>
<hr>
 <a href="pages.cfm?page=#total_pages#">Last Page</a>
<hr>
</cfoutput>



</div>

<div id="footer">
Copyright © 
</div>

</body>
</html>
