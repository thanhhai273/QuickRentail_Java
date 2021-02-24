package com.quickrental.website.model;

//Danh sách ảnh sản phẩm gợi ý
//Create by: MTHUNG (05/12/2020)
public class SuggestionImg {
	// Mã ảnh
	public int id;
	// Ảnh
	public String img;
	// Link tới sản phẩm
	public String link;

	// Phương thức setter/getter
	public int getId() {
		return id;
	}

	public SuggestionImg(int id, String img, String link) {
		this.id = id;
		this.img = img;
		this.link = link;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	// In ra các trường
	@Override
	public String toString() {
		return "SuggestionImg [id=" + id + ", img=" + img + ", link=" + link + "]";
	}
}
