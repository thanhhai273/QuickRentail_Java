package com.quickrental.website.model;

import java.util.List;

/**
 * chứa cấu trúc tạm để lưu danh sách các category theo trường item của nó
 * @author SonNV
 * date: 13/12/2020
 *
 */
public class ListOfListCate {
	// id của trường item
	public int itemId;
	public String itemName;
	public List<Category> cates;
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public List<Category> getCates() {
		return cates;
	}
	public void setCates(List<Category> cates) {
		this.cates = cates;
	}
	public ListOfListCate(int itemId, List<Category> cates) {
		this.itemId = itemId;
		this.cates = cates;
	}
	public ListOfListCate(int itemId, List<Category> cates, String itemName) {
		this.itemId = itemId;
		this.cates = cates;
		this.itemName = itemName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String ArraytoString() {
		 String results = " ";
		for(Category c : cates) {
	       results += c.toString(); //if you implement toString() for Dog then it will be added here
	    }
		return results;
	}
	@Override
	public String toString() {
		return "ListOfListCate [itemId=" + itemId + ", itemName=" + itemName + ", cates=" + cates + "]";
	}
	
	
	

}
