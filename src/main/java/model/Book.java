package model;


public class Book {

  private String uuid;
  private String name;
  private String brief;
  private double price;
  private double prePrice;
  private String author;
  private java.sql.Timestamp pubDate;
  private String pub;
  private String picture;


  public String getUuid() {
    return uuid;
  }

  public void setUuid(String uuid) {
    this.uuid = uuid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getBrief() {
    return brief;
  }

  public void setBrief(String brief) {
    this.brief = brief;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public double getPrePrice() {
    return prePrice;
  }

  public void setPrePrice(double prePrice) {
    this.prePrice = prePrice;
  }


  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }


  public java.sql.Timestamp getPubDate() {
    return pubDate;
  }

  public void setPubDate(java.sql.Timestamp pubDate) {
    this.pubDate = pubDate;
  }


  public String getPub() {
    return pub;
  }

  public void setPub(String pub) {
    this.pub = pub;
  }


  public String getPicture() {
    return picture;
  }

  public void setPicture(String picture) {
    this.picture = picture;
  }

}
