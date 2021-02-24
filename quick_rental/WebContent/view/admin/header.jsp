<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header</title>
<link href="view/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	<!-- Custom styles for this template-->
    <link href="view/admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<!-- Phần header -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<!-- Thanh search -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

		<!-- Chức năng cho admin -->
		<form
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-light border-0 small"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Phần điều khiển Sidebar -->
		<ul class="navbar-nav ml-auto">

			<!-- Thông báo -->
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Số thông báo-->
					<span class="badge badge-danger badge-counter">3+</span>
			</a> <!-- Danh sách thông báo -->
				<div
					class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="alertsDropdown">
					<h6 class="dropdown-header">Alerts Center</h6>
					<a class="dropdown-item d-flex align-items-center" href="#">
						<div class="mr-3">
							<div class="icon-circle bg-primary">
								<i class="fas fa-file-alt text-white"></i>
							</div>
						</div>
						<div>
							<div class="small text-gray-500">December 12, 2019</div>
							<span class="font-weight-bold">A new monthly report is
								ready to download!</span>
						</div>
					</a> <a class="dropdown-item d-flex align-items-center" href="#">
						<div class="mr-3">
							<div class="icon-circle bg-success">
								<i class="fas fa-donate text-white"></i>
							</div>
						</div>
						<div>
							<div class="small text-gray-500">December 7, 2019</div>
							$290.29 has been deposited into your account!
						</div>
					</a> <a class="dropdown-item d-flex align-items-center" href="#">
						<div class="mr-3">
							<div class="icon-circle bg-warning">
								<i class="fas fa-exclamation-triangle text-white"></i>
							</div>
						</div>
						<div>
							<div class="small text-gray-500">December 2, 2019</div>
							Spending Alert: We've noticed unusually high spending for your
							account.
						</div>
					</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
						All Alerts</a>
				</div></li>


			<div class="topbar-divider d-none d-sm-block"></div>

			<!-- Quản trị viên -->
			<li class="nav-item dropdown no-arrow">
				<!-- Tên quản trị viên --> <a class="nav-link dropdown-toggle"
				href="#" id="userDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small">${ADMIN.adminName}</span>
					<img class="img-profile rounded-circle"
					src="view/admin/img/undraw_profile.svg">
			</a> <!-- Danh sách dropdown-->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<!-- <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div> -->
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Đăng xuất
					</a>
				</div>
			</li>

		</ul>

	</nav>
	<!-- Kết thúc header -->
	
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