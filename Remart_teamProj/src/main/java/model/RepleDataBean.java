package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class RepleDataBean implements Serializable{
	int reple_id;
	int feed_id;
	String id;
	String content;
	String img;
	Timestamp reg_date;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public int getReple_id() {
		return reple_id;
	}
	public void setReple_id(int reple_id) {
		this.reple_id = reple_id;
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
	@Override
	public String toString() {
		return reple_id + "," + feed_id
				+ "," + id + "," + content + ","
				+ reg_date+","+img;
	}
	
	
}
