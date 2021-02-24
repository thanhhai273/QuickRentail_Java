package com.quickrental.website.model;

// Danh mục
// Create by: MTHUNG (16/11/2020)
// Modify: Sonnv(12/12/2020)
public class Category {
	// Mã danh mục
	public int cateId;
	// Tên danh mục
	public String cateName;
	// item( trường sản phẩm mà nó thuộc về)
	public int itemId;
	// Tên viết tắt của danh mục
	public String description;

	// Phương thức setter/getter
	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category(int cateId, String cateName, int itemId, String description) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
		this.itemId = itemId;
		this.description = description;
	}

	// In các trường
	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", cateName=" + cateName + ", itemId=" + itemId + ", description="
				+ description + "]";
	}
}
