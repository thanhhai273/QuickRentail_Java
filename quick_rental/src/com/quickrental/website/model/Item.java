package com.quickrental.website.model;

public class Item {
	// id loại sản phẩm
	public int itemId;
	// tên loại sản phẩm
	public String itemName;
	//
	
	//getter and setter
	public int getItemId() {
		return itemId;
	}

	
	
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}

	//contructor
	public Item(int itemId, String itemName) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
	}


	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + "]";
	}
	
	
	
	
	
	
	

	
}
