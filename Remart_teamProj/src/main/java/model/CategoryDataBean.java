package model;

public class CategoryDataBean {
	String category_id;
	String category_name;
	String category_group;
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_group() {
		return category_group;
	}
	public void setCategory_group(String category_group) {
		this.category_group = category_group;
	}
	@Override
	public String toString() {
		return "CategoryDataBean [category_id=" + category_id
				+ ", category_name=" + category_name + ", category_group="
				+ category_group + "]";
	}
	
	
}
