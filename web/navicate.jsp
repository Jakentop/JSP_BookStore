<%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/26
  Time: 20:49
  To change this template use File | Settings | File Templates.
  这是用于导入的标题的模板
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--    引用JSTL标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navigate">
    <%--    标题Github区域--%>
    <div class="github"></div>
    <%--登录、注册区域--%>
    <div class="func">
        <c:if test="${sessionScope.user==null}" var="login_flag"><%--未登录用户--%>
            <a href="login.jsp">登录</a>
            <a href="register.jsp">注册</a>

        </c:if><%--    登录用户--%>
        <c:if test="${not login_flag}">
            <a href="index.jsp">欢迎！&nbsp;<c:out value="${sessionScope.user.getUserName()}"></c:out> </a>
            <a href="cart.jsp">购物车</a>
            <a href="user/logout">退出</a>
        </c:if>
    </div>
</div>