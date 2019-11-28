package fun.json;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class hashmap {
    @Test
    public void m() {
        Map map = new HashMap<String, Object>();
        map.put("test", 123);
        System.out.print(map.get("tes1t"));
    }
}
