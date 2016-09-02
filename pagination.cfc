<cfcomponent  > 
    
    <cffunction name="pagination" output="yes"> 
        <cfargument name="num"  type="numeric">
        
        <cfargument name="Info"  type="query">		
		

<cfparam name="URL.PageIndex" default="0">
<cfset intPagesToLinkTo =int(#Info.Recordcount# / #num#)>
<cfset RecordsPerPage = num >
<cfset intItemsPerPage = #RecordsPerPage#>
<cfset intNumberOfTotalItems = #Info.Recordcount#>
<cfif isdefined("url.page")>
  <cfset intCurrentPage = val(url.page)>
  <cfelse>
  <cfset intCurrentPage = 1>
</cfif>
<cfset intMaxLinkToShow = ceiling(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo>
<cfset intMinLinkToShow = (int(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo)+1>
<cfif intMaxLinkToShow eq (int(variables.intCurrentPage/intPagesToLinkTo)*intPagesToLinkTo)>
  <cfset intMinLinkToShow = intMaxLinkToShow - (intPagesToLinkTo - 1)>
</cfif>
<cfif intMaxLinkToShow gt intNumberOfTotalItems / intItemsPerPage>
  <cfset intMaxLinkToShow = ceiling(intNumberOfTotalItems / intItemsPerPage)>
</cfif>
<cfif intMaxLinkToShow - intPagesToLinkTo LTE 0>
  <cfset boolShowBackButton = 0>
<cfelse>
  <cfset boolShowBackButton = 1>
</cfif>
<cfif ceiling(intNumberOfTotalItems / intItemsPerPage) lte intMaxLinkToShow>
  <cfset boolShowForwardButton = 0>
<cfelse>
  <cfset boolShowForwardButton = 1>
</cfif>
<cfset intMinItemsToShow = (intItemsPerPage * (intCurrentPage - 1))+ 1>
<cfset intMaxItemsToShow = intMinItemsToShow + intItemsPerPage - 1>
<cfif intMaxItemsToShow gt intNumberOfTotalItems>
  <cfset intMaxItemsToShow = intNumberOfTotalItems>
</cfif>
<div style="clear:both; margin-top:10px;">
  <cfif variables.boolShowBackButton>
    <div style="float:left;font-weight:bold;margin:5px;padding:5px;border:1px solid black;">
      <a href="?page=<cfoutput>#intMinLinkToShow-1#</cfoutput>">&lt;</a>
	  </div>	  
  </cfif>
  <cfloop from="#int(variables.intMinLinkToShow)#" to="#int(variables.intMaxLinkToShow)#"index="i">
    <div style="float:left;font-weight:bold;margin:5px;padding:5px;border:1px solid black;">
      <cfoutput>	  
        <cfif intCurrentPage eq i>
         <a href="?PageIndex=#i-1#&class=#RecordsPerPage#">#i#</a>
	       <cfelse>
		  <a href="?PageIndex=#i-1#&class=#RecordsPerPage#">#i#</a>          
        </cfif>
      </cfoutput>
    </div>
  </cfloop>
  <cfif variables.boolShowForwardButton>
    <div style="float:left;font-weight:bold;margin:5px;padding:5px;border:1px solid black;">
      <a href="?page=<cfoutput>#int(intMaxLinkToShow+1)#</cfoutput>">&gt;</a>
    </div>
  </cfif>
</div>
 <cfreturn > 
 </cffunction> 
</cfcomponent>