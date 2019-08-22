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
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>类别名称</label>
                            <input type="text" name="name" class="form-control" value="${category.name}"/>
                        </div>
                     <#assign checkparentId="${category.parentId}"/>
                        <div class="form-group">
                            <label>父类id</label>
                            <select name="parentId" class="form-control">
                                    <option value="0">无父类</option>
                                    <#list categorylist as category>
                                    <option value="${category.id}"
                                    <#if (category.id)??&&checkparentId==category.id>
                                            selected
                                    </#if>
                                    >${category.id}-${category.name}</option>
                                <#--<option value="" style="display: none"></option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>-->
                                </#list>
                            </select>
                        </div>
                        <#assign checkstatus="${category.status}"/>
                        <div class="form-group">
                            <label>类别状态</label>
                            <select name="status" class="form-control">
                                <option value="1"
                                  <#if checkstatus==1>
                                            selected
                                  </#if>
                                >1-正常</option>
                                <option value="2"
                                <#if checkstatus==2>
                                            selected
                                </#if>
                                >2-已废弃</option>
                            </select>
                        </div>

                        <input type="hidden" name="id" value="${category.id}"><br/>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>