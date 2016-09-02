





<cfparam name="url.pageSize" default="10">
<cfform name="logForm">
<cfgrid format="html" name="courseGrid" 
pagesize="#url.pageSize#"
 selectmode="row" 
 height="200" 
bind="cfc:cfgrid.getCourses({cfgridpagesize},{cfgridpage},{cfgridsortcolumn},{cfgridsortdirection})">
<cfgridcolumn name="Student_id" width="100" header="Student_id " headerbold="true" />
<cfgridcolumn name="FirstName" width="180" header="FirstName " headerbold="true" />
<cfgridcolumn name="LastName" width="180" header="LastName" headerbold="true" />
<cfgridcolumn name="class" width="180" header="class" headerbold="true" />

</cfgrid>
</cfform>