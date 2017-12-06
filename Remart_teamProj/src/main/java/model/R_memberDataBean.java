package model;

import java.io.Serializable;

public class R_memberDataBean implements Serializable{
	private String id;
	private String passwd;
	private String name;
	private String phone;
	private String address1;
	private String address2;
	private String zip1;
	private String zip2;
	private String grade;
	private int point;
	private int use_like;
	private int follownum;
	private int followernum;
	private int writenum;
	private String sex;
	private String email;
	private String jumin1;
	private String info;
	private String profileImg;
	private int follow_status;
	public int getFollowernum() {
		return followernum;
	}

	public void setFollowernum(int followernum) {
		this.followernum = followernum;
	}

	public int getFollow_status() {
		return follow_status;
	}

	public void setFollow_status(int follow_status) {
		this.follow_status = follow_status;
	}
	public int getFollownum() {
		return follownum;
	}

	public void setFollownum(int follownum) {
		this.follownum = follownum;
	}

	public int getWritenum() {
		return writenum;
	}

	public void setWritenum(int writenum) {
		this.writenum = writenum;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getZip1() {
		return zip1;
	}
	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}
	public String getZip2() {
		return zip2;
	}
	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUse_like() {
		return use_like;
	}
	public void setUse_like(int use_like) {
		this.use_like = use_like;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "R_memberDataBean [id=" + id + ", passwd=" + passwd + ", name="
				+ name + ", phone=" + phone + ", address1=" + address1
				+ ", address2=" + address2 + ", zip1=" + zip1 + ", zip2="
				+ zip2 + ", grade=" + grade + ", point=" + point
				+ ", use_like=" + use_like + ", sex=" + sex + ", email="
				+ email + ", jumin1=" + jumin1 + ", info=" + info
				+ ", profileImg=" + profileImg + "]";
	}
	
	
}
