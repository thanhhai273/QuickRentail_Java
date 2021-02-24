package com.quickrental.website.controller;

import javax.servlet.http.HttpServlet;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.catalina.util.CustomObjectInputStream;

import com.mysql.cj.Session;
import com.quickrental.website.dao.AdminDAO;
import com.quickrental.website.dao.CartDAO;
import com.quickrental.website.dao.CustomerDAO;
import com.quickrental.website.dao.ItemDAO;
import com.quickrental.website.dao.ProcessingBillDAO;
import com.quickrental.website.dao.ProductDAO;
import com.quickrental.website.dao.SuccessBillDAO;
import com.quickrental.website.dao.WishlistDAO;
import com.quickrental.website.model.Cart;
import com.quickrental.website.model.Customer;
import com.quickrental.website.model.ItemCart;
import com.quickrental.website.model.ListOfListCate;
import com.quickrental.website.model.ListOfListProcessBill;
import com.quickrental.website.model.ListOfListSuccessBill;
import com.quickrental.website.model.ProccessBillTable;
import com.quickrental.website.model.ProcessingBill;
import com.quickrental.website.model.Product;
import com.quickrental.website.model.ProductWithItem;
import com.quickrental.website.model.SuccessBill;
import com.quickrental.website.model.Wishlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * HÃ m Controller xá»­ lÃ½ cÃ¡c yÃªu cáº§u cho Users Createby: Sonnv
 * (11/12/2020)
 */
