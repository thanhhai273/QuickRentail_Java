package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.quickrental.website.model.Category;
import com.quickrental.website.model.Item;
import com.quickrental.website.model.ListOfListCate;

/**
 * DAO chứa các service xử lý tương tác CSDL cho Loại sản phẩm
 * 
 * @author MTHUNG (13/12/2020)
 * modify: Sonnv(13/12/2020)
 *
 */
public class ItemDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public ItemDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Thêm loại sản phẩm mới
	 * 
	 * @param newAdmin
	 * @throws Exception
	 */
	public void createItem(Item item) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into item(id, name) values(?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setInt(1, item.getItemId());
			stt.setString(2, item.getItemName());

			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}

	/**
	 * Lấy danh sách Loại sản phẩm
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Item> getItems() throws Exception {

		List<Item> items = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from item";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");

				Item item = new Item(id, name);
				items.add(item);
			}
			return items;

		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy lên loại sản phẩm của danh mục sản phẩm
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getNameItemByCate(int cateId) throws Exception {

		String nameItem = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select i.name from item i, category c where c.cate_id = ? and i.id = c.item_id";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, cateId);
			rs = stt.executeQuery();
			if (rs.next()) {
				nameItem = rs.getString("i.name");
			}
			return nameItem;
		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Cập nhật tên Loại sản phẩm
	 * 
	 * @param newName
	 * @param itemId
	 * @throws Exception
	 */
	public void updateProdWarehouse(String newName, int itemId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update item set name = ? where id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newName);
			stt.setInt(2, itemId);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Xóa Loại sản phẩm
	 * 
	 * @param itemId mã Loại sản phẩm
	 * @throws Exception
	 */
	public void deleteWarehouse(int itemId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();

			String sql = "delete from item where id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, itemId);

			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}
	
	/**
	 * Lấy tất cả category theo itemId
	 * @param itemId mã loại sản phẩm
	 * @throws Exeption
	 * @return List<category>
	 */
	public static List<Category> getAllCategorys(int itemId) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		List<Category> categorys = new ArrayList<>();
		try {
			cn = dataSource.getConnection();
			String sql = "select * from category where item_id = ?";
			stt = cn.prepareStatement(sql);
			stt.setInt(1,itemId);
			rs = stt.executeQuery();
			while(rs.next()) {
				int cate_id = rs.getInt("cate_id");
				String cate_name = rs.getString("cate_name");
				int item_id = rs.getInt("item_id");
				String description = rs.getString("description");
				Category cate = new Category(cate_id, cate_name, item_id, description);
				categorys.add(cate);
			}
			return categorys;
		}finally {close(cn, stt, rs);}
	}
	
	/**
	 * Lấy tất cả ListofListCate Lấy danh sách tất cả item trong đó mỗi item có chứa 1 danh sách các category trực thuộc
	 * @throws Exeption
	 * @return 
	 */
	public static List<ListOfListCate> getAllListOfListCates() throws Exception{
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		List<ListOfListCate> ListOfListCates = new ArrayList<>();
		try {
			cn = dataSource.getConnection();
			String sql = "select * from item";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while(rs.next()) {
				int item_id = rs.getInt("id");
				String item_name = rs.getString("name");
				List<Category> cg = getAllCategorys(item_id);
				ListOfListCate llc = new ListOfListCate(item_id, cg, item_name);
				ListOfListCates.add(llc);
				
			}
			return ListOfListCates;
		}finally {close(cn, stt, rs);}
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
