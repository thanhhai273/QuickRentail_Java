package com.quickrental.website.controller;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.quickrental.website.dao.AdminDAO;
import com.quickrental.website.dao.BankDAO;
import com.quickrental.website.dao.CategoryDAO;
import com.quickrental.website.dao.CustomerDAO;
import com.quickrental.website.dao.ItemDAO;
import com.quickrental.website.dao.ProcessingBillDAO;
import com.quickrental.website.dao.ProductDAO;
import com.quickrental.website.dao.SuccessBillDAO;
import com.quickrental.website.dao.WarehouseDAO;
import com.quickrental.website.model.Admin;
import com.quickrental.website.model.Bank;
import com.quickrental.website.model.Category;
import com.quickrental.website.model.Customer;
import com.quickrental.website.model.DetailCustomer;
import com.quickrental.website.model.Item;
import com.quickrental.website.model.ListOfListProcessBill;
import com.quickrental.website.model.ListOfListSuccessBill;
import com.quickrental.website.model.ProccessBillTable;
import com.quickrental.website.model.Product;
import com.quickrental.website.model.ProductTable;
import com.quickrental.website.model.SuccessBill;
import com.quickrental.website.model.Warehouse;
import com.quickrental.website.model.WarehouseTable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * Hàm Controller xử lý các yêu cầu cho Admin Createby: MTHUNG (01/12/2020)
 */
