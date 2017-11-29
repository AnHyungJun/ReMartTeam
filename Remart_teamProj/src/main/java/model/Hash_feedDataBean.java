package model;

public class Hash_feedDataBean {
	int hash_feed_id;
	int hash_id;
	int feed_id;
	public int getHash_feed_id() {
		return hash_feed_id;
	}
	public void setHash_feed_id(int hash_feed_id) {
		this.hash_feed_id = hash_feed_id;
	}
	public int getHash_id() {
		return hash_id;
	}
	public void setHash_id(int hash_id) {
		this.hash_id = hash_id;
	}
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	@Override
	public String toString() {
		return "Hash_feedDataBean [hash_feed_id=" + hash_feed_id + ", hash_id="
				+ hash_id + ", feed_id=" + feed_id + "]";
	}
	
	
}
