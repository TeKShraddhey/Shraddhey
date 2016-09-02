<cfcomponent output="false">
    <cffunction name="getStates" access="remote" returntype="array">

        <cfquery name="states" datasource="test_1"> 
            SELECT DISTINCT LocationID ,ID 
			FROM  [test].[dbo].[MOC_Locations]
            
        </cfquery>
        <cfset count="1" />
        <cfset results = arraynew(2)>
        <cfloop query="states">
            <cfset results[count][1]="#LocationID#" />
            <cfset results[count][2]="#LocationID#" />
            <cfset count= count+1>
        </cfloop>
        <cfreturn results />
    </cffunction>
    <cffunction name="getCity" access="remote" returntype="array">
        <cfargument name="LocationID" type="any" required="true">
		
    
	    <cfquery name="cities1" datasource="test_1">
           


 SELECT *
FROM ( SELECT [LocationID] FROM [test].[dbo].[MOC_Locations]
			where LocationName= ( SELECT [LocationName] FROM [test].[dbo].[MOC_Locations]
			where LocationID='#arguments.LocationID#' 
        
        )
        ) A 
CROSS JOIN (SELECT Cell AS Cell 
            FROM [test].[dbo].[MOC_Cells] 
            WHERE LocationID=( SELECT [LocationID] FROM [test].[dbo].[MOC_Locations]
			where LocationName=( SELECT [LocationName] FROM [test].[dbo].[MOC_Locations]
			where LocationID='#arguments.LocationID#' 
        
        )
        
        ) 
          ) B
		   
			
        </cfquery>
        
        <cfset count="1" />
        <cfset results = arraynew(2)>
    
        <cfloop query="cities1">
            <cfset results[count][1]="#Cell#" />
            <cfset results[count][2]="#Cell#" />
            <cfset count= count+1>
        </cfloop>
        <cfreturn results />
    </cffunction>
</cfcomponent>


