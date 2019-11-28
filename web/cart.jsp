<%@ page import="model.cCartBook" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="jaken.sql.SqlSessionFactoryUtil" %><%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/19
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!List<cCartBook> cCartBooks;%>
<%
    //注意添加拦截器
    //获取购物车信息
    User user = (User) session.getAttribute("user");
    SqlSession session1 = SqlSessionFactoryUtil.openSqlSession();
    cCartBooks = session1.selectList("jaken.sql.cart.getList", user.getId());
%>
<html>
  <head>
    <title><%=((User)session.getAttribute("user")).getUserName()%>的购物车</title>

<%--      导航样式--%>
      <link rel="stylesheet" href="css/navicat.css">
<%--      搜索框样式--%>
      <link type="text/css" rel="stylesheet" href="css/search-form.css"/>
      <link type="text/css" rel="styleSheet" href="css/cartreset.css"/>
      <link type="text/css" rel="styleSheet" href="css/cart.css"/>
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
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>
        <!-- 购物车渲染区域 -->
        <div class="cartBox">
            <div class="order_content">
                <c:set var="cCartBooks" value="<%=cCartBooks%>"/>
                <c:forEach var="item" items="${cCartBooks}" >
                    <c:set var="book" value="${item.uuid}"/>
                    <ul class="order_lists">
<%--                        选择区域--%>
                    <li class="list_chk">
                        <input type="checkbox" id="${item.getId()}" class="son_check">
                        <label for="${item.getId()}"></label>
                    </li>
                    <li class="list_con">
                        <%-- 图片区域--%>
                        <div class="list_img"><a href="javascript:;"><img src="pic/get?uuid=${book.getPicture()}" alt=""></a></div>
<%--                        文字区域--%>
                            <div class="list_text"><a href="details.jsp?uuid=${bool.getUuid()}">${book.getName()}</a></div>
                    </li>
                    <li class="list_info">
<%--                        商品参数--%>
                        <p>规格：默认</p>
                        <p>数量：1</p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥${book.getPrice()}</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
<%--                            这是数量--%>
                            <input type="text" value="1" id="sum_${item.getId()}" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥${book.getPrice()}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
                </c:forEach>
            </div>
        </div>
<div style="margin-bottom: 100px;"></div>
        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a href="javascript:;">结算</a></div>
            </div>
        </div>
    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
    <script src="./js/carts.js"></script>
</div>

  </body>
<script>
<%--    结算事件--%>
$(".calBtn").click(function () {
    // 获取当前选中的事件

    //获取当前选中的值
    d=new Array()

    $('.son_check').siblings("[class=mark]").each(function(){
        d.push(
            {
                'id':$(this).attr('for'),
            'amounts':$('#sum_'+$(this).attr('for')).val()
            }
        );
    })
    console.log(d);
    $.ajax({
        url:'order/create',
        data:{
            data:JSON.stringify(d)
        },
        type:"POST",
        success: function (res) {
            console.log(res);
            if (res.status == 'ok') {
                alert("提交完成");
            //    刷新页面
                location.reload();
            }

        }


    })

});
</script>
</html>
