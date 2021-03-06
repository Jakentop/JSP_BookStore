package model;


public class Order {

  private String uuid;
  private java.sql.Timestamp date;
  private String orderInfoId;
  private long userId;
  private double tick;
  private String status;


  public String getUuid() {
    return uuid;
  }

  public void setUuid(String uuid) {
    this.uuid = uuid;
  }


  public java.sql.Timestamp getDate() {
    return date;
  }

  public void setDate(java.sql.Timestamp date) {
    this.date = date;
  }


  public String getOrderInfoId() {
    return orderInfoId;
  }

  public void setOrderInfoId(String orderInfoId) {
    this.orderInfoId = orderInfoId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public double getTick() {
    return tick;
  }

  public void setTick(double tick) {
    this.tick = tick;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

}
