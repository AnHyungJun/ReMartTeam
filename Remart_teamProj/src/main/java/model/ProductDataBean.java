package model;

import java.io.Serializable;

public class ProductDataBean implements Serializable{
	String product_id;
	String food_id;
	int price;
	int qty;
	String offline_mart_id;
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
		return "ProductDataBean [product_id=" + product_id + ", food_id="
				+ food_id + ", price=" + price + ", qty=" + qty
				+ ", offline_mart_id=" + offline_mart_id + "]";
	}
	
	
}
