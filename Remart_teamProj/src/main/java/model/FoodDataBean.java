package model;

public class FoodDataBean {
	String food_id;
	String category_id;
	String name;
	int price;
	int qty;
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	@Override
	public String toString() {
		return "FoodDataBean [food_id=" + food_id + ", category_id="
				+ category_id + ", name=" + name + ", price=" + price
				+ ", qty=" + qty + "]";
	}
	
	
}
