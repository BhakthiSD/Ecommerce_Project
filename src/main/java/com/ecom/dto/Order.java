package com.ecom.dto;

import java.util.Date;

public class Order {
	private int order_id;
    private int product_id;
    private Date order_date;
    private Date delivery_date;
    private int eid,cid;
    public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	 public String toString() {
		 return "[order_id="+order_id+", product_id="+product_id+", order_date="+order_date+", delivery_date="+delivery_date+
				 ", eid="+eid+", cid="+cid+"]";
	 }
}
