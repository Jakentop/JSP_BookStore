package jaken.ctrl.cart;

import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description 根据ID删除购物车内的一条数据
 * @Accept_option CartID 购物车的ID
 * @Accetp_option UserID not but need session
 * @Accept_method POST
 */
@WebServlet(name = "DelCart")
public class DelCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        int cartid =Integer.parseInt(request.getParameter("CartID"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map temp = new HashMap<String, Object>();
        temp.put("bookid", cartid);
        temp.put("userid", user.getId());
        SqlSession sqlSession = SqlSessionFactoryUtil.openSqlSession();
//        执行删除
        int result = sqlSession.delete("jaken.sql.cart.delByBookId", temp);
        String resinfo;
        if (result == 0) {
            resinfo = message.GetMsg("err", "err", "err");
        }
        else{
            resinfo = message.GetMsg("ok", "ok", "ok");
        }
//输出信息
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        out.print(resinfo);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
