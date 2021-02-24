package com.quickrental.website.dao;

import com.quickrental.website.model.Product;
import com.quickrental.website.model.ProductTable;
import com.quickrental.website.model.ProductWithItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

/**
 * DAO chứa các service xử lý nghiệp vụ cho API, Controller của sản phẩm
 * 
 * @author MTHUNG (01/12/2020)
 * modify Sonnv 
 * add lấy 8 sản phẩm mới
 * 
 */
public class ProductDAO {

	/**
	 * Khai báo nguồn dữ liệu để tạo kết nối đến CSDL
	 */
	private static DataSource dataSource;

	/**
	 * Hàm khởi tạo Khởi tạo nguồn dữ liệu
	 * 
	 * @param theDataSource
	 */
	public ProductDAO(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/**
	 * Tính số lượng sản phẩm
	 * @return
	 * @throws Exception
	 */
	public int countProduct() throws Exception {
		int count = 0;
		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select count(prod_id) from product;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(prod_id)");
			}
			return count;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Thêm sản phẩm mới
	 * 
	 * @param newProduct
	 * @throws Exception
	 */
	public void createNewProduct(Product newProduct) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "insert into product(prod_code, image1, image2, image3, prop_color, prod_name, prod_deposit, prod_price, prod_status, prod_description, prod_amount, cate_id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			stt = cn.prepareStatement(sql);

			stt.setString(1, newProduct.getProdCode());
			stt.setString(2, newProduct.getImage1());
			stt.setString(3, newProduct.getImage2());
			stt.setString(4, newProduct.getImage3());
			stt.setString(5, newProduct.getProdColor());
			stt.setString(6, newProduct.getProdName());
			stt.setString(7, newProduct.getProdDeposit());
			stt.setString(8, newProduct.getProdPrice());
			stt.setString(9, newProduct.getProdStatus());
			stt.setString(10, newProduct.getProdDescription());
			stt.setInt(11, newProduct.getProdAmount());
			stt.setInt(12, newProduct.getCateId());

			stt.executeUpdate();
		} finally {
			close(cn, stt, null);
		}

	}
	
	/**
	 * Lấy danh sách toàn bộ sản phẩm
	 * 
	 * @param records
	 * @param startRecord
	 * @return
	 * @throws Exception
	 */
	public List<Product> getProducts() throws Exception {
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_name = rs.getString("prod_name");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

				products.add(tempProd);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Lấy danh sách toàn bộ sản phẩm có phân trang
	 * 
	 * @param records
	 * @param startRecord
	 * @return
	 * @throws Exception
	 */
	public List<Product> getProducts(int records, int startRecord) throws Exception {
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product limit ?,?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, startRecord);
			stt.setInt(2, records);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_name = rs.getString("prod_name");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

				products.add(tempProd);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy danh sách toàn bộ sản phẩm bao gồm cả tên Danh mục
	 * 
	 * @param records
	 * @param startRecord
	 * @return
	 * @throws Exception
	 */
	public List<ProductTable> getProductsCate() throws Exception {
		List<ProductTable> productsTable = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select p.*, c.cate_name from product p, category c where p.cate_id = c.cate_id ;";
			stt = cn.prepareStatement(sql);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("p.prod_id");
				String prod_code = rs.getString("p.prod_code");
				String image1 = rs.getString("p.image1");
				String image2 = rs.getString("p.image2");
				String image3 = rs.getString("p.image3");
				String prop_color = rs.getString("p.prop_color");
				String prod_name = rs.getString("p.prod_name");
				String prod_price = rs.getString("p.prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("p.prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("p.prod_status");
				String prod_description = rs.getString("p.prod_description");
				int prod_amount = rs.getInt("p.prod_amount");
				int cate_id = rs.getInt("p.cate_id");
				Timestamp create_date = rs.getTimestamp("p.create_date");
				String cate_name = rs.getString("c.cate_name");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);
				ProductTable tempProdTable = new ProductTable(tempProd, cate_name);
				productsTable.add(tempProdTable);
			}
			return productsTable;
		} finally {
			close(cn, stt, rs);
		}

	}
	
	/**
	 * Lấy danh sách sản phẩm theo Loại sản phẩm
	 * 
	 * @param cateId
	 * @return
	 * @throws Exception
	 */
	public static List<Product> getProductsByCate(int cateId) throws Exception {
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product where cateId = ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(3, cateId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_name = rs.getString("prod_name");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);
				products.add(tempProd);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Lấy danh sách sản phẩm theo Loại sản phẩm có phân trang
	 * 
	 * @param records
	 * @param startRecord
	 * @param cateId
	 * @return
	 * @throws Exception
	 */
	public static List<Product> getProductsByCate(int records, int startRecord, int cateId) throws Exception {
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product  where cate_id = ? limit ?,? ;";
			stt = cn.prepareStatement(sql);
			stt.setInt(2, startRecord);
			stt.setInt(3, records);
			stt.setInt(1, cateId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_name = rs.getString("prod_name");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

				products.add(tempProd);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy danh sách gồm <para>record sản phẩm radom để hiển thị trong chi tiết sản phẩm 
	 * 
	 * @param records
	 * @param startRecord
	 * @param cateId
	 * @return
	 * @throws Exception
	 */
	public List<Product> getRandomProductsByCate(int records, int cateId) throws Exception {

		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product  where cate_id = ?  order by rand() limit ?";
			stt = cn.prepareStatement(sql);
			stt.setInt(2, records);
			stt.setInt(1, cateId);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_name = rs.getString("prod_name");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

				products.add(tempProd);
			}
			return products;
		} finally {
			close(cn, stt, rs);
		}
	}
	
	/**
	 * Lấy các sản phẩm mới 
	 * @param record
	 * @throws SQLException 
	 * 
	 */
	public static List<ProductWithItem> getNewProducts(int record) throws SQLException{
		List<ProductWithItem> newProducts = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select * from(select prod_id, image1, prod_price, prod_deposit, prod_name, id from product p, item i, category cate where p.cate_id = cate.cate_id and cate.item_id = i.id ORDER BY create_date LIMIT ?) T1 ORDER BY rand()";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, record);
			rs = stt.executeQuery();
			while(rs.next()) {
				String prod_id = rs.getString("prod_id");
				String image1 = rs.getString("image1");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_name = rs.getString("prod_name");
				int itemId = rs.getInt("id");
				ProductWithItem p =  new ProductWithItem(prod_id, image1, prod_price, prod_deposit, prod_name, itemId);
				newProducts.add(p);
			}
			return newProducts;
			
		}finally {
			close(cn, stt,rs);
		}
		
	}
	
	/**
	 * Lấy các sản phẩm theo status 
	 * @param record
	 * @param status
	 * @throws SQLException 
	 * 
	 */
	public static List<ProductWithItem> getProductbyStatus(int record, String status) throws SQLException{
		List<ProductWithItem> StatusProducts = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;
		try {
			cn = dataSource.getConnection();
			String sql = "select prod_id, image1, prod_price, prod_deposit, prod_name, id from product p , item i, category cate where p.cate_id = cate.cate_id and cate.item_id = i.id and prod_status = ? ORDER by rand() LIMIT  ? ";
			stt = cn.prepareStatement(sql);
			stt.setString(1, status);
			stt.setInt(2, record);
			rs = stt.executeQuery();
			while(rs.next()) {
				String prod_id = rs.getString("prod_id");
				String image1 = rs.getString("image1");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_name = rs.getString("prod_name");
				int itemId = rs.getInt("id");
				ProductWithItem p =  new ProductWithItem(prod_id, image1, prod_price, prod_deposit, prod_name, itemId);
				StatusProducts.add(p);
			}
			return StatusProducts;
			
		}finally {
			close(cn, stt,rs);
		}
		
	}
	/**
	 * Xem chi tiết sản phẩm
	 * 
	 * @param prodId
	 * @return
	 * @throws Exception
	 */
	public static Product getProduct(String prodId) throws Exception {
		Product product = null;

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, prodId);
			rs = stt.executeQuery();
			if (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_name = rs.getString("prod_name");
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				product = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

			} else {
				throw new Exception("Could not find product in database!");
			}
			return product;
		} finally {
			close(cn, stt, rs);
		}

	}

	/**
	 * Cập nhật sản phẩm theo Id
	 * 
	 * @param product
	 * @throws Exception
	 */
	public void updateProduct(Product product) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "update product set image1 = ?, image2 = ?, image3 = ?, prod_name = ?, prod_price = ?, prod_status = ?, prod_description = ?, prod_amount = ?, cate_id = ? where prod_id = ?;";
			stt = cn.prepareStatement(sql);

			stt.setString(1, product.getImage1());
			stt.setString(2, product.getImage2());
			stt.setString(3, product.getImage3());
			stt.setString(4, product.getProdName());
			stt.setString(5, product.getProdPrice());
			stt.setString(6, product.getProdStatus());
			stt.setString(7, product.getProdDescription());
			stt.setInt(8, product.getProdAmount());
			stt.setInt(9, product.getCateId());
			stt.setString(10, product.getProdId());

			stt.execute();
		} finally {
			close(cn, stt, null);
		}
	}

	/**
	 * Xóa sản phẩm theo Id
	 * 
	 * @param productId
	 * @throws Exception
	 */
	public void deleteProduct(String productId) throws Exception {
		Connection cn = null;
		PreparedStatement stt = null;
		try {
			cn = dataSource.getConnection();
			String sql = "delete from product where prod_id = ?;";
			stt = cn.prepareStatement(sql);
			stt.setString(1, productId);
			stt.execute();
		} finally {
			close(cn, stt, null);
		}

	}
	
	/**
	 * Tìm kiếm sản phẩm theo tên có phân trang
	 * 
	 * @param records
	 * @param startRecord
	 * @param cateId
	 * @return
	 * @throws Exception
	 */
	public List<Product> searchProduct(int records, int startRecord, String enterSearch) throws Exception {
		List<Product> products = new ArrayList<>();

		Connection cn = null;
		PreparedStatement stt = null;
		ResultSet rs = null;

		try {
			cn = dataSource.getConnection();
			String sql = "select * from product limit ?,? where prod_name like ?;";
			stt = cn.prepareStatement(sql);
			stt.setInt(1, startRecord);
			stt.setInt(2, records);
			String newString = "%" + enterSearch + "%";
			stt.setString(3, newString);
			rs = stt.executeQuery();
			while (rs.next()) {
				String prod_id = rs.getString("prod_id");
				String prod_code = rs.getString("prod_code");
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
				String image3 = rs.getString("image3");
				String prop_color = rs.getString("prop_color");
				String prod_price = rs.getString("prod_price");
				int b = Integer.parseInt(prod_price);
				prod_price = NumberFormat.getIntegerInstance().format(b);
				String prod_deposit = rs.getString("prod_deposit");
				int a = Integer.parseInt(prod_deposit);
				prod_deposit = NumberFormat.getIntegerInstance().format(a);
				String prod_name = rs.getString("prod_name");
				String prod_status = rs.getString("prod_status");
				String prod_description = rs.getString("prod_description");
				int prod_amount = rs.getInt("prod_amount");
				int cate_id = rs.getInt("cate_id");
				Timestamp create_date = rs.getTimestamp("create_date");

				Product tempProd = new Product(prod_id, prod_code, image1, image2, image3, prop_color, prod_name, prod_price, prod_deposit,
						prod_status, prod_description, prod_amount, cate_id, create_date);

				products.add(tempProd);
			}
			return products;
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
