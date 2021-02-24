package com.quickrental.website.dao;
import com.quickrental.website.model.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của Thông tin khách
 * hàng
 * 
 * @author MTHUNG (05/12/2020)
 *
 */
public class CustomerDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public CustomerDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	/**
	 * Tính số lượng khách hàng
	 * @return
	 * @throws Exception
	 */
	public static int NumCustomer() throws Exception {
		int count = 0;
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select count(customer_id) from customer;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(customer_id)");
			}
			return count;
		} finally {
			close(cn, stt, rs);
		}

	}
	/**
	 * Thêm người dùng mới
	 * 
	 * @param newCustomer
	 * @throws Exception
	 */
	public static void createNewCustomer(Customer newCustomer) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into customer(custome_code, first_name, last_name, address, birthday, gender, phone_number, email, bank_id, bank_code_account, password) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			//stt.setString(1, newCustomer.getCustomerId());
			stt.setString(1, newCustomer.getCustomerCode());
			stt.setString(2, newCustomer.getFirstName());
			stt.setString(3, newCustomer.getLastName());
			stt.setString(4, newCustomer.getAddress());
			stt.setString(5, newCustomer.getBirthday());
			stt.setInt(6, newCustomer.getGender());
			stt.setString(7, newCustomer.getPhoneNumber());
			stt.setString(8, newCustomer.getEmail());
			stt.setInt(9, newCustomer.getBankId());
			stt.setString(10, newCustomer.getBankCodeAccount());
			stt.setString(11, newCustomer.getPassword());

			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}

	/**
	 * Lấy danh sách toàn bộ Khách hàng
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Customer> getCustomers() throws Exception {
		List<Customer> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select customer_id, custome_code, first_name, last_name, address, birthday, gender, phone_number, email, bank_id, bank_code_account from customer;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String customer_id = rs.getString("customer_id");
				String custome_code = rs.getString("custome_code");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String address = rs.getString("address");
				String birthday = rs.getString("birthday");
				birthday = formatDate(birthday);
				int gender = rs.getInt("gender");
				String phone_number = rs.getString("phone_number");
				String email = rs.getString("email");
				int bank_id = rs.getInt("bank_id");
				String bank_code_account = rs.getString("bank_code_account");

				Customer tempCus = new Customer(customer_id, custome_code, first_name, last_name, address, birthday,
						gender, phone_number, email, bank_id, bank_code_account);

				products.add(tempCus);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	

	/**
	 * Lấy thông tin chi tiết tài khoản Khách hàng
	 * 
	 * @param customerId
	 * @return
	 * @throws Exception
	 */
	public Customer getDetailCus(String customerId) throws Exception {
		Customer customer = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select customer_id, custome_code, first_name, last_name, address, birthday, gender, phone_number, email, bank_id, bank_code_account from customer where customer_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customerId);
			rs = stt.executeQuery();
			if (rs.next()) {
				String customer_id = rs.getString("customer_id");
				String custome_code = rs.getString("custome_code");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String address = rs.getString("address");
				String birthday = rs.getString("birthday");
				birthday = formatDate(birthday);
				int gender = rs.getInt("gender");
				String phone_number = rs.getString("phone_number");
				String email = rs.getString("email");
				int bank_id = rs.getInt("bank_id");
				String bank_code_account = rs.getString("bank_code_account");

				customer = new Customer(customer_id, custome_code, first_name, last_name, address, birthday,
						gender, phone_number, email, bank_id, bank_code_account);
			} else {
				throw new Exception("Can not found customer!");
			}
			return customer;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy mật khẩu cho tài khoản Khách hàng
	 * 
	 * @param customerId
	 * @return
	 * @throws Exception
	 */
	public String getPassCus(String customerId) throws Exception {
		String pass = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select password from customer where customer_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customerId);
			rs = stt.executeQuery();
			if (rs.next()) {
				pass = rs.getString("password");

			} else {
				throw new Exception("Can not found pass for customer!");
			}
			return pass;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Cập nhật thông tin tài khoản Khách hàng
	 * 
	 * @param customer
	 * @throws Exception
	 */
	public void updateCustomer(Customer customer) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update customer set custome_code = ?, first_name = ?, last_name = ?, address = ?, birthday = ?, gender = ?, phone_number = ?, bank_id = ?, bank_code_account = ? where customer_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, customer.getCustomerCode());
			stt.setString(2, customer.getFirstName());
			stt.setString(3, customer.getLastName());
			stt.setString(4, customer.getAddress());
			stt.setString(5, customer.getBirthday());
			stt.setInt(6, customer.getGender());
			stt.setString(7, customer.getPhoneNumber());
			stt.setInt(8, customer.getBankId());
			stt.setString(9, customer.getBankCodeAccount());
			stt.setString(10, customer.getCustomerId());

			stt.execute();
			
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Cập nhật mật khẩu tài khoản Khách hàng
	 * 
	 * @param customerId
	 * @param newPass
	 * @throws Exception
	 */
	public void updatePassCus(String customerId, String newPass) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update customer set password = ? where customer_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newPass);
			stt.setString(2, customerId);

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Xóa tài khoản khách hàng theo Id
	 * 
	 * @param customerId
	 * @throws Exception
	 */
	public void deleteCustomer(String customerId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from customer where customer_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customerId);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}
	 /** kiểm tra đăng nhập
	 * 
	 * @param email, password  
	 * @throws Exception
	 */
	public static Customer getCustomerByAccount(String email, String password) throws Exception {
		Connection cn  = null;
		PreparedStatement stt = null;
		ResultSet rs  = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from customer where email = ? and password = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, email);
			stt.setString(2, password);
			rs = stt.executeQuery();
			while(rs.next()) {
				Customer cs = new Customer();
				cs.setAddress(rs.getString("address"));
				cs.setBankCodeAccount(rs.getString("bank_code_account"));
				cs.setBankId(rs.getInt("bank_id"));
				cs.setBirthday(rs.getString("birthday"));
				cs.setCustomerCode(rs.getString("custome_code"));
				cs.setCustomerId(rs.getString("customer_id"));
				cs.setEmail(rs.getString("email"));
				cs.setFirstName(rs.getString("first_name"));
				cs.setGender(rs.getInt("gender"));
				cs.setLastName(rs.getString("last_name"));
				cs.setPassword(rs.getString("password"));
				cs.setPhoneNumber(rs.getString("phone_number"));
				return cs;
				
			}
		}finally {
			close(cn, stt, rs);
		}
		return null;
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
	
	/**
	 * Hàm chung để format hiển thị ngày sinh
	 * @param birthday
	 * @return
	 */
	private String formatDate(String birthday) {
		String[] date = birthday.split("-");
		return date[2] + "-" + date[1] + "-" + date[0];
	}

}
