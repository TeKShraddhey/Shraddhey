<!DOCTYPE html>
<html>
<head>
<title>Assign Instance to User</title>
<link rel="stylesheet" type="text/css" href="/CONTACT_MANAGER/codebase/dhtmlx.css"/>
<script src="/CONTACT_MANAGER/codebase/dhtmlx.js"></script>
<cfoutput>
<link rel="stylesheet" href="/CONTACT_MANAGER/codebase/sec.css">
<link rel="stylesheet" href="/CONTACT_MANAGER/codebase/sra_main.css">
<script src="/CONTACT_MANAGER/codebase/edesk.js"></script>
<script src="/CONTACT_MANAGER/codebase/sra_adminassign.js"></script>
</cfoutput>
<script>
var GBL_USERID = 0;
var GBL_PAGE_ASSIGNMENT = 'InstanceToUser';
</script>
<cfajaxproxy cfc="CONTACT_MANAGER.data.secAjaxassign" jsclassname="jsObj" />
</head>
<body onLoad="initFn_SRAInstoUser(0)">

<div align="left" class="lblsubtitle"></div><br>



		
		<div id="toolbar_assigned">
		<div id="grid_assigned" style="width:600%; height:50vh; border: 1px solid;"></div>

		</div>
		<div id="grid_available" style="width:6000%; height:50vh;border: 1px solid;">



 

</body>
</html>