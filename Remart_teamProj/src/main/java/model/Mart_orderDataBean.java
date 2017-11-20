package model;

import java.io.Serializable;
import java.security.Timestamp;

public class Mart_orderDataBean implements Serializable{
	int mart_order_id;
	String food_id;
	int qty;
	Timestamp re_date;
	Timestamp or_date;
	String offline_mart_id;
	String status;
	public int getMart_order_id() {
		return mart_order_id;
	}
	public void setMart_order_id(int mart_order_id) {
		this.mart_order_id = mart_order_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public Timestamp getOr_date() {
		return or_date;
	}
	public void setOr_date(Timestamp or_date) {
		this.or_date = or_date;
	}
	public String getOffline_mart_id() {
		return offline_mart_id;
	}
	public void setOffline_mart_id(String offline_mart_id) {
		this.offline_mart_id = offline_mart_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Mart_orderDataBean [mart_order_id=" + mart_order_id
				+ ", food_id=" + food_id + ", qty=" + qty + ", re_date="
				+ re_date + ", or_date=" + or_date + ", offline_mart_id="
				+ offline_mart_id + ", status=" + status + "]";
	}
	
	
}
