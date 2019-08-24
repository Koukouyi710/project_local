<html>
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

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <a href="/user/product/findproduct"><button type="submit" class="btn btn-default" style="float: right">返回</button></a>
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>商品Id</th>
                            <th>类别Id</th>
                            <th>商品名称</th>
                            <th>商品副标题</th>
                            <th>商品主图</th>
                            <th>图片地址</th>
                        <#--<th>商品详情</th>-->
                            <th>价格</th>
                            <th>库存数量</th>
                            <th>商品状态</th>
                            <th>是否新品</th>
                            <th>是否热门</th>
                            <th>是否轮播</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list SproductList.getList() as product>
                            <tr>
                                <td width="80">${product.id}</td>
                            <#assign checkcategoryId="${product.categoryId}"/>
                            <#if checkcategoryId==0>
                                    <td width="100">${product.categoryId}-无父类</td>
                            </#if>
                            <#list categorylist as category>
                                <#if checkcategoryId==category.id>
                                    <td width="100">${product.categoryId}-${category.name}</td>
                                </#if>
                            </#list>
                            <#--<td>${product.categoryId}</td>-->
                                <td width="100">${product.name}</td>
                                <td width="100">${product.subtitle}</td>
                            <#--<td>${product.mainImage}</td>-->
                                <td><img height="100" width="100" src="http://img.cdn.imbession.top/${product.mainImage}" alt=""></td>
                                <td>${product.subImages}</td>
                            <#-- <td width="200">${product.detail}</td>-->
                                <td width="100">${product.price}</td>
                                <td width="100">${product.stock}</td>
                            <#assign checkstatus="${product.status}"/>
                             <#if checkstatus==1>
                                    <td width="120">${product.status}-在售</td>
                             </#if>
                            <#if checkstatus==2>
                                    <td width="120">${product.status}-下架</td>
                            </#if>
                            <#if checkstatus==3>
                                    <td width="120">${product.status}-删除</td>
                            </#if>

                                <#assign checkisNew="${product.isNew}"/>
                             <#if checkisNew==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisNew==0>
                                    <td width="50">否</td>
                            </#if>
                                <#if checkisNew==null>
                                    <td width="50"> </td>
                                </#if>

                                <#assign checkisHot="${product.isHot}"/>
                             <#if checkisHot==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisHot==0>
                                    <td width="50">否</td>
                            </#if>
                                <#if checkisHot==null>
                                    <td width="50"> </td>
                                </#if>

                                <#assign checkisBanner="${product.isBanner}"/>
                             <#if checkisBanner==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisBanner==0>
                                    <td width="50">否</td>
                            </#if>
                                <#if checkisBanner==null>
                                    <td width="50"> </td>
                                </#if>
                            <#--<td>${product.status}</td>-->
                                <td width="200">${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td width="200">${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                             <#if checkstatus==1>
                                    <td>
                                        <a href="/user/product/productdetail/${product.id}">详情</a>
                                        <a href="/user/product/productupdate/${product.id}">修改</a>
                                    </td>
                                     <td><a href="productdown/${product.id}" >下架</a> </td>

                             </#if>
                            <#if checkstatus==2>
                                  <td>
                                      <a href="/user/product/productdetail/${product.id}">详情</a>
                                      <a href="/user/product/productupdate/${product.id}">修改</a>
                                  </td>
                                     <td>  <a href="productup/${product.id}" >上架</a></td>
                                    <td>   <a href="productdelete/${product.id}" >删除</a></td>
                            </#if>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                <#--分页-->
                    <div class="col-md-12 column">
                        <ul class="pagination pull-right">
                    <#if SproductList.getCurrentPage() lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/product/search?currentPage=${SproductList.getCurrentPage() - 1}">上一页</a></li>
                    </#if>

                        <#--<#list 1..uplist.getTotalPages() as index>
                            <#if uplist.getCurrentPage() == index>
                                <li class="disabled"><a href="#">${index}</a></li>
                            <#else>
                                <li><a href="/user/product/findproduct?currentPageup=${index}">${index}</a></li>
                            </#if>
                        </#list>-->

                            <#if (SproductList.getTotalPages() > 0)>
                                <li <#if (SproductList.getCurrentPage() == 1)>class="disabled"</#if>><a href="/user/product/search?currentPage=1">1</a></li>
                            </#if>

                        <#--如果不只有一页-->
                            <#if ((SproductList.getTotalPages() > 1))>
                            <#--如果当前页往前查3页不是第2页-->
                                <#if ((SproductList.getCurrentPage() - 3) > 2)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--当前页的前3页和后3页-->
                                <#list (SproductList.getCurrentPage() - 3)..(SproductList.getCurrentPage() + 3) as index>
                                <#--如果位于第一页和最后一页之间-->
                                    <#if (index > 1) && (index < SproductList.getTotalPages())>
                                        <li <#if (SproductList.getCurrentPage() == index)>class="disabled"</#if>><a href="/user/product/search?currentPage=${index}" >${index}</a></li>
                                    </#if>
                                </#list>

                            <#--如果当前页往后查3页不是倒数第2页-->
                                <#if (SproductList.getCurrentPage() + 3) < (SproductList.getTotalPages() - 1)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--最后页&ndash;&gt;-->
                                <li <#if (SproductList.getCurrentPage() == SproductList.getTotalPages())>class="disabled"</#if>><a href="/user/product/search?currentPage=${SproductList.getTotalPages()}" >${SproductList.getTotalPages()}</a></li>
                            </#if>

                    <#if SproductList.getCurrentPage() gte SproductList.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/product/search?currentPage=${SproductList.getCurrentPage() + 1}">下一页</a></li>
                    </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>