@WebServlet(name = "AdminController", urlPatterns = { "/admin" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 5, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Khai báo các DAO xử lý nghiệp vụ tương tác với CSDL
	 */
	private ProductDAO productDAO;
	private AdminDAO adminDAO;
	private CustomerDAO customerDAO;
	private BankDAO bankDAO;
	private WarehouseDAO warehouseDAO;
	private ProcessingBillDAO processingBillDAO;
	private SuccessBillDAO successBillDAO;
	private CategoryDAO categoryDAO;
	private ItemDAO itemDAO;
	
	/**
	 * Khởi tạo nguồn tương tác dữ liệu
	 */
	@Resource(name = "jdbc/quick_rental")
	private DataSource dataSource;

	/**
	 * Hàm khởi động
	 */
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			productDAO = new ProductDAO(dataSource);
			adminDAO = new AdminDAO(dataSource);
			customerDAO = new CustomerDAO(dataSource);
			bankDAO = new BankDAO(dataSource);
			warehouseDAO = new WarehouseDAO(dataSource);
			processingBillDAO = new ProcessingBillDAO(dataSource);
			successBillDAO = new SuccessBillDAO(dataSource);
			categoryDAO = new CategoryDAO(dataSource);
			itemDAO = new ItemDAO(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * Hàm khởi tạo
	 */
	public AdminController() {
		super();
	}

	/**
	 * Các hàm sử dụng Get
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "LOGIN_ADMIN";
			}
			switch (theCommand) {
			case "LOGIN_ADMIN":
				loginAdmin(request, response);
				break;
			case "LOGOUT_ADMIN":
				logoutAdmin(request, response);
				break;
			case "LOAD_ADMIN":
				loadAdmin(request, response);
				break;
			case "LOAD_ACCOUNT_CUS":
				loadAccountCus(request, response);
				break;
			case "LOAD_ACCOUNT_ADMIN":
				loadAccountAdmin(request, response);
				break;
			case "LOAD_INFO_PRODUCT":
				loadInfoProduct(request, response);
				break;
			case "LOAD_WAREHOUSE":
				loadWarehouse(request, response);
				break;
			case "LOAD_PROCESS_BILL":
				loadProcessingBill(request, response);
				break;
			case "LOAD_SUCCESS_BILL":
				loadSuccessBill(request, response);
				break;
			case "DELETE_ACCOUNT_CUS":
				deleteAccountCus(request, response);
				break;
			case "DELETE_ACCOUNT_ADMIN":
				deleteAccountAdmin(request, response);
				break;
			case "DELETE_PRODUCT":
				deleteProduct(request, response);
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Xóa sản phẩm
	 * @param request
	 * @param response
	 */
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String prodId = request.getParameter("prodId");
		System.out.println("Xóa : " + prodId);
		
		Product tempProd = ProductDAO.getProduct(prodId);
		String imgString = tempProd.getImage1();
		String[] words = imgString.split("[/]");
		String url = "D:\\My_Project\\QuickRentail\\quick_rental\\WebContent\\assets\\img\\".replace("\\", "/") + words[2]
				+ "/" + words[3] + "/" + words[4];
		System.out.println("delete-----------------------------: " + url);
		Path img = Paths.get(url);
		Files.walk(img).map(Path::toFile).sorted(Comparator.comparing(File::isDirectory)).forEach(File::delete);
		productDAO.deleteProduct(prodId);
		
		warehouseDAO.deleteWarehouse(prodId);
		loadInfoProduct(request, response);
	}

	/**
	 * Xóa tài khoản Admin
	 * @param request
	 * @param response
	 */
	private void deleteAccountAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String adminId = request.getParameter("adminId");
		adminDAO.deleteAdmin(adminId);
		loadAccountAdmin(request, response);
	}

	/**
	 * Xóa tài khoản người dùng
	 * @param request
	 * @param response
	 */
	private void deleteAccountCus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String customerId = request.getParameter("customerId");
		customerDAO.deleteCustomer(customerId);
		loadAccountCus(request, response);
	}

	/**
	 * Hàm đăng xuất tài khoản cho admin
	 * @param request
	 * @param response
	 */
	private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		loginAdmin(request, response);
	}

	/**
	 * Hàm chuyển đến trang login khi sang giao diện quản lý
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Lấy ra danh sách các hóa đơn đã hoàn thành
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadSuccessBill(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<ListOfListSuccessBill> listOfListSuccessBill =  successBillDAO.getListOfListSuccessBill();
		for (ListOfListSuccessBill listOfListSuccessBill2 : listOfListSuccessBill) {
			System.out.println("---------"+listOfListSuccessBill2.listBill);
		}
		request.setAttribute("LIST_OF_LIST_SUCCESS_BILL", listOfListSuccessBill);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/success-bill.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Lấy ra danh sách các hóa đơn thuê
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadProcessingBill(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<ListOfListProcessBill> listOfListProcessBill =  processingBillDAO.getListOfListProcessBill();
		System.out.println(listOfListProcessBill);
		request.setAttribute("LIST_OF_LIST_PROCESS_BILL", listOfListProcessBill);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/processing-bill.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Lấy danh sách sản phẩm trong kho bao gồm cả tên sản phẩm
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadWarehouse(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<WarehouseTable> listWareTable = warehouseDAO.getWarehousesProd();
		request.setAttribute("LIST_WAREHOUSE_TABLE", listWareTable);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/warehouse.jsp");
		dispatcher.forward(request, response);
	}
	
	/**
	 * Lấy thông tin tất cả sản phẩm của cửa hàng
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadInfoProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<ProductTable> listProdTable = productDAO.getProductsCate();
		request.setAttribute("LIST_PRODUCT_TABLE", listProdTable);
		List<Category> cates = categoryDAO.getCates();
		request.setAttribute("LIST_CATE", cates);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/list-product.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Lấy ra danh sách tài khoản của admin
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadAccountAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<Admin> listAdmin = adminDAO.getAdmins();
		request.setAttribute("LIST_ADMIN", listAdmin);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/list-account-admin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Lấy ra danh sách tài khoản Khách hàng
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadAccountCus(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<DetailCustomer> listDetailCus = new ArrayList<DetailCustomer>();
		List<Customer> listCustomer = customerDAO.getCustomers();
		listCustomer.forEach((i) -> System.out.println(i.toString()));
		List<Bank> listBank = bankDAO.getBanks();
		for (Customer c : listCustomer) {
			DetailCustomer detailCus = null;
			System.out.println("DS Ng dùng: " + c.bankId);
			if(c.bankId != 0) {
				for (Bank bank : listBank) {
					if(bank.id == c.bankId) {
						detailCus = new DetailCustomer(c, bank.bankName);
						System.out.println("Customer: "+c.toString());
						break;
					}
				}
			};
			
			listDetailCus.add(detailCus);
		}
		
		request.setAttribute("LIST_CUS", listDetailCus);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/list-account-customer.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * Hàm load trang quản lý Admin sau khi đăng nhập thành công
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void loadAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int countProd = productDAO.countProduct();
		int countCus = customerDAO.NumCustomer();
		request.setAttribute("COUNT_PROD", countProd);
		request.setAttribute("COUNT_CUS", countCus);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * Các hàm sử dụng Post
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
			case "CONVERT_SUCCESS_BILL":
				convertSuccessBill(request, response);
				break;
			case "ADD_PRODUCT":
				addProduct(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Hàm thêm mới sản phẩm
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// Lấy thông tin sản phẩm thêm mới
		String prodId = java.util.UUID.randomUUID().toString();
		String prodCode = request.getParameter("prodCode");
		String prodColor = request.getParameter("propColor");
		String prodName = request.getParameter("prodName");
		String prodPrice = request.getParameter("prodPrice");
		String prodDeposit = request.getParameter("prodDeposit");
		String prodStatus = request.getParameter("prodStatus");
		String prodDescription = request.getParameter("prodDescription");
		int prodAmount = Integer.parseInt(request.getParameter("prodAmount"));
		int cateId = Integer.parseInt(request.getParameter("cateId"));
		String importPrice = request.getParameter("importPrice");
		String prodCodePartner = request.getParameter("prodCodePartner");
		
		String nameItem = itemDAO.getNameItemByCate(cateId);
		String nameCate = categoryDAO.getNameCate(cateId);
		String image1 = "assets/img/" + nameItem + "/" + nameCate + "/" + prodCode + "/img1.jpg";
		String image2 = "assets/img/" + nameItem + "/" + nameCate + "/" + prodCode + "/img2.jpg";
		String image3 = "assets/img/" + nameItem + "/" + nameCate + "/" + prodCode + "/img3.jpg";
		
		// Check null các trường không bắt buộc
		if(prodColor == null) prodColor = "";
		if(prodDescription == null) prodDescription = "";

		// Thêm sản phẩm mới vào CSDL - kho hàng
		Warehouse newWarehouse = new Warehouse(prodId, prodAmount, 0, importPrice, prodCodePartner);
		if(warehouseDAO.createWarehouse(newWarehouse)) {
			// Thêm sản phẩm mới vào CSDL - bảng Product
			Product newProduct = new Product(prodId, prodCode, image1, image2, image3, prodColor, prodName, prodPrice, prodDeposit, prodStatus, prodDescription, prodAmount, cateId);
			productDAO.createNewProduct(newProduct);
			System.out.println(newProduct.toString());
			
			// Đường dẫn lưu ảnh 
			String url = "D:\\My_Project\\QuickRentail\\quick_rental\\WebContent\\assets\\img\\" + nameItem + "\\" + nameCate + "\\" + prodCode;
			
			File file = new File(url);
			if (!file.exists()) {
				file.mkdir();
			}
			
			// Copy ảnh thêm vào thư mục lưu ảnh
			for (int i = 1; i < 4; i++) {
				String input = "input-" + i;
				String img = "img" + i;
				System.out.println("nameInput :" + input + " | " + "nameImg :" + img);
				Part filePart = null;
				if (request.getPart(input) != null) {
					filePart = request.getPart(input);
					if (filePart.getSize() > 0) {
						OutputStream outputStream = new FileOutputStream(
								new File(url + "\\" + img + ".jpg"));
						if (filePart != null) {
							InputStream fileContent = filePart.getInputStream();
							IOUtils.copy(fileContent, outputStream);
						}
					}
				}
			}
		}
		loadInfoProduct(request, response);
	}

	/**
	 * Hàm chuyển hóa đơn từ đang thực hiện sang hóa đơn đã hoàn thành
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void convertSuccessBill(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String billCode = request.getParameter("ssBillCode");
		int ssStatus = Integer.parseInt(request.getParameter("ssStatus"));
		System.out.println("Mã hóa đơn: " + billCode + ", Trạng thái :" + ssStatus);
		List<ProccessBillTable> listBill = ProcessingBillDAO.getProccessBillTablesByBill(billCode);
		for (ProccessBillTable proccessBillTable : listBill) {
			String receivedDate = (new Timestamp(System.currentTimeMillis())).toString();
			SuccessBill successBill = new SuccessBill(proccessBillTable.processingBill.billId, billCode, proccessBillTable.processingBill.prodId, proccessBillTable.processingBill.prodAmount, formatDatetime(proccessBillTable.processingBill.createdDate), receivedDate, ssStatus, proccessBillTable.bankId, proccessBillTable.bankCode, proccessBillTable.processingBill.customerId);
			System.out.println("successBill " + successBill.toString());
			successBillDAO.createNewSuccessBill(successBill);
			processingBillDAO.deleteBill(billCode);
		}
		loadProcessingBill(request, response);
	}

	/**
	 * Hàm check xem đăng nhập đúng chưa và trả về kết quả
	 * @param request
	 * @param response
	 */
	private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String emailAdmin = request.getParameter("emailAdmin");
		String passAdmin = request.getParameter("passAdmin");
		System.out.println(emailAdmin + "-----" +passAdmin );
		Admin admin = adminDAO.checkAdmin(emailAdmin, passAdmin);
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("idAdmin", admin.adminId);
			session.setAttribute("emailAdmin", emailAdmin);
			session.setAttribute("passAdmin", passAdmin);
			session.setAttribute("ADMIN", admin);
			loadAdmin(request, response);
			System.out.println("Login admin thành công: "+ admin.adminName);
		} else {
			String checkFail = "error";
			HttpSession session = request.getSession();
			session.setAttribute("checkFail", checkFail);
			System.out.println("Login admin thất bại");
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/admin/login.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	@SuppressWarnings("unused")
	private String formatDatetime(String time) {
		String[] part = time.split(" ");
		String[] partTime = part[1].split("-");
		return partTime[2] + "-" + partTime[1] + "-" +  partTime[0] + " " + part[0];
	}
}