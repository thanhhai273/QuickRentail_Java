package com.quickrental.website.dao;
import com.quickrental.website.model.Product;
import com.quickrental.website.model.Wishlist;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của Thông tin sản phẩm yêu thích
 * @author SonNV 
 * @date 7/12/2020
 */
public class WishlistDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến dataBase
	 */
	private static DataSource datasource;
	/**
	 * Contructor
	 * @param datasource
	 */
	public WishlistDAO(DataSource datasource) {
		WishlistDAO.datasource = datasource;
	}
	/**
	 * Thêm sản phẩm yêu thích mới
	 * @param newWishLish
	 * @throws Exception
	 */
	public static void createNewWishlist(Wishlist newWishlist) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = datasource.getConnection();
			String sql = "insert into wishlist (id, prod_id, prod_name, prod_price, customer_id) value (?,?,?,?,?);";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, newWishlist.getId());
			stt.setString(2, newWishlist.getProdId());
			stt.setString(3,newWishlist.getProdName());
			stt.setString(4, newWishlist.getProdPrice());
			stt.setString(5, newWishlist.getCustomerId());
			
			stt.execute();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	

	
	/**
	 * Xóa sản phẩm yêu thích theo Id khách hàng và Id product
	 * @param prod_id
	 * @param customer_id
	 * @throws Exception
	 */
	public void DeleteWishlist(String prod_id, String customer_id) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = datasource.getConnection();
			String sql = "delete from wishlist where (prod_id = ? and customer_id = ?);";
			stt = cn.prepareStatement(sql);
			stt.setString(1, prod_id);
			stt.setString(2, customer_id);
			
			stt.execute();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	
	/**
	 * Lấy ra danh sách sản phẩm trong WishList theo customer_id
	 * @param customer_id
	 * @throws Exception
	 */
	public static List<Product> getProdinWishList (String customer_id) throws Exception {
		List<Product> products = new ArrayList<>();
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = datasource.getConnection();
			String sql = "select pd.prod_id, pd.prod_code, image1, image2, image3, pd.prod_name, pd.prod_price,"
					 +"pd.prod_status, pd.prod_description, pd.prod_deposit, pd.prod_amount, cate_id  from product pd, wishlist wl "
					 + "where (pd.prod_id = wl.prod_id and wl.customer_id = customer_id);";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while(rs.next()) {
				String prod_id = rs.getString("pd.prod_id");
				String prod_code = rs.getString("pd.prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prod_name = rs.getString("pd.prod_name");
				String prod_price = rs.getString("pd.prod_price");
				String prod_deposit = rs.getString("pd.prod_deposit");
				String prod_status = rs.getString("pd.prod_status");
				int prod_amount = rs.getInt("pd.prod_amount");
				String prod_description = rs.getString("pd.prod_description");
				int cate_id = rs.getInt("cate_id");
				
				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id);

				products.add(tempProd);
				
			}
			return products;
			
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	
	/**
	 * Hàm đóng kết nối
	 * 
	 * @param cn
	 * @param stt
	 * @param rs
	 */
	private static void close(Connection cn, Statement stt, ResultSet rs) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (stt != null) {
				stt.close();
			}
			if (cn != null) {
				cn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
