package com.quickrental.website.dao;

import com.quickrental.website.model.ListOfListProcessBill;
import com.quickrental.website.model.ProccessBillTable;
import com.quickrental.website.model.ProcessingBill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của hóa đơn đang thuê
 * 
 * @author MTHUNG (15/12/2020)
 * 
 */
public class ProcessingBillDAO {

	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public ProcessingBillDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Thêm hóa đơn đang thuê mới
	 * 
	 * @param newProcessingBill
	 * @throws Exception
	 */
	public static void createProcessingBill(ProcessingBill newProcessingBill) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into processing_bill(bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term) values(?, ?, ?, ?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newProcessingBill.getBillCode());
			stt.setInt(2, newProcessingBill.getBillStatus());
			stt.setString(3, newProcessingBill.getProdId());
			stt.setInt(4, newProcessingBill.getProdAmount());
			stt.setString(5, newProcessingBill.getProdDeposit());
			stt.setString(6, newProcessingBill.getProdPrice());
			stt.setString(7, newProcessingBill.getCustomerId());
			stt.setInt(8, newProcessingBill.getRentalTerm());

			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}
	
	/**
	 * Lấy danh sách toàn bộ hóa đơn đang thuê
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<ProcessingBill> getProcessingBills() throws Exception {
		List<ProcessingBill> processingBills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from processing_bill;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				String bill_code = rs.getString("bill_code");
				int bill_status = rs.getInt("bill_status");
				String prod_id = rs.getString("prod_id");
				int prod_amount = rs.getInt("prod_amount");
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String customer_id = rs.getString("customer_id");
				int rental_term = rs.getInt("rental_term");
				String created_date = rs.getString("created_date");
				Timestamp crdate = Timestamp.valueOf(created_date);
				created_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				String modify_date = rs.getString("modify_date");

				ProcessingBill tempProcessingBill = new ProcessingBill(bill_id, bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term, created_date, modify_date);

				processingBills.add(tempProcessingBill);
			}
			return processingBills;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy danh sách toàn hóa đơn theo mã hóa đơn
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<ListOfListProcessBill> getListOfListProcessBill() throws Exception {
		List<ListOfListProcessBill> listOfListProcessBill = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select DISTINCT bill_code from processing_bill;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_code = rs.getString("bill_code");
				List<ProccessBillTable> listProccessBillTable = getProccessBillTablesByBill(bill_code);
				ListOfListProcessBill tempListProcessBil = new ListOfListProcessBill(listProccessBillTable, bill_code);
				listOfListProcessBill.add(tempListProcessBil);
			}
			return listOfListProcessBill;
		} finally {
			close(cn, stt, rs);
		}
	}
	/**
	 * Lấy danh sách tập hóa đơn theo customerid
	 * 
	 * @return
	 * @throws Exception
	 */
	public static List<ListOfListProcessBill> getListOfListProcessBillbyCusId(String customer_id) throws Exception {
		List<ListOfListProcessBill> listOfListProcessBill = new ArrayList<>();
		List<String> billcodes = new ArrayList<String>();
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select bill_code from processing_bill where customer_id = ? ";
			
			stt = cn.prepareStatement(sql);
			stt.setString(1, customer_id);
			rs = stt.executeQuery();
			while(rs.next()) {
				
				String billCode = rs.getString("bill_code");
				if(billcodes.contains(billCode) == false) {
					billcodes.add(billCode);
					List<ProccessBillTable> sbt = getProccessBillTablesByBill(billCode);
					ListOfListProcessBill lsb = new ListOfListProcessBill(sbt, billCode);
					listOfListProcessBill.add(lsb);
					}
			}
			return listOfListProcessBill;
			
		} finally {
			close(cn, stt, rs);
		}
	}
	
	
	
	/**
	 * Lấy danh sách toàn bộ hóa đơn đang thuê theo Id Khách hàng
	 * 
	 * @param billId
	 * @return
	 * @throws Exception
	 */
	public static List<ProcessingBill> getProccessBillTablesByCusId(String customerId) throws Exception {
		List<ProcessingBill> bills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select b.* from processing_bill b where b.customer_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, customerId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("b.bill_id");
				String bill_code = rs.getString("b.bill_code");
				int bill_status = rs.getInt("b.bill_status");
				String prod_id = rs.getString("b.prod_id");
				int prod_amount = rs.getInt("b.prod_amount");
				String prod_deposit = rs.getString("b.prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_price = rs.getString("b.prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String customer_id = rs.getString("b.customer_id");
				int rental_term = rs.getInt("b.rental_term");
				String created_date = rs.getString("b.created_date");
				Timestamp crdate = Timestamp.valueOf(created_date);
				created_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				String modify_date = rs.getString("b.modify_date");
				ProcessingBill tempProcessingBill = new ProcessingBill(bill_id, bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term, created_date, modify_date);
				bills.add(tempProcessingBill);
			}
			return bills;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy danh sách toàn bộ hóa đơn đang thuê theo Tên khách hàng
	 * 
	 * @param nameInput
	 * @return
	 * @throws Exception
	 */
	public List<ProccessBillTable> getProcessBillByNameCus(String nameInput) throws Exception {
		List<ProccessBillTable> bills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select b.*, c.first_name, c.last_name, p.prod_name, p.prod_code from processing_bill b, product p, customer c where b.prod_id = p.prod_id and b.customer_id = c.customer_id and c.last_name like ?;";
			stt = cn.prepareStatement(sql);
			String newString = "%" + nameInput + "%";
			stt.setString(1, newString);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("b.bill_id");
				String bill_code = rs.getString("b.bill_code");
				int bill_status = rs.getInt("b.bill_status");
				String prod_id = rs.getString("b.prod_id");
				int prod_amount = rs.getInt("b.prod_amount");
				String prod_deposit = rs.getString("b.prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_price = rs.getString("b.prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String customer_id = rs.getString("b.customer_id");
				int rental_term = rs.getInt("b.rental_term");
				String created_date = rs.getString("b.created_date");
				Timestamp crdate = Timestamp.valueOf(created_date);
				created_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				String modify_date = rs.getString("b.modify_date");
				String last_name = rs.getString("c.last_name");
				String first_name = rs.getString("c.first_name");
				String prod_name = rs.getString("p.prod_name");
				String prod_code = rs.getString("p.prod_code");
				ProcessingBill tempProcessingBill = new ProcessingBill(bill_id, bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term, created_date, modify_date);
				ProccessBillTable tempProccessBillTable = new ProccessBillTable(tempProcessingBill, first_name, last_name, prod_name, prod_code);
				bills.add(tempProccessBillTable);
			}
			return bills;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy danh sách toàn bộ hóa đơn đang thuê theo Mã hóa đơn cho Trang quản lý
	 * 
	 * @param billCode
	 * @return
	 * @throws Exception
	 */
	public static List<ProccessBillTable> getProccessBillTablesByBill(String billCode) throws Exception {
		List<ProccessBillTable> bills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select distinct b.*, c.first_name, c.last_name, p.prod_name, p.prod_code, c.bank_id, c.bank_code_account from processing_bill b, product p, customer c, bank where b.prod_id = p.prod_id and b.customer_id = c.customer_id and b.bill_code like ?;";
			stt = cn.prepareStatement(sql);
			String newString = "%" + billCode + "%";
			stt.setString(1, newString);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("b.bill_id");
				String bill_code = rs.getString("b.bill_code");
				int bill_status = rs.getInt("b.bill_status");
				String prod_id = rs.getString("b.prod_id");
				int prod_amount = rs.getInt("b.prod_amount");
				String prod_deposit = rs.getString("b.prod_deposit");
				prod_deposit = prod_deposit.replace(",", "");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_price = rs.getString("b.prod_price");
				prod_price = prod_price.replace(",", "");
				int price = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(price);
				String customer_id = rs.getString("b.customer_id");
				int rental_term = rs.getInt("b.rental_term");
				String created_date = rs.getString("b.created_date");
				Timestamp crdate = Timestamp.valueOf(created_date);
				created_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				String modify_date = rs.getString("b.modify_date");
				String last_name = rs.getString("c.last_name");
				String first_name = rs.getString("c.first_name");
				String prod_name = rs.getString("p.prod_name");
				String prod_code = rs.getString("p.prod_code");
				int bank_id = rs.getInt("c.bank_id");
				String bank_code_account = rs.getString("c.bank_code_account");
				ProcessingBill tempProcessingBill = new ProcessingBill(bill_id, bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term, created_date, modify_date);
				ProccessBillTable tempProccessBillTable = new ProccessBillTable(tempProcessingBill, first_name, last_name, prod_name, prod_code, bank_id, bank_code_account);
				bills.add(tempProccessBillTable);
			}
			return bills;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy danh sách toàn bộ hóa đơn đang thuê theo Mã hóa đơn
	 * 
	 * @param billId
	 * @return
	 * @throws Exception
	 */
	public static List<ProcessingBill> getProccessBillTablesByBillId(String billCode) throws Exception {
		List<ProcessingBill> bills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select b.* from processing_bill b where b.bill_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, billCode);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("b.bill_id");
				String bill_code = rs.getString("b.bill_code");
				int bill_status = rs.getInt("b.bill_status");
				String prod_id = rs.getString("b.prod_id");
				int prod_amount = rs.getInt("b.prod_amount");
				String prod_deposit = rs.getString("b.prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_price = rs.getString("b.prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String customer_id = rs.getString("b.customer_id");
				int rental_term = rs.getInt("b.rental_term");
				String created_date = rs.getString("b.created_date");
				Timestamp crdate = Timestamp.valueOf(created_date);
				created_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				String modify_date = rs.getString("b.modify_date");
				ProcessingBill tempProcessingBill = new ProcessingBill(bill_id, bill_code, bill_status, prod_id, prod_amount, prod_deposit, prod_price, customer_id, rental_term, created_date, modify_date);
				bills.add(tempProcessingBill);
			}
			return bills;
		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Cập nhật trạng thái hóa đơn theo Mã hóa đơn
	 * 
	 * @param product
	 * @throws Exception
	 */
	public void updateProcessingBill(int status, String billCode) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update processing_bill set bill_status = ? where bill_code = ?;";
			stt = cn.prepareStatement(sql);

			stt.setInt(1, status);
			stt.setString(2, billCode);

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Xóa hóa đơn đang thuê theo Mã hóa đơn
	 * 
	 * @param productId
	 * @throws Exception
	 */
	public void deleteBill(String billCode) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from processing_bill where bill_code = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, billCode);
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
