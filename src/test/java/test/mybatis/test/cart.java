package test.mybatis.test;

import jaken.sql.SqlSessionFactoryUtil;
import model.Cart;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class cart {

private SqlSession session;
private int id;
private String uuid;
private Cart cart;

    @Before
    public void before() {
        session = SqlSessionFactoryUtil.openSqlSession();
        id=17;
        uuid="161aefb10e5f11eaae3d50e08535507f";
        cart = new Cart();
        cart.setUuid(uuid);
        cart.setId(id);

    }

    @After
    public void after() {
        session.close();
    }

    @Test
    public void getlist() {
        System.out.print(session.selectList("jaken.sql.cart.getList",id));
    }

    @Test
    public void insertOne() {
        HashMap temp = new HashMap<String, Object>();
        temp.put("userid", id);
        temp.put("bookid", uuid);
        session.insert("jaken.sql.cart.insertOne",temp);

    }

    @Test
    public void findByBookId() {
        HashMap temp = new HashMap<String, Object>();
        temp.put("userid", id);
        temp.put("bookid", uuid);

        System.out.print(session.selectList("jaken.sql.cart.findByBookId", temp).size());
    }
    @Test
    public void detByBookId() {

        Map temp = new HashMap<String, Object>();
        temp.put("userid", id);
        temp.put("bookid", uuid);
        System.out.print(session.selectList("jaken.sql.cart.delByBookId", temp));
    }
}
