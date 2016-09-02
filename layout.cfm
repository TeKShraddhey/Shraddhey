<html> 
 
<body> 
<cflayout name="outerlayout" type="vbox"> 
<cflayoutarea style="height:400;"> 
<cflayout name="thelayout" type="border"> 
<!--- The 100% height style ensures that the background color fills 
the area. --->
<cflayoutarea position="top" size="100" splitter="true"
style="background-color:##00FFFF; height:100%"> 
This is text in layout area 1: top 
</cflayoutarea> 
<cflayoutarea title="Left layout area" position="left"
closable="true"
collapsible="true" name="left" splitter="true"
style="background-color:##FF00FF; height:100%"> 
This is text in layout area 2: left
You can close and collapse this area. 
</cflayoutarea> 
<cflayoutarea position="center" 
style="background-color:##FFFF00; height:100%"> 
This is text in layout area 3: center 
</cflayoutarea> 
<cflayoutarea position="right" collapsible="true"
title="Right Layout Area" 
style="background-color:##FF00FF; height:100%" > 
This is text in layout area 4: right
You can collapse this, but not close it. 
It is initially collapsed. 
</cflayoutarea> 
<cflayoutarea position="bottom" size="100" splitter="true"
style="background-color:##00FFFF; height:100%"> 
This is text in layout area 5: bottom 
</cflayoutarea> 
</cflayout> 
</cflayoutarea> 


</cflayout> 




<cfform name="form1" format="Flash" skin="haloBlue" width="375" height="350"  action ="layout1.cfm" > 
    <cfcalendar name="selectedDate"  
        
        mask="mmm dd, yyyy"  
        dayNames="SU,MO,TU,WE,TH,FR,SA" 
      
        monthNames="JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC" 
         
        width="200" height="150"> 
    <cfinput type="dateField" name="startdate" label="Block out starts" 
        width="100" value=""> 
    <cfinput type="dateField" name="enddate" label="Block out ends" width="100" 
        value=""> 
    <cfinput type="dateField" name="selectdate" label="Initial date" width="100" 
        value="" > 
    <cfinput type="Submit" name="submitit" value="Save" width="100">  
</cfform>
<cfform name="form01" action ="layout1.cfm" > 
    <cfslider name="slider1" 
    format="HTML" 
  
    width="350" 
    value="100" 
    min="0" 
    max="200" 
    increment="10" 
    tip="true"/> 
	<cfinput type="Submit" name="submitit" value="Save" width="100">  
</cfform>

</body> 
</html>