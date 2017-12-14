package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Restaurant_recommandDataBean implements Serializable{
	int restaurant_recommand_id;
	String subject;
	String content;
	Timestamp reg_date;
	String id;
	int rnum;
	int avgstar;
	String roadAddr;
	
	
	
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public int getAvgstar() {
		return avgstar;
	}
	public void setAvgstar(int avgstar) {
		this.avgstar = avgstar;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRestaurant_recommand_id() {
		return restaurant_recommand_id;
	}
	public void setRestaurant_recommand_id(int restaurant_recommand_id) {
		this.restaurant_recommand_id = restaurant_recommand_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "restaurant_recommandDataBean [restaurant_recommand_id="
				+ restaurant_recommand_id + ", subject=" + subject
				+ ", content=" + content + ", reg_date=" + reg_date + ", id="
				+ id + "]";
	}
	
}
