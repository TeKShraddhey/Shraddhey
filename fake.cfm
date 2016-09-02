<cfscript>
variables.cities = queryNew("state,city", "integer,varchar", [
    {state:1, city:"San Francisco"},
    {state:1, city:"San Mateo"},
    {state:1, city:"Mountain View"},
    {state:2, city:"Lafayette"},
    {state:2, city:"Lake Charles"},
    {state:2, city:"Catahoula"},
    {state:3, city:"Houston"},
    {state:3, city:"Dallas"},
    {state:3, city:"Fort Worth"}]);
</cfscript>