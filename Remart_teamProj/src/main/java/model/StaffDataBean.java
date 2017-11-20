package model;

import java.io.Serializable;

public class StaffDataBean implements Serializable{
	String staff_id;
	String password;
	String name;
	String mart_id;
	String position;
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
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
	public String getMart_id() {
		return mart_id;
	}
	public void setMart_id(String mart_id) {
		this.mart_id = mart_id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "StaffDataBean [staff_id=" + staff_id + ", password=" + password
				+ ", name=" + name + ", mart_id=" + mart_id + ", position="
				+ position + "]";
	}
	
	
}
