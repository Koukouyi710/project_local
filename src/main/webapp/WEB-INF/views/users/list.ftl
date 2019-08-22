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
                            <th>id</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>email</th>
                            <th>phone</th>
                            <th>找回密码问题</th>
                            <th>找回密码答案</th>
                            <th>角色</th>
                            <th>创建时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list userlist as user>
                        <#assign checkrole="${user.role}"/>
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.question}</td>
                            <td>${user.answer}</td>
                            <#if checkrole==0>
                                <td>${user.role}-管理员</td>
                            </#if>
                            <#if checkrole==1>
                                <td>${user.role}-普通用户</td>
                            </#if>
                            <#--<td>${user.role}</td>-->
                            <td>${user.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${user.updateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>
                                <a href="/user/updateuser/${user.id}" >修改</a>
                                <a href="deleteuser/${user.id}" >删除</a>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>