<!DOCTYPE html>
<html>
<body>

<CFQUERY NAME="Info" DATASOURCE="test_1" >
         
		SELECT *
        FROM student1
        RIGHT JOIN StudentContact1
         ON student1.student_id=StudentContact1.student_id
		 where FirstName LIKE  '#form.FirstName#%' AND    LastName LIKE '#form.LastName#%' 
		       
</CFQUERY>	
 

<h1>RESULTS </h1>


<cfform>

	<cfgrid  format="html"
	          name="artGridverticaltal"
			 
	         selectmode="row">
	        <cfgridcolumn   header="Property"
	                        
	                        name="Field"
	                        width="200">
	        <cfgridcolumn   header="Value"
	                        
	                        name="Value"
	                        width="200">
	        <cfoutput query="Info">
			    
	            <cfgridrow  data="FirstName,#FirstName#">
	            <cfgridrow  data="LastName,#LastName#">
				<cfgridrow  data="Student_id,#Student_id#">
	            <cfgridrow  data="class,#class#">
	            <cfgridrow  data="JoiningDate,#JoiningDate#">
	            <cfgridrow  data="telephone,#telephone#">
	            <cfgridrow  data="email,#email#">
	            <cfgridrow  data="address,#address#">
	            
	        </cfoutput>
	</cfgrid>
</cfform>
</body>
</html>