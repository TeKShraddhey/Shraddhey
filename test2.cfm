<cfoutput> this is a test page </cfoutput>

<cfquery name="testqry" datasource ="test_1">
	select * from Table_1
</cfquery>

<table>
	<tr>
		<th>id</th>
		<th>name</th>
		<th>age</th>
		<th>city</th>
		<th>state</th>
		
	</tr>
	
<cfoutput query="testqry">
	<tr>
		<td>#id#</td>
		<td>#name#</td>
		<td>#age#</td>
		<td>#city#</td>
		<td>#state#</td>
	</tr>
	</table>
</cfoutput>
<tr>
