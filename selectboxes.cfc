<cfcomponent>
   <cffunction name="getFillQuery" output="no" access="remote" returntype="query">
      <cfargument name="itemID" required="true" type="numeric" />
     
      <!--- I am faking the query for test purposes --->
      <cfset var selectQuery = queryNew("display,id") />
      <!--- this would be where you do your real query --->
      <cfset var i = 0 />
      <cfloop from="1" to="5" index="i">
         <cfset queryAddRow(selectQuery) />
         <cfset querySetCell(selectQuery,"display","selected #arguments.itemID# option #i#") />
         <cfset querySetCell(selectQuery,"id",i) />
      </cfloop>
     
      <cfreturn selectQuery />
   </cffunction>
</cfcomponent>