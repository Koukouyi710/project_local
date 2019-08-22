<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/7
  Time: 1:07
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

    类别名称:<input type="text" name="name"><br/>
    父类id:
    <%--<input type="text" name="parentId">--%>
    <select name="parentId">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
    </select>
    <br/>
    类别状态:
    <%--<input type="text" name="status">--%>
    <select name="status">
        <option value="1">1-正常</option>
        <option value="2">2-已废弃</option>
    </select>
    <br/>
    排序编号:<input type="text" name="sort_order"><br/>
    <input type="submit"  value="添加"><br/>

</form>

</body>
</html>
