package jaken.fun;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PascalNameFilter;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
//
public class message {
    /**
     *
     * @param response Servlet相应头
     * @param status 状态，ok或err
     * @param msg_title 消息标题
     * @param info 消息内容
     * @return true表示操作成功，false标识操作失败
     */
    public static boolean RetMsg(HttpServletResponse response,String status, String msg_title, String info) {
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        String temp = GetMsg(status, msg_title, info);
        out.print(temp);
        return true;
    }

    /**
     *
     * @param status 状态，ok或err
     * @param msg_title 消息标题
     * @param info 消息内容
     * @return 生成的json字符串
     */
    public static String GetMsg(String status, String msg_title, String info)
    {
        HashMap temp = new HashMap();
        temp.put("title", msg_title);
        temp.put("info", info);
        temp.put("status", status);
        return JSON.toJSONString(temp);
    }

    /**
     *
     * @param object 需要序列化的对象
     * @param properties 需要选择的原型
     * @return 返回一个json序列化字符串
     */
    public static String GetJsonPartInclude(Object object, String...properties) {
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter();
        for (String add : properties) {
            filter.getIncludes().add(add);
        }
        return JSON.toJSONString(object, filter);
    }

    /**
     *
     * @param object 需要序列化的对象
     * @param properties 需要排除的原型
     * @return 返回一个json序列化字符串
     */
    public static String GetJsonPartExclude(Object object, String...properties) {
        SimplePropertyPreFilter filter = new SimplePropertyPreFilter();
        for (String add : properties) {
            filter.getExcludes().add(add);
        }
        return JSON.toJSONString(object, filter);
    }
}
