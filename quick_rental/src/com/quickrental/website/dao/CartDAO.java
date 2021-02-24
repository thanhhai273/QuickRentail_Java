package com.quickrental.website.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import com.quickrental.website.model.Cart;
import com.quickrental.website.model.ItemCart;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của giỏ hàng
 * 
 * @author NVSON (01/12/2020)
 */

public class CartDAO {
	 /**
	  * Khai bao nguon du lieu
	  */
	private static DataSource dataSource;
	
	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public CartDAO(DataSource dataSource) {
		CartDAO.dataSource = dataSource;
	}
	/**
	 * Thêm mới sản phẩm vào giỏ hàng
	 * 
	 *@param newCart
	 * @throws Exception
	 */
	public static void createNewCart(Cart newCart) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into cart(cart_id, customer_id, prod_id, prod_amount, prod_time) value(?,?,?,?,?);";
			stt = cn.prepareStatement(sql);
			
			
			stt.setString(1, newCart.getCartId());
			stt.setString(2, newCart.getCustomerId());
			stt.setString(3, newCart.getProdId());
			stt.setInt(4, newCart.getProdAmount());
			stt.setInt(5, newCart.getProdTime());
			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}
				
	}
	
	/**
	 * Kiểm tra xem cart của (customer_id, prod_id) có tồn tại hay không
	 * @param customer_id
	 * @param prod_id
	 * @return
	 * @throws Exception 
	 */
	public static Cart checkProdInCart(String customer_id,String prod_id) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		Cart tmpcart = null;
		
		try {
			cn = dataSource.getConnection();
			String sql =" select * from cart where customer_id = ? and prod_id = ?";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customer_id);
			stt.setString(2, prod_id);
			rs = stt.executeQuery();
			if(rs.next()) {
				String cart_id = rs.getString("cart_id");
				int prod_amount = rs.getInt("prod_amount");
				int prod_time = rs.getInt("prod_time");
				tmpcart = new Cart(cart_id,customer_id,prod_id,prod_amount, prod_time);

			}
			
			return tmpcart;
			
		}finally {
			close(cn, stt, rs);
		}
		
	}
	
	/**
	 * Lấy danh sách toàn bộ sản phẩm trong giỏ hàng theo customerId
	 * @param customerId
	 * @throws Exception
	 * @return
	 */
	public static List<ItemCart> getDetailCart(String customerId ) throws Exception{
		List<ItemCart> carts = new ArrayList<>();
		
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		
		/*
		 *  Return modal of Item in Carts
		 */
				
			try {
				cn = dataSource.getConnection();
				String sql = "select pd.prod_id, pd.prod_code, pd.image1, pd.image2, pd.image3, pd.prod_name, pd.prod_price,"
						 +"pd.prod_status, pd.prod_description, pd.cate_id, c.prod_amount, c.prod_time from product pd, cart c "
						 + "where (pd.prod_id = c.prod_id and c.customer_id = customer_id);";
				stt = cn.prepareStatement(sql);
				rs = stt.executeQuery();
				while(rs.next()) {
					String prod_id = rs.getString("pd.prod_id");
					String prod_code = rs.getString("pd.prod_code");
					String image1 = rs.getString("pd.image1");
					String image2 = rs.getString("pd.image2");
					String image3 = rs.getString("pd.image3");
					String prod_name = rs.getString("pd.prod_name");
					String prod_price = rs.getString("pd.prod_price");
					String prod_status = rs.getString("pd.prod_status");
					int prod_amount = rs.getInt("c.prod_amount");
					int prod_time = rs.getInt("c.prod_time");
					String prod_description = rs.getString("pd.prod_description");
					int cate_id = rs.getInt("cate_id");
					
					ItemCart tempitem = new ItemCart(prod_id, prod_code, image1, image2, image3, prod_name, prod_price, prod_description, prod_amount,prod_time, cate_id, prod_status);
					carts.add(tempitem);
				}
				return carts;
				
				
				
			}finally {
			close(cn, stt,rs);
		}
		
	}
	
	/**
	 * Cập nhật sản phẩm trong giỏ hàng
	 * 
	 * @param cart
	 * @throws Exception
	 */
	public static void updateCart(Cart cart) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null
				;
		try {
			cn = dataSource.getConnection();
			String sql = "update cart set customer_id = ? , prod_id = ?, prod_amount = ?, prod_time = ? where cart_id = ?;";
			stt = cn.prepareStatement(sql);
			
			
			stt.setString(1, cart.getCustomerId());
			stt.setString(2, cart.getProdId());
			stt.setInt(3, cart.getProdAmount());
			stt.setInt(4, cart.getProdTime());
			stt.setString(5, cart.getCartId());

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Xóa tài sản phẩm cart khỏi giỏ hàng theo customer_id và product_id 
	 * 
	 * @param prod_id
	 * @param customer_id
	 * @throws Exception
	 */
	public static void deleteCart(String customer_id, String product_id) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from cart where customer_id = ? and prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customer_id);
			stt.setString(2, product_id);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}
	
	/**
	 * Cập nhật prod_amount trong giỏ hàng
	 * @param cart_id
	 * @param number 
	 * @throws Exception
	 */
	public static void updateAmount(String cart_id,int number ) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update cart set prod_amount = ? where cart_id = ? ;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, number);
			stt.setString(2, cart_id);
			stt.execute();
		} finally {
			close(cn, stt, null);
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
