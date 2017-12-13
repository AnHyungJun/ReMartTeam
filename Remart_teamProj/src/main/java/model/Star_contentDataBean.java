package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Star_contentDataBean implements Serializable{
	int star_content_id;
	int star;
	String starcontent;
	String id;
	Timestamp reg_date;
	int restaurant_recommand_id;
	public int getStar_content_id() {
		return star_content_id;
	}
	public void setStar_content_id(int star_content_id) {
		this.star_content_id = star_content_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getStarcontent() {
		return starcontent;
	}
	public void setStarcontent(String starcontent) {
		this.starcontent = starcontent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getRestaurant_recommand_id() {
		return restaurant_recommand_id;
	}
	public void setRestaurant_recommand_id(int restaurant_recommand_id) {
		this.restaurant_recommand_id = restaurant_recommand_id;
	}
	@Override
	public String toString() {
		return "Star_contentDataBean [star_content_id=" + star_content_id
				+ ", star=" + star + ", starcontent=" + starcontent + ", id="
				+ id + ", reg_date=" + reg_date + ", restaurant_recommand_id="
				+ restaurant_recommand_id + "]";
	}
	
	
}
