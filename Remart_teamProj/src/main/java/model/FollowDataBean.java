package model;

public class FollowDataBean {
	String follow_id;
	String my_id;
	String other_id;
	public String getFollow_id() {
		return follow_id;
	}
	public void setFollow_id(String follow_id) {
		this.follow_id = follow_id;
	}
	public String getMy_id() {
		return my_id;
	}
	public void setMy_id(String my_id) {
		this.my_id = my_id;
	}
	public String getOther_id() {
		return other_id;
	}
	public void setOther_id(String other_id) {
		this.other_id = other_id;
	}
	@Override
	public String toString() {
		return "FollowDataBean [follow_id=" + follow_id + ", my_id=" + my_id
				+ ", other_id=" + other_id + "]";
	}
	
	
}
