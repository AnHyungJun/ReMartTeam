package model;

import java.io.Serializable;
import java.security.Timestamp;
import java.util.List;

public class FeedDataBean implements Serializable{
	int feed_id;
	String id;
	int like_num;
	String preImg;
	Timestamp reg_date;
	String recipe_name;
	List<String> img_name;
	List<String> content;
	public String getPreImg() {
		return preImg;
	}
	public void setPreImg(String preImg) {
		this.preImg = preImg;
	}
	
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public List getImg_name() {
		return img_name;
	}
	public void setImg_name(List img_name) {
		this.img_name = img_name;
	}
	public List getContent() {
		return content;
	}
	public void setContent(List content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "FeedDataBean [feed_id=" + feed_id + ", id=" + id
				+ ", like_num=" + like_num + ", reg_date=" + reg_date
				+ ", recipe_name=" + recipe_name
				+ "]";
	}
	
	
	
}
