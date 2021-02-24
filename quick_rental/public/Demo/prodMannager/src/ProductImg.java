package com.abc.web.jdbc;



public class ProductImg {
	// Id sản phẩm
	public String prodId;
	// Mã sản phẩm
	public String prodCode;
	// Tên sản phẩm
	public String prodName;
	// Giá thuê trên 1 sản phẩm
	public String prodPrice;
	// Trạng thái sản phẩm
	public int prodStatus;
	// Số lượng sản phẩm hiện tại còn
	public int prodAmount;
	// Ảnh min hoạ
	public String prodImg;
	
	
	public ProductImg (String productCode, String prodName, String proPrice, int prodStatus, int prodAmount, String prodImg) {
		super();
		this.prodCode = prodCode;
		this.prodName = prodName;
		this.prodPrice = proPrice;
		this.prodStatus = prodStatus;
		this.prodAmount = prodAmount;
		this.prodImg = prodImg;
		
	}
	
	public String getProdId() {
		return prodId;
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
	public int getProdStatus() {
		return prodStatus;
	}
	public void setProdStatus(int prodStatus) {
		this.prodStatus = prodStatus;
	}
	public int getProdAmount() {
		return prodAmount;
	}
	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}
	public String getProImg() {
		return prodImg;
	}
	public void setProImg(String prodImg) {
		this.prodImg = prodImg;
	}

	@Override
	public String toString() {
		return "ProductImg [prodId=" + prodId + ", prodCode=" + prodCode + ", prodName=" + prodName + ", prodPrice="
				+ prodPrice + ", prodStatus=" + prodStatus + ", prodAmount=" + prodAmount + ", prodImg=" + prodImg
				+ "]";
	}
	
}
