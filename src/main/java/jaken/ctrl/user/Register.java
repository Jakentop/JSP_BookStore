package jaken.ctrl.user;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import org.apache.ibatis.session.SqlSession;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.ElementType;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description 注册提交接口
 * @Accept_method POST
 * @Accept_option UserName,Address,Sex,E_mail,Password,PetName,Phone
 */
@WebServlet(name = "Register",urlPatterns = "/user/register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8");
        User user = new User();
        try {
            user.setUserName(request.getParameter("UserName"));
            user.setAddress(request.getParameter("Address"));
            user.setSex(request.getParameter("Sex"));
            user.setAuth("0");//设置为普通权限
            user.setE_Mail(request.getParameter("E_mail"));
            user.setPassword(request.getParameter("Password"));
            user.setPetName(request.getParameter("PetName"));
            user.setPhone(request.getParameter("Phone"));
        } catch (Exception e) {
            response.setStatus(500);
        }

            SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        //        判断是否存在
        Map<String, String> map = new HashMap<String, String>();
        map.put("key", "UserName");
        map.put("value", user.getUserName());
        int size=(int)session.selectOne("jaken.sql.user.findByKey", map);
        String res;

        if (size == 0) {
            //        写入数据库
            session.insert("jaken.sql.user.insertUser", user);
            res = message.GetMsg("ok", "插入成功", message.GetJsonPartInclude(user, "id"));
        }
        else
        {
            res = message.GetMsg("err", "插入失败", "用户名重复");
        }
        session.close();
        System.out.println(res);
        PrintWriter out = response.getWriter();
        out.print(res);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
