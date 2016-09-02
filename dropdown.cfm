<cfform name = "form1" action="formB.cfm" method="Post"> 
<table style="width :50%">
<tr >
<td >
LocationName:<cfselect name="LocationName" tooltip="Location" bindOnLoad="Yes" bind="cfc:dp1.getStates()" /> 
</td>


<td >
Cell: <cfselect name="cell" tooltip="Cell" bindOnLoad="Yes" bind="cfc:dp1.getCity({LocationName})" /> 
</td>
</tr>
<tr>

<td >
Email:
<cftextarea name="email"  tooltip="email" validate="email" message="enter a valid email" validateat="onSubmit" height="200px" Width="5000px"/> 
</td>

</tr>
<tr>

<td ><cfinput type="submit" name="submit" value="submit"> </tr>
</table>
</cfform> 


