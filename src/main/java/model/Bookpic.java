package model;


public class Bookpic {

  private long id;
  private String bookId;
  private String picId;
  private String attribute;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getBookId() {
    return bookId;
  }

  public void setBookId(String bookId) {
    this.bookId = bookId;
  }


  public String getPicId() {
    return picId;
  }

  public void setPicId(String picId) {
    this.picId = picId;
  }


  public String getAttribute() {
    return attribute;
  }

  public void setAttribute(String attribute) {
    this.attribute = attribute;
  }

}
