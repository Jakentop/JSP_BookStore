package test.mybatis.test;

import model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

public class connect_test {

    @Test
    public void connect() {
        try {
            Reader reader = Resources.getResourceAsReader("Mybatis.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
            SqlSession sqlSession = sqlSessionFactory.openSession();
            List<User> l = sqlSession.selectList("mybatis.sql.User.findById", 1);
            System.out.println(l);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
