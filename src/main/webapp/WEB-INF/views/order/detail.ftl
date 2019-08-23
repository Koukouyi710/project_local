<html>
<#include "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">


    <#--主要内容content-->
        <div id="page-content-wrapper">
            <div class="container">
                <div class="row clearfix">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>订单总金额</th>
                                <th>支付方式</th>
                                <th>订单状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td id="orderNo">${orderVO.orderNo}</td>
                                <td id="payment">${orderVO.payment}</td>
                                <td id="paymentType">${orderVO.paymentTypeDesc}</td>
                                <td id="status">${orderVO.statusDesc}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                <#--订单详情表数据-->
                    <div class="col-md-12 column">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>商品id</th>
                                <th>商品名称</th>
                                <th>商品主图</th>
                                <th>价格</th>
                                <th>数量</th>
                                <th>总额</th>
                            </tr>
                            </thead>
                            <tbody>
                        <#list orderVO.orderItemVoList as orderDetail>
                        <tr>
                            <td id="productId">${orderDetail.productId}</td>
                            <td id="productName">${orderDetail.productName}</td>
                            <td id="productImage"><img src="http://img.cdn.imbession.top/${orderDetail.productImage}" width="150px"></td>
                            <td id="currentUnitPrice">${orderDetail.currentUnitPrice}</td>
                            <td id="quantity">${orderDetail.quantity}</td>
                            <td id="totalPrice">${orderDetail.totalPrice}</td>
                        </tr>
                        </#list>
                            </tbody>
                        </table>
                    </div>

                <#--操作-->
                    <div class="col-md-12 column">
                <#if orderVO.status == 20>
                    <a href="/user/order/send/${order.id}" type="button" class="btn btn-default btn-primary">订单发货</a>
                </#if>
                    <#if orderVO.status == 10>
                     <a href="" class="btn btn-info">修改地址</a>
                    <a href="/user/order/cancel/${order.id}" type="button" class="btn btn-default btn-danger">取消订单</a>
                        </#if>
                        <a href="/user/order/findorder"><button type="submit" class="btn btn-default" style="float: right">返回</button></a>
                    </div>
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
</body>
</html>