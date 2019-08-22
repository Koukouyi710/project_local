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
                            <label>用户名</label>
                            <input type="text" name="username" value="${user.username}" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label>用户密码</label>
                            <input type="text" name="password"  class="form-control" value="" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label>email</label>
                            <input type="text" name="email" class="form-control"  value="${user.email}">
                        </div>

                        <div class="form-group">
                            <label>phone</label>
                            <input type="text" name="phone" class="form-control"  value="${user.phone}">
                        </div>

                        <div class="form-group">
                            <label>找回密码问题</label>
                            <input type="text" name="question"  class="form-control" value="${user.question}">
                        </div>

                        <div class="form-group">
                            <label>找回密码答案</label>
                            <input type="text" name="answer" class="form-control"  value="${user.answer}">
                        </div>
                        <#assign checkrole="${user.role}"/>
                        <div class="form-group">
                            <label>角色</label>
                            <select name="role" class="form-control">
                                <option value="0"
                                <#if checkrole==0>
                                            selected
                                </#if>
                                >0-管理员</option>
                                <option value="1"
                                <#if checkrole!=0>
                                            selected
                                </#if>
                                >1-普通用户</option>
                            </select>
                        </div>

                        <input type="hidden" name="id" class="form-control" value="${user.id}"><br/>
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