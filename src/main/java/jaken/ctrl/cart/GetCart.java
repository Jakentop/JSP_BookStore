package jaken.ctrl.cart;

import com.sun.xml.internal.bind.v2.model.core.ID;
import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import model.cCartBook;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @Description 获取购物车信息列表
 * @Accept_method POST
 * @Accept_option none but need session
 */
@WebServlet(name = "LoginAuth",urlPatterns = "/cart/getcart")
public class GetCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       根据用户信息获取购物车信息
        HttpSession se = request.getSession();
        User user = (User) se.getAttribute("user");
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        List<cCartBook> res = session.selectList("jaken.sql.cart.getList", user.getId());
        System.out.println(res.size());
//        将结果传递给对应页面
        request.setAttribute("res", res);
        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
