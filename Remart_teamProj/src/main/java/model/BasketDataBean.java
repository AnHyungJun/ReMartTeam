package model;

import java.io.Serializable;
import java.util.List;

public class BasketDataBean implements Serializable{
	int basket_id;
	String id;
	int food_id;
	int food_num;
	String bname;
	int bprice;
	
	public int getBasket_id() {
		return basket_id;
	}
	public void setBasket_id(int basket_id) {
		this.basket_id = basket_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFood_id() {
		return food_id;
	}
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}

}
