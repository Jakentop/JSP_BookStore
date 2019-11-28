package test.mybatis.test;

import jaken.fun.message;
import jaken.sql.SqlSessionFactoryUtil;
import model.Book;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

public class TBook {
    @Test
    public void Add() {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        Book book = new Book();
        book.setUuid(UUID.randomUUID().toString().replace("-", ""));
        book.setName("这是一份测试书籍");
        book.setBrief("这是一本测试书籍，这是他的简短介绍");
        book.setPrice(100.23);
        book.setPrePrice(599);
        book.setAuthor("测试用例");
        book.setPubDate(new Timestamp(2019, 8, 12, 0, 0, 0, 0));
        book.setPub("测试出版商");
        book.setPicture(UUID.randomUUID().toString().replace("-", ""));

        session.insert("jaken.sql.Book.Add", book);
    }


@Test
public  void Change() {
    SqlSession session = SqlSessionFactoryUtil.openSqlSession();
    Book book = (Book) session.selectOne("jaken.sql.Book.Search", "这是一份测试书籍");
    book.setPrice(500.5);
    session.update("jaken.sql.Book.Change", book);
}

@Test
    public void Search() {
    SqlSession session = SqlSessionFactoryUtil.openSqlSession();
    List<String> res = session.selectList("jaken.sql.book.Search", "国");
    System.out.println(res.size());

}
@Test
    public void GetBooksRand()
    {
        SqlSession session = SqlSessionFactoryUtil.openSqlSession();
        List<Book> res = session.selectList("jaken.sql.book.GetBooksRand", 10);
        System.out.print(message.GetJsonPartExclude(res));
    }
}
