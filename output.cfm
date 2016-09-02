<cfspreadsheet action="read"  headerrow="1" query="mySheet" src="D:\ColdFusion9\cpysheet.xlsx" sheet="1">
    
      <cfquery datasource="test_1" name="myInsert">
      <cfoutput>
      <cfloop query="mySheet">
        
		
		 UPDATE [eDesk].[dbo].[brand_Shr_May05_2016_new]
    SET display_name= '#mySheet.German_equivalent_text_to_Column_B_text#' 
        
    WHERE lang ='GER'  and label_name='#mySheet.LabelName#'
	 
      </cfloop>
      </cfoutput>
       </cfquery>
	   
