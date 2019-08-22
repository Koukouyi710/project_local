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



<form action="" method="post" enctype="multipart/form-data">

    <input type="hidden" name="id" value="${product.id}"><br/>
    类别Id:
    <%--<input type="text" name="categoryId" value="${product.categoryId}">--%>
    <select name="categoryId">
        <option value="" style="display: none"></option>
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
    </select>
    <br/>
    商品名称:<input type="text" name="name" value="${product.name}"><br/>
    商品副标题:<input type="text" name="subtitle" value="${product.subtitle}"><br/>
    图片上传：<input type="file" name="picfile"></br>
    商品详情:<input type="text" name="detail" value="${product.detail}"><br/>
    价格:<input type="text" name="price" value="${product.price}"><br/>
    库存数量:<input type="text" name="stock" value="${product.stock}"><br/>
    商品状态:
    <%--<input type="text" name="status" value="${product.status}">--%>
    <select name="status">
        <option value="" style="display: none"></option>
        <option value="1">1-在售</option>
        <option value="2">2-下架</option>
        <option value="3">3-删除</option>
    </select>
    <br/>
    <input type="submit"  value="确认"><br/>

</form>


</body>
</html>
