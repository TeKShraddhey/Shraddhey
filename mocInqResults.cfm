<div id="rightTop">
	<div id="tabDiv">
		<div id="resultsImg">
			<div id="resultsImgLabel"><cfoutput>Results</cfoutput></div>			
			<div id="resultsHelpText" onmouseout="nd();" onmouseover="return overlib('Results', FGCOLOR, '#FFFFDE', BGCOLOR, '#0F4F96');"></div>
		</div>
		<div id="pagingArea" style="float:right; width:610px; height:17px;"></div>		
	</div>
	<div id="right">
		<div id="toolbar" style="clear:both; width:99%;" class="notranslate">
		<table style="width:100%;padding:0px;margin:0px; clear:both;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<div id="toolbar_zone" style="width:100%;"/>
				</td>
			</tr>
		</table>			
		<script>
			function onButtonClick(itemId) {
				switch(itemId)
				{
					case ('0_excel'):
					{
					   exportExcel();					 	
					}
					break;
					case ('0_newmoc'):
					{
						newMoc();
					}
					break;
					case ('0_approvalmoc'):
					{
						viewApporvalMoc();
					}
					break;
					case ('0_editmoc'):
					{
						vieweditMoc();
					}
					break;
					case ('0_admin'):
					{
						adminAction();
					}
					break;	
				}
			};			
			aToolBar = new dhtmlXToolbarObject("toolbar_zone");
			aToolBar.attachEvent("onClick", onButtonClick);
			aToolBar.loadStruct("index.cfm?event=mocTBar&" + new Date().getTime(),doOnLoadTB);			
			function doOnLoadTB(){
				aToolBar.forEachItem(function(itemId){
					aToolBar.showItem(itemId);
				});
				if(aToolBar.getType('0_approvalmoc'))aToolBar.disableItem('0_approvalmoc');	
				if(aToolBar.getType('0_editmoc'))aToolBar.disableItem('0_editmoc');
		}	

		</script>
		<style type="text/css">
		#expExlDiv{
			width:100%;height:100%;background-color:#F0F0F0; padding:5px; font-family:Arial, Helvetica, sans-serif; font-size:12px; font-weight:bold;
		}
		</style>
		</div>
		<div id="grid">
			<div id="gridbox"></div> 
		</div>
		
		<div id="modalMessageHolder" style="display:none;"></div>
	</div>
</div>