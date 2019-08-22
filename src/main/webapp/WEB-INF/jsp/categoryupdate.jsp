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

   <input type="hidden" name="id" value="${category.id}"><br/>
    名称:<input type="text" name="name" value="${category.name}"><br/>
    父类id:
    <select name="parentId">
        <option value="" style="display: none"></option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
    </select>
<%--    <input type="text" name="parentId" value="${category.parentId}">--%>
    <br/>
    类别状态:
    <select name="status">
        <option value="" style="display: none"></option>
        <option value="1">1-正常</option>
        <option value="2">2-已废弃</option>
    </select>
    <%--<input type="text" name="status" value="${category.status}">--%>
    <br/>
    <input type="submit"  value="确认"><br/>

</form>


</body>
</html>
