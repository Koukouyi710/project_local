<%--
  Created by IntelliJ IDEA.
  User: Neuedu
  Date: 2019/8/6
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"  language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>修改类别</h1>



<form action="" method="post">

   <input type="hidden" name="id" value="${user.id}"><br/>
    用户名:<input type="text" name="username" value="${user.username}"><br/>
    用户密码:<input type="text" name="password" value="${user.password}"><br/>
    email:<input type="text" name="email" value="${user.email}"><br/>
    phone:<input type="text" name="phone" value="${user.phone}"><br/>
    找回密码问题:<input type="text" name="question" value="${user.question}"><br/>
    找回密码答案:<input type="text" name="answer" value="${user.answer}"><br/>
    角色:
    <%--<input type="text" name="role" value="${user.role}">--%>
    <select name="role">
        <option value="" style="display: none"></option>
        <option value="0">0-管理员</option>
        <option value="1">1-普通用户</option>
    </select>
    <br/>
    <input type="submit"  value="确认"><br/>

</form>


</body>
</html>
