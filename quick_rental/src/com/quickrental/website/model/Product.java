package com.quickrental.website.model;

import java.sql.Timestamp;

// Sản phẩm
// Create by: MTHUNG (16/11/2020)
// Update by: MTHUNG (05/12/2020)
public class Product {
	// Id sản phẩm
	public String prodId;
	// Mã sản phẩm
	public String prodCode;
	// Ảnh minh họa 1
	public String image1;
	// Ảnh minh họa 2
	public String image2;
	// Ảnh minh họa 3
	public String image3;
	// Màu sản phẩm
	public String prodColor;
	// Tên sản phẩm
	public String prodName;
	// Giá thuê trên 1 sản phẩm
	public String prodPrice;
	// Tiền đặt cọc
	public String prodDeposit;
	// Trạng thái sản phẩm
	public String prodStatus;
	// Mô tả sản phẩm
	public String prodDescription;
	// Số lượng sản phẩm hiện tại còn
	public int prodAmount;
	// Id danh mục
	public int cateId;
	// Ngày tạo mới sản phẩm
	public Timestamp createDate;

	// Phương thức setter/getter
	public String getProdId() {
		return prodId;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getProdColor() {
		return prodColor;
	}

	public void setProdColor(String prodColor) {
		this.prodColor = prodColor;
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

	public String getProdStatus() {
		return prodStatus;
	}

	public void setProdStatus(String prodStatus) {
		this.prodStatus = prodStatus;
	}

	public String getProdDescription() {
		return prodDescription;
	}

	public void setProdDescription(String prodDescription) {
		this.prodDescription = prodDescription;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getProdDeposit() {
		return prodDeposit;
	}

	public void setProdDeposit(String prodDeposit) {
		this.prodDeposit = prodDeposit;
	}

	// Tạo hàm khởi tạo
	public Product(String prodId, String prodCode, String image1, String image2, String image3, String prodColor,
			String prodName, String prodPrice, String prodDeposit, String prodStatus, String prodDescription,
			int prodAmount, int cateId, Timestamp createDate) {
		super();
		this.prodId = prodId;
		this.prodCode = prodCode;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.prodColor = prodColor;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.prodStatus = prodStatus;
		this.prodDescription = prodDescription;
		this.prodAmount = prodAmount;
		this.cateId = cateId;
		this.createDate = createDate;
	}

	public Product(String prodId, String prodCode, String image1, String image2, String image3, String prodColor,
			String prodName, String prodPrice, String prodDeposit, String prodStatus, String prodDescription,
			int prodAmount, int cateId) {
		super();
		this.prodId = prodId;
		this.prodCode = prodCode;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.prodColor = prodColor;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.prodStatus = prodStatus;
		this.prodDescription = prodDescription;
		this.prodAmount = prodAmount;
		this.cateId = cateId;
	}

	public Product(String prodCode, String image1, String image2, String image3, String prodColor, String prodName,
			String prodPrice, String prodDeposit, String prodStatus, String prodDescription, int prodAmount,
			int cateId) {
		super();
		this.prodCode = prodCode;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.prodColor = prodColor;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.prodStatus = prodStatus;
		this.prodDescription = prodDescription;
		this.prodAmount = prodAmount;
		this.cateId = cateId;
	}

	public Product(String prodId, String image1, String prodPrice, String prodDeposit,String prodName ) {
		this.prodId = prodId;
		this.image1 = image1;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.prodName  = prodName;
	}

	// In ra các trường
	@Override
	public String toString() {
		return "Product [prodId=" + prodId + ", prodCode=" + prodCode + ", image1=" + image1 + ", image2=" + image2
				+ ", image3=" + image3 + ", prodColor=" + prodColor + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", prodDeposit=" + prodDeposit + ", prodStatus=" + prodStatus + ", prodDescription="
				+ prodDescription + ", prodAmount=" + prodAmount + ", cateId=" + cateId + ", createDate=" + createDate
				+ "]";
	}

}