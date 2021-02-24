package com.abc.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.mysql.cj.x.protobuf.MysqlxConnection.Close;
import com.mysql.cj.xdevapi.Result;




public class ProdManagerDbUtil {
	private DataSource dataSource;
	public ProdManagerDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<ProductImg> getProductImgs() throws Exception {
		List<ProductImg> products = new ArrayList<>();
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT prod_code, prod_name, image1, prod_price, prod_amount, prod_status FROM product inner join image_product on product.prod_id = image_product.prod_id;";
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery(sql);
			
			while (myRs.next()) {
				String prodCode = myRs.getString("prod_code");
				String proName = myRs.getString("prod_name");
				String image = myRs.getString("image1");
				String price = myRs.getString("prod_price");
				int amount = myRs.getInt("prod_amount");
				int status = myRs.getInt("prod_status");
				
				ProductImg tempPro = new ProductImg(prodCode, proName, price, status, amount, image);
				
				products.add(tempPro);
			}
			
			return products;
		} finally {
			close(myConn, myRs, myStmt);
		}	
	}

	private void close(Connection myConn, ResultSet myRs, Statement myStmt) {
		try {
			if (myConn != null) {
				myConn.close();
			}
			if (myRs != null) {
				myRs.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
