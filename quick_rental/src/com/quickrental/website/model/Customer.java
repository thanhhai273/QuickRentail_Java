package com.quickrental.website.model;


// Khách hàng
// Create by: MTHUNG (16/11/2020) 
public class Customer {
	// Id khách hàng
	public String customerId;
	// Mã khách hàng
	public String customerCode;
	// Họ của khách hàng
	public String firstName;
	// Tên khách hàng
	public String lastName;
	// Địa chỉ hiện tại
	public String address;
	// Ngày sinh
	public String birthday;
	// Giới tính
	public int gender;
	// Số điện thoại
	public String phoneNumber;
	// Địa chỉ email
	public String email;
	// Mã ngân hàng
	public int bankId;
	// Số tài khoản ngân hàng
	public String bankCodeAccount;
	// Mật khẩu
	public String password;

	// Phương thức setter/getter
	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBankId() {
		return bankId;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public String getBankCodeAccount() {
		return bankCodeAccount;
	}

	public void setBankCodeAccount(String bankCodeAccount) {
		this.bankCodeAccount = bankCodeAccount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// Tạo hàm khởi tạo
	public Customer(String customerId, String customerCode, String firstName, String lastName, String address,
			String birthday, int gender, String phoneNumber, String email, int bankId, String bankCodeAccount,
			String password) {
		super();
		this.customerId = customerId;
		this.customerCode = customerCode;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.bankId = bankId;
		this.bankCodeAccount = bankCodeAccount;
		this.password = password;
	}

	public Customer(String customerId, String customerCode, String firstName, String lastName, String address,
			String birthday, int gender, String phoneNumber, String email, int bankId, String bankCodeAccount) {
		super();
		this.customerId = customerId;
		this.customerCode = customerCode;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.bankId = bankId;
		this.bankCodeAccount = bankCodeAccount;
	}

	public Customer() {}

	// In các trường
	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerCode=" + customerCode + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", address=" + address + ", birthday=" + birthday + ", gender=" + gender
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", bankId=" + bankId + ", bankCodeAccount="
				+ bankCodeAccount + ", password=" + password + "]";
	}

}
