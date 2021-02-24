package com.quickrental.website.model;

//Hình ảnh poster
//Craete by: MTHUNG (05/12/2020)
public class Poster {
	// Id tài khoản
	public int id;
	// Địa chỉ ảnh
	public String img;
	// Tiêu đề ảnh
	public String title;
	// Mô tả ngắn gọn
	public String description;

	

	public Poster(int id, String img, String title, String description) {
		this.id = id;
		this.img = img;
		this.title = title;
		this.description = description;
	}

	// Tạo hàm khởi tạo
	public int getId() {
		return id;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// In các trường
	@Override
	public String toString() {
		return "Poster [id=" + id + ", img=" + img + ", title=" + title + ", description=" + description + "]";
	}

}
