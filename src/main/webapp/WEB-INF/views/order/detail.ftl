<html>
<#include "/common/header.ftl">
<body onload="_onload()">
<div id="myDiv">
<#include "/common/nav.ftl">
</div>

<table class="table table-bordered table-condensed">
    <thead>
    <tr>
        <th>订单id</th>
        <th>用户名</th>
        <th>订单号</th>
        <th>地址id</th>
        <th>实际付款金额</th>
        <th>支付类型</th>
        <th>运费</th>
        <th>订单状态</th>
        <th>支付时间</th>
        <th>发货时间</th>
        <th>交易完成时间</th>
        <th>交易关闭时间</th>
        <th>创建时间</th>
        <th>最后更新时间</th>
        <th colspan="3">操作</th>
    </tr>
    </thead>
    <tbody>
                        <#list orderList.getList() as order>
                        <tr>
                            <td>${order.id}</td>
                            <td width="100">${order.userId}
                            <#list userlist as user>
                                <#if order.userId==user.id>
                                    <#if user.username!=null>
                                        -${user.username}
                                    </#if>
                                </#if>
                            </#list>
                            </td>
                            <td>${order.orderNo}</td>
                            <td width="70">${order.shippingId}&nbsp<a href="shippingdetail/${order.shippingId}">详情</a></td>
                            <td>${order.payment}</td>

                            <#assign checkpaymentType="${order.paymentType}"/>
                             <#if checkpaymentType==1>
                                    <td width="120">${order.paymentType}-在线支付</td>
                             </#if>

                            <td>${order.postage}</td>

                            <#assign checkstatus="${order.status}"/>
                             <#if checkstatus==0>
                                    <td width="120">${order.status}-订单取消</td>
                             </#if>
                            <#if checkstatus==10>
                                    <td width="120">${order.status}-未付款</td>
                            </#if>
                            <#if checkstatus==20>
                                    <td width="120">${order.status}-已付款</td>
                            </#if>
                            <#if checkstatus==40>
                                    <td width="120">${order.status}-已发货</td>
                            </#if>
                            <#if checkstatus==50>
                                    <td width="120">${order.status}-交易完成</td>
                            </#if>
                            <#if checkstatus==60>
                                    <td width="120">${order.status}-交易关闭</td>
                            </#if>

                            <td width="200">${order.paymentTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="200">${order.sendTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="200">${order.endTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="200">${order.closeTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="200">${order.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="200">${order.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td width="50"><a href="detail/${order.id}">详情</a></td>
                            <td width="50">
                                <#if order.getStatus() == 10>
                                    <a href="cancel/${order.id}">取消</a>
                                </#if>
                            </td>
                            <td width="50">
                                <#if order.getStatus() == 20>
                                    <a href="send/${order.id}">发货</a>
                                </#if>
                            </td>
                        </tr>
                        </#list>
    </tbody>
</table>
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
        xmlhttp.open("post","http://localhost:8080/user/order/test",true)
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
