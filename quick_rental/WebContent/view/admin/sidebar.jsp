<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sidebar</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<!-- Phần Sidebar -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Icon Home -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="home.html">
			<div class="sidebar-brand-icon">
				<i class="fas fa-home"></i>
			</div>
		</a>

		<!-- Dấu ngăn xếp -->
		<hr class="sidebar-divider my-0">

		<!-- Phần thống kê chung -->
		<c:url var="loadChart" value="admin">
			<c:param name="command" value="LOAD_ADMIN"></c:param>
		</c:url>
		<li class="nav-item active"><a class="nav-link"
			href="${loadChart}"> <i class="fas fa-chart-pie"></i> <span>Thống
					kê</span>
		</a></li>

		<!-- Dấu ngăn xếp -->
		<hr class="sidebar-divider">

		<!-- Quản lý tài khoản -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-user-circle" style="width: 16px; text-align: center;"></i>
				<span>Tài khoản</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý tài khoản:</h6>
					<c:url var="loadAccountCus" value="admin">
						<c:param name="command" value="LOAD_ACCOUNT_CUS"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadAccountCus}">Khách hàng</a>
					<c:url var="loadAccountAdmin" value="admin">
						<c:param name="command" value="LOAD_ACCOUNT_ADMIN"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadAccountAdmin}">Quản trị viên</a>
				</div>
			</div></li>

		<!-- Quản lý sản phẩm -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fas fa-align-justify"
				style="width: 16px; text-align: center;"></i> <span>Sản phẩm</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý sản phẩm:</h6>
					<c:url var="loadInfoProduct" value="admin">
						<c:param name="command" value="LOAD_INFO_PRODUCT"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadInfoProduct}">Thông tin
						sản phẩm</a>
					<c:url var="loadWarehouse" value="admin">
						<c:param name="command" value="LOAD_WAREHOUSE"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadWarehouse}">Sản phẩm trong
						kho</a>
				</div>
			</div></li>
		<!-- Quản lý hóa đơn -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseBill"
			aria-expanded="true" aria-controls="collapseBill"> <i
				class="fas fa-file-invoice" style="width: 16px; text-align: center;"></i>
				<span>Hóa đơn</span>
		</a>
			<div id="collapseBill" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Quản lý hóa đơn:</h6>
					<c:url var="loadProcessingBill" value="admin">
						<c:param name="command" value="LOAD_PROCESS_BILL"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadProcessingBill}">Hóa đơn
						thuê</a>
					<c:url var="loadSuccessBill" value="admin">
						<c:param name="command" value="LOAD_SUCCESS_BILL"></c:param>
					</c:url>
					<a class="collapse-item" href="${loadSuccessBill}">Hóa đơn
						thành công</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
</body>
</html>