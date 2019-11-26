package jaken.ctrl.pic;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.*;
import java.nio.Buffer;

/**
 * @Description 图片加载接口
 * @Accept_option uuid 图片的全局唯一标识
 * @Accept_method get
 */
@WebServlet(urlPatterns = "/pic/get")
public class Download extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");
//        获取请求的uuid
        String uuid = request.getParameter("uuid");

//        获取绝对路径
        ServletContext context = this.getServletContext();
        String path = context.getInitParameter("PicPath");
        File file = new File(path + uuid);

        FileInputStream fileInputStream = new FileInputStream(file);
        BufferedInputStream in = new BufferedInputStream(fileInputStream);
//        输出图片
        OutputStream out = response.getOutputStream();
        int temp = in.read();
        while(temp!=-1)
        {
            out.write(temp);
            temp = in.read();
        }




    }
}
