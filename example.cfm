<!doctype html>
<html>
<head>
<h3>Example A: Let the instruction complete itself</h3> 

<cfset myVariable = 3> 

<cfloop from = "1" to = "4" index = "Counter"> 
    <cfset myVariable = myVariable + 1> 
</cfloop> 
 
<cfoutput> 
<p>The value of myVariable after incrementing through the loop #Counter# times is: 
    #myVariable#</p> 
</cfoutput> 
 
<h3>Example B: Use cfabort to halt the instructions with showmessage attribute and 
    cferror</h3> 

<cfset myVariable = 3> 

<cfloop from = "1" to = "4" index = "Counter"> 

    <cfif Counter is 2> 
     
        
        <cfabort showerror="CFABORT has been called for no good reason"> 


    <cfelse> 
        <cfset myVariable = myVariable + 1> 
    </cfif>  
</cfloop> 
 
<cfoutput> 
<p> The value of myVariable after incrementing through the loop#counter# times is: #myVariable#</p> 
</cfoutput>

</head>
</html>