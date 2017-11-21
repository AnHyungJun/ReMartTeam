package model;

import java.io.Serializable;

public class Offline_martDataBean implements Serializable{
	String offline_mart_id;
	String password;
	String tel;
	String location;

	public String getOffline_mart_id() {
		return offline_mart_id;
	}
	public void setOffline_mart_id(String offline_mart_id) {
		this.offline_mart_id = offline_mart_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "Offrine_martDataBean [offline_mart_id=" + offline_mart_id
				+ ", password=" + password + ", tel=" + tel + ", location="
				+ location + "]";
	}
	
	
}
