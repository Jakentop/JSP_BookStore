package jaken.sql;

import model.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import static org.junit.Assert.*;

public class SqlSessionFactoryUtilTest {
    @Test
    public void t() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        User user = session.selectOne("jaken.sql.user.findById", 1);
        System.out.println(user);

    }
}