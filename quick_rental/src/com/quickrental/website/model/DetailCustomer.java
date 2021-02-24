package com.quickrental.website.model;

/**
 * Lớp thông tin chi tiết Khách hàng bao gồm cả tên Ngân hàng
 * @author MTHUNG (14/12/2020)
 *
 */
public class DetailCustomer {
	// Thông tin chung Khách hàng
	public Customer customer;
	
	// Tên ngân hàng đăng ký
	public String bankName;

	// Phương thức setter, getter
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	// Constructor
	public DetailCustomer(Customer customer, String bankName) {
		super();
		this.customer = customer;
		this.bankName = bankName;
	}
	
	// Hàm dùng để in ra tất cả trường
	@Override
	public String toString() {
		return "DetailCustomer [customer=" + customer + ", bankName=" + bankName + "]";
	}
}
