<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Quick start with dhtmlxGrid</title>
    <link rel="STYLESHEET" type="text/css" href="/dhtmlxSuite_v46/codebase/dhtmlx.css">
    <script src="/dhtmlxSuite_v46/codebase/dhtmlx.js"></script>

<style>
#nav {
    line-height:30px;
   position: relative;
    left: 700px;
	top:-500px;
    height:50px;
    width:200px;
    float:top;    	      
}
#buttons {
    line-height:30px;
   position: relative;
    left: 580px;
	top:-400px;
    height:50px;
    width:200px;
        	      
}

</style>
</head>
<body>


















    <div id="gridbox" style="width:550px;height:400px;"></div> 
    <script>
        myGrid = new dhtmlXGridObject('gridbox');
 
  myGrid.setImagePath("./codebase/imgs/");       
  myGrid.setHeader("Customer 	,Name ,Instance");
  //the headers of columns         
  myGrid.setInitWidths("150,200,150,100");          
  //the widths of columns         
  myGrid.setColAlign("left,left,left,left");      
  //the alignment of columns           
  myGrid.setColTypes("ro,ed,ed,ed");               
  //the types of columns         
  myGrid.setColSorting("int,str,str,int");          
  //the sorting types 
  myGrid.enableMultiselect(true);

  myGrid.enableDragAndDrop(true);
  myGrid.enableAutoWidth(true);  
  myGrid.init(); 
 
 
 
 myGrid.load("/CONTACT_MANAGER/data/loadAllUsers.cfm","xml");

              </script>  
<div id=buttons><a href='#' 
onclick='if (myGrid2.getSelectedId()) myGrid2.moveRow(myGrid2.getSelectedId(),"row_sibling",myGrid.getSelectedId(),myGrid)'>&#9668;</a></div>
			 
<div id=buttons><a href='#' 
onclick='if (myGrid.getSelectedId()) myGrid.moveRow(myGrid.getSelectedId(),"row_sibling",myGrid2.getSelectedId(),myGrid2)'> &#9658;</a></div>			 
			 
			 
			 <div id=nav> 
			  <div id="gridbox2" style="width:600px;height:400px; overflow:hidden;"></div> 
    <script>
        myGrid2 = new dhtmlXGridObject('gridbox2');
 
  myGrid2.setImagePath("./codebase/imgs/");       
  myGrid2.setHeader("Customer 	,Name ,Instance");
  //the headers of columns         
  myGrid2.setInitWidths("150,250,150,100");          
  //the widths of columns         
  myGrid2.setColAlign("left,left,left,left");      
  //the alignment of columns           
  myGrid2.setColTypes("ro,ed,ed,ed");               
  //the types of columns         
  myGrid2.setColSorting("int,str,str,int");          
  //the sorting types 
  myGrid2.enableDragAndDrop(true);
  myGrid2.enableAutoWidth(true);  
  myGrid2.init(); 
 
 myGrid2.enableMultiselect(true);

 
 
myGrid2.parse(data,"json"); //takes the name and format of the data source

</script>  </div>
</body>
</html>