package com.quickrental.website.model;

// Modal phục vụ show các sản phẩm trong Giỏ hàng
//Create by: SonNV (07/12/2020)
public class ItemCart {
		// Id sản phẩm
		public String prodId;
		// Mã sản phẩm
		public String prodCode;
		// Ảnh minh họa 1
		public String image1;
		// Ảnh minh họa 2
		public String image2;
		// Ảnh minh họa 3
		public String image3;
		// Tên sản phẩm
		public String prodName;
		// Giá thuê trên 1 sản phẩm
		public String prodPrice;
		// Mô tả sản phẩm
		public String prodDescription;
		// Số lượng sản phẩm trong giỏ
		public int prodAmount;
		// Số lượng ngày thuê
		public int prodTime;
		
		// Id danh mục
		public int cateId;
		//Status
		public String prodStatus;
		
		
		public int getProdTime() {
			return prodTime;
		}
		public void setProdTime(int prodTime) {
			this.prodTime = prodTime;
		}
		
		public String getProdId() {
			return prodId;
		}
		public void setProdId(String prodId) {
			this.prodId = prodId;
		}
		public String getProdCode() {
			return prodCode;
		}
		public void setProdCode(String prodCode) {
			this.prodCode = prodCode;
		}
		public String getImage1() {
			return image1;
		}
		public void setImage1(String image1) {
			this.image1 = image1;
		}
		public String getImage2() {
			return image2;
		}
		public void setImage2(String image2) {
			this.image2 = image2;
		}
		public String getImage3() {
			return image3;
		}
		public void setImage3(String image3) {
			this.image3 = image3;
		}
		public String getProdName() {
			return prodName;
		}
		public void setProdName(String prodName) {
			this.prodName = prodName;
		}
		public String getProdPrice() {
			return prodPrice;
		}
		public void setProdPrice(String prodPrice) {
			this.prodPrice = prodPrice;
		}
		public String getProdDescription() {
			return prodDescription;
		}
		public void setProdDescription(String prodDescription) {
			this.prodDescription = prodDescription;
		}
		public int getProdAmount() {
			return prodAmount;
		}
		public void setProdAmount(int prodAmount) {
			this.prodAmount = prodAmount;
		}
		public int getCateId() {
			return cateId;
		}
		public void setCateId(int cateId) {
			this.cateId = cateId;
		}
		public String getProdStatus() {
			return prodStatus;
		}
		public void setProdStatus(String prodStatus) {
			this.prodStatus = prodStatus;
		}
		//contructor
		
		
		
		@Override
		public String toString() {
			return "ItemCart [prodId=" + prodId + ", prodCode=" + prodCode + ", image1=" + image1 + ", image2=" + image2
					+ ", image3=" + image3 + ", prodName=" + prodName + ", prodPrice=" + prodPrice
					+ ", prodDescription=" + prodDescription + ", prodAmount=" + prodAmount + ", prodTime=" + prodTime
					+ ", cateId=" + cateId + ", prodStatus=" + prodStatus + "]";
		}
		public ItemCart(String prodId, String prodCode, String image1, String image2, String image3, String prodName,
				String prodPrice, String prodDescription, int prodAmount, int prodTime, int cateId,String prodStatus) {
			super();
			this.prodId = prodId;
			this.prodCode = prodCode;
			this.image1 = image1;
			this.image2 = image2;
			this.image3 = image3;
			this.prodName = prodName;
			this.prodPrice = prodPrice;
			this.prodDescription = prodDescription;
			this.prodAmount = prodAmount;
			this.prodTime = prodTime;
			this.cateId = cateId;
			this.prodStatus = prodStatus;
		}
		
		
		
		
		

}