@WebServlet(name = "CustomerController", urlPatterns = { "/home" })
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Khai bÃ¡o cÃ¡c DAO xá»­ lÃ½ nghiá»‡p vá»¥ tÆ°Æ¡ng tÃ¡c vá»›i CSDL
	 */
	private ProductDAO productDAO;
	private CustomerDAO customerDAO;
	private ItemDAO itemDAO;
	private CartDAO cartDAO;
	private WishlistDAO wishDAO;
	private SuccessBillDAO successBillDAO;
	private ProcessingBillDAO processingBillDAO;
	RequestDispatcher rd = null;

	/**
	 * Khá»Ÿi táº¡o nguá»“n tÆ°Æ¡ng tÃ¡c dá»¯ liá»‡u
	 */
	@Resource(name = "jdbc/quick_rental")
	private DataSource dataSource;

	/**
	 * HÃ m khá»Ÿi Ä‘á»™ng
	 */
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			productDAO = new ProductDAO(dataSource);
			customerDAO = new CustomerDAO(dataSource);
			itemDAO = new ItemDAO(dataSource);
			cartDAO = new CartDAO(dataSource);
			wishDAO = new WishlistDAO(dataSource);
			processingBillDAO = new ProcessingBillDAO(dataSource);
			successBillDAO = new SuccessBillDAO(dataSource);

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * HÃ m khá»Ÿi táº¡o
	 */
	public CustomerController() {
		super();
	}

	/**
	 * CÃ¡c hÃ m sá»­ dá»¥ng Get
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			String theCommand = request.getParameter("command");
			System.out.println("do get got:" + theCommand);
			if (theCommand == null) {
				theCommand = "LOAD_HOME";
			}
			switch (theCommand) {

			case "LOAD_HOME":
				loadHome(request, response);
				break;
			case "LOGIN_CUSTOMER":
				loginCustomer(request, response);
				break;
			case "REGISTER_CUSTOMER":
				registerCustomer(request, response);
				break;
			case "LOGOUT_CUSTOMER":
				logoutCustomer(request, response);
				break;

			case "VIEW_DETAIL_CUSTOMER":
				viewDetailCustomer(request, response);
				break;

			case "VIEW_DETAIL_PRODUCT":
				viewDetailProduct(request, response);
				break;
			case "VIEW_CATE":
				viewCate(request, response);
				break;
			case "VIEW_CART":
				viewCart(request, response);
				break;
			case "VIEW_WISHLIST":
				viewWishlist(request, response);
				break;
			case "VIEW_BILL":
				viewbill(request, response);
				break;
			// case "VIEW_SUCCESSBILL":
			// viewSuccessbill(request, response);
			// break;
			case "DELETE_WISHLIST":
				deleteFromWishlist(request, response);
				break;
			case "DELETE_CART":
				deleteFromCart(request, response);
				break;
			case "NUM_CART":
				numCart(request, response);
				break;
			case "NUM_YEU":
				numYeu(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void viewbill(HttpServletRequest request, HttpServletResponse response) throws Exception {
		viewProccessingbill(request, response);
		viewSuccessbill(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/bill.jsp");
		dispatcher.forward(request, response);

	}

	private int numYeu(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0;
		HttpSession session = request.getSession();
		String cusid = (String) session.getAttribute("idCustomer");
		List<Product> wishlists = WishlistDAO.getProdinWishList(cusid);
		num = wishlists.size();

		PrintWriter out = response.getWriter();
		out.println(Integer.toString(num));
		out.close();
		return num;

	}

	private void viewDetailCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		Customer cs = (Customer) request.getAttribute("CUSTOMER");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/profile.jsp");
		dispatcher.forward(request, response);
	}

	private void viewSuccessbill(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		HttpSession session = request.getSession(false);
		String CusID = (String) session.getAttribute("idCustomer");
		List<ListOfListSuccessBill> lscbills = SuccessBillDAO.ListofListSuccessbill(CusID);
		System.out.println("Tổng số hóa đơn đã thành công là: " + lscbills.size());
		request.setAttribute("Billed", lscbills);

	}

	private void viewProccessingbill(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		HttpSession session = request.getSession(false);
		String CusID = (String) session.getAttribute("idCustomer");
		List<ListOfListProcessBill> lpcbills = ProcessingBillDAO.getListOfListProcessBillbyCusId(CusID);
		System.out.println("Tổng số hóa đơn đã đặt là: " + lpcbills.size());
		request.setAttribute("Billing", lpcbills);

	}

	/**
	 * hiển thị danh mục yêu thích
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void viewWishlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		HttpSession session = request.getSession(false);
		String CusID = (String) session.getAttribute("idCustomer");
		List<Product> wishlists = wishDAO.getProdinWishList(CusID);
		request.setAttribute("CURWISHLIST", wishlists);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/wishlists.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * chuyển đến trang đăng ký
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void registerCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/register.jsp");
		dispatcher.forward(request, response);

	}

	private int numCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num;
		HttpSession session = request.getSession();
		String cusid = (String) session.getAttribute("idCustomer");
		List<ItemCart> itemcarts = CartDAO.getDetailCart(cusid);
		num = 0;

		for (ItemCart cart : itemcarts) {
			num += cart.prodAmount;
		}
		// System.out.println("number in cart" +num);
		PrintWriter out = response.getWriter();
		out.println(Integer.toString(num));
		out.close();
		return num;

	}

	/**
	 * Hàm đăng xuất tài khoản cho customer
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void logoutCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		loginCustomer(request, response);

	}

	/**
	 * hàm chuyển đến khi click login
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void loginCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/login.jsp");
		dispatcher.forward(request, response);

	}

	// function hiá»ƒn thá»‹ chi tiáº¿t sáº£n pháº©m
	private void viewDetailProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		// báº¯t name cá»§a input Ä‘á»ƒ láº¥y ra id cá»§a sáº£n pháº©m: input cÃ³ name =
		// id-productdetail, value = id cá»§a product Ä‘Ã³
		String prod_id = request.getParameter("id-productdetail");
		Product p = ProductDAO.getProduct(prod_id);
		request.setAttribute("DETAIL", p);
		List<Product> products = productDAO.getRandomProductsByCate(4, p.cateId);
		request.setAttribute("RELATED", products);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/product-details.jsp");
		dispatcher.forward(request, response);

	}

	// ham loadhome
	private void loadHome(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession(false);
//		System.out.println(session.getAttribute("idCustomer"));
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		List<ProductWithItem> newproducts = ProductDAO.getNewProducts(8);
		request.setAttribute("NEW_PRODUCTS", newproducts);
		List<ProductWithItem> hotproducts = ProductDAO.getProductbyStatus(3, "HOT");
		request.setAttribute("HOT_PRODUCTS", hotproducts);
		List<ProductWithItem> saleproducts = ProductDAO.getProductbyStatus(3, "SALE");
		request.setAttribute("SALE_PRODUCT", saleproducts);
		List<ProductWithItem> trendproducts = ProductDAO.getProductbyStatus(3, "TREND");
		request.setAttribute("TREND", trendproducts);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/index.jsp");
		dispatcher.forward(request, response);
	}

	// hÃ m hiá»ƒn thá»‹ danh sÃ¡ch sáº£n pháº©m theo cate cÃ³ phÃ¢n trang
	/*
	 * cáº§n truyá»�n id cá»§a cate lÃªn khi click vÃ o category Ä‘Ã³ báº±ng hidden
	 * input set value = "$cateId" name ="cateId" trong jsp cáº§n táº¡o 1 form trong
	 * Ä‘Ã³ cÃ³ cÃ¡c hidden input id maxpageitem(sá»‘ sáº£n pháº©m tá»‘i Ä‘a trÃªn
	 * trang), page(page hiá»‡n táº¡i), sau Ä‘Ã³ dÃ¹ng jquery truyá»�n lÃªn, tham
	 * kháº£o link https://www.youtube.com/watch?v=vQcdVAJSYOM
	 * 
	 * 
	 * 
	 * 
	 */
	private void viewCate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		String cateId = request.getParameter("cateId");
		String pageStr = request.getParameter("page");
		String maxPageItemStr = request.getParameter("maxPageItem");
		int page;
		int totalPages;
		int maxPageItem = 10;

		if (pageStr != null) {
			page = Integer.parseInt(pageStr);
		} else {
			page = 1;
		}

		if (maxPageItemStr != null) {
			maxPageItem = Integer.parseInt(request.getParameter("maxPageItem"));
		}
		int startRecord = (page - 1) * maxPageItem;
		int record = maxPageItem;
		int cateID = Integer.parseInt(cateId);
		List<Product> products = ProductDAO.getProductsByCate(record, startRecord, cateID);
		int totalproduct = ProductDAO.getProductsByCate(cateID).size();
		totalPages = (int) Math.ceil((double) totalproduct / maxPageItem);
		request.setAttribute("PAGE", page);
		request.setAttribute("MAX_PAGE_ITEM", maxPageItem);
		request.setAttribute("TOTAL_PAGE", totalPages);
		request.setAttribute("LIST_PRODUCT", products);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/list-product.jsp");
		dispatcher.forward(request, response);

	}

	/*
	 * hien thi gio hang
	 */
	private void viewCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ListOfListCate> LOLCs = ItemDAO.getAllListOfListCates();
		request.setAttribute("NAV_BAR", LOLCs);
		HttpSession session = request.getSession(false);
		String CusID = (String) session.getAttribute("idCustomer");
		if (CusID == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Bạn chưa đăng nhập');");
			out.println("location='home?command=LOGIN_CUSTOMER'");
			out.println("</script>");

		} else {
			System.out.println("id ng dùng:" + CusID);
			List<ItemCart> carts = cartDAO.getDetailCart(CusID);
			request.setAttribute("CURCART", carts);
			List<Product> listproducts = new ArrayList<Product>();
			for (int i = 0; i < carts.size(); i++) {
				Product p = ProductDAO.getProduct(carts.get(i).prodId);
				listproducts.add(p);
			}
			request.setAttribute("PRODUCT", listproducts);

			RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/cart.jsp");
			dispatcher.forward(request, response);
		}

	}

	/**
	 * Cac ham su dung Post
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			String theCommand = request.getParameter("command");
			System.out.println("doPost: command got: " + theCommand);
			switch (theCommand) {
			case "CHECK_LOGIN":
				checkLogin(request, response);
				break;
			case "INSERT":
				createCustomer(request, response);
				break;
			case "ADD_WISHLIST":
				addToWishlist(request, response);
				break;

			case "UPDATE_CART":
				updateCart(request, response);
				break;
			case "ORDER":
				orderProducts(request, response);
				break;
			case "ADD_CART":
				addToCart(request, response);
				break;

			}

			/*
			 * case "UPDATE_INFOR": updateCustomer(request, response); break;
			 */
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	/**
	 * Thêm vào giỏ hàng
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void addToCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// truyền product-id lên server khi nhấn button addTocart
		HttpSession session = request.getSession(false);
		if (session.getAttribute("idCustomer") == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Bạn chưa đăng nhập');");
			out.println("location='home?command=LOGIN_CUSTOMER'");
			out.println("</script>");

		} else {
			// aready login
			String prod_id = request.getParameter("product_id");
			System.out.println("idproduct : " + prod_id);
			// System.out.println(prod_id);
			String customer_id = (String) session.getAttribute("idCustomer");
			Cart tmpcart = CartDAO.checkProdInCart(customer_id, prod_id);
			if (tmpcart == null) {
				Cart tmpcart1 = new Cart(customer_id, prod_id, 1, 1);
				CartDAO.createNewCart(tmpcart1);
			} else {
				CartDAO.updateAmount(tmpcart.getCartId(), tmpcart.getProdAmount() + 1);

			}
			response.setContentType("text/html;charset=UTF-8");
			int num = numCart(request, response);
			System.out.println("num in cart when add" + num);
			PrintWriter out = response.getWriter();

			out.println(Integer.toString(num));

		}

	}

	/**
	 * xoa san pham trong gio hang
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void deleteFromCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// truyền product-id lên server khi nhấn button addTocart

		HttpSession session = request.getSession(false);
		if (session.getAttribute("idCustomer") == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			loginCustomer(request, response);
		} else {
			String prod_id = request.getParameter("product_id");
			System.out.println(prod_id);
			String customer_id = (String) session.getAttribute("idCustomer");
			cartDAO.deleteCart(customer_id, prod_id);
			viewCart(request, response);
		}
	}

	/**
	 * Cap nhat san pham trong gio hang
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void updateCart(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// truyền product-id lên server khi nhấn button addTocart
		HttpSession session = request.getSession(false);
		if (session.getAttribute("idCustomer") == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			loginCustomer(request, response);
		} else {

			String customer_id = (String) session.getAttribute("idCustomer");
			// lấy ra 2 dữ liệu từ input là số sản phẩm và số ngày
			List<ItemCart> carts = cartDAO.getDetailCart(customer_id);
			int numCart = carts.size();
			System.out.println("Got " + numCart + " san pham");
			for (int i = 1; i <= numCart; i++) {
				String prod_id = request.getParameter(("product_" + i).toString());

				int prod_amount = Integer.parseInt(request.getParameter("amount_" + i));

				int prod_time = Integer.parseInt(request.getParameter(("time_" + i).toString()));
				// System.out.println(prod_id + "======"+prod_amount + "======"+ prod_amount );
				if (prod_amount == 0 || prod_time == 0) {
					CartDAO.deleteCart(customer_id, prod_id);
				} else {

					Cart cart = CartDAO.checkProdInCart(customer_id, prod_id);
					cart.setProdAmount(prod_amount);
					cart.setProdTime(prod_time);

					// System.out.println(prod_id + "======="+cart.toString());
					CartDAO.updateCart(cart);
				}

			}

			viewCart(request, response);

		}

	}

	private void orderProducts(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// truyền product-id lên server khi nhấn button addTocart
		HttpSession session = request.getSession(false);
		if (session.getAttribute("idCustomer") == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			loginCustomer(request, response);
		} else {
			String customer_id = (String) session.getAttribute("idCustomer");
			List<ItemCart> carts = CartDAO.getDetailCart(customer_id);
			// tao processing bill
			System.out.println(carts.size());
			List<ListOfListProcessBill> listpbill = processingBillDAO.getListOfListProcessBill();
			int size = listpbill.size();
			String errors[] = new String[size];
			for (int i = 0; i < carts.size(); i++) {
				Product p = productDAO.getProduct(carts.get(i).prodId);
				String billCode = "BH" + (size + 1);
				int billStatus = 1;
				String prodId = p.prodId;
				int prodAmount = carts.get(i).prodAmount;
				String prodDeposit = p.prodDeposit;
				String prodPrice = p.prodPrice;
				String customerId = customer_id;
				int rentalTerm = carts.get(i).prodTime;
				System.out.println(rentalTerm);
				ProcessingBill pb = new ProcessingBill(billCode, billStatus, prodId, prodAmount, prodDeposit, prodPrice,
						customerId, rentalTerm);
				ProcessingBillDAO.createProcessingBill(pb);
				CartDAO.deleteCart(customer_id, p.prodId);

			}
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Đặt đơn thành công');");
			out.println("</script>");
			loadHome(request, response);

		}
	}

	/**
	 * xoa san pham yeu thich
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void deleteFromWishlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String customer_id = (String) session.getAttribute("idCustomer");
		String prod_id = (String) request.getParameter("product_id");
		System.out.println("idproduct to delete form wishlist: " + prod_id + "  idcus   " + customer_id);
		wishDAO.DeleteWishlist(prod_id, customer_id);
		viewWishlist(request, response);
	}

	private void addToWishlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("idCustomer") == null) {
			// chưa đăng nhập nên chuyển đến trang đăng nhập
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Bạn chưa đăng nhập');");
			out.println("location='home?command=LOGIN_CUSTOMER'");
			out.println("</script>");

		} else {
			// aready login
			String prod_id = request.getParameter("product_id");
			System.out.println("idproduct : " + prod_id);
			// System.out.println(prod_id);
			String customer_id = (String) session.getAttribute("idCustomer");
			Product p = ProductDAO.getProduct(prod_id);
			List<Product> wishlists = WishlistDAO.getProdinWishList(customer_id);
			Boolean contain = false;
			for (Product pr : wishlists) {
				if (pr.prodId.equals(prod_id)) {
					contain = true;
					break;
				}

			}
			if (contain == false) {
				Wishlist newWishlist = new Wishlist(prod_id, p.getProdName(), p.getProdPrice(), customer_id);
				WishlistDAO.createNewWishlist(newWishlist);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				int num = numYeu(request, response);
				out.println(Integer.toString(num));
				System.out.println("number in wish when add " + num);
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println(-1);

			}

		}

	}

	private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email + "------------" + password);
		Customer cs = CustomerDAO.getCustomerByAccount(email, password);
		if (cs != null) {
			HttpSession session = request.getSession();
			session.setAttribute("emailCustomer", cs.getEmail());
			session.setAttribute("passCustomer", cs.getPassword());
			session.setAttribute("idCustomer", cs.getCustomerId());
			session.setAttribute("CustomerName", cs.getFirstName());
			session.setAttribute("CUSTOMER", cs);
			loadHome(request, response);
			System.out.println("LoginSuccess " + cs.firstName);

		} else {
			HttpSession session = request.getSession();
			session.setAttribute("checkFail", "error");
			System.out.println("Login thất bại");
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/login.jsp");
			dispatcher.forward(request, response);

		}
	}

	private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Customer cs = new Customer();
		cs.setCustomerCode("CS" + CustomerDAO.NumCustomer());
		System.out.println(request.getParameter("address"));
		cs.setAddress(request.getParameter("address").toString());

		// cs.setBankCodeAccount(request.getParameter("bank_code_account"));
		// cs.setBankId(Integer.parseInt(request.getParameter("bank_id")));
		// cs.setBirthday(request.getParameter("birthday"));
		// cs.setCustomerCode(request.getParameter("customer_code"));
		cs.setEmail(request.getParameter("email"));
		cs.setFirstName(request.getParameter("firstname"));
		// cs.setGender(Integer.parseInt(request.getParameter("gender")));
		cs.setLastName(request.getParameter("lastname"));
		cs.setPassword(request.getParameter("password"));
		cs.setPhoneNumber(request.getParameter("phone_number"));
		CustomerDAO.createNewCustomer(cs);
		HttpSession session = request.getSession(true);
		session.setAttribute("emailCustomer", cs.getEmail());
		session.setAttribute("passCustomer", cs.getPassword());
		session.setAttribute("idCustomer", cs.getCustomerId());
		session.setAttribute("CUSTOMER", cs);

		System.out.println("RegisterSuccess");
		loadHome(request, response);
	}

}
