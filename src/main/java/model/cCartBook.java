package model;


public class cCartBook {

  private long id;
  private long userId;
  private Book uuid;
  private long amount;
  private java.sql.Timestamp date;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public Book getUuid() {
    return uuid;
  }

  public void setUuid(Book uuid) {
    this.uuid = uuid;
  }


  public long getAmount() {
    return amount;
  }

  public void setAmount(long amount) {
    this.amount = amount;
  }


  public java.sql.Timestamp getDate() {
    return date;
  }

  public void setDate(java.sql.Timestamp date) {
    this.date = date;
  }

}
