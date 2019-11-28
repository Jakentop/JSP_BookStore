package jaken.ctrl.order;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.xpath.internal.operations.Or;
import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.*;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * @Description 根据购物车中选择的信息生成一个订单，同样的原数据会在购物车中删除，
 * @Accept_method POST
 * @Accept_option list,with dic
 */
@WebServlet(name = "CreateOrder",urlPatterns = "/order/create")
public class CreateOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    设置返回类型
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8");
//    处理返回类型
        String infostring = request.getParameter("data");
        System.out.println(infostring);
        List<Map<String,String>> infolist = (List<Map<String,String>>) JSON.parse(infostring);
        HttpSession session = request.getSession();
        long userid = ((User) session.getAttribute("user")).getId();

//     执行cart删除，和订单生成
        SqlSession sqlSession = SqlSessionFactoryUtil.openSqlSession(false);//使用事务来处理本次提交
        //删除cart中数据，去除删除了的数据
        List<cCartBook> cartBooks = new ArrayList<cCartBook>();

        for (Map<String, String> item : infolist) {
            long cartid = Long.parseLong(item.get("id"));
            Map<String, Long> param = new HashMap<String, Long>();
            param.put("userid", userid);
            param.put("ID",cartid);
            //加入列表
            cCartBook temp = (cCartBook) sqlSession.selectOne("jaken.sql.cart.findByCartId", param);

            temp.setAmount(Long.parseLong(item.get("amounts")));

            cartBooks.add(temp);
            //删除
            int delres=sqlSession.delete("jaken.sql.cart.delByBookId", param);
//            添加删除失败跳转错误页面
        }
        //生成一张空订单
        Order order = new Order();
        order.setUserId(userid);
        order.setUuid(UUID.randomUUID().toString().replace("-", ""));
        order.setStatus("0");
        order.setTick(0);
        sqlSession.insert("jaken.sql.order.insertOneOrder", order);
        //生成订单与货物的映射表
        for (cCartBook item : cartBooks) {
            Ordergoods temp = new Ordergoods();
            temp.setBookUuid(item.getUuid().getUuid());
            temp.setAmount(item.getAmount());
            temp.setOrderUuid(order.getUuid());
            sqlSession.insert("jaken.sql.ordergoods.insertOrderGoods", temp);
        }

//        处理完成提交数据库事务
        sqlSession.commit();
//        成功返回
        PrintWriter out = response.getWriter();
        out.print(message.GetMsg("ok", "ok", "提交完成"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
