package test.mybatis.test;

import com.sun.org.apache.xpath.internal.operations.Or;
import jaken.sql.SqlSessionFactoryUtil;
import model.Order;
import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import java.sql.Time;
import java.util.UUID;

public class order {

    private SqlSession session = SqlSessionFactoryUtil.openSqlSession();
    private Order order= new Order();


    @Before

    public void init() {
        order.setUuid(UUID.randomUUID().toString().replace("-", ""));
        order.setOrderInfoId("00000000000");
        order.setStatus("1");
        order.setTick(10);
        order.setUserId(17);

    }

    @Test
    public void insertOneOrder() {
        session.insert("jaken.sql.Order.insertOneOrder", order);
    }

    @Test
    public void getOrderByUserId() {
        session.selectList("jaken.sql.Order.getOrderByUserId", 17);
    }
}
