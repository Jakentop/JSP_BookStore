package jaken.ctrl;

import org.junit.Test;

import java.io.*;

public class FilePathTest {
    @Test
    public void m() throws IOException {
        
        File file = new File("test.jpg");
        FileInputStream inputStream = new FileInputStream(file);
        BufferedInputStream out = new BufferedInputStream(inputStream);
        int temp = out.read();
        while (temp != -1) {
            temp = out.read();
        }
        out.close();

    }
}
