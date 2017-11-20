package model;

import java.io.Serializable;

public class HashtagDataBean implements Serializable{
	String hashtag_id;
	String hashtag_content;
	String feed_id;
	public String getHashtag_id() {
		return hashtag_id;
	}
	public void setHashtag_id(String hashtag_id) {
		this.hashtag_id = hashtag_id;
	}
	public String getHashtag_content() {
		return hashtag_content;
	}
	public void setHashtag_content(String hashtag_content) {
		this.hashtag_content = hashtag_content;
	}
	public String getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(String feed_id) {
		this.feed_id = feed_id;
	}
	@Override
	public String toString() {
		return "HashtagDataBean [hashtag_id=" + hashtag_id
				+ ", hashtag_content=" + hashtag_content + ", feed_id="
				+ feed_id + "]";
	}
	
	
}
