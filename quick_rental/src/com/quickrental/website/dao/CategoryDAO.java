package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import com.quickrental.website.model.Category;
/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của Danh mục
 * 
 * @author MTHUNG (15/12/2020)
 * 
 */
public class CategoryDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public CategoryDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	/**
	 * Lấy danh sách toàn bộ sản phẩm
	 * 
	 * @param records
	 * @param startRecord
	 * @return
	 * @throws Exception
	 */
	public List<Category> getCates() throws Exception {
		List<Category> cates = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from category;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				int cate_id = rs.getInt("cate_id");
				String cate_name = rs.getString("cate_name");
				int item_id = rs.getInt("item_id");
				String description = rs.getString("description");

				Category cate = new Category(cate_id, cate_name, item_id, description);
				cates.add(cate);
			}
			return cates;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy lên danh mục sản phẩm theo id
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getNameCate(int cateId) throws Exception {

		String nameCate = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select cate_name from category where cate_id = ?";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, cateId);
			rs = stt.executeQuery();
			if (rs.next()) {
				nameCate = rs.getString("cate_name");
			}
			return nameCate;
		} finally {
			close(cn, stt, rs);
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
