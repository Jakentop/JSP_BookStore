package test.test;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;


public class hashmap {
    @Test
    public void test() {

        Map<String,Object> temp = new HashMap<String,Object>();
        Object b=temp;
        HashMap<String,Object> t=(HashMap<String,Object>) b;
    }
}
