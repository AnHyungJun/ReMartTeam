package model;

import java.io.Serializable;
import java.security.Timestamp;

public class Food_orderDataBean implements Serializable{
	String food_order_id;
	String id;
	Timestamp order_date;
	String request;
	String order_state;
	int post_number;
	String zip1;
	String zip2;
	String address;
	String phone;
	String name;
	int all_price;
	String food_name;
	String p_company;
	String order_number;
	public String getFood_order_id() {
		return food_order_id;
	}
	public void setFood_order_id(String food_order_id) {
		this.food_order_id = food_order_id;
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
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public int getPost_number() {
		return post_number;
	}
	public void setPost_number(int post_number) {
		this.post_number = post_number;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getOrder_number() {
		return order_number;
	}
	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}
	@Override
	public String toString() {
		return "Food_orderDataBean [food_order_id=" + food_order_id + ", id="
				+ id + ", order_date=" + order_date + ", request=" + request
				+ ", order_state=" + order_state + ", post_number="
				+ post_number + ", zip1=" + zip1 + ", zip2=" + zip2
				+ ", address=" + address + ", phone=" + phone + ", name="
				+ name + ", all_price=" + all_price + ", food_name="
				+ food_name + ", p_company=" + p_company + ", order_number="
				+ order_number + "]";
	}
	
	
}
