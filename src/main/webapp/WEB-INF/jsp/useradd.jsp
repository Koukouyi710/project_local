<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/7
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"  language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<h1>添加类别</h1>



<form action="" method="post">

    用户名:<input type="text" name="username"><br/>
    用户密码:<input type="text" name="password"><br/>
    email:<input type="text" name="email"><br/>
    phone:<input type="text" name="phone"><br/>
    找回密码问题:<input type="text" name="question"><br/>
    找回密码答案:<input type="text" name="answer"><br/>
    角色:
    <%--<input type="text" name="role">--%>
    <select name="role">
        <option value="0">0-管理员</option>
        <option value="1" selected = "selected" >1-普通用户</option>
    </select>
    <br/>
    <input type="submit"  value="添加"><br/>

</form>

</body>
</html>