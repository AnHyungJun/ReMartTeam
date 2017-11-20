package model;

import java.io.Serializable;

public class StaffDataBean implements Serializable{
	int staff_id;
	String password;
	String name;
	String offline_mart_id;
	String position;
	public int getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getOffline_mart_id() {
		return offline_mart_id;
	}
	public void setOffline_mart_id(String offline_mart_id) {
		this.offline_mart_id = offline_mart_id;
	}
	@Override
	public String toString() {
		return "StaffDataBean [staff_id=" + staff_id + ", password=" + password
				+ ", name=" + name + ", offline_mart_id=" + offline_mart_id
				+ ", position=" + position + "]";
	}
	
	
}
