<!DOCTYPE html>
<html>
<head>
<style>
</style>
<h4>Hold on a sec!!</h4>
<form action="filter.cfm" method="post" autocomplete="on">
 
  
  NO. OF RECORDS PER PAGE:<br>
  <select name= "selclassteacher" id ="selclassteacher">
    <cfloop from="1" to="50" index="i">
	<option value = <cfoutput>#i#</cfoutput> ><cfoutput>#i#</cfoutput></option>
	</cfloop>
	
  <input type="submit" value="Submit">
  <br>
  <input type="button" onClick="location.href='shraddhey.html?'" value='click here to visit home page'></td>
</form>
















