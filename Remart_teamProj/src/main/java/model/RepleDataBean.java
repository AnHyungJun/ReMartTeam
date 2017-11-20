package model;

import java.security.Timestamp;

public class RepleDataBean {
	String reple_id;
	String feed_id;
	String id;
	String content;
	Timestamp reg_date;
	public String getReple_id() {
		return reple_id;
	}
	public void setReple_id(String reple_id) {
		this.reple_id = reple_id;
	}
	public String getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(String feed_id) {
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
		return "RepleDataBean [reple_id=" + reple_id + ", feed_id=" + feed_id
				+ ", id=" + id + ", content=" + content + ", reg_date="
				+ reg_date + "]";
	}
	
	
}
