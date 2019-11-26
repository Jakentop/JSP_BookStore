package jaken.ctrl.index;

import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.Book;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description 获取联想词接口
 * @Accept_option key检索的关键字
 * @Accept_method GET
 */
@WebServlet(urlPatterns = "/index/getmindkey",name = "GetMindKey")
public class GetMindKey extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        key = "%" + key + "%";
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        List<Book> books = session.selectList("jaken.sql.book.GetMind", key);
        ArrayList<Map> res = new ArrayList<>();
        Map<String, String> t = null;
        for (Book book : books) {
            t = new HashMap<String, String>();
//            设置返回字段长度
            t.put("key",book.getName().substring(0, 8));
            t.put("link", book.getUuid());
            res.add(t);
        }
        message.RetMsg(response, "ok", "ok", message.GetJsonPartExclude(res));


    }
}
