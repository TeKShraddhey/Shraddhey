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
<script src="/CONTACT_MANAGER/codebase/sra_admin.js"></script>
</cfoutput>
<script>
var GBL_USERID = 0;
var GBL_PAGE_ASSIGNMENT = 'InstanceToUser';
</script>
<cfajaxproxy cfc="CONTACT_MANAGER.data.secAjax" jsclassname="jsObj" />
</head>
<body onLoad="initFn_SRAInstoUsernew(0)">


<div align="left" class="lblsubtitle"></div><br>
<div id="sra-pane-container">
<div class="row-pane"  >
	<div class="pane-cell pane-large" style= "padding-left: 2cm;">
		<div id="toolbar_assigned"></div>
		<div id="grid_assigned" style="width:600%; height:50vh; border: 1px solid;"></div>
	</div>
	<div class="pane-cell pane-small" style= "padding-left: 2cm;">
		<br><br><br><br><br><br>
		<img src="" alt="&#8592;" onClick="moveRowsBetweenGrids(availableGridObj,assignedGridObj)"
		border="0" />
		<br><br>
		<img src="" alt="&#8594" onClick="moveRowsBetweenGrids(assignedGridObj,availableGridObj)" border="0" />
	</div>
	<div class="pane-cell pane-large" style= "padding-left: 2cm;">
		<div id="toolbar_available"></div>
		<div id="grid_available" style="width:600%; height:50vh;border: 1px solid;"></div>
	</div>
</div>
</div>
</body>
</html>