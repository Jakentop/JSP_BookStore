package model;


import java.sql.Timestamp;

public class CartBook {

  public String getName() {
    return Name;
  }

  public void setName(String name) {
    Name = name;
  }

  public double getPrice() {
    return Price;
  }

  public void setPrice(double price) {
    Price = price;
  }

  public String getPicture() {
    return Picture;
  }

  public void setPicture(String picture) {
    Picture = picture;
  }

  public Timestamp getDate() {
    return Date;
  }

  public void setDate(Timestamp date) {
    Date = date;
  }

  public long getUserID() {
    return UserID;
  }

  public void setUserID(long userID) {
    UserID = userID;
  }

  private String Name;
  private double Price;
  private String Picture;
  private java.sql.Timestamp Date;
  private long UserID;


}
