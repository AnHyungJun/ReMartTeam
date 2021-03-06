package model;

import java.io.Serializable;

public class FoodDataBean implements Serializable{

   private int food_id;
   private String category_id;
   private String name;
   private int price;
   private int qty;
   private String category_name;
   private String category_group;
   private String type;
   
   
   
   public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public int getFood_id() {
      return food_id;
   }
   
   public void setFood_id(int food_id) {
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
   
   public String getCategory_name() {
      return category_name;
   }
   
   public void setCategory_name(String category_name) {
      this.category_name = category_name;
   }
   
   public String getCategory_group() {
      return category_group;
   }
   
   public void setCategory_group(String category_group) {
      this.category_group = category_group;
   }
	
	@Override
	public String toString() {
		return  food_id + "-" + name + "-" + price;
	}
	   
   
}