<cfoutput> this is a test page </cfoutput>

<cfquery name="testqry" datasource ="test_1">
	select * from shraddheytable
</cfquery>

<table>
	<tr>
		<td>fname</td>
		<td>lname</td
		<td>middlenmae</td
		<td>city</td
		<td>state</td
	</tr>
	
<cfoutput query="testqry">
	<tr>
		<td>#fname#</td>
		<td>#lname#</td
		<td>#middlenmae#</td
		<td>#city#</td
		<td>#state#</td
	</tr>
</cfoutput>