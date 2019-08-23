<html>
<body load="_onload()">
<h2>Hello World!</h2>
<div id="myDiv">

</div>
</body >
<script>
    function _onload() {
        //请求订单列表接口
        var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("post","http://localhost:8080/order/findorder",true)
        xmlhttp.send()
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
    }
</script>
</html>
