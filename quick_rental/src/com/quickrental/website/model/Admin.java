package com.quickrental.website.model;

// Người quản lý
// Craete by: MTHUNG (16/11/2020)
public class Admin {
	// Id tài khoản
	public String adminId;
	// Mã quản lý
	public String adminCode;
	// Tên người quản lý
	public String adminName;
	// Tên tài khoản
	public String adminAccount;
	// Mật khẩu tài khoản
	public String adminPass;

	// Phương thức setter/getter
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminAccount() {
		return adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	// Tạo hàm khởi tạo
	public Admin(String adminId, String adminCode, String adminName, String adminAccount, String adminPass) {
		super();
		this.adminId = adminId;
		this.adminCode = adminCode;
		this.adminName = adminName;
		this.adminAccount = adminAccount;
		this.adminPass = adminPass;
	}

	public Admin(String adminId, String adminCode, String adminName, String adminAccount) {
		super();
		this.adminId = adminId;
		this.adminCode = adminCode;
		this.adminName = adminName;
		this.adminAccount = adminAccount;
	}

	public Admin(String adminId) {
		super();
		this.adminId = adminId;
	}

	// In các trường
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminCode=" + adminCode + ", adminName=" + adminName + ", adminAccount="
				+ adminAccount + ", adminPass=" + adminPass + "]";
	}
}
