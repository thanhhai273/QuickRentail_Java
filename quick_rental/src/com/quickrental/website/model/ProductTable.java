package com.quickrental.website.model;

/**
 * Lớp để lấy các trường cho bảng Thông tin sản phẩm của Admin
 * @author MTHUNG (14/12/2020)
 *
 */
public class ProductTable {

	// Thông tin chung của Product
	public Product product;
	
	// Tên danh mục
	public String cateName;

	// Các phương thức setter, getter
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	
	// Constructor
	public ProductTable(Product product, String cateName) {
		super();
		this.product = product;
		this.cateName = cateName;
	}

	// Hàm in ra thông tin các trường
	@Override
	public String toString() {
		return "ProductTable [product=" + product + ", cateName=" + cateName + "]";
	}
}
