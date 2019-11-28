package jaken.ctrl.cart;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.Cart;
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

/**
 * @Description 添加一条信息到购物车中
 * @Accept_method post
 * @Accept_option uuid 书籍唯一ID
 * @Accept_option amounts 数量
 */
@WebServlet(name = "AddOne",urlPatterns = "/cart/addone")
public class AddOne extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        设置返回与编码
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json");
        request.setCharacterEncoding("utf-8");
        String res;
//        取值
        String uuid = request.getParameter("uuid");
        String am = request.getParameter("amounts");
//        判断请求是否有效
        if (uuid == null || am == null) {
            res = message.GetMsg("err", "err", "调用无效");
        }
        else
        {
            int amounts = Integer.parseInt(am);
            //获取用户信息
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Cart cart = new Cart();
            cart.setUserId(user.getId());
            cart.setUuid(uuid);
            cart.setAmount(amounts);
//            插入数据
            SqlSession sqlSession = SqlSessionFactoryUtil.openSqlSession();
            int flag = sqlSession.insert("jaken.sql.cart.insertOne", cart);
            if (flag !=0) {
                res = message.GetMsg("ok", "ok", "插入成功");
            }
            else
                res = message.GetMsg("err", "err", "err");

        }
        PrintWriter out = response.getWriter();
        out.print(res);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
