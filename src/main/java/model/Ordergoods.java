package model;


public class Ordergoods {

  private long id;
  private String orderUuid;
  private String bookUuid;
  private long amount;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getOrderUuid() {
    return orderUuid;
  }

  public void setOrderUuid(String orderUuid) {
    this.orderUuid = orderUuid;
  }


  public String getBookUuid() {
    return bookUuid;
  }

  public void setBookUuid(String bookUuid) {
    this.bookUuid = bookUuid;
  }


  public long getAmount() {
    return amount;
  }

  public void setAmount(long amount) {
    this.amount = amount;
  }

}
