<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/7
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"  language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <th>id</th>
    <th>用户名</th>
    <th>密码</th>
    <th>email</th>
    <th>phone</th>
    <th>找回密码问题</th>
    <th>找回密码答案</th>
    <th>角色</th>
    <th>创建时间</th>
    <th>最后一次更新时间</th>
    <th>操作</th>
    </thead>
    <a href="useradd" >添加</a>
    <c:forEach items="${userlist}" var="user">

        <tr>
            <th>${user.id}</th>
            <th>${user.username}</th>
            <th>${user.password}</th>
            <th>${user.email}</th>
            <th>${user.phone}</th>
            <th>${user.question}</th>
            <th>${user.answer}</th>
            <th>${user.role}</th>
            <th>${user.createTime}</th>
            <th>${user.updateTime}</th>
            <th>
                <a href="updateuser/${user.id}" >修改</a>
                <a href="deleteuser/${user.id}" >删除</a>
            </th>
        </tr>


    </c:forEach>


</table>


</body>
</html>
