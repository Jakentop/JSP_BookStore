<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="jaken.sql.SqlSessionFactoryUtil" %><%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/28
  Time: 13:30
  To change this template use File | Settings | File Templates.
  这是搜索结果页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--    引用JSTL标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="styleSheet" href="css/order.css"/>
    <%--      导航样式--%>
    <link rel="stylesheet" href="css/navicat.css">


</head>
<body>
<%--导航栏--%>
<%@include file="navicate.jsp" %>
<%--占位符--%>
<div style="margin-top: 100px;"></div>


<%--标题--%>
<div class="title">
    <div class="t_text">订单信息</div>
    <div class="t_hr"></div>
</div>

<div class="main">
    <%--    渲染搜索结果--%>
<%--    <c:set var="books" value="<%=books%>" scope="page" />--%>
<%--    <c:forEach var="item" items="${books}">--%>
        <div class="good">
            <div class="left">
                <img src="pic/get?uuid=${item.getPicture()}" alt=""/>
            </div>
            <div class="right">
                    <a href="details.jsp?uuid=${item.getUuid()}" class="btitle">
                        ${item.getName()}
                    </a>
                    <div class="bprice">
                        <span style="font-size: 16px;text-decoration: line-through;color: grey;">原价：￥${item.getPrice()}</span>
                        <span>现价：￥${item.getPrePrice()}</span>
                    </div>
            </div>
        </div>
<%--    </c:forEach>--%>


</div>
</body>
</html>
