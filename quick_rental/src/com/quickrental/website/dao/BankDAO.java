package com.quickrental.website.dao;

import com.quickrental.website.model.Bank;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của Bank
 * Thêm Sửa Xóa
 * @author SonNV 
 * @date 7/12/2020
 */
public class BankDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public BankDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Thêm mới bank
	 * 
	 * @param newBank
	 * @throws Exception
	 */
	public void createNewBank(Bank newBank) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into Bank(id, bankName) value =(?,?);";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, newBank.getId());
			stt.setString(2, newBank.getBankName());

			stt.executeUpdate();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	/**
	 * Cập nhật thông tin Bank
	 * 
	 * @param bank
	 * @throws Exception
	 */
	public void updateBank(Bank bank) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update bank set bank_name = ? where bankid = ?;";
			stt = cn.prepareStatement(sql);

			stt.setInt(2, bank.getId());
			stt.setString(1, bank.getBankName());

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Xóa bank theo bankid
	 * @param bankId
	 * @throws Exception
	 */
	public void deleteBank(String bankId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from bank where (id = ?);";
			stt = cn.prepareStatement(sql);
			stt.setString(1, bankId);
			
			stt.execute();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	/**
	 * Lấy danh sách tất cả bank
	 * @throws Exception
	 * @return
	 */
	public List<Bank> getBanks() throws Exception {
		List<Bank> banks = new ArrayList<>();
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select bank.id, bank.bank_name from bank;";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("id");
				String bank_name = rs.getString("bank_name");
				Bank tmpbank = new Bank(id, bank_name);
				banks.add(tmpbank);
			}
			return banks;
			
			
		}finally {
			close(cn, stt,rs);
			
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
