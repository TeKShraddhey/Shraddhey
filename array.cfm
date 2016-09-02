<!DOCTYPE html>
<html>
<head>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
</style>
</head>
<body>
<div id="header">

<marquee behavior="alternate" >LIST ARRAY AND STRUCTURE EXAMPLES:</marquee>
</div>


<cfset array = Arraynew(1)>
<cfset array[1]="shraddhey"> 
<cfset array[2]="pagaria"> 
<cfset array[3]="jain">
<cfdump var='#array#' format ='text'>
<cfset list ="shraddhey !pagaria!jain! saumya">
</br>
<cfoutput>list items :#list#</br>
</cfoutput>
<cfoutput>items in list #listlen(list, '!')#</cfoutput>
<p>Particular list item at position 2</p>
<cfoutput>Item at position 2 is #listgetat(list,2,'!')#</br></cfoutput>
<cfoutput>First Item : #listfirst(list,'!')# </br></cfoutput>
<cfoutput>last Item : #listlast(list,'!')#</br></cfoutput>
<cfoutput>Rest Item (excluding firstname only): #listrest(list,'!')#</br></cfoutput>
<p>Appending and prepending to a list</p>
<cfset list= listappend(list, "deep",'!')>
<cfoutput>After appending list has : #list#</br></cfoutput>
<cfset list= listprepend(list, "deep",'!')>
<cfoutput>After prepending list has : #list#</br></cfoutput>
<cfset list= listinsertat(list,2,"sharma",'!')>
<cfoutput>list items now:#list#</br></cfoutput>
<p>Deleting items from a list</p>

<cfset list= listdeleteat(list,2,'!')>
<cfoutput>list items now after deleting:#list#</br></cfoutput>
<p>Replacing a list item:</p>
<cfset list= listsetat(list,2,"javed",'!')>
<cfoutput>list items now after replacing:#list#</br></cfoutput>
<p>looping through list items </p>
<cfoutput>
<cfloop list="#list#" index="i"  delimiters="!">
<ul>
<li>#i#</li>
</ul>
</cfloop>
</cfoutput>
<cfset list= listChangeDelimS(list,",","!")>
<cfoutput>list items now after CHANGING DELIMITER:#list#</br></cfoutput>

<cfset list= listChangeDelimS(list,"!",",")>
<cfoutput>list items now after again CHANGING DELIMITER:#list#</br></cfoutput>

<cfset list= listsort(list,"text", "desc", '!')>
<cfoutput>list items after sorting : #list#</br></cfoutput>

<cfoutput>
1). listfind('Pagaria') : #listfind(list,"Pagaria","!")# </br>
2). listcontains('Pagar') : #listcontains(list,"Pagar","!")# </br>
3). listfindnocase('Pagaria') : #listfindnocase(list,"Pagaria","!")# </br>
4). listcontainsnocase('Pagar') : #listcontainsnocase(list,"Pagar","!")# </br>
<cfdump var=#list#>
<cfdump var="#listtoarray(list,'!')#">
</cfoutput>

<cfquery name="test" datasource="test_1" >
select * from 
student1
</cfquery>
<cfdump var="#test#">
<cfset mylist= valuelist(test.FirstName)>
<cfset testarray = listtoarray(mylist)>
<cfdump var="#testarray#">




<h2>Array examples</h2>
<cfset testarray= arraynew(1)>
<cfset testarray[1]="shraddhey">
<cfset testarray[2]="jain">
<cfset testarray[3]="pagaria">
<cfset testarray[4]="saumya">
<cfset testarray[5]="hello">
<cfdump var="#testarray#" format ="text">
<p>Explicit array without using arraynew: </p>
<cfset testarray1= ["a","b","c","d","e"]>
<cfdump var="#testarray1#" format ="text">
<cfset arrayappend(testarray,"abcde")>
<cfset arrayprepend(testarray,"hdfc")>
<cfset testarray[9]="hhhhh">
<cfset testarray[8]="pppphh">
<cfdump var="#testarray#" format ="text">


<p>Inserting at a particular position</p>
<cfset arrayinsertat(testarray1,3,"r")>
<cfdump var="#testarray1#" format ="text">


<p>Deleting at a particular position</p>
<cfset arrayDeleteAt(testarray1,5)>
<cfdump var="#testarray1#" format ="text">


<p>Deleting a particular item </p>
<cfset arrayDelete(testarray,"jain")>
<cfdump var = "#testarray#">
<cfset arrayclear(testarray1)>
<cfdump var = "#testarray1#">


<cfoutput> testaaray1 has #arraylen(testarray1)# elements:</br></cfoutput>
<cfoutput> testaaray has #arraylen(testarray)# elements:</br></cfoutput>
<cfoutput> testaaray is empty ? #arrayisempty(testarray)# </br></cfoutput>
<cfoutput> testaaray1 is empty ? #arrayisempty(testarray1)# </br></cfoutput>


<cfset numarray=["1","2","3","4","5","6","7","8","9","10"]>
<cfoutput>
array average is: #arrayavg(numarray)#</br>
array sum is:     #arraysum(numarray)#</br>
array minimum is: #arraymin(numarray)#</br>
array maximum is: #arraymax(numarray)#</br>
</cfoutput>

