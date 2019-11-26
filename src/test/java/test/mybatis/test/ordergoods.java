package test.mybatis.test;

import jaken.sql.SqlSessionFactoryUtil;
import model.Ordergoods;
import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class ordergoods {
    SqlSession session = SqlSessionFactoryUtil.openSqlSession();

    @Test
    public void insertOrderGoods() {
        List<Ordergoods> ordergoods = new ArrayList<Ordergoods>();
        int i;
        for (i = 0; i < 5; i++) {
            Ordergoods temp = new Ordergoods();
            temp.setBookUuid("d96f45da0c5411eaa0a450e085355083");
            temp.setOrderUuid("171b9fc0cd9f4af8a138a4418d29b147");
            temp.setAmount(10);
            ordergoods.add(temp);
        }
        session.insert("jaken.sql.OrderGoods.insertOrderGoods", ordergoods);

    }
}
