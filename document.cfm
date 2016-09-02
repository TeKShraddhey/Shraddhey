
<!DOCTYPE html>
<head>
<title>cfdocument tag: how to use pagebreak (page break) as cfdocumentitem type in printable document</title>
</head>
<body>
<cfquery name="shraddhey" datasource="test_1" >
 SELECT Student_id, FirstName FROM student1
</cfquery>
<cfdocument format="PDF" pagetype="legal"  userpassword="secret123" encryption="128-bit">>
 <cfoutput>
        <cfdocumentitem type="header">
            This isPage Header <br />
            Total Page Count: #cfdocument.totalpagecount#
        </cfdocumentitem>
        <cfdocumentsection>
      <h3 style="color:Crimson; font-style:italic">
	cfdocument
       </h3>
       <cftable query="shraddhey" colheaders="yes" htmltable="yes" border="no">
       <cfcol header="Student_id " text="#Student_id#">
       <cfcol header="FirstName" text="#FirstName#">
       </cftable>
       <cfdocumentitem type="pagebreak">
       </cfdocumentitem>
      <h3 style="color:DimGray; font-style:italic">
      This is another page
      </h3>
       </cfdocumentsection>
	   
 </cfoutput>
</cfdocument>

</body>
</html>