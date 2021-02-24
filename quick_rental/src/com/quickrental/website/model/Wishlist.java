package com.quickrental.website.model;

//Danh sách yêu thích
//Create by: MTHUNG (05/12/2020
public class Wishlist {
	// Mã danh sách yêu thích
	public int id;
	// Mã sản phẩm
	public String prodId;
	// Tên sản phẩm
	public String prodName;
	// Giá sản phẩm
	public String prodPrice;
	// Mã khách hàng
	public String customerId;

	public Wishlist(String prodId, String prodName, String prodPrice, String customerId) {
		this.prodId = prodId;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.customerId = customerId;
	}

	// Phương thức setter/getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	// In các trường
	@Override
	public String toString() {
		return "Wishlist [id=" + id + ", prodId=" + prodId + ", prodName=" + prodName + ", prodPrice=" + prodPrice
				+ ", customerId=" + customerId + "]";
	}

}
