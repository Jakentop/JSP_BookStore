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
    <title>BookStore</title>
    <link type="text/css" rel="styleSheet" href="css/index.css"/>
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
        <a href="#/Article.aspx?kid=1" title="星级评分">星级评分</a>
        <a href="#/Article.aspx?kid=2" title="层特效">层特效</a>
        <a href="#/Article.aspx?kid=3" title="关键字">关键字</a>
        <a href="#/Article.aspx?kid=4" title="拖拽">拖拽</a>
        <a href="#/Article.aspx?kid=5" title="分页插件">分页插件</a>
        <a href="#/Article.aspx?kid=6" title="时间插件">时间插件</a>
        <a href="#/Article.aspx?kid=7" title="弹出层">弹出层</a>
        <a href="#/Article.aspx?kid=8" title="数据统计">数据统计</a>
        <a href="#/Article.aspx?kid=9" title="HTML5">HTML5</a>
        <a href="#/Article.aspx?kid=10" title="置顶特效">置顶特效</a>
        <a href="#/Article.aspx?kid=11" title="选项卡">选项卡</a>
        <a href="#/Article.aspx?kid=12" title="导航菜单">导航菜单</a>
        <a href="#/Article.aspx?kid=13" title="原创">原创</a>
        <a href="#/Article.aspx?kid=14" title="动画插件">动画插件</a>
        <a href="#/Article.aspx?kid=15" title="实用特效">实用特效</a>
        <a href="#/Article.aspx?kid=16" title="table插件">table插件</a>
        <a href="#/Article.aspx?kid=17" title="文字特效">文字特效</a>
        <a href="#/Article.aspx?kid=18" title="图片特效">图片特效</a>
        <a href="#/Article.aspx?kid=19" title="在线客服">在线客服</a>
        <a href="#/Article.aspx?kid=20" title="瀑布流">瀑布流</a>
        <a href="#/Article.aspx?kid=21" title="网友蘑菇">网友蘑菇</a>
    </div>

</div>

<%--猜你喜欢--%>
<div class="guess_you_like_main">
<div>猜你喜欢</div>
</div>
  <div class="main">
    <div class="good">
        <div class="g_pic">
            <img src="img/1.jpg"/>
        </div>
        <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
            <span class="g_price">
            ￥300.2
            </span>
        </div>
        <div class="g_title">
            这是测试的书籍
        </div>
    </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
      <div class="good">
          <div class="g_pic">
              <img src="img/1.jpg"/>
          </div>
          <div class="dprice">
            <span class="pre_price">
            ￥120.0
            </span>
              <span class="g_price">
            ￥300.2
            </span>
          </div>
          <div class="g_title">
              这是测试的书籍
          </div>
      </div>
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

          _html = "Yup yup! Your search text sounds like this: ";
          if(!value.length){
              _html = "Yup yup! Add some text friend :D";
          }
          else{
              _html += "<b>" + value + "</b>";
          }

          $(obj).find('.result-container').html('<span>' + _html + '</span>');
          $(obj).find('.result-container').fadeIn(100);

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
                              $("#tagsList").append("<a href='"+info[i]['link']+"'>"+info[i]['key']+"</a>");
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

  </script>
<%--云图--%>
<script src="js/tags.js"></script>
</html>
