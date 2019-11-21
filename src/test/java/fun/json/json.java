package fun.json;

import com.alibaba.fastjson.JSON;
import jaken.fun.message;
import model.User;
import org.junit.Test;

import java.util.Dictionary;
import java.util.HashMap;

public class json {
    @Test
    public void m() {
        User user = new User();
        user.setId(123);
        user.setPhone("123456");
        System.out.print(JSON.toJSONString(user));

    }

    @Test
    public void mm() {
        String res=message.GetMsg("err", "出现错误", "发生了错误信息");
        System.out.print(res);

    }
}
