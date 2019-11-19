package jaken.ctrl.manage;

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

@WebServlet(name = "UserRegister",urlPatterns = "/manage/userregister")
public class UserRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
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
        int size=session.selectList("jaken.sql.user.findById", user).size();
        if (size == 0) {
            //        写入数据库
            session.insert("jaken.sql.user.insertUser", user);
        }
        else
            session.close();
            System.out.println(user.getId());
        PrintWriter out = response.getWriter();
        out.println("{\"ok\":\"ok\"}");




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
