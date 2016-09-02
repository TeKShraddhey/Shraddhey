

<div id="left">
	<cfoutput>
	<form name="frmFilters" id="frmFilters" method="post" action="index.cfm">
	
	</cfoutput>
		<div id="formArea">	
			<div id="mocFltrSearch" >					
				<div id="MocNumDiv" class="textField">
				<span class="notranslate"><cfoutput>MOC Number:</cfoutput></span>
	
                </div>
                		<div id="StatusDiv" class="textField">
				<span class="notranslate"><cfoutput>MOC Status:</cfoutput></span>
				<cfoutput><select id="mocStatus" >
                    	<option value="All"  >All</option>
                        <option value="Cancelled"  >Cancelled</option>
                         <option value="Closed"  >Closed</option>  
                         <option value="Not Submitted"  >Not Submitted</option>  
                        <option value="Open"  >Open</option>                                            
                    </select></cfoutput>
                    </div>
                  
</form>
</div>