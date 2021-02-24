package com.quickrental.website.model;


// Đơn hàng đang xử lý
// Create by: MTHUNG (16/11/2020)
public class ProcessingBill {
	// Id hóa đơn
	public String billId;
	// Mã hóa đơn
	public String billCode;
	// Trạng thái đơn hàng
	public int billStatus;
	// Id sản phẩm
	public String prodId;
	// Số lượng sản phẩm
	public int prodAmount;
	// Tiền đặt cọc
	public String prodDeposit;
	// Giá trên 1 sản phẩm
	public String prodPrice;
	// Id khách hàng
	public String customerId;
	// Số ngày thuê (Tính từ thời điểm nhận được hàng)
	public int rentalTerm;
	// Ngày khởi tạo
	public String createdDate;
	// Ngày cập nhật gần nhất
	public String modifyDate;

	// Phương thức setter/getter
	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getBillCode() {
		return billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	public int getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(int billStatus) {
		this.billStatus = billStatus;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public int getProdAmount() {
		return prodAmount;
	}

	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}

	public String getProdDeposit() {
		return prodDeposit;
	}

	public void setProdDeposit(String prodDeposit) {
		this.prodDeposit = prodDeposit;
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

	public int getRentalTerm() {
		return rentalTerm;
	}

	public void setRentalTerm(int rentalTerm) {
		this.rentalTerm = rentalTerm;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	// Constructor
	public ProcessingBill(String billId, String billCode, int billStatus, String prodId, int prodAmount,
			String prodDeposit, String prodPrice, String customerId, int rentalTerm, String createdDate,
			String modifyDate) {
		super();
		this.billId = billId;
		this.billCode = billCode;
		this.billStatus = billStatus;
		this.prodId = prodId;
		this.prodAmount = prodAmount;
		this.prodDeposit = prodDeposit;
		this.prodPrice = prodPrice;
		this.customerId = customerId;
		this.rentalTerm = rentalTerm;
		this.createdDate = createdDate;
		this.modifyDate = modifyDate;
	}

	public ProcessingBill(String billCode, int billStatus, String prodId, int prodAmount, String prodDeposit,
			String prodPrice, String customerId, int rentalTerm) {
		super();
		this.billCode = billCode;
		this.billStatus = billStatus;
		this.prodId = prodId;
		this.prodAmount = prodAmount;
		this.prodDeposit = prodDeposit;
		this.prodPrice = prodPrice;
		this.customerId = customerId;
		this.rentalTerm = rentalTerm;
	}

	// In các trường
	@Override
	public String toString() {
		return "ProcessingBill [billId=" + billId + ", billCode=" + billCode + ", billStatus=" + billStatus
				+ ", prodId=" + prodId + ", prodAmount=" + prodAmount + ", prodDeposit=" + prodDeposit + ", prodPrice="
				+ prodPrice + ", customerId=" + customerId + ", rentalTerm=" + rentalTerm + ", createdDate="
				+ createdDate + ", modifyDate=" + modifyDate + "]";
	}

}
