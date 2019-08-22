<%--
  Created by IntelliJ IDEA.
  User: Neuedu
  Date: 2019/8/6
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8"  language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>

    <table>
       <thead>
            <th>商品Id</th>
            <th>类别Id</th>
            <th>商品名称</th>
            <th>商品副标题</th>
            <th>商品主图</th>
            <th>图片地址</th>
            <th>商品详情</th>
            <th>价格</th>
            <th>库存数量</th>
            <th>商品状态</th>
            <th>创建时间</th>
            <th>修改时间</th>
            <th>操作</th>
       </thead>
        <a href="productadd" >添加</a>
        <c:forEach items="${productlist}" var="product">

         <tr>
             <th>${product.id}</th>
             <th>${product.categoryId}</th>
             <th>${product.name}</th>
             <th>${product.subtitle}</th>
             <th>${product.mainImage}</th>
             <th>${product.subImages}</th>
             <th>${product.detail}</th>
             <th>${product.price}</th>
             <th>${product.stock}</th>
             <th>${product.status}</th>
             <th>${product.createTime}</th>
             <th>${product.updateTime}</th>
             <th>
                 <a href="productupdate/${product.id}" >修改</a>
                 <a href="productdelete/${product.id}" >删除</a>
             </th>
         </tr>

        </c:forEach>


    </table>



</head>
<body>




</body>
</html>
