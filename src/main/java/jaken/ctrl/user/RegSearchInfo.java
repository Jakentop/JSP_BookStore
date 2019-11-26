package jaken.ctrl.user;

import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description 查找数据库中是否有重复字段
 * @Accept_option key 查找键 UserName,E_mail
 * @Accept_option value 查找值
 * @Accept_method POST
 */
@WebServlet(urlPatterns = "/user/RegSearchInfo")
public class RegSearchInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String key = request.getParameter("key");
        String value = request.getParameter("value");
        if (key.compareTo("UserName") != 0 && key.compareTo("E_mail") != 0) {//判空
            out.print(message.GetMsg("err", "接口调用错误", "接口调用错误"));
        }
        else
        {

            SqlSession session = SqlSessionFactoryUtil.openSqlSession();
            int res;
            Map map = new HashMap<String, String>();
            map.put("key", key);
            map.put("value", value);
            res = session.selectOne("jaken.sql.user.findByKey", map);
            if(res!=0) out.print(message.GetMsg("err","repeat","字段重复"));
            else out.print(message.GetMsg("ok", "ok", "字段不重复"));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
