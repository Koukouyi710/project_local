<html>
<#include  "common/header.ftl">

<body>
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
                            <th>类别Id</th>
                            <th>类别名称</th>
                            <th>所属父类</th>
                            <th>类别状态</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list pagelist.getList() as category>
                        <#assign checkparentId="${category.parentId}"/>
                        <tr>
                            <td>${category.id}</td>
                            <td>${category.name}</td>
                            <#list categorylist as category1>
                                <#if checkparentId==category1.id>
                                    <td>${category.parentId}-${category1.name}</td>
                                </#if>
                            </#list>
                            <#if checkparentId==0>
                                    <td>${category.parentId}-无父类</td>
                            </#if>
                            <#--<td>${category.parentId}</td>-->
                            <#assign checkstatus="${category.status}"/>
                             <#if checkstatus==1>
                                    <td>${category.status}-正常</td>
                             </#if>
                            <#if checkstatus==2>
                                    <td>${category.status}-已废弃</td>
                            </#if>
                            <#--<td>${category.status}</td>-->
                            <td>${category.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${category.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td><a href="/user/category/update/${category.id}">修改</a>
                                <a href="delete/${category.id}" >删除</a></td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                <#--分页-->
                    <div class="col-md-12 column">
                        <ul class="pagination pull-right">
                    <#if pagelist.getCurrentPage() lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/category/find?currentPage=${pagelist.getCurrentPage() - 1}">上一页</a></li>
                    </#if>

                    <#list 1..pagelist.getTotalPages() as index>
                        <#if pagelist.getCurrentPage() == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/category/find?currentPage=${index}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if pagelist.getCurrentPage() gte pagelist.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/category/find?currentPage=${pagelist.getCurrentPage() + 1}">下一页</a></li>
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