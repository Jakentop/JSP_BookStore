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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "GuessYouLike",urlPatterns = "/index/guessyoulike")
public class GuessYouLike extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8");
        String res;
    int num=Integer.parseInt(request.getParameter("num"));
    if (num>24)
    {
        res = message.GetMsg("err", "err", "[]");
    }
    else
    {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        List<Book> resl = session.selectList("jaken.sql.book.GetBooksRand",num);
        res = message.GetJsonPartExclude(resl,"amounts");
        res = message.GetMsg("ok", "ok", res);
    }
        PrintWriter out = response.getWriter();
        out.print(res);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);
    }
}
