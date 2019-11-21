package test.mybatis.test;

import jaken.sql.SqlSessionFactoryUtil;
import model.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

public class some_grammer_test {
    @Test
    public void m() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        System.out.print(session.selectOne("jaken.sql.user.findById", 20));

    }

    @Test
    public void n() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        User user = new User();
        user.setUserName("interfacetest1");
        user.setPassword("password");
        System.out.print(session.selectList("jaken.sql.user.login",user));
    }

    @Test
    public void mm() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        session.selectList("jaken.sql.cart.getList",1);
    }
}
