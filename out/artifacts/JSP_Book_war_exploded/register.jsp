<%--
  Created by IntelliJ IDEA.
  User: zyz
  Date: 2019/11/19
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script src="./js/Jquery.js"></script>
    <link type="text/css" rel="styleSheet" href="css/register.css"/>
</head>
<body>

<%--注册页面--%>
<div class="main">
    <div class="title">用户注册</div>
<%--    表格--%>
<table>
    <tr>
        <td class="td1">用户名：</td>
        <td class="td2"><input id="UserName"/></td>
        <td class="valid" id="v_UserName"></td>

    </tr>
    <tr>
        <td class="td1">密码：</td>
        <td class="td2"><input type="password"id="Password"></td>
        <td class="valid" id="v_Password"></td>
    </tr>
    <tr>
        <td class="td1">确认密码：</td>
        <td class="td2"><input type="password" id="Password_rep"/> </td>
        <td class="valid" id="v_Password_rep"></td>
    </tr>
    <tr>
        <td class="td1">邮箱：</td>
        <td class="td2"><input type="text" id="E_mail"/></td>
        <td class="valid" id="v_E_mail"></td>
    </tr>
    <tr>
        <td class="td1">昵称：</td>
        <td class="td2"><input type="text" id="PetName"/></td>
        <td class="valid" id="v_PetName"></td>
    </tr>
    <tr>
        <td class="td1">性别：</td>
        <td class="td2">
            <input style="height: 15px;width:15px;"  type="radio" name="Sex" value="男" checked="checked" />
            <span style="color:white;font-size: 15px;">男</span>
            <input style="height: 15px;width:15px;" type="radio" name="Sex" value="女" />
            <span style="color: white;font-size: 15px;">女</span>
        </td>
        <td class="valid" id="v_Sex"></td>
    </tr>
    <tr>
        <td class="td1">真实姓名：</td>
        <td class="td2"><input type="text" id="TrueName"/> </td>
        <td class="valid" id="v_TrueName"></td>

    </tr>
    <tr>
        <td class="td1">地址：</td>
        <td class="td2"><input type="text"id="Address"/> </td>
        <td class="valid" id="v_Address"></td>

    </tr>
    <tr>
        <td class="td1">联系方式：</td>
        <td class="td2"><input type="text" id="Phone"/> </td>
        <td class="valid" id="v_Phone"></td>
    </tr>
</table>
<%--    按钮--%>
    <div class="buttongroup">
        <a href="#" class="button" id="submit" style="margin-right: 60px;">提交</a>
        <a href="#" class="button" id="reset">重写</a>
    </div>
</div>

<%--粒子背景--%>
<div id="mydiv" style="height:auto"></div>

</body>
<%--粒子js--%>

<script type="text/javascript">
    window.onload = function() {
        //配置
        var config = {
            vx: 4,	//小球x轴速度,正为右，负为左
            vy: 4,	//小球y轴速度
            height: 2,	//小球高宽，其实为正方形，所以不宜太大
            width: 2,
            count: 200,		//点个数
            color: "0,0,0", 	//点颜色
            stroke: "0,0,0", 		//线条颜色
            dist: 6000, 	//点吸附距离
            e_dist: 20000, 	//鼠标吸附加速距离
            max_conn: 10 	//点到点最大连接数
        }

        //调用
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="js/canvas-particle.js"></script>

<%--业务逻辑js--%>
<script>
<%--提交事件--%>
$("#submit").click(function () {
    //获取数据源
    form={
        UserName:$("#UserName").val(),
        Address:$("#Address").val(),
        Sex:$("[name='Sex']:checked").val(),
        E_mail:$("#E_mail").val(),
        Password:$("#Password").val(),
        PetName:$("#PetName").val(),
        Phone:$("#Phone").val(),
        TrueName:$("#TrueName").val()
    };
    Password_rep=$("#Password_rep").val();

//  提交验证
    {
        pass = true;//设置验证标识

        //清空之前验证信息
        clearValid();
        //判空验证
        for (var key in form) {
            if (form[key] == "") {
                $("#v_" + key).text("此项不可以为空；");
                pass = false;
            }
        }
        //单项验证
        if (Password_rep != form['Password'])//密码重复
        {
            pass = false;
            t = $("#v_Password").text();
            $("#v_Password").text(t + "密码输入不一致；");
            t = $("#v_Password_rep").text();
            $("#v_Password_rep").text(t + "密码输入不一致；");
        }

        mail_reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;//邮箱有效验证
        if (!mail_reg.test(form['E_mail'])) {
            t = $("#v_E_mail").text();
            $("#v_E_mail").text(t + "邮箱格式错误；");
            pass = false;
        }

        if (searchUserName("UserName", form['UserName']) == true) //验证用户名是否重复
        {
            t = $("#v_UserName").text();
            $("#v_UserName").text(t + "用户名已经注册；");
            pass = false;
        }

        if (searchUserName("E_mail", form['E_mail']) == true) //验证邮箱是否注册过
        {
            t = $("#v_E_mail").text();
            $("#v_E_mail").text(t + "邮箱已经注册；");
            pass = false;
        }

        if (form["Phone"].length != 11)//手机号验证
        {
            t = $("#v_Phone").text();
            $("#v_Phone").text(t + "手机号长度应为11位；");
            pass=false;
        }
    }

    //发起请求
    if (pass == true) {
        $.ajax({
            url:'user/register',
            type:'post',
            data:form,
            success:function (res) {
                // 请求成功跳转到首页
                console.log(res);
                if(res.status=='ok')
                {
                    console.log("ok");
                    window.location.href="index.jsp";
                }
                else
                {
                    alert("出现了一些未知的错误");
                }

            }
        });
    }


});

//重置事件
$("#reset").click(function () {
clearValid();
    $("#E_mail").val("");
    $("#UserName").val("");
    $("#Password_rep").val("");
    $("#Password").val("");
    $("#Address").val("");
    $("#PetName").val("");
    $("#Phone").val("");
    $("#TrueName").val("");
});

/*
*搜索是否重复
* key搜索键
* value搜索值
*/
function searchUserName(key,value)
{
    var result;
    $.ajax({
        url: "user/RegSearchInfo",
        data:{
            key:key,
            value:value
        },
        async:false,//注意修改为同步接口
        type:'POST',
        success: function(res){
            console.log(res)
            result=res;

        }});

    if (result['status'] == 'err') {
        return true
    }
    else
    {
        return false
    }
}

/**
 * 清空验证消息
 */
function clearValid() {
        $("#v_E_mail").text("");
        $("#v_UserName").text("");
        $("#v_Password_rep").text("");
        $("#v_Password").text("");
        $("#v_Address").text("");
        $("#v_PetName").text("");
        $("#v_Phone").text("");
        $("#v_Sex").text("");
        $("#v_TrueName").text("");
}


</script>
</html>
