package com.quickrental.website.model;
import java.util.List;

/**
 * Bảng chi tiết tất cả hóa đơn đang thuê cho trang quản lý Admin
 * @author MTHUNG (15/12/2020)
 *
 */
public class ListOfListProcessBill {
	// Thông tin chi tiết danh sách Hóa đơn thuê
	public List<ProccessBillTable> listBill;
	
	// Mã hóa đơn
	public String billCode;

	// Các phương thức setter, getter
	public List<ProccessBillTable> getListBill() {
		return listBill;
	}

	public void setListBill(List<ProccessBillTable> listBill) {
		this.listBill = listBill;
	}

	public String getBillCode() {
		return billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	// Constructor
	public ListOfListProcessBill(List<ProccessBillTable> listBill, String billCode) {
		super();
		this.listBill = listBill;
		this.billCode = billCode;
	}

	// Hàm in ra tất cả các trường
	@Override
	public String toString() {
		return "ListOfListProcessBill [listBill=" + listBill + ", billCode=" + billCode + "]";
	}
}
