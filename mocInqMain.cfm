<cfsilent> 
<cfset mocCellsStruct = structNew() />
	<cfoutput query="request.cellsListQuery" group="locationid">
        <cfset mocCellsStruct[locationid] = arrayNew(2) />
        <cfset cntr = 1 />
        <cfoutput>
            <cfif  len(trim(cell))>
            <cfset mocCellsStruct[locationid][cntr][1] = Trim(cell) />
            <cfset mocCellsStruct[locationid][cntr][2] = Trim(cell) />
            <cfset cntr = cntr + 1 />
            </cfif>
        </cfoutput>
    </cfoutput>
</cfsilent> 
<!DOCTYPE html>
<html>
<head>
<title>EDesk :: MOC</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="/DHTMLXSuite_v46/codebase/dhtmlx.js"></script>
<link rel="STYLESHEET" type="text/css" href="/dhtmlxSuite_v46/codebase/dhtmlx.css">
<script src="/scripts/jquery-ui-1.8.23/development-bundle/jquery-1.8.0.js"></script>
<script type="text/javascript" src="/scripts/overlib.js"></script>
<script src="/scripts/common/eDesk.js"></script>
<script type="text/javascript" src="js/mocInq.js"></script>
<link rel="stylesheet" href="/<cfoutput>#session.brand#</cfoutput>/css/edesk.css" type="text/css">
<style type="text/css">
@import url(<cfoutput>/#session.brand#</cfoutput>/css/mocInquiry.css);
.dhx_page_skyblue div{height:15px;}
.dhx_pager_info_skyblue{font-size:12px;}
</style>

<link href="/css/edesk.css" rel="stylesheet" type="text/css">
<cfajaxproxy cfc="moc.model.mocInqManager" jsclassname="ajaxQObj" />
<script type="text/javascript">
var gmocInqlabelNames="MOC Number, Type, Location, Cell,Status,Line Status,BON, Line Number, Item Number,Expedited Qty,Expedited Req Date,Expedited Alternate Date,Date Requested,Date Closed, Initiator,Project Name,Inside Supervisor";
$(document).ready(function() {
		onBLoad();doOnLoadTB();doOnLoadCalendar();window.onresize = setInitDims;
	});
var myCalendar;
	function doOnLoadCalendar(){
		myFromCalendar = new dhtmlXCalendarObject(["mocFromDate"]);		
		myFromCalendar.setDateFormat("%m/%d/%Y");
		myFromCalendar.showTime(true);
		var childFrom = myFromCalendar.contTime.firstChild.firstChild;
		for (var q=0; q<childFrom.childNodes.length; q++) childFrom.childNodes[q].style.display = "none";		
		childFrom.innerHTML += "<div style='text-align:center;'>"+"<a href='javascript:void(0);' onclick='doFromClick()'>Clear</a>"+"</div>";
		childFrom = null;
		myToCalendar = new dhtmlXCalendarObject(["mocToDate"]);		
		myToCalendar.setDateFormat("%m/%d/%Y");
		myToCalendar.showTime(true);
		var childTo = myToCalendar.contTime.firstChild.firstChild;
		for (var q=0; q<childTo.childNodes.length; q++) childTo.childNodes[q].style.display = "none";		
		childTo.innerHTML += "<div style='text-align:center;'>"+"<a href='javascript:void(0);' onclick='doToClick()'>Clear</a>"+"</div>";
		childTo = null;
	}
	function doFromClick(obj) {				  
			document.getElementById("mocFromDate").value='';
			myFromCalendar.setDate(null);
			myFromCalendar.hide();
		}
	function doToClick(obj) {				  
			document.getElementById("mocToDate").value='';
			myToCalendar.setDate(null);
			myToCalendar.hide();
		}

<cfwddx action="cfml2js" input="#mocCellsStruct#" toplevelvariable="jsCellsStruct" />
</script>
</head>
<body scroll="no" bottommargin="0" rightmargin="0" topmargin="0" leftmargin="0">
<div id="divOuterMost">
	<div align="center"><cfinclude template="/edeskmenu/menuinc_withdoctype.cfm"></div>
	<cfoutput>
	#request.header#
	<div id="pageTitle" style="padding-top:4px;width:270px;"><span class="notranslate">&nbsp;MOC</span></div>
	<div id="pageBreadCrumbs"><a href="#ReplaceNoCase(request.webRoot, 'a.', '.')#portal/index.cfm"><span class="notranslate">Home</span></a> ><span class="notranslate">&nbsp;MOC</span></span></div>
	<div id="contentArea">
		#request.filter#
		<div id="fold">
			<div id="vslider" style="background-image:url(#application.structObj[session.brand][session.language]['filterExpandedBG'].display_name#); background-repeat:repeat-y;"><img id="imgvslider" src="#application.structObj[session.brand][session.language]['filterExpanded'].display_name#" border="0" onClick="showHideFilter();" usemap="##Map2"><map name="Map2" id="Map2"><area shape="rect" coords="5,5,18,18" href="##" onMouseOut="nd();" onMouseOver="return overlib('You can filter activities from here.', FGCOLOR, '##FFFFDE', BGCOLOR, '##0F4F96');" /></map></div>
		</div>
		#request.results#
	</div>
	</cfoutput>
	<div id="loading">
		<div id="loadingmask"></div>
		<div id="loadingmessage"><br><img src="/images/loading.gif" align="middle"><br><br>Loading Results...</div>
	</div>
</div>
</body>
</html>