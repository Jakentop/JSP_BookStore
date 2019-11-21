package jaken.sql;

import jaken.fun.message;
import model.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

public class UserSqlTest {
    @Test
    public void m() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        System.out.println(session.selectList("jaken.sql.user.findById", 0).size()
        );
    }
    @Test
    public void n() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        User user=new User();
        user.setUserName("test");

        int size=session.selectList("jaken.sql.user.findByUserName", user.getUserName()).size();
        String res;
        if (size == 0) {
            //        写入数据库
            session.insert("jaken.sql.user.insertUser", user);

            res = message.GetMsg("ok", "插入成功", message.GetJsonPartInclude(user, "id"));
        }
        else
        {
            res = message.GetMsg("err", "插入失败", "用户名重复");
        }
    }
}
