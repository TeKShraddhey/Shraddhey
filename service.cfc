<cfcomponent>

 
<cffunction name="getCities" >
{

   

   
    url.returnformat="json";
    url.queryformat="struct";

    //include a file to create a fake query we can select against
    <cfinclude template="fake.cfm">

    remote query function getCities(required string state) {
        return queryExecute("select city from cities where state in (:state)", {state={value:arguments.state, cfsqltype:'cf_sql_integer', list:true}}, {dbtype:'query'});
 

}
}
</cffunction>
</cfcomponent>