<cfsetting enablecfoutputonly="true">
<cfparam name="url.buildingid" default="1">
<cfquery name="levels" ...>
SELECT levelid, levelname
FROM levels
WHERE buildingid = <cfqueryparam cfsqltype="cf_sql_integer" value="#val(url.buildingid)#">
</cfquery>
<cfoutput query="levels">
<option value="#levelid#">#levelname#</option>
</cfoutput>
