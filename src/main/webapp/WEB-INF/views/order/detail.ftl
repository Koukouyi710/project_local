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

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            查看地址
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">地址详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">收货人</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverName}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">固定电话</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverPhone}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">移动电话</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverMobile}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">省份</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverProvince}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">城市</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverCity}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">区/县</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverDistrict}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">详细地址</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverAddress}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">邮编</label>
                                            <div class="col-sm-10">
                                                <p class="form-control-static">${orderVO.shippingVo.receiverZip}</p>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                <#if orderVO.status == 20>
                    <a href="/user/order/send/${order.id}" type="button" class="btn btn-default btn-primary">订单发货</a>
                </#if>
                    <#if orderVO.status == 10>
                     <a href="" class="btn btn-info" data-toggle="modal" data-target="#upModal">修改地址</a>

                    <!-- Modal -->
                        <div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">修改地址</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/user/order/shippingupdate" method="post" role="form">
                                            <input type="hidden" name="id" value="${order.shippingId}">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">收货人</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverName}" name="receiverName">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">固定电话</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverPhone}" name="receiverPhone">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">移动电话</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverMobile}" name="receiverMobile">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">省份</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverProvince}" name="receiverProvince">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">城市</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverCity}" name="receiverCity">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">区/县</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverDistrict}" name="receiverDistrict">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">详细地址</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverAddress}" name="receiverAddress">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">邮编</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="${orderVO.shippingVo.receiverZip}" name="receiverZip">
                                                </div>
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">提交</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>

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