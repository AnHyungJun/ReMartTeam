package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class SaleDataBean implements Serializable{
	int sale_id;
	int product_id;
	String staff_id;
	Timestamp s_date;
	int qty;
	String offline_mart_id;
	
	public int getSale_id() {
		return sale_id;
	}
	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public Timestamp getS_date() {
		return s_date;
	}
	public void setS_date(Timestamp s_date) {
		this.s_date = s_date;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getOffline_mart_id() {
		return offline_mart_id;
	}
	public void setOffline_mart_id(String offline_mart_id) {
		this.offline_mart_id = offline_mart_id;
	}
	@Override
	public String toString() {
		return "SaleDataBean [sale_id=" + sale_id + ", product_id="
				+ product_id + ", staff_id=" + staff_id + ", s_date=" + s_date
				+ ", qty=" + qty + ", offline_mart_id=" + offline_mart_id + "]";
	}
	
	
	
}
