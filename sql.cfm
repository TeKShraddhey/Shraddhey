<cfsetting enablecfoutputonly="Yes"> 
<cfquery name="GetEmps" datasource="test_1"> 
SELECT p.[PARTID], p.[PRODUCTID] , p.[PARTNUMBER],
 pr.[MANUFACTUREPRODUCTIDNAME],pr.[PRODUCTTITLE], pcs.[CATALOGSECTIONID],cs. [LINEAGE] ,
 [eDesk].[dbo].[getCatalogSectionName](cs.LINEAGE,1) as catlogsection,
 [eDesk].[dbo].[getCatalogSectionName](cs.LINEAGE,2) as catlogsection1,
 [eDesk].[dbo].[getCatalogSectionName](cs.LINEAGE,3) as catlogsection2,
 [eDesk].[dbo].[getCatalogSectionName](cs.LINEAGE,4) as catlogsection3
FROM [eDesk].[dbo].[PART] AS p
inner join [eDesk].[dbo].[PRODUCT] AS pr ON pr.[PRODUCTID] = p.[PRODUCTID] 
inner JOIN [eDesk].[dbo].[PART_CATALOG_SECTION] AS pcs ON pcs.[PARTID] = p.[PARTID]
inner JOIN [eDesk].[dbo].[CATALOG_SECTION] AS cs ON cs.[CATALOGSECTIONID] = pcs.[CATALOGSECTIONID]
</cfquery>
<cfcontent type="application/msexcel"> 
<cfheader name="Content-Disposition" value="filename=records.xls">
<cfoutput> 
<table >
<tr>
<td><b>Part ID<b></td>
<td><b>Product ID<b></td>
<td><b>Part Numbe<b></td>
<td><b>Manufacture ProductID Name<b></td>
<td><b>Product Title<b></td>
<td><b>Catalog Section ID<b></td>
<td><b>Lineage<b></td>
<td><b>Catalog Section<b></td>
<td><b>Catalog Section 1<b></td>
<td><b>Catalog Section 2<b></td>
<td><b>Catalog Section 3<b></td>  
</td>
        <cfloop query="GetEmps"> 
            <tr>
			<td>#PARTID#</td> 
			<td>#PRODUCTID#</td> 
			<td>#PARTNUMBER#</td> 
			<td>#MANUFACTUREPRODUCTIDNAME#</td> 
			<td>#PRODUCTTITLE#</td> 
			<td>#CATALOGSECTIONID#</td> 
			<td>#LINEAGE#</td> 
			<td>#catlogsection#</td> 
			<td>#catlogsection1#</td> 
			<td>#catlogsection2#</td> 
			<td>#catlogsection3#</td> 
            </tr> 
        </cfloop> 
    </table> 
</cfoutput>