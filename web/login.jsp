<%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/21
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link type="text/css" rel="styleSheet" href="css/login.css"/>
    <script src="./js/Jquery.js"></script>
    <style type="text/css">
        *{margin:0;padding:0;}

        .slideshow {
            position: absolute;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }

        .slideshow-image {
            position: absolute;
            width: 100%;
            height: 100%;
            background: no-repeat 50% 50%;
            background-size: cover;
            -webkit-animation-name: kenburns;
            animation-name: kenburns;
            -webkit-animation-timing-function: linear;
            animation-timing-function: linear;
            -webkit-animation-iteration-count: infinite;
            animation-iteration-count: infinite;
            -webkit-animation-duration: 16s;
            animation-duration: 16s;
            opacity: 1;
            -webkit-transform: scale(1.2);
            transform: scale(1.2);
        }
        .slideshow-image:nth-child(1) {
            -webkit-animation-name: kenburns-1;
            animation-name: kenburns-1;
            z-index: 3;
        }
        .slideshow-image:nth-child(2) {
            -webkit-animation-name: kenburns-2;
            animation-name: kenburns-2;
            z-index: 2;
        }
        .slideshow-image:nth-child(3) {
            -webkit-animation-name: kenburns-3;
            animation-name: kenburns-3;
            z-index: 1;
        }
        .slideshow-image:nth-child(4) {
            -webkit-animation-name: kenburns-4;
            animation-name: kenburns-4;
            z-index: 0;
        }

        @-webkit-keyframes kenburns-1 {
            0% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            1.5625% {
                opacity: 1;
            }
            23.4375% {
                opacity: 1;
            }
            26.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            98.4375% {
                opacity: 0;
                -webkit-transform: scale(1.21176);
                transform: scale(1.21176);
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes kenburns-1 {
            0% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            1.5625% {
                opacity: 1;
            }
            23.4375% {
                opacity: 1;
            }
            26.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            98.4375% {
                opacity: 0;
                -webkit-transform: scale(1.21176);
                transform: scale(1.21176);
            }
            100% {
                opacity: 1;
            }
        }
        @-webkit-keyframes kenburns-2 {
            23.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            26.5625% {
                opacity: 1;
            }
            48.4375% {
                opacity: 1;
            }
            51.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
        }
        @keyframes kenburns-2 {
            23.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            26.5625% {
                opacity: 1;
            }
            48.4375% {
                opacity: 1;
            }
            51.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
        }
        @-webkit-keyframes kenburns-3 {
            48.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            51.5625% {
                opacity: 1;
            }
            73.4375% {
                opacity: 1;
            }
            76.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
        }
        @keyframes kenburns-3 {
            48.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            51.5625% {
                opacity: 1;
            }
            73.4375% {
                opacity: 1;
            }
            76.5625% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
        }
        @-webkit-keyframes kenburns-4 {
            73.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            76.5625% {
                opacity: 1;
            }
            98.4375% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }
        @keyframes kenburns-4 {
            73.4375% {
                opacity: 1;
                -webkit-transform: scale(1.2);
                transform: scale(1.2);
            }
            76.5625% {
                opacity: 1;
            }
            98.4375% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<%--网站标题--%>
<img class="title" src="img/login.png"/>

<%--登录功能--%>
<div class="main">

<table>
    <tr class="tr1">
        <td class="td1">用户名：</td>
        <td class="td2"><input placeholder="请输入用户名" type="text" id="name"></td>
    </tr>

    <tr class="tr2">
        <td class="td1">密码：</td>
        <td class="td2"><input placeholder="请输入密码" type="password" id="passwd"></td>
    </tr>
</table>
    <div id="result"></div>
<a href="#" id="login" class="button">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
<a href="register.jsp" class="button">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
</div>
<%--背景图片--%>
<div class="slideshow">
    <div class="slideshow-image" style="background-image: url('img/login_bg_1.jpg')"></div>
    <div class="slideshow-image" style="background-image: url('img/login_bg_2.jpg')"></div>
    <div class="slideshow-image" style="background-image: url('img/login_bg_3.jpg')"></div>
    <div class="slideshow-image" style="background-image: url('img/login_bg_4.jpg')"></div>
</div>

</body>
<script>
    var host='<%=application.getInitParameter("location")%>';
    $("#login").click(function () {
        if($("#name").val()=='' || $("#passwd").val() =='') {
            $("#result").text('请输入用户名或密码');
        }
        //提交请求
        else
        $.ajax({
            url: "user/login",
            type:'POST',
            data:{
                UserName: $("#name").val(),
                Password:$("#passwd").val()
            },
            success: function(res){
                //登录接口返回
                console.log(res);
                if (res['status'] == 'err') {
                    $("#result").text('用户名或密码不匹配');
                }
                else
                {
                //跳转
                    window.location.href = "index.jsp";
                }
            }});
    })
</script>
</html>
