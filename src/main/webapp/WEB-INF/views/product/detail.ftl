<html xmlns="http://www.w3.org/1999/html">
<#include "common/header.ftl">
<head>
    <style type="text/css">
        table{
            table-layout: fixed;/*只有定义表格的算法为fixed,th才有效果*/
            border-collapse: collapse;/*边框合并模式*/
        }
        table tr th{
            overflow:hidden;/*超出的文字隐藏*/
            text-overflow:ellipsis;/*文字超出后,显示省略号*/
            white-space:nowrap;/*文字不换行*/
            word-break:keep-all;/*文字不换行*/
        }
        table tr td{
            overflow:hidden;/*超出的文字隐藏*/
            text-overflow:ellipsis;/*文字超出后,显示省略号*/
        }
    </style>
</head>
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--返回框-->
    <div aria-label="返回顶部" style="width: 100px;height:100px;background-color: #ff730e;position: fixed"></div>

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <a href="/user/product/findproduct"><button type="submit" class="btn btn-default" style="float: right">返回</button></a>
                <div class="col-md-12 column">
                    <div>${product.detail}</div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>