<html> 
<head> 
<script> 

function changeImage()
{
var img = document.getElementById("image");
img.src="http:\\SchoolHouse.gif";
return false;
}

</script>

</head>
<body>
<img id="image" src="/s1.jpg"  alt="hi" width=256px; height=256px>
</br></br></br>
<button id="clickme" onclick="changeImage();">NEXT</button>

</body>
</html>