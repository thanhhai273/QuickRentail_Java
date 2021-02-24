package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import com.quickrental.website.model.Warehouse;
import com.quickrental.website.model.WarehouseTable;

/**
 * DAO chứa các service xử lý tương tác CSDL cho Kho hàng
 * 
 * @author MTHUNG (13/12/2020)
 *
 */
public class WarehouseDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public WarehouseDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Thêm sản phẩm mới vào kho hàng
	 * 
	 * @param newAdmin
	 * @throws Exception
	 */
	public boolean createWarehouse(Warehouse warehouse) throws Exception {
		boolean isSuccess = false;
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into warehouse(prod_id, amount, rent_amount, import_price, prod_code_partner) values(?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setString(1, warehouse.getProdId());
			stt.setInt(2, warehouse.getAmount());
			stt.setInt(3, warehouse.getRentAmount());
			stt.setString(4, warehouse.getImportPrice());
			stt.setString(5, warehouse.getProdCodePartner());

			stt.executeUpdate();
			isSuccess = true;
		} finally {
			close(cn, stt, null);
		}
		return isSuccess;
	}

	/**
	 * Lấy thông tin toàn bộ sản phẩm trong Kho
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Warehouse> getWarehouses() throws Exception {

		List<Warehouse> warehouses = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from warehouse";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				int amount = rs.getInt("amount");
				int rent_amount = rs.getInt("rent_amount");
				String import_price = rs.getString("import_price");
				int a = Integer.parseInt(import_price);
				import_price = NumberFormat.getIntegerInstance().format(a);
				String prod_code_partner = rs.getString("prod_code_partner");

				Warehouse warehouse = new Warehouse(prod_id, amount, rent_amount, import_price, prod_code_partner);
				warehouses.add(warehouse);
			}
			return warehouses;

		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy thông tin toàn bộ sản phẩm trong Kho bao gồm cả tên Sản phẩm
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<WarehouseTable> getWarehousesProd() throws Exception {

		List<WarehouseTable> warehousesTable = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select w.*, p.prod_name from warehouse w, product p where w.prod_id = p.prod_id";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {
				String prod_id = rs.getString("w.prod_id");
				int amount = rs.getInt("w.amount");
				int rent_amount = rs.getInt("w.rent_amount");
				String import_price = rs.getString("w.import_price");
				int a = Integer.parseInt(import_price);
				import_price = NumberFormat.getIntegerInstance().format(a);
				String prod_code_partner = rs.getString("w.prod_code_partner");
				String prod_name = rs.getString("p.prod_name");

				Warehouse warehouse = new Warehouse(prod_id, amount, rent_amount, import_price, prod_code_partner);
				WarehouseTable warehouseTable = new WarehouseTable(warehouse, prod_name);
				warehousesTable.add(warehouseTable);
			}
			return warehousesTable;

		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Lấy thông tin chi tiết một sản phẩm trong Kho hàng
	 * 
	 * @param prodId mã sản phẩm
	 * @return
	 * @throws Exception
	 */
	public Warehouse getProdWarehouse(String prodId) throws Exception {
		Warehouse warehouse = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from warehouse where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, prodId);
			rs = stt.executeQuery();
			if (rs.next()) {
				String prod_id = rs.getString("prod_id");
				int amount = rs.getInt("amount");
				int rent_amount = rs.getInt("rent_amount");
				String import_price = rs.getString("import_price");
				int a = Integer.parseInt(import_price);
				import_price = NumberFormat.getIntegerInstance().format(a);
				String prod_code_partner = rs.getString("prod_code_partner");

				warehouse = new Warehouse(prod_id, amount, rent_amount, import_price, prod_code_partner);
			} else {
				throw new Exception("Can not found Warehouse!");
			}
			return warehouse;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Cập nhật số lượng sản phẩm trong kho
	 * 
	 * @param prodId
	 * @param amount
	 * @param rentAmount
	 * @throws Exception
	 */
	public void updateProdWarehouse(String prodId, int amount, int rentAmount) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update warehouse set amount = ?, rent_amount = ? where prod_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setInt(1, amount);
			stt.setInt(2, rentAmount);
			stt.setString(3, prodId);

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Xóa tài khoản sản phẩm trong Kho hàng
	 * 
	 * @param prodId mã sản phẩm
	 * @throws Exception
	 */
	public void deleteWarehouse(String prodId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();

			String sql = "delete from warehouse where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, prodId);

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
