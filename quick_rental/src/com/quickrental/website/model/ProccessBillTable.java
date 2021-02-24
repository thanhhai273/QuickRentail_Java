package com.quickrental.website.model;

/**
 * Lớp để lấy các trường cho bảng Quản lý hóa đơn thuê của Admin
 * 
 * @author MTHUNG (15/12/2020)
 *
 */
public class ProccessBillTable {
	// Thông tin chung của Hóa đơn đang thuê
	public ProcessingBill processingBill;

	// Họ của khách hàng
	public String firstName;

	// Tên của khách hàng
	public String lastName;

	// Tên sản phẩm
	public String prodName;
	// Mã sản phẩm
	public String prodCode;

	// Id ngân hàng
	public int bankId;
	// Số tài khoản thực hiện giao dịch
	public String bankCode;

	// Các phương thức setter, getter

	public ProcessingBill getProcessingBill() {
		return processingBill;
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

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public void setProcessingBill(ProcessingBill processingBill) {
		this.processingBill = processingBill;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	// Constructor
	public ProccessBillTable(ProcessingBill processingBill, String firstName, String lastName, String prodName,
			String prodCode) {
		super();
		this.processingBill = processingBill;
		this.firstName = firstName;
		this.lastName = lastName;
		this.prodName = prodName;
		this.prodCode = prodCode;
	}

	public ProccessBillTable(ProcessingBill processingBill, String firstName, String lastName, String prodName,
			String prodCode, int bankId, String bankCode) {
		super();
		this.processingBill = processingBill;
		this.firstName = firstName;
		this.lastName = lastName;
		this.prodName = prodName;
		this.prodCode = prodCode;
		this.bankId = bankId;
		this.bankCode = bankCode;
	}

	// Hàm in ra tất cả các trường
	@Override
	public String toString() {
		return "ProccessBillTable [processingBill=" + processingBill + ", firstName=" + firstName + ", lastName="
				+ lastName + ", prodName=" + prodName + ", prodCode=" + prodCode + "]";
	}

}
