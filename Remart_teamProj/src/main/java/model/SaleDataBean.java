package model;

import java.io.Serializable;
import java.security.Timestamp;

public class SaleDataBean implements Serializable{
	String sale_id;
	String product_id;
	String staff_id;
	Timestamp s_date;
	int qty;
	public String getSale_id() {
		return sale_id;
	}
	public void setSale_id(String sale_id) {
		this.sale_id = sale_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
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
	@Override
	public String toString() {
		return "SaleDataBean [sale_id=" + sale_id + ", product_id="
				+ product_id + ", staff_id=" + staff_id + ", s_date=" + s_date
				+ ", qty=" + qty + "]";
	}
	
	
}
