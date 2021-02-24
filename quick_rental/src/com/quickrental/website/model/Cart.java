package com.quickrental.website.model;

// Giỏ hàng
// Create by: MTHUNG (16/11/2020)
public class Cart {
	// Id giỏ hàng
	public String cartId;
	// Id khách hàng
	public String customerId;
	// Id sản phẩm
	public String prodId;
	// Số lượng sản phẩm
	public int prodAmount;
	// số ngày đặt sản phẩm
	public int prodTime;
	
	public int getProdTime() {
		return prodTime;
	}
	public void setProdTime(int prodTime) {
		this.prodTime = prodTime;
	}
	// Phương thức setter/getter
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public int getProdAmount() {
		return prodAmount;
	}
	
	public Cart(String cartId, String customerId, String prodId, int prodAmount, int prodTime) {
		super();
		this.cartId = cartId;
		this.customerId = customerId;
		this.prodId = prodId;
		this.prodAmount = prodAmount;
		this.prodTime = prodTime;
	}
	public Cart(String customerId, String prodId, int prodAmount, int prodTime) {
		this.customerId = customerId;
		this.prodId = prodId;
		this.prodAmount = prodAmount;
		this.prodTime = prodTime;
	}
	public void setProdAmount(int prodAmount) {
		this.prodAmount = prodAmount;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", customerId=" + customerId + ", prodId=" + prodId + ", prodAmount="
				+ prodAmount + ", prodTime=" + prodTime + "]";
	}
	
	// In các trường
	
	
}
