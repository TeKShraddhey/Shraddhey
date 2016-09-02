<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>cfgrid tag example: how to display data in a flash format grid</title>
</head>

<body>
<h2 style="color:DodgerBlue">ColdFusion cfgrid example: Flash Format</h2>

<cfquery name="qCenters" datasource="test_1" >
 SELECT *
 FROM student1
</cfquery>

<cfform method="post" name="GridExampleForm">
 <cfgrid 
     name="Centers" 
        query="qCenters" 
        format="flash" 
        width="800" 
        height="500"
		pagesize="5"
        >
		
</cfgrid>
</cfform>

</body>
</html>