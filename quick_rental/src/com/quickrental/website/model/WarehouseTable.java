package com.quickrental.website.model;

/**
 * Lớp thông tin chi tiết cho Kho hàng bao gồm cả tên sản phẩm cho Admin
 * 
 * @author MTHUNG (14/12/2020)
 *
 */
public class WarehouseTable {

	// Thông tin chung Kho hàng
	public Warehouse warehouse;

	// tên Sản phẩm
	public String prodName;

	// Các hàm setter, getter
	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	// Constructor
	public WarehouseTable(Warehouse warehouse, String prodName) {
		super();
		this.warehouse = warehouse;
		this.prodName = prodName;
	}

	// Hàm in ra tất cả trường
	@Override
	public String toString() {
		return "WarehouseTable [warehouse=" + warehouse + ", prodName=" + prodName + "]";
	}

}
