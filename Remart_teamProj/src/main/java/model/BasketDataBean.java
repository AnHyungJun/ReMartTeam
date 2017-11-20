package model;

import java.io.Serializable;

public class BasketDataBean implements Serializable{
	int basket_id;
	String id;
	String food_id;
	int food_num;
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
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	@Override
	public String toString() {
		return "BasketDataBean [basket_id=" + basket_id + ", id=" + id
				+ ", food_id=" + food_id + ", food_num=" + food_num + "]";
	}
	
	
}
