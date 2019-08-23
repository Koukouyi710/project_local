<html>
<#include "common/header.ftl">

<body onload="_onload()">
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>订单id</th>
                            <th>用户id</th>
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
                            <td>${order.userId}</td>
                            <td>${order.orderNo}</td>
                            <td>${order.shippingId}</td>
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
                            <td width="50"><a href="detail/id=${order.id}">详情</a></td>
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
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if orderList.getCurrentPage() lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/order/findorder?currentPage=${orderList.getCurrentPage() - 1}">上一页</a></li>
                    </#if>

                    <#--<#list 1..uplist.getTotalPages() as index>
                        <#if uplist.getCurrentPage() == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/product/findproduct?currentPageup=${index}">${index}</a></li>
                        </#if>
                    </#list>-->

                            <#if (orderList.getTotalPages() > 0)>
                                <li <#if (orderList.getCurrentPage() == 1)>class="disabled"</#if>><a href="/user/order/findorder?currentPage=1">1</a></li>
                            </#if>

                    <#--如果不只有一页-->
                            <#if ((orderList.getTotalPages() > 1))>
                            <#--如果当前页往前查3页不是第2页-->
                                <#if ((orderList.getCurrentPage() - 3) > 2)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--当前页的前3页和后3页-->
                                <#list (orderList.getCurrentPage() - 3)..(orderList.getCurrentPage() + 3) as index>
                                <#--如果位于第一页和最后一页之间-->
                                    <#if (index > 1) && (index < orderList.getTotalPages())>
                                        <li <#if (orderList.getCurrentPage() == index)>class="disabled"</#if>><a href="/user/order/findorder?currentPage=${index}" >${index}</a></li>
                                    </#if>
                                </#list>

                            <#--如果当前页往后查3页不是倒数第2页-->
                                <#if (orderList.getCurrentPage() + 3) < (orderList.getTotalPages() - 1)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--最后页&ndash;&gt;-->
                                <li <#if (orderList.getCurrentPage() == orderList.getTotalPages())>class="disabled"</#if>><a href="/user/order/findorder?currentPage=${orderList.getTotalPages()}" >${orderList.getTotalPages()}</a></li>
                            </#if>

                    <#if orderList.getCurrentPage() gte orderList.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/order/findorder?currentPage=${orderList.getCurrentPage() + 1}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<#--弹窗-->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    提醒
                </h4>
            </div>
            <div class="modal-body">
                你有新的订单
            </div>
            <div class="modal-footer">
                <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="location.reload()" type="button" class="btn btn-primary">查看新的订单</button>
            </div>
        </div>
    </div>
</div>

<#--播放音乐-->
<audio id="notice" loop="loop">
    <source src="/sell/mp3/song.mp3" type="audio/mpeg" />
</audio>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    function _onload() {
        //请求订单列表接口
        
    }
</script>
</body>
</html>