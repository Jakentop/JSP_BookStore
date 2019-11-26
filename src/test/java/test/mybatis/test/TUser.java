package test.mybatis.test;

import jaken.sql.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class TUser {
    @Test
    public  void findByKey() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("key", "UserName");
        map.put("value", "zyz");
        System.out.print((int)session.selectOne("jaken.sql.user.findByKey", map));

    }

}
