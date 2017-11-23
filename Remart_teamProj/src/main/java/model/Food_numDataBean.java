package model;

import java.io.Serializable;

public class Food_numDataBean implements Serializable{
	int food_num_id;
	int food_id;
	int qty;
	String div;
	int order_id;
	public int getFood_num_id() {
		return food_num_id;
	}
	public void setFood_num_id(int food_num_id) {
		this.food_num_id = food_num_id;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	@Override
	public String toString() {
		return "Food_numDataBean [food_num_id=" + food_num_id + ", food_id="
				+ food_id + ", qty=" + qty + ", div=" + div + ", order_id="
				+ order_id + "]";
	}
	
	
}
