
<cfset myQuery = QueryNew("Name, Time, Advanced", "VarChar, Time, Bit")> 
 

<cfset newRow = QueryAddRow(MyQuery, 2)> 
 

<cfset temp = QuerySetCell(myQuery, "Name", "The Wonderful World of CMFL", 1)> 
<cfset temp = QuerySetCell(myQuery, "Time", "9:15 AM", 1)> 
<cfset temp = QuerySetCell(myQuery, "Advanced", False, 1)> 
<cfset temp = QuerySetCell(myQuery, "Name", "CFCs for Enterprise Applications", 2)> 
<cfset temp = QuerySetCell(myQuery, "Time", "12:15 PM", 2)> 
<cfset temp = QuerySetCell(myQuery, "Advanced", True, 2)> 
 
<h4>The query object contents</h4> 
<cfoutput query = "myQuery"> 
    #Name# #Time# #Advanced#<br> 
</cfoutput><br> 
<br> 
<h4>Using individual query data values</h4> 
<cfoutput> 
    #MyQuery.name[2]# is at #MyQuery.Time[2]#<br> 
</cfoutput><br> 
<br> 
<h4>The query metadata</h4> 
<cfset querymetadata=getMetaData(myQuery)> 
<cfdump var="#querymetadata#">