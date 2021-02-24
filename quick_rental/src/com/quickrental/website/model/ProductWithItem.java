package com.quickrental.website.model;

/**
 * @author SonNV
 * date: 13/12/2020
 */

public class ProductWithItem {
	// Id sản phẩm
	public String prodId;
	// Mã sản phẩm

	public String image1;
	// Tên sản phẩm
	public String prodName;
	// Giá thuê trên 1 sản phẩm
	public String prodPrice;
	// Tiền đặt cọc
	public String prodDeposit;
	// item mà nó thuộc về
	public int itemId;

	// hàm khởi tạo
	public ProductWithItem(String prodId, String image1, String prodPrice, String prodDeposit, String prodName,
			int itemId) {
		this.prodId = prodId;
		this.image1 = image1;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.prodName = prodName;
		this.itemId = itemId;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
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

	public String getProdDeposit() {
		return prodDeposit;
	}

	public void setProdDeposit(String prodDeposit) {
		this.prodDeposit = prodDeposit;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	// hàm in ra
	@Override
	public String toString() {
		return "ProductWithItem [prodId=" + prodId + ", image1=" + image1 + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", prodDeposit=" + prodDeposit + ", itemId=" + itemId + "]";
	}

	// productwithITEM

}
