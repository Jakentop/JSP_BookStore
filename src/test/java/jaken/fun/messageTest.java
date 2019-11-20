package jaken.fun;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.sun.org.apache.bcel.internal.generic.NEW;
import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class messageTest {
    private User user = new User();
    @Test
    public void retMsg() {
        ;
    }

    @Test
    public void getMsg() {
        System.out.print(message.GetMsg("ok", "测试用例", "这是测试用例"));
    }

    @Before
    public void getUser() {

        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        this.user= session.selectOne("jaken.sql.user.findById", 1);

    }


    @Test
    public void getJsonPartInclude() {
        System.out.print(message.GetJsonPartInclude(this.user, "userName", "sex"));
    }

    @Test
    public void getJsonPartExclude() {
        System.out.print(message.GetJsonPartExclude(this.user, "userName", "sex"));
    }
}