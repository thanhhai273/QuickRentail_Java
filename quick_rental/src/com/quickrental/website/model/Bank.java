package com.quickrental.website.model;

//Ngân hàng
//Craete by: MTHUNG (5/12/2020)
public class Bank {
	// Mã ngân hàng
	public int id;
	// Tên ngân hàng
	public String bankName;

	// Phương thức setter/getter
	public int getId() {
		return id;
	}

	public Bank(int id, String bankName) {
		this.id = id;
		this.bankName = bankName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	// In các trường
	@Override
	public String toString() {
		return "Bank [id=" + id + ", bankName=" + bankName + "]";
	}
}
