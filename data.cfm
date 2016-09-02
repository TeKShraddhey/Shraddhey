<cfsilent>
<cfparam name="URL.mask" default="" />
<cfset FacilityName =listfirst(URL.mask,",")>
<cfset cellNumber =listgetAt(URL.mask,2,",")>
<cfset orderNumber =listlast(URL.mask,",")>
<cfif isDefined("URL.mask")>
<cfquery name="getQry" datasource="test_1" maxrows="20">
	SELECT	 orderNumber
	  FROM	[test].[dbo].[moc_bag_orders]
	WHERE	orderNumber like <cfqueryparam cfsqltype="cf_sql_varchar" value="#orderNumber#%" />
     AND  FacilityName= <cfqueryparam cfsqltype="cf_sql_varchar" value="#FacilityName#" />
	 AND cellNumber=<cfqueryparam  cfsqltype="cf_sql_integer" value="#cellNumber#" />
     ORDER BY orderNumber
</cfquery>
<cfsavecontent variable="str">
<cfoutput query="getQry">
<option value="#XMLFormat(orderNumber)#">#XMLFormat(orderNumber)#</option>
</cfoutput>
</cfsavecontent>
</cfif><!--- URL.iStr --->
</cfsilent><cfcontent type="application/xml" /><?xml version="1.0" encoding="ISO-8859-1"?><complete><cfoutput>#str#</cfoutput></complete>