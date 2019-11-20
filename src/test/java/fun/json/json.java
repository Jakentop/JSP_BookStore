package fun.json;

import com.alibaba.fastjson.JSON;
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
        HashMap temp = new HashMap();
        temp.put("hello", 123);
        temp.put("hell", new User());
        System.out.print(JSON.toJSONString(temp));

    }
}
