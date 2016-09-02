 
 <cfcomponent>

 
 
 
 
                      <cffunction name="getCourses"  returntype="Struct" access="remote" output="false">
                       <cfargument name="pageSize" default="30" required="true" type="numeric"  />
						<cfargument name="pageNo" default="5"required="true" type="numeric"  />
						<cfargument name="gridsortcolumn" default="Student_id"required="true" type="string"  />
						<cfargument name="gridsortdirection" default="" required="true" type="string" hint="Sort Order" />
					<cfset local.getCourses = queryNew("") />
								<cftry>
						<CFQUERY NAME="local.getCourses" DATASOURCE="test_1" >
         
								SELECT *
								FROM student1
								RIGHT JOIN StudentContact1
								ON student1.student_id=StudentContact1.student_id
		 
		 
         
						</CFQUERY>


							<cfreturn QueryConvertForGrid(local.getCourses, arguments.pageNo, arguments.pageSize) />
					<cfcatch>

					<cfdump var="local.getCourses">
					</cfcatch>
					</cftry>
					</cffunction>





							<cffunction name="getCourses1"  returntype="Struct" access="remote" output="false">
								<cfargument name="pageSize" default="30" required="true" type="numeric"  />
								<cfargument name="pageNo" default="5"required="true" type="numeric"  />
								<cfargument name="gridsortcolumn" default="Student_id"required="true" type="string"  />
								<cfargument name="gridsortdirection" default="" required="true" type="string" hint="Sort Order" />
								<cfset local.getCourses1 = queryNew("") />


						<cftry>

						<CFQUERY NAME="local.getCourses1" DATASOURCE="test_1" >
         
							SELECT *
							FROM student1
							RIGHT JOIN StudentContact1
							ON student1.student_id=StudentContact1.student_id
		
						</CFQUERY>

						<cfreturn QueryConvertForGrid(local.getCourses1, arguments.pageNo, arguments.pageSize) />
							<cfcatch>

						<cfdump var="local.getCourses1">
							</cfcatch>
							</cftry>
						</cffunction>








									<cffunction name="getEmp" access="remote"> 
									<cfargument name="LastName" required="true"> 
									<cfargument name="FirstName" required="true">
									<cfargument name="class" required="true">
		
									<cfargument name="JoiningDate" required="true">
									<cfset var empQuery="">
									<cfif #form.class# eq "NONE">
										<cfquery name="empQuery" datasource="test_1"> 
										SELECT *
										FROM student1
										RIGHT JOIN StudentContact1
										ON student1.student_id=StudentContact1.student_id
										WHERE FirstName Like  '#arguments.FirstName#%'   AND   LastName LIKE '#arguments.LastName#%'
										AND JoiningDate >= '<cfoutput>#dateformat(arguments.JoiningDate,"yyyy-mm-dd")#</cfoutput>'
								</cfquery>
							<cfelse>		
										<cfquery name="empQuery" datasource="test_1"> 
										SELECT *
										FROM student1
										RIGHT JOIN StudentContact1
										ON student1.student_id=StudentContact1.student_id
										WHERE FirstName Like  '#arguments.FirstName#%'   AND   LastName LIKE '#arguments.LastName#%'
										AND class LIKE '#arguments.class#' AND JoiningDate >= '<cfoutput>#dateformat(arguments.JoiningDate,"yyyy-mm-dd")#</cfoutput>'
								</cfquery>	  
								</cfif>
         
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
</div>		 
</div>	
<div id="nav">
   
<form name="frm" action="newfilter.cfm" method="post" autocomplete="on">
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
   
  <input type="hidden" name="pageIndex" id="pageIndex" value="">
  
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
  
  
  
</form>

</div>
	 
<div id = "section">		 
<cfparam name="url.pageSize" default="5">
<cfform name="logForm">
<cfgrid format="html" name="courseGrid" 
query="empQuery"
 selectmode="row" 
 height="580" 
 width="1000"
>
<cfgridcolumn name="Student_id" width="80" header="Student_id " headerbold="true" />
<cfgridcolumn name="FirstName" width="100" header="FirstName " headerbold="true" />
<cfgridcolumn name="LastName" width="100" header="LastName" headerbold="true" />
<cfgridcolumn name="class" width="50" header="class" headerbold="true" />
<cfgridcolumn name="JoiningDate" width="100" header="JoiningDate" headerbold="true" />
<cfgridcolumn name="telephone" width="150" header="telephone" headerbold="true" />
<cfgridcolumn name="email" width="180" header="emial" headerbold="true" />
<cfgridcolumn name="address" width="100" header="address" headerbold="true" />
</cfgrid>
</cfform>		 
</cffunction> 
</div>


</cfcomponent>