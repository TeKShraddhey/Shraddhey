
<!doctype html>
<html>
<head> 

<cfset x=#username#>
<cfset y=#password#>
<cfif x eq "shraddhey" AND password eq "manage12345">
<a href="shraddhey.html" target="_parent">REDIRECTING:</a></li>
<meta http-equiv="refresh" content="2; url=shraddhey.html" />
<cfelse>
<cfoutput>WRONG DATA.</cfoutput>
</br>
<a href="http://127.0.0.1:8500/testapp/hello.cfm" target="_parent">BACK TO LOGIN PAGE:</a>
</cfif>
</head>
</html>