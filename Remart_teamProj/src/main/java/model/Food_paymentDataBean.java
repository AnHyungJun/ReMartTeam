package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Food_paymentDataBean implements Serializable{

	int payment_id;
	String id;
	Timestamp order_date;
	String pay_method;
	String phone;
	String name;
	int all_price;
	String zip1;
	String zip2;
	String address1;
	String address2;
	
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAll_price() {
		return all_price;
	}
	public void setAll_price(int all_price) {
		this.all_price = all_price;
	}
	public String getZip1() {
		return zip1;
	}
	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}
	public String getZip2() {
		return zip2;
	}
	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	@Override
	public String toString() {
		return "Food_paymentDataBean [payment_id=" + payment_id + ", id=" + id
				+ ", order_date=" + order_date + ", pay_method=" + pay_method
				+ ", phone=" + phone + ", name=" + name + ", all_price="
				+ all_price + ", zip1=" + zip1 + ", zip2=" + zip2
				+ ", address1=" + address1 + ", address2=" + address2 + "]";
	}
}
