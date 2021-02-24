package com.quickrental.website.model;

import java.util.List;

/**
 * Bảng chi tiết tất cả hóa đơn đã thuê
 * 
 * @author MTHUNG (15/12/2020)
 *
 */
public class ListOfListSuccessBill {
	// Thông tin chi tiết danh sách Hóa đơn thuê
	public List<SuccessBillTable> listBill;

	// Mã hóa đơn
	public String billCode;

	// Các phương thức setter, getter
	public List<SuccessBillTable> getListBill() {
		return listBill;
	}

	public void setListBill(List<SuccessBillTable> listBill) {
		this.listBill = listBill;
	}

	public String getBillCode() {
		return billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	// constructor
	public ListOfListSuccessBill(List<SuccessBillTable> listBill, String billCode) {
		super();
		this.listBill = listBill;
		this.billCode = billCode;
	}

	// Hàm in ra tất cả các trường
	@Override
	public String toString() {
		return "Listsuccessbill [listBill=" + listBill + ", billCode=" + billCode + "]";
	}

}

// sưa tên
