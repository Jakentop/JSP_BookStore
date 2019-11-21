package jaken.ctrl.user;

import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import org.apache.ibatis.session.SqlSession;
import sun.plugin2.message.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Description 用户登录接口，用户登录，保存Session
 * @Accept_option UserName,Password
 * @Accept_method POST
 */
@WebServlet(urlPatterns = "/user/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json");
        User user = new User();
        user.setUserName(request.getParameter("UserName"));
        user.setPassword(request.getParameter("Password"));

//        执行登录
        SqlSession sqlSession = SqlSessionFactoryUtil.openSqlSession();
        user =sqlSession.selectOne("jaken.sql.user.login", user);

        String res;
//        登录失败
        if (user==null) {
            res = message.GetMsg("err", "登录失败", "用户名或密码错误");
        }
//        登录成功
        else{
//            写入session
            HttpSession s = request.getSession(true);
            s.setAttribute("user", user);
            res = message.GetMsg("ok", "登录成功",
                    message.GetJsonPartInclude(user, "userName", "petName"));
        }
//        返回
        PrintWriter out = response.getWriter();
        out.print(res);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
