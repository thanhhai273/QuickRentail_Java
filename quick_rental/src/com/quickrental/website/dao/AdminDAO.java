package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.quickrental.website.model.Admin;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller cho tài khoản của
 * Admin
 * 
 * @author MTHUNG (01/12/2020)
 *
 */
public class AdminDAO {

	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public AdminDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Thêm tài khoản mới cho quản lý cửa hàng
	 * 
	 * @param newAdmin
	 * @throws Exception
	 */
	public void createNewAdmin(Admin newAdmin) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into admin(admin_id, admin_code, admin_name, admin_account, admin_pass) values(?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newAdmin.getAdminId());
			stt.setString(2, newAdmin.getAdminCode());
			stt.setString(3, newAdmin.getAdminName());
			stt.setString(4, newAdmin.getAdminAccount());
			stt.setString(5, newAdmin.getAdminPass());

			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}

	/**
	 * Lấy danh sách tài khoản quản lý cửa hàng
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Admin> getAdmins() throws Exception {

		List<Admin> admins = new ArrayList<>();

		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from admin";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while (rs.next()) {
				String admin_id = rs.getString("admin_id");
				String admin_code = rs.getString("admin_code");
				String admin_name = rs.getString("admin_name");
				String admin_account = rs.getString("admin_account");
				String admin_pass = rs.getString("admin_pass");

				Admin admin = new Admin(admin_id, admin_code, admin_name, admin_account, admin_pass);
				admins.add(admin);
			}
			return admins;

		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Lấy thông tin chi tiết tài khoản Admin
	 * 
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public Admin getDetailAdmin(String adminId) throws Exception {
		Admin admin = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select admin.admin_id, admin.admin_code, admin.admin_name, admin.admin_account from admin where admin.admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, adminId);
			rs = stt.executeQuery();
			if (rs.next()) {
				String admin_id = rs.getString("admin_id");
				String admin_code = rs.getString("admin_code");
				String admin_name = rs.getString("admin_name");
				String admin_account = rs.getString("admin_account");

				admin = new Admin(admin_id, admin_code, admin_name, admin_account);
			} else {
				throw new Exception("Can not found admin!");
			}
			return admin;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Hàm check xem có tồn tại tài khoản được truyền vào không
	 * @param email
	 * @param pass
	 * @return
	 * @throws Exception
	 */
	public Admin checkAdmin(String email, String pass) throws Exception {
		Admin admin = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from admin where admin_account = ? and admin_pass = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, email);
			stt.setString(2, pass);
			rs = stt.executeQuery();
			if (rs.next()) {
				String admin_id = rs.getString("admin_id");
				String admin_code = rs.getString("admin_code");
				String admin_name = rs.getString("admin_name");
				String admin_account = rs.getString("admin_account");

				admin = new Admin(admin_id, admin_code, admin_name, admin_account);
			}
			return admin;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Lấy mật khẩu cho tài khoản Admin
	 * 
	 * @param adminId
	 * @return
	 * @throws Exception
	 */
	public String getPassAdmin(String adminId) throws Exception {
		String pass = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select admin.admin_pass from admin where admin.admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, adminId);
			rs = stt.executeQuery();
			if (rs.next()) {
				pass = rs.getString("admin_pass");

			} else {
				throw new Exception("Can not found pass for admin!");
			}
			return pass;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Cập nhật thông tin tài khoản Admin
	 * 
	 * @param admin
	 * @throws Exception
	 */
	public void updateAdmin(Admin admin) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update admin set admin_name = ?, admin_account = ? where admin_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, admin.getAdminName());
			stt.setString(2, admin.getAdminAccount());
			stt.setString(3, admin.getAdminId());

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Cập nhật mật khẩu tài khoản Admin
	 * 
	 * @param adminId
	 * @param newPass
	 * @throws Exception
	 */
	public void updatePassAdmin(String adminId, String newPass) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update admin set admin_pass = ? where admin_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newPass);
			stt.setString(2, adminId);

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Xóa tài khoản Admin
	 * 
	 * @param adminId
	 * @throws Exception
	 */
	public void deleteAdmin(String adminId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();

			String sql = "delete from admin where admin_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, adminId);

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
