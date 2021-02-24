package com.quickrental.website.model;


// Hóa đơn thành công (sau khi cửa hàng nhận hàng)
// Create by: MTHUNG (16/11/2020)
public class SuccessBill {
	public SuccessBill(String billId, String billCode, String prodId, int prodAmount, String rentalDate,
			String receivedDate, int statusRefund, int bankId, String bankCode, String customerId) {
		super();
		this.billId = billId;
		this.billCode = billCode;
		this.prodId = prodId;
		this.prodAmount = prodAmount;
		this.rentalDate = rentalDate;
		this.receivedDate = receivedDate;
		this.statusRefund = statusRefund;
		this.bankId = bankId;
		this.bankCode = bankCode;
		this.customerId = customerId;
	}
	//id customer
	public String customerId;
	// Id hóa đơn
	public String billId;
	// Mã hóa đơn
	public String billCode;
	// Id sản phẩm
	public String prodId;
	// Số lượng sản phẩm
	public int prodAmount;
	// Ngày cho thuê
	public String rentalDate;
	// Ngày nhận hàng
	public String receivedDate;
	// Trạng thái hoàn tiền (0-Chưa hoàn, 1-Đã hoàn)
	public int statusRefund;
	// Tên ngân hàng dùng để giao dịch
	public int bankId;
	// Tài khoản ngân hàng
	public String bankCode;

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

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

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}

	public int getStatusRefund() {
		return statusRefund;
	}

	public void setStatusRefund(int statusRefund) {
		this.statusRefund = statusRefund;
	}

	public int getBankId() {
		return bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	// In các trường
	@Override
	public String toString() {
		return "SuccessBill [customerId=" + customerId + ", billId=" + billId + ", billCode=" + billCode + ", prodId="
				+ prodId + ", prodAmount=" + prodAmount + ", rentalDate=" + rentalDate + ", receivedDate="
				+ receivedDate + ", statusRefund=" + statusRefund + ", bankId=" + bankId + ", bankCode=" + bankCode
				+ "]";
	}
}
