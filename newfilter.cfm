<!DOCTYPE html>
<html>
<head>
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
    width:220px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
</style>
</head>
<body>
<div id="header">
<h1>FILTER PAGE</h1>
</div>
<div id="nav">   
<form action="cfgrid.cfc" method="post" autocomplete="on">
  From Date :
  <input type="Text" id="datepicker" name="JoiningDate" size="25" maxlength="25" >
  First name:<br>
  <input type="text" name="FirstName" > 
     
 <br>
  Last name:<br>
  <input type="text" name="LastName" >
  <br>
  <br>
  Class:
   <select name= "class" id ="class">
    <option value = "NONE" default >NONE</option>
	<cfloop from="1" to="12" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	<br>
    <input type="submit" value="Submit">
    <br>
    
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
<input type="Hidden" name="method" value="getEmp"> 
 </form>
</div>
<div id="section">
<cfparam name="url.pageSize" default="5">
<cfform name="logForm">
<cfgrid format="html" name="courseGrid" 
pagesize="#url.pageSize#"
 selectmode="row" 
 height="280" 
 width="1000"
bind="cfc:cfgrid.getCourses({cfgridpagesize},{cfgridpage},{cfgridsortcolumn},{cfgridsortdirection})">
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
</div>
</body>
</html>
