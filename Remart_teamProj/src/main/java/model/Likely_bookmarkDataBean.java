package model;

import java.io.Serializable;

public class Likely_bookmarkDataBean implements Serializable{
	int likely_bookmark_id;
	String id;
	String feed_id;
	String type;
	public int getLikely_bookmark_id() {
		return likely_bookmark_id;
	}
	public void setLikely_bookmark_id(int likely_bookmark_id) {
		this.likely_bookmark_id = likely_bookmark_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(String feed_id) {
		this.feed_id = feed_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "("+feed_id+")"+type;
	}
	
	
	
}
