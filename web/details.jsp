<%@ page import="model.Book" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="jaken.sql.SqlSessionFactoryUtil" %>
<%@ page import="com.sun.javafx.image.BytePixelSetter" %><%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/28
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!Book book;%>
<%
    //获取书籍详细信息
    String uuid = request.getParameter("uuid");
    if (uuid.length() == 32) {

        SqlSession session1 = SqlSessionFactoryUtil.openSqlSession();
        book = session1.selectOne("jaken.sql.book.FindByID", uuid);
    } else if (book == null) {
        book = new Book();
    }
%>
<html>
<head>
    <title><%=book.getName().substring(0, 10)%>详细页面</title>
    <link type="text/css" rel="styleSheet" href="css/details.css"/>
    <%--      导航样式--%>
    <link rel="stylesheet" href="css/navicat.css">
    <%--      搜索框样式--%>
    <link type="text/css" rel="stylesheet" href="css/search-form.css"/>
    <script src="./js/Jquery.js"></script>
    <%--    弹窗组件>--%>
    <link rel="stylesheet" type="text/css" href="css/iziModal.css">
    <script src="js/iziModal.min.js" type="text/javascript"></script>
</head>
<body>
<%--导航栏--%>
<%@include file="navicate.jsp" %>
<%--占位符--%>
<div style="margin-top:80px;"></div>

<%--主体--%>
<div class="main">
    <div class="title"><%=book.getName()%>
    </div>

    <div class="maininfo">
        <div class="pic">
            <img src="pic/get?uuid=<%=book.getPicture()%>"/>
        </div>
        <div class="rightinfo">
            <div class="bname">
                <%
                    if (book.getLongname().compareTo("") != 0)
                        out.print(book.getLongname());
                    else out.print(book.getName());
                %>
            </div>
            <div class="price">
                <span style="color:grey;text-decoration:line-through;">原价：￥<%=book.getPrePrice()%></span>
                <span>现价：￥<%=book.getPrice()%></span>
            </div>
            <%--            加入购物车--%>
            <div class="addbutton">
                <a href="#" id="append">加入购物车</a>
            </div>
            <div class="pub_author">
                <div>作者：<%=book.getAuthor()%>
                </div>
                <div>出版商：<%=book.getPub()%>
                </div>
                <div>出版日期：<%=book.getPubDate()%>
                </div>
            </div>
        </div>
    </div>

    <div class="bbrief">
        简介：<%
        if (book.getBrief().compareTo("") != 0) {
            out.print(book.getBrief());
        } else out.print("暂无简介");
    %>
    </div>
</div>

<%--模态窗口--%>
<div id="modal-alert" class="iziModal"></div>
</body>
<script>
    $("#append").click(function (e) {
        e.preventDefault();
        $.ajax({
            url: 'cart/addone',
            type: "POST",
            data: {
                uuid: '<%=book.getUuid()%>',
                amounts: 1
            },
            success: function (res) {
                if (res.status === 'ok') {
                    alert("添加成功");
                }
            }
        })

    });
</script>
</html>
