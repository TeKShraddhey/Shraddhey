<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Paging and functions</title>
    <link rel="STYLESHEET" type="text/css" href="/dhtmlxSuite_v46/codebase/dhtmlx.css">
    <script src="/dhtmlxSuite_v46/codebase/dhtmlx.js"></script>

<style>


</style>
</head>
<body>

<CFQUERY NAME="GetInfo" DATASOURCE="test_1">
         SELECT type,Location, cell
         FROM [test].[dbo].[MOC_Header]
         
</CFQUERY>

<table>
<th>
<td>
TYPE:

<select name= "type" id ="type">
    <cfloop QUERY="GetInfo">
	<option value = <cfoutput>#Type#</cfoutput> ><cfoutput>#Type#</cfoutput></option></br>
</cfloop>
</td>

<input type="button" onClick="location.href='shraddhey.html?'" value='ADD ROW'>
<input type="button" onClick="location.href='shraddhey.html?'" value='SAVE GRID'>



                <div id="gridbox" style="width:100%; height:500px;">
                    </div>
               <div id="recinfoArea"></div>
   
    <script>
  
 
       
       var contactsGrid = new dhtmlXGridObject('gridbox');

 
 contactsGrid.setHeader("BON,Line Number,Item Number,Expedited Quantity,Expedited Request Date,Expedited Alternate Date,Project Name,Inside Supervisor");   //sets the headers of columns
        contactsGrid.setColumnIds("BON,Line Number,Item Number,Expedited Quantity,Expedited Request Date,Expedited Alternate Date,Project Name,Inside Supervisor");         //sets the columns' ids
        contactsGrid.setInitWidths("100,100,100,100,100,100,100,100");   //sets the initial widths of columns
        contactsGrid.setColAlign("left,left,left,left,left,left,left,left");     //sets the alignment of columns
        contactsGrid.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed");               //sets the types of columns
        contactsGrid.setColSorting("str,str,str,str,str,str,str,str");  //sets the sorting types of columns
        contactsGrid.enableDragAndDrop(true);
		contactsGrid.setEditable(true);
		contactsGrid.setColValidators("ValidInteger,ValidInteger,ValidInteger,ValidInteger,"); 
		contactsGrid.init();
 contactsGrid.load("/CONTACT_MANAGER/data/loadAllUsers.cfm","xml");
 
              </script>  
</body>
</html>