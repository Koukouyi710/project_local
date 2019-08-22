<html>
<#include "common/header.ftl">

<body>
<div id="wrapper" class="toggled">

    <#--边栏sidebar-->
    <#include "common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <label>在架商品</label>
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
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list uplist.getList() as product>
                        <#if "${product.status}"==1>
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
                                <td><img height="100" width="100" src="${product.mainImage}" alt=""></td>
                                <td width="100">${product.subImages}</td>
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

                                <#assign checkisHot="${product.isHot}"/>
                             <#if checkisHot==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisHot==0>
                                    <td width="50">否</td>
                            </#if>

                                <#assign checkisBanner="${product.isBanner}"/>
                             <#if checkisBanner==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisBanner==0>
                                    <td width="50">否</td>
                            </#if>
                            <#--<td>${product.status}</td>-->
                                <td width="200">${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td width="200">${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td width="50"><a href="/user/product/productupdate/${product.id}">修改</a>
                                    <a href="productdown/${product.id}" >下架</a>
                                </td>
                            </tr>
                        </#if>
                        </#list>
                        </tbody>
                    </table>
                <#--分页-->
                    <div class="col-md-12 column">
                        <ul class="pagination pull-right">
                    <#if uplist.getCurrentPage() lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/product/findproduct?currentPageup=${uplist.getCurrentPage() - 1}">上一页</a></li>
                    </#if>

                    <#--<#list 1..uplist.getTotalPages() as index>
                        <#if uplist.getCurrentPage() == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/product/findproduct?currentPageup=${index}">${index}</a></li>
                        </#if>
                    </#list>-->

                            <#if (uplist.getTotalPages() > 0)>
                                <li <#if (uplist.getCurrentPage() == 1)>class="disabled"</#if>><a href="/user/product/findproduct?currentPageup=1">1</a></li>
                            </#if>

                        <#--如果不只有一页-->
                            <#if ((uplist.getTotalPages() > 1))>
                            <#--如果当前页往前查3页不是第2页-->
                                <#if ((uplist.getCurrentPage() - 3) > 2)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--当前页的前3页和后3页-->
                                <#list (uplist.getCurrentPage() - 3)..(uplist.getCurrentPage() + 3) as index>
                                <#--如果位于第一页和最后一页之间-->
                                    <#if (index > 1) && (index < uplist.getTotalPages())>
                                        <li <#if (uplist.getCurrentPage() == index)>class="disabled"</#if>><a href="/user/product/findproduct?currentPageup=${index}" >${index}</a></li>
                                    </#if>
                                </#list>

                            <#--如果当前页往后查3页不是倒数第2页-->
                                <#if (uplist.getCurrentPage() + 3) < (uplist.getTotalPages() - 1)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--最后页&ndash;&gt;-->
                                <li <#if (uplist.getCurrentPage() == uplist.getTotalPages())>class="disabled"</#if>><a href="/user/product/findproduct?currentPageup=${uplist.getTotalPages()}" >${uplist.getTotalPages()}</a></li>
                            </#if>

                    <#if uplist.getCurrentPage() gte uplist.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/product/findproduct?currentPageup=${uplist.getCurrentPage() + 1}">下一页</a></li>
                    </#if>
                        </ul>
                    </div>


                    <label>未上架商品</label>
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
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list downlist.getList() as product>
                        <#if "${product.status}"==2>
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
                                <td><img height="100" width="100" src="${product.mainImage}" alt=""></td>
                                <td width="100">${product.subImages}</td>
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

                                <#assign checkisHot="${product.isHot}"/>
                             <#if checkisHot==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisHot==0>
                                    <td width="50">否</td>
                            </#if>

                                <#assign checkisBanner="${product.isBanner}"/>
                             <#if checkisBanner==1>
                                    <td width="50">是</td>
                             </#if>
                            <#if checkisBanner==0>
                                    <td width="50">否</td>
                            </#if>

                            <#--<td>${product.status}</td>-->
                                <td width="200">${product.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td width="200">${product.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                <td width="50"><a href="/user/product/productupdate/${product.id}">修改</a>
                                    <a href="productup/${product.id}" >上架</a>
                                    <a href="productdelete/${product.id}" >删除</a>
                                </td>
                            </tr>
                        </#if>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                            <#if downlist.getCurrentPage() lte 1>
                                <li class="disabled"><a href="#">上一页</a></li>
                            <#else>
                                <li><a href="/user/product/findproduct?currentPagedown=${downlist.getCurrentPage() - 1}">上一页</a></li>
                            </#if>
                     <#--下面的这段适合于总页数比较少的分页-->
                     <#--<#list 1..downlist.getTotalPages() as index >
                         <#if downlist.getCurrentPage() == index>
                             <li class="disabled"><a href="#">${index}</a></li>
                         <#else>
                             <li><a href="/user/product/findproduct?currentPagedown=${index}">${index}</a></li>
                         </#if>
                     </#list>-->


                    <#--&lt;#&ndash; 以下为带省略号分页 &ndash;&gt;
                    &lt;#&ndash;第一页&ndash;&gt;-->
                            <#if (downlist.getTotalPages() > 0)>
                                <li <#if (downlist.getCurrentPage() == 1)>class="disabled"</#if>><a href="/user/product/findproduct?currentPagedown=1">1</a></li>
                            </#if>

                    <#--如果不只有一页-->
                            <#if ((downlist.getTotalPages() > 1))>
                            <#--如果当前页往前查3页不是第2页-->
                                <#if ((downlist.getCurrentPage() - 3) > 2)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--当前页的前3页和后3页-->
                                <#list (downlist.getCurrentPage() - 3)..(downlist.getCurrentPage() + 3) as index>
                                <#--如果位于第一页和最后一页之间-->
                                    <#if (index > 1) && (index < downlist.getTotalPages())>
                                        <li <#if (downlist.getCurrentPage() == index)>class="disabled"</#if>><a href="/user/product/findproduct?currentPagedown=${index}" >${index}</a></li>
                                    </#if>
                                </#list>

                            <#--如果当前页往后查3页不是倒数第2页-->
                                <#if (downlist.getCurrentPage() + 3) < (downlist.getTotalPages() - 1)>
                                    <li><span class="text">…</span></li>
                                </#if>

                            <#--最后页&ndash;&gt;-->
                                <li <#if (downlist.getCurrentPage() == downlist.getTotalPages())>class="disabled"</#if>><a href="/user/product/findproduct?currentPagedown=${downlist.getTotalPages()}" >${downlist.getTotalPages()}</a></li>
                            </#if>


                            <#if downlist.getCurrentPage() gte downlist.getTotalPages()>
                                <li class="disabled"><a href="#">下一页</a></li>
                            <#else>
                                <li><a href="/user/product/findproduct?currentPagedown=${downlist.getCurrentPage() + 1}">下一页</a></li>
                            </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>