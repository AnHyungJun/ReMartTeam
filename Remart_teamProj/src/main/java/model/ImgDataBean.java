package model;

public class ImgDataBean {
	String img_id;
	String feed_id;
	String image_name;
	String content;
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
	public String getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(String feed_id) {
		this.feed_id = feed_id;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ImgDataBean [img_id=" + img_id + ", feed_id=" + feed_id
				+ ", image_name=" + image_name + ", content=" + content + "]";
	}
	
	
}
