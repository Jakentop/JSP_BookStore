<%@ page import="model.cCartBook" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/19
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title><%=((User)session.getAttribute("user")).getUserName()%>的购物车</title>
    <link type="text/css" rel="styleSheet" href="css/cart.css"/>
<%--      导航样式--%>
      <link rel="stylesheet" href="css/navicat.css">
<%--      搜索框样式--%>
      <link type="text/css" rel="stylesheet" href="css/search-form.css"/>
    <script src="./js/Jquery.js"></script>
<%--    引用JSTL标签库--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  </head>
  <body>
<%--导航栏--%>
<%@include file="navicate.jsp"%>

<%--标题--%>
<div class="title">
    <div class="t_text">购物车</div>
    <div class="t_hr"></div>
</div>

<%--购物车--%>
<div class="car_main">
<div class="good">
<div class="g_pic">
    <img src="img/1.jpg" alt="">
</div>
    <div class="g_nam">
        这里是书籍的名称这里是书籍的名称这里是书籍的名称这里是书籍的名称这里是书籍的名称这里是书籍的名称这里是书籍的名称
    </div>
    <div class="g_price">
        ￥120.00
    </div>
    <div class="g_price">
        ￥120.00
    </div>

</div>
</div>

  </body>

</html>
