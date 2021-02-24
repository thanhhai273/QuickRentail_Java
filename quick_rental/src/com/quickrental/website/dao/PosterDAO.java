package com.quickrental.website.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.quickrental.website.model.Poster;

/**
 * DAO chứa các xử lý nghiệp vụ cho API, controller của ảnh Poster
 * Thêm, sửa, xóa, lấy tất cả
 * @author SonNV
 * @date 9/12/2020
 */
public class PosterDAO {
	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param datasource
	 */
	public PosterDAO(DataSource datasource) {
		PosterDAO.dataSource = datasource;
	
	}
	/**
	 * Thêm mới poster
	 * 
	 * @param poster
	 * @throws Exception
	 */
	public void createNewPoster(Poster newPoster) throws Exception{
		Connection cn = null;
		PreparedStatement stt = null;
		
		try {
			cn = dataSource.getConnection();
			String sql = "insert into poster(id, img, title, description ) value = (?, ?, ?,?);";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, newPoster.getId());
			stt.setString(2, newPoster.getImg());
			stt.setString(3, newPoster.getTitle());
			stt.setString(4, newPoster.getDescription());
			
			
		}finally{
			close(cn, stt, null);
		}
	}
	
	/**
	 * Cập nhật thông tin poster
	 * 
	 * @param poster
	 * @throws Exception
	 */
	public void updatePoster(Poster poster) throws Exception{
		Connection cn =  null;
		PreparedStatement stt =  null;
		try {
			cn = dataSource.getConnection();
			String sql = "update poster set img = ?, title =?, description = ? where id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, poster.getImg());
			stt.setString(2, poster.getTitle());
			stt.setString(3, poster.getDescription());
			stt.setInt(4, poster.getId());
			
			
			stt.execute();
		}finally {
			close(cn, stt, null);
		}
	}
	
	/**
	 * Xóa poster theo id
	 * @param posterId
	 * @throws Exception
	 */
	public void deletePoster(String posterId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from poster where (id = ?);";
			stt = cn.prepareStatement(sql);
			stt.setString(1, posterId);
			
			stt.execute();
			
			
		}finally {
			close(cn, stt,null);
			
		}
		
	}
	
	/**
	 * Lấy danh sách tất cả poster
	 * @throws Exception
	 * @return
	 */
	public List<Poster> getPosters() throws Exception {
		List<Poster> posters= new ArrayList<>();
		Connection cn = null;
		Statement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from poster;";
			stt = cn.createStatement();
			rs = stt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("id");
				String img = rs.getString("img");
				String title = rs.getString("title");
				String description = rs.getString("description");
				Poster poster = new Poster(id, img, title, description);
				posters.add(poster);
			}
			return posters;
			
			
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
