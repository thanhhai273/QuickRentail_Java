package com.quickrental.website.dao;
import com.quickrental.website.model.SuggestionImg;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

/**
 * DAO chứa các xử lý nghiệp vụ cho API, controller của SuggestionImg
 * Thêm, sửa, xóa, lấy tất cả
 * @author SonNV
 * @date 9/12/2020
 */
public class SuggestionImgDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param datasource
	 */
	public SuggestionImgDAO(DataSource dataSource) {
		// TODO Auto-generated constructor stub
		SuggestionImgDAO.dataSource = dataSource;
	}
	
	/**
	 * Thêm mới suggestion imgage
	 * 
	 * @param newimg
	 * @throws Exception
	 */
	public void createNewSuggestionImg(SuggestionImg img) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		
		try {
			cn = dataSource.getConnection();
			String sql = "insert into suggestion_img(id, img, link ) value = (?, ?, ?);";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, img.getId());
			stt.setString(2, img.getImg());
			stt.setString(3, img.getLink());
			
			
		}finally{
			close(cn, stt, null);
		}
	}
	
	/**
	 * Cập nhật thông tin img
	 * 
	 * @param img
	 * @throws Exception
	 */
	public void updateSuggestionImg(SuggestionImg img) throws Exception{
		Connection cn =  null;
		PreparedStatement stt =  null;
		try {
			cn = dataSource.getConnection();
			String sql = "update suggestion_img set img = ?, link =? where id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, img.getImg());
			stt.setString(2, img.getLink());
			stt.setInt(3, img.getId());
			
			
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Xóa img theo id
	 * @param imgId
	 * @throws Exception
	 */
	public void deleteSuggestionImg(String imgId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from suggest_img where (id = ?);";
			stt = cn.prepareStatement(sql);
			stt.setString(1, imgId);
			
			stt.execute();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	
	/**
	 * Lấy danh sách tất cả img
	 * @throws Exception
	 * @return
	 */
	public List<SuggestionImg> getSuggestionimgs() throws Exception {
		List<SuggestionImg> suggestionimgs= new ArrayList<>();
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from suggestion_img;";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("id");
				String image = rs.getString("img");
				String link = rs.getString("link");
				SuggestionImg suggestionimg = new SuggestionImg(id, image, link);
				suggestionimgs.add(suggestionimg);
			}
			return suggestionimgs;
			
			
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
