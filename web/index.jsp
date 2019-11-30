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
<!DOCTYPE html>
  <head>
    <title>BookStore</title>

    <link type="text/css" rel="styleSheet" href="css/index.css"/>
      <%--      导航样式--%>
      <link rel="stylesheet" href="css/navicat.css">
<%--      搜索框样式--%>
      <link type="text/css" rel="stylesheet" href="css/search-form.css"/>
    <script src="./js/Jquery.js"></script>

  </head>
  <body>
  <%--导航栏--%>
  <%@include file="navicate.jsp"%>
<%--标题--%>
<div class="title">BookStore</div>

<%--占位符--%>
<div class="search_tag">
    <%--  搜索框--%>
    <section class="container">
        <form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="请输入关键字" />
                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
        </form>
    </section>
    <%--云图--%>
    <div id="tagsList">
        <a></a>
        <a></a>
        <a></a>
    </div>
</div>
<%--箭头过渡--%>
  <div style="text-align: center;">
      <img style="max-width: 4%;animation: flag_down 2s infinite linear ;" src="img/index_flag.png">
  </div>
<%--猜你喜欢--%>
<div class="guess_you_like_main">
<div>猜你喜欢</div>
</div>
  <div class="main">

<%--        <div class="good">--%>
<%--            <div class="g_pic">--%>
<%--                <img src="img/1.jpg"/>--%>
<%--            </div>--%>
<%--            <div class="dprice">--%>
<%--            <span class="pre_price">--%>
<%--            ￥120.0--%>
<%--            </span>--%>
<%--                <span class="g_price">--%>
<%--            ￥300.2--%>
<%--            </span>--%>
<%--            </div>--%>
<%--            <div class="g_title">--%>
<%--                这是测试的书籍--%>
<%--            </div>--%>
<%--        </div>--%>

  </div>

  </body>
<%--搜索框--%>
  <script type="text/javascript">

      function searchToggle(obj, evt){
          var container = $(obj).closest('.search-wrapper');
          if(!container.hasClass('active')){
              container.addClass('active');
              evt.preventDefault();
          }
          else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
              container.removeClass('active');
              // clear input
              container.find('.search-input').val('');
              // clear and hide result container when we press close
              container.find('.result-container').fadeOut(100, function(){$(this).empty();});
          }
      }
      // 提交方法
      function submitFn(obj, evt){
          value = $(obj).find('.search-input').val().trim();
          window.location.href='result.jsp?key='+value
          evt.preventDefault();
      }
      //自动联想事件绑定
      $(".search-input").bind("input propertychange", function() {
          $.ajax({
              url: "index/getmindkey?key="+$(".search-input").val(),
              success: function(res){
                  console.log(res);
                  if (res['status'] == 'ok') {
                      info=JSON.parse(res['info']);
                      if (info.length > 0) {
                          tspeed=200000;
                          //刷新元素
                          $("#tagsList").empty();
                          //添加元素
                          for (i = 0; i < info.length; i++) {
                              $("#tagsList").append("<a href='details.jsp?uuid="+info[i]['link']+"'>"+info[i]['key']+"</a>");
                          }
                          tspeed=20;
                      }
                  }
              }});
      });
      //默认自动展开
      setTimeout(function () {
          $(".search-icon").click();
      },800);
  //  首次联想
      $.ajax({
          url: "index/getmindkey?key=计算机",
          async: false,
          success: function(res){
              console.log(res);
              if (res['status'] == 'ok') {
                  info=JSON.parse(res['info']);
                  if (info.length > 0) {
                      tspeed=200000;
                      //刷新元素
                      $("#tagsList").empty();
                      //添加元素
                      for (i = 0; i < info.length; i++) {
                          $("#tagsList").append("<a href='details.jsp?uuid="+info[i]['link']+"'>"+info[i]['key']+"</a>");
                      }
                      tspeed=20;
                  }
              }
          }});
  </script>
<%--云图--%>
<script src="js/tags.js"></script>
<%--猜你喜欢--%>
<script>
    function update_list() {
        $.ajax({
            url:'index/guessyoulike',
            data:{num: 8},
            type:'POST',
            success:function (res) {
                if (res.status == 'ok') {
                    //执行渲染猜你喜欢
                    res = JSON.parse(res.info);
                    var f=$('.main');//父节点添加
                    c=0
                    $.each(res, function(i,val){

                        f.append("<div class=\"good\" id=\"good"+i+"\"></div>");
                        c+=1
                        var n=$("#good"+i);
                        n.append("<div class=\"g_pic\">\n" +
                            "            <img src=\"pic/get?uuid="+val.picture+"\"/>\n" +
                            "        </div>\n" +
                            "        <div class=\"dprice\">\n" +
                            "            <span class=\"pre_price\">\n" +
                            "            ￥"+val.prePrice+"\n" +
                            "            </span>\n" +
                            "            <span class=\"g_price\">\n" +
                            "            ￥"+val.price+"\n" +
                            "            </span>\n" +
                            "        </div>\n" +
                            "        <div class=\"g_title\">\n" +
                            "            "+val.name.substring(0,45)+"" +
                            "        </div>");
                        n.click(function () {
                            window.location.href="details.jsp?uuid="+val.uuid;
                        })
                    });
                }
            }

        })
    }
    //首次加载默认数据
    update_list();





</script>
</html>
