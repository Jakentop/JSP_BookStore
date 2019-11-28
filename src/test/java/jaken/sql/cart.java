package jaken.sql;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

public class cart {
    @Test
    public void m() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        session.selectList("jaken.sql.cart.getList",1);
    }
}
