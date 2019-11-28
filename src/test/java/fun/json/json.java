package fun.json;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import jaken.fun.message;
import model.User;
import org.junit.Test;

import java.util.Dictionary;
import java.util.HashMap;
import java.util.LinkedHashMap;

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

    @Test
    public void mmm() {
        JSONObject map = new JSONObject(true);
        map.put("test", 123);
        map.put("test2", 234);
        System.out.println(map.toString());

        HashMap<String, Object> map1 = JSON.parseObject(map.toString(), new TypeReference<HashMap<String, Object>>() {
        });
        System.out.println(map1.get("test"));
    }
}
