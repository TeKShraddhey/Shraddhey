<cfajaxproxy cfc="selectboxes" jsclassname="Selectboxes">
<html>
<head>
<script language="javascript">
   var formItemToFill;
   function callFill(thisSelect,target) {
      formItemToFill = target;
      selectBoxes = new SelectBoxes();
      selectBoxes.setCallbackHandler(fill);
      selectBoxes.getFillQuery(thisSelect.options[thisSelect.selectedIndex].value);
   }
   function fill(r) {
        var i = 0;
        var foo2 = document.forms['myForm'].foo2;
        foo2.options.length = 0;
        for (i in r.DATA) {
            foo2.options[i] = new Option(r.DATA[i][0],r.DATA[i][1]);
        }
   }
</script>
</head>
<body onload="callFill(document.forms['myForm'].foo1,'foo2');">
<form name="myForm">
   <select name="foo1" onchange="callFill(this,'foo2');">
      <option value="1">Option 1</option>
      <option value="2">Option 2</option>
      <option value="3">Option 3</option>
   </select>
   <br />
   <select name="foo2" id="foo2"></select>
</form>
</body>
</html>