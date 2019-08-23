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
                    <div class="col-md-12 column">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>收货人姓名</th>
                                <th>固定电话</th>
                                <th>移动电话</th>
                                <th>省份</th>
                                <th>城市</th>
                                <th>区/县</th>
                                <th>详细地址</th>
                                <th>邮编</th>
                            </tr>
                            </thead>
                            <tbody>
                        <tr>
                            <td id="receiverName">${shipping.receiverName}</td>
                            <td id="receiverPhone">${shipping.receiverPhone}</td>
                            <td id="receiverMobile">${shipping.receiverMobile}</td>
                            <td id="receiverProvince">${shipping.receiverProvince}</td>
                            <td id="receiverCity">${shipping.receiverCity}</td>
                            <td id="receiverDistrict">${shipping.receiverDistrict}</td>
                            <td id="receiverAddress">${shipping.receiverAddress}</td>
                            <td id="receiverZip">${shipping.receiverZip}</td>
                        </tr>
                            </tbody>
                        </table>
                        <div class="form-group">
                            <a href="" class="btn btn-info">修改地址</a>
                            <a href="/user/order/findorder"><button type="submit" class="btn btn-default" style="float: right">返回</button></a>
                        </div>
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