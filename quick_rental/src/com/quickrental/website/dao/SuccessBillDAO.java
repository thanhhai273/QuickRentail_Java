package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.quickrental.website.model.ListOfListSuccessBill;
import com.quickrental.website.model.SuccessBill;
import com.quickrental.website.model.SuccessBillTable;

import javax.sql.DataSource;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của đơn hàng thành công
 * 
 * @author Sonnv (12/12/2020)
 * 
 */
public class SuccessBillDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public SuccessBillDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	/**
	 * Thêm successbill mới
	 * 
	 * @param newBill
	 * @throws Exception
	 */
	public void createNewSuccessBill(SuccessBill newBill) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into succes_bill(bill_id, bill_code, prod_id, prod_amount, rental_date, received_date, status_refund, bank_id,bank_code, customer_id) values(?,?,?,?,?,?,?,?,?,?)";
			stt = cn.prepareStatement(sql);
			stt.setString(1,newBill.getBillId());
			stt.setString(2,newBill.getBillCode());
			stt.setString(3, newBill.getProdId());
			stt.setInt(4, newBill.getProdAmount());
			stt.setString(5, newBill.getRentalDate());
			stt.setString(6, newBill.getReceivedDate());
			stt.setInt(7, newBill.getStatusRefund());
			stt.setInt(8, newBill.getBankId());
			stt.setString(9, newBill.getBankCode());
			stt.setString(10, newBill.getCustomerId());
			
			stt.executeUpdate();
		}
		finally {
			close(cn,stt,null);
		}
		
	}
	
	
	/**
	 * Lấy danh sách toàn hóa đơn theo mã hóa đơn
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<ListOfListSuccessBill> getListOfListSuccessBill() throws Exception {
		List<ListOfListSuccessBill> listOfListSuccessBill = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select DISTINCT bill_code from succes_bill;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_code = rs.getString("bill_code");
				List<SuccessBillTable> listSuccessBillTable = getSuccessBillTablebyCode(bill_code);
				ListOfListSuccessBill tempListSuccessBill = new ListOfListSuccessBill(listSuccessBillTable, bill_code);
				listOfListSuccessBill.add(tempListSuccessBill);
			}
			return listOfListSuccessBill;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Lấy danh sách toàn bộ successBill
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<SuccessBill> getSuccessBills() throws Exception {
		List<SuccessBill> successbills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from succes_bill;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				String bill_code = rs.getString("bill_code");
				String prod_id = rs.getString("prod_id");
				int prod_amount = rs.getInt("prod_amount");
				String rental_date = rs.getString("rental_date");
				String received_date = rs.getString("received_date");
				int status_refund = rs.getInt("status_refund");
				int bank_id = rs.getInt("bank_id");
				String bank_code = rs.getString("bank_code");
				String customer_id = rs.getString("customer_id");
				

				SuccessBill tempbill = new SuccessBill(bill_id,bill_code,prod_id,prod_amount,rental_date,received_date,status_refund,bank_id,bank_code,customer_id);
				successbills.add(tempbill);
			}
			return successbills;
		} finally {
			close(cn, stt, rs);
		}
	}

	/**
	 * Lấy danh sách  successBill theo id khách
	 * @param customerId
	 * @return
	 * @throws Exception 
	 */
	public static List<SuccessBill> getSuccessBillbyCusIds(String CusId) throws Exception{
		List<SuccessBill> successbills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from succes_bill where customer_id = ? ;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, CusId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				String bill_code = rs.getString("bill_code");
				String prod_id = rs.getString("prod_id");
				int prod_amount = rs.getInt("prod_amount");
				String rental_date = rs.getString("rental_date");
				String received_date = rs.getString("received_date");
				int status_refund = rs.getInt("status_refund");
				int bank_id = rs.getInt("bank_id");
				String bank_code = rs.getString("bank_code");
				String customer_id = rs.getString("customer_id");
				

				SuccessBill tempbill = new SuccessBill(bill_id,bill_code,prod_id,prod_amount,rental_date,received_date,status_refund,bank_id,bank_code, customer_id);
				successbills.add(tempbill);
			}
			return successbills;
		} finally {
			close(cn, stt, rs);
		}
		
		
	}
	
	
	/**
	 * Lấy danh sách  successBilltable theo billCode
	 * @param customerId
	 * @return
	 * @throws Exception 
	 */
	public static List<SuccessBillTable> getSuccessBillTablebyCode(String billCode) throws Exception{
		List<SuccessBillTable> successbills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select sb.bill_id, sb.bill_code, sb.prod_id, sb.prod_amount, sb.rental_date, sb.received_date, sb.status_refund, sb.bank_id, sb.bank_code, sb.customer_id, c.first_name, c.last_name, p.prod_name, p.prod_price, p.prod_deposit, p.prod_code, b.bank_name from succes_bill sb, customer c, product p, bank b where sb.customer_id = c.customer_id and sb.prod_id = p.prod_id and sb.bank_id = b.id and bill_code = ?";
			stt = cn.prepareStatement(sql);
			stt.setString(1, billCode);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("sb.bill_id");
				String bill_code = rs.getString("sb.bill_code");
				String prod_id = rs.getString("sb.prod_id");
				int prod_amount = rs.getInt("sb.prod_amount");
				String rental_date = rs.getString("sb.rental_date");
				Timestamp crdate1 = Timestamp.valueOf(rental_date);
				rental_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate1);
				String received_date = rs.getString("sb.received_date");
				Timestamp crdate = Timestamp.valueOf(received_date);
				received_date = new SimpleDateFormat("hh:mm:ss dd-MM-yyyy").format(crdate);
				int status_refund = rs.getInt("sb.status_refund");
				int bank_id = rs.getInt("sb.bank_id");
				String bank_code = rs.getString("sb.bank_code");
				String customer_id = rs.getString("sb.customer_id");
				String cusFirstname = rs.getString("c.first_name");
				String cusLastname = rs.getString("c.last_name");
				String prod_name = rs.getString("p.prod_name");
				String prod_price = rs.getString("p.prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("p.prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_code = rs.getString("p.prod_code");
				String bank_name = rs.getString("b.bank_name");

				SuccessBill tempbill = new SuccessBill(bill_id,bill_code,prod_id,prod_amount,rental_date,received_date,status_refund,bank_id,bank_code, customer_id);
				SuccessBillTable temptable = new SuccessBillTable(tempbill, cusFirstname, cusLastname, prod_code, prod_name, prod_price, prod_deposit, bank_name);
				successbills.add(temptable);
			}
			return successbills;
		} finally {
			close(cn, stt, rs);
		}
		
		
	}
	
	
	/**
	 * Lấy danh sách  successBill theo billCode
	 * @param customerId
	 * @return
	 * @throws Exception 
	 */
	public static List<SuccessBill> getSuccessBillbyIds(String billCode) throws Exception{
		List<SuccessBill> successbills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from succes_bill where bill_code = ? ;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, billCode);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				String bill_code = rs.getString("bill_code");
				String prod_id = rs.getString("prod_id");
				int prod_amount = rs.getInt("prod_amount");
				String rental_date = rs.getString("rental_date");
				String received_date = rs.getString("received_date");
				int status_refund = rs.getInt("status_refund");
				int bank_id = rs.getInt("bank_id");
				String bank_code = rs.getString("bank_code");
				String customer_id = rs.getString("customer_id");

				SuccessBill tempbill = new SuccessBill(bill_id,bill_code,prod_id,prod_amount,rental_date,received_date,status_refund,bank_id,bank_code, customer_id);
				successbills.add(tempbill);
			}
			return successbills;
		} finally {
			close(cn, stt, rs);
		}
		
		
	}
	
	
	/**
	 * Lấy danh sách  successBill theo tên khách hàng
	 * @param customerId
	 * @return
	 * @throws Exception 
	 */
	public static List<SuccessBill> getSuccessBills(String Name) throws Exception{
		List<SuccessBill> successbills = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select sb.bill_id, sb.bill_code, prod_id, prod_amount, rental_date, received_date, status_refund, c.bank_id,c.customer_id, "
					+ " bank_code from succes_bill sb, customer c where sb.customer_id = c.customer_id and (CONCAT_WS (' ', c.last_name, c.first_name) LIKE ? or CONCAT_WS (' ',  c.first_name, c.last_name) LIKE ?);" ;
			stt = cn.prepareStatement(sql);
			stt.setString(1, Name);
			stt.setString(2, Name);
			rs = stt.executeQuery();
			while (rs.next()) {
				String bill_id = rs.getString("bill_id");
				String bill_code = rs.getString("bill_code");
				String prod_id = rs.getString("prod_id");
				int prod_amount = rs.getInt("prod_amount");
				String rental_date = rs.getString("rental_date");
				String received_date = rs.getString("received_date");
				int status_refund = rs.getInt("status_refund");
				int bank_id = rs.getInt("bank_id");
				String bank_code = rs.getString("bank_code");
				String customer_id = rs.getString("customer_id");
				

				SuccessBill tempbill = new SuccessBill(bill_id,bill_code,prod_id,prod_amount,rental_date,received_date,status_refund,bank_id,bank_code, customer_id);
				successbills.add(tempbill);
			}
			return successbills;
		} finally {
			close(cn, stt, rs);
		}
		
		
	}
	
	
	/**
	 * Cập nhật trạng thái theo billcode
	 * 
	 * @param product
	 * @throws Exception
	 */
	public void updateSuccessBill(String billCode, String newStatus) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update succes_bill set status_refund = ? where bill_code = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newStatus);
			stt.setString(2, billCode);

			stt.executeQuery();
		} finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Lấy tất cả đơn hàng có cùng customerId (một đơn hàng là 1 danh sách successbill có cùng bill code)
	 * @throws Exception 
	 * 
	 */
	public static List<ListOfListSuccessBill> ListofListSuccessbill(String cusId) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		List<ListOfListSuccessBill> lsbs = new ArrayList<>();
		List<String> billcodes = new ArrayList<String>();
		try {
			cn = dataSource.getConnection();
			String sql = "select bill_code from succes_bill where customer_id = ? ";
			
			stt = cn.prepareStatement(sql);
			stt.setString(1, cusId);
			rs = stt.executeQuery();
			while(rs.next()) {
				String billCode = rs.getString("bill_code");
				if(billcodes.contains(billCode) == false) {
					billcodes.add(billCode);
				List<SuccessBillTable> sbt = getSuccessBillTablebyCode(billCode);
				ListOfListSuccessBill lsb = new ListOfListSuccessBill(sbt, billCode);
				if(!lsbs.contains(lsb))
					lsbs.add(lsb);
				}
			}
			return lsbs;
			
		}finally {
			close(cn,stt,rs);
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
