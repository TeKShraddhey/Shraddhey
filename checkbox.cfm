
<cfif isdefined("form.submit")>

	
	<cfquery name="data" datasource="test_1">
 Insert into [test].[dbo].[hide]
 values ('#form.selected_value#')
 </cfquery>
 <script><cfoutput>
	window.parent.closeWin('#replace(form.selected_value,",","~","all")#');
	//window.opener.location.reload(true);
	//window.parent.winCommon.close();</cfoutput>
 </script>
 
<cfelse>
	
<link rel="STYLESHEET" type="text/css" href="/dhtmlxSuite_v46/codebase/dhtmlx.css">
<script type="text/javascript" src="/scripts/overlib.js"></script>
    <script src="/dhtmlxSuite_v46/codebase/dhtmlx.js"></script>
   <script src="/CONTACT_MANAGER/codebase/sra_admin.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script></head>
<body>
<p>Hide Coloumns: (disabled checkbox - Coloumn will be shown always.)</p>
<form method="post" action="http://127.0.0.1:8500/testapp/checkbox.cfm" >
	<p><input  class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_1" value="0" disabled>MocNumber </p>
	<p><input  class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_2" value="1">type </p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_3" value="2" disabled> Location</p>
	<p><input  class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_4" value="3"> Cell</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_5" value="4"> status</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_6" value="5">LineStatus </p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_7" value="6" disabled>Bon </p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_8" value="7"> LineNumber</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_9" value="8">ItemNumber </p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_10" value="9"> Expedited Qunantity</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_11" value="10">Expedited Request Date</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_12" value="11"> Expedited Alternate Date</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_13" value="12">Date Requested</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_14" value="13"> Date Closed</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_15" value="14">Initiator</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_16" value="15"> Project Name</p>
	<p><input class="messageCheckbox" type="CHECKBOX" name="CHECKBOX_17" value="16">Inside Supervisor</p>
	<input type="hidden" id="selected_value" name="selected_value" value="">
	<p><input type="submit" name="submit" value="Submit!" onclick="checkCheckBoxes();" ></p>
</form>
<script type="text/javascript" language="JavaScript">
function checkCheckBoxes(theForm) {
var selectedvalue = []; // initialize empty array 
    $(".messageCheckbox:checked").each(function(){
        selectedvalue.push($(this).val());
    });
	document.getElementById('selected_value').value = selectedvalue;	
}
</script> 
</body>
</cfif>