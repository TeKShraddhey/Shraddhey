<cfsetting enablecfoutputonly="Yes"> 
<cfquery name="userQry" datasource="test_1" >
	
 SELECT  s.[MOCNumber]
    , h2.[Type]
    , h1.[LocationName]
    , s.[Cell]
    , s.[Status]
    , r.[LineStatus]
    , r.[BON]
    , r.[LineNumber] 
    , r.[ItemNumber]
	,r.[ExpeditedQty]
      ,r.[ExpeditedReqDate]
      ,r.[ExpeditedAltDate]
	  ,s.[DateRequested],
	  s.[DateClosed]
      ,s.[Initiator]
    ,r.[ProjectName]
	,r.[InsideSupervisor]
    
FROM  [test].[dbo].[MOC_Header] AS s 
INNER JOIN [test].[dbo].[MOC_Product] AS r 
    ON s. [MOCID] = r .[MOCID]
INNER JOIN [test].[dbo].[MOC_Locations] AS h1 
    ON s.[location] = h1.[LocationID]
	INNER JOIN [test].[dbo].[MOC_Types] AS h2 
  On s.[type]= h2.[id]

</cfquery>
<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=Employees.xls"> 
<cfoutput> 
    <table >
<tr>
<td>MOCNumber</td>
<td>Type</td>
<td>LocationName</td>
<td>Cell</td>
<td>Status</td>
<td>LineStatus</td>
<td>BON</td>
<td>LineNumber</td>
<td>ItemNumber</td>
<td>ExpeditedQty</td>
<td>ExpeditedReqDate</td>
<td>ExpeditedAltDate</td>
<td>DateRequested</td>
<td>DateClosed</td>
<td>Initiator</td>
<td>ProjectName</td>
<td>InsideSupervisor</td>
	  
</td> 
        <cfloop query="userQry"> 
            <tr> 
                <td>#MOCNumber#</td> 
                <td>#Type#</td> 
                <td>#LocationName#</td> 
				<td>#Cell#</td>
				<td>#Status#</td>
				<td>#LineStatus#</td>
				<td>#BON#</td>
				<td>#LineNumber#</td>
				<td>#ItemNumber#</td>
				<td>#ExpeditedQty#</td>
				<td>#ExpeditedReqDate#</td>
				<td>#ExpeditedAltDate#</td>
				<td>#DateRequested#</td>
				<td>#DateClosed#</td>
				<td>#Initiator#</td>
				<td>#ProjectName#</td>
				<td>#InsideSupervisor#</td>
            </tr> 
        </cfloop> 
    </table> 
</cfoutput>

