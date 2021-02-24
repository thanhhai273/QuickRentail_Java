package com.quickrental.website.model;

public class SuccessBillTable {
	// Thông tin chung
	public SuccessBill successbill;
	// Họ của khách hàng
	public String firstName;
	// Tên của khách hàng
	public String lastName;
	// Mã sản phẩm sản phẩm
	public String prodCode;
	// Tên sản phẩm
	public String prodName;
	// Giá sản phẩm
	public String prodPrice;
	// Giá đặt cọc
	public String prodDeposit;
	// Tên ngân hàng
	public String bankName;
	

	// khởi tạo
	public SuccessBillTable(SuccessBill successbill, String firstName, String lastName, String prodCode,
			String prodName, String prodPrice, String prodDeposit, String bankName) {
		super();
		this.successbill = successbill;
		this.firstName = firstName;
		this.lastName = lastName;
		this.prodCode = prodCode;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.prodDeposit = prodDeposit;
		this.bankName = bankName;
	}

	// get set

	public SuccessBill getSuccessbill() {
		return successbill;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
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

	public void setSuccessbill(SuccessBill successbill) {
		this.successbill = successbill;
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

	// Hàm in ra tất cả các trường
	@Override
	public String toString() {
		return "SuccessBillTable [successbill=" + successbill + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", prodCode=" + prodCode + ", prodName=" + prodName + ", prodPrice=" + prodPrice + ", prodDeposit="
				+ prodDeposit + ", bankName=" + bankName + "]";
	}

}
