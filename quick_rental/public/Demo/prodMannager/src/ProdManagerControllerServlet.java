package com.abc.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/ProdManagerControllerServlet")
public class ProdManagerControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProdManagerDbUtil prodManagerDbUtil;
	
	@Resource(name = "jdbc/quick_rental")
	private DataSource dataSource;
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			prodManagerDbUtil = new ProdManagerDbUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException();
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			listPro(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}



	private void listPro(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
		List<ProductImg> pros = prodManagerDbUtil.getProductImgs();
		
		request.setAttribute("Pro_LIST", pros);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ProManager.jsp");
		dispatcher.forward(request, response);
	}

}
