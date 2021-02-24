package com.quickrental.website.model;

// Kho hàng
// Create by: MTHUNG (16/11/2020)
public class Warehouse {
	// Id sản phẩm
	public String prodId;
	// Số lượng sản phẩm còn trong kho
	public int amount;
	// Số lượng sản phẩm đang cho thuê
	public int rentAmount;
	// Giá tiền nhập
	public String importPrice;
	// Mã sản phẩm định nghĩa bên đối tác
	public String prodCodePartner;

	// Tạo constructor
	public Warehouse(String prodId, int amount, int rentAmount, String importPrice, String prodCodePartner) {
		super();
		this.prodId = prodId;
		this.amount = amount;
		this.rentAmount = rentAmount;
		this.importPrice = importPrice;
		this.prodCodePartner = prodCodePartner;
	}

	// Phương thức setter/getter
	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getRentAmount() {
		return rentAmount;
	}

	public void setRentAmount(int rentAmount) {
		this.rentAmount = rentAmount;
	}

	public String getImportPrice() {
		return importPrice;
	}

	public void setImportPrice(String importPrice) {
		this.importPrice = importPrice;
	}

	public String getProdCodePartner() {
		return prodCodePartner;
	}

	public void setProdCodePartner(String prodCodePartner) {
		this.prodCodePartner = prodCodePartner;
	}

	// In các trường
	@Override
	public String toString() {
		return "Warehouse [prodId=" + prodId + ", amount=" + amount + ", rentAmount=" + rentAmount + ", importPrice="
				+ importPrice + ", prodCodePartner=" + prodCodePartner + "]";
	}
}
