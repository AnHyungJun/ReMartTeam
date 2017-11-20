package model;

import java.io.Serializable;

public class Feed_foodDataBean implements Serializable{
	int feed_food_id;
	String feed_id;
	String food_id;
	public int getFeed_food_id() {
		return feed_food_id;
	}
	public void setFeed_food_id(int feed_food_id) {
		this.feed_food_id = feed_food_id;
	}
	public String getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(String feed_id) {
		this.feed_id = feed_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	@Override
	public String toString() {
		return "Feed_foodDataBean [feed_food_id=" + feed_food_id + ", feed_id="
				+ feed_id + ", food_id=" + food_id + "]";
	}
	
	
}