<cfset arraysort(testarray,"textnocase")>
<cfdump var = "#testarray#">

<cfset arraysort(numarray,"numeric","desc")>
<cfdump var = "#numarray#">

<p>Swapping array elements</p>
<cfset arrayswap(numarray,"1","3")>
<cfdump var = "#numarray#">

<cfoutput>
arraycontains('ABCDE'): #arraycontains(testarray, 'ABCDE')#<br/>
arraycontains('abcde '): #arraycontains(testarray, 'abcde')#<br/>
arraycontains('abcd '): #arraycontains(testarray, 'abcd ')#<br/>
 
arrayfind('abcde'): #arrayfind(testarray, 'abcde')#<br/>
arrayfind('ABCDE '): #arrayfind(testarray, 'ABCDE ')#<br/>
arrayfindNoCase('ABCDE'): #arrayfindnocase(testarray, 'ABCDE')#<br/>
arrayfindNoCase('abCde'): #arrayfindnocase(testarray, 'abCde')#<br/>
</cfoutput>



<p>STRUCTURE EXAPMLES:</p>
<cfset struct=structnew()>
<cfset struct.FirstName="shraddhey">
<cfset struct.id="2129">
<cfset struct.LastName="pagaria">
<cfset struct["age"]="24">
<cfdump var="#struct#">
<p>NESTING STRUCTURES</p>
<cfset struct1 = structnew()>
<cfset struct1.first=structnew()>
<cfset struct1.second=structnew()>
<cfset struct1.first.name="shraddhey">
<cfset struct1.first.age="24">
<cfset struct1.first.class="12">
<cfset struct1.first.id="2129">
<cfset struct1.second.name="golu">
<cfset struct1.second.age="24">
<cfset struct1.second.class="10">
<cfset struct1.second.id="2130">
<cfdump var="#struct1#">
<cfscript>
struct1.three=structnew();
struct1.three.name="jain";
struct1.three.age="24";
struct1.three.id="2131";
struct1.three.class="5";
struct1.four=structnew();
struct1.four["name"]="pagaria";
struct1.four.age="15";
structinsert(struct1.four,"class","8");
struct1.four.id="2132";

</cfscript>
<cfset struct1.five= {name="javed", class="12", id="2133",age="22"} >

<cfdump var="#struct1#">
<cftry>
<cfset structinsert(struct1.four,"class","9",false) >
<cfcatch type="any">
<cfoutput>#cfcatch.message#</br></cfoutput>
</cfcatch>
</cftry>
<cfdump var="#struct1#">
<p>Updating values in structure:</p>
<cfscript>
struct1.four.name ="hello";

structinsert(struct1.four, "name", "deep", true);
structupdate (struct1.four, "name", "sharma");
</cfscript>
<cfdump var="#struct1#">
<cfoutput>
is struct empty (struct1)? #structisempty(struct1)#</cfoutput>
<p>Checking for a particular key in structure:</p>
<cfoutput>
structKeyExists(struct1.four, "name"): #structKeyExists(struct1.four, "name")#<br/>
structKeyExists(struct1.four, "school"): #structKeyExists(struct1.four, "school")#<br/></cfoutput>

<cfoutput>
<table>
<tr>Name</tr>
<td>#struct1.first.name#</td>
<td>#struct1.second.name#</td>
<td>#struct1.three.name#</td>
<td>#struct1.four.name#</td>
</table>
</cfoutput>
<cfdump var=#struct#>
<p>Deleting a key from a structure:</p>
<cfscript>
writeoutput("struct has " &structcount(struct)& "keys:" &structkeylist(struct)& "</br>");
structdelete(struct,"FirstName");
writeoutput("struct has " &structcount(struct)& "keys:" &structkeylist(struct)& "</br>");
</cfscript>

<cfset new = structnew() >
<cfset new.name = "shraddhey" >
<cfset new.age = "24" >
<cfdump var="#new#" label="new" >
 
<cfset new1 = structnew() >
<cfset new1.middleName = "jain" >
<cfset new1.id = "25" >
<cfdump var="#new1#" label="new1" >
 
<cfset result = structAppend(new, new1,false) >
<cfdump var="#new#" label="newappended" >
<cfoutput>Appended?: #result#<br/></cfoutput>

<p>Sorting structures:</p>
<cfscript>
    sortexample = structNew();
    sortexample.1 = "a";
    sortexample.2 = "z";
    sortexample.3 = "B";
    sortexample.4 = "E";
    sortexample.5 = "W";
    sortexample.6 = "q";
    sortexample.7 = "t";
</cfscript>
 <p>with nocases:</p>
<cfloop array="#structSort(sortexample, 'textNoCase', 'desc')#" index="i">
    <cfoutput>#sortexample[i]#<br/></cfoutput>
</cfloop>
<p>with cases:</p>
<cfloop array="#structSort(sortexample, 'text', 'desc')#" index="i">
    <cfoutput>#sortexample[i]#<br/></cfoutput>
</cfloop>
<cfset structclear(struct)>
<cfdump var="#struct#">
<cfset copy = StructCopy(sortexample)>
<cfdump var="#sortexample#"> 
<cfset clone = Duplicate(sortexample)> 
<cfdump var="#sortexample#">
<cfoutput></cfoutput>

