 <cfparam name=“url.start” default=“1”> <cfset perPage = 10>

<cfquery name=“getart” datasource=“cfartgallery”> select art.artname, art.description, art.price from art order by art.artname asc </cfquery>

<script> $(function() { <!— Show Prev if start gt 1 —> <cfif url.start gt 1> <cfoutput> showPrev(#url.start-perpage#) </cfoutput> <cfelse> hidePrev() </cfif> <!— Show next if we need to —> <cfif (url.start + perPage - 1) lt getart.recordCount> <cfoutput> showNext(#url.start+perpage#) </cfoutput> <cfelse> hideNext() </cfif> }) </script>

<cfoutput query=“getart” startrow=“#url.start#” maxrows=“#perpage#”> <p> <b>#artname#</b> #dollarFormat(price)#<br/> #description# </p> </cfoutput> 