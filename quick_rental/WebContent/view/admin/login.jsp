<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Đăng nhập | Admin</title>
<!-- Custom fonts for this template-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="view/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="view/admin/css/sb-admin-2.min.css" rel="stylesheet">

<%
	String display = "none";
if (session.getAttribute("checkFail") != null) {
	display = "block";
	session.removeAttribute("checkFail");
}
%>
</head>
<body class="bg-gradient-primary">
	<div class="container" style="height: 100vh;">
		<!-- Outer Row -->
		<div class="d-flex justify-content-center h-100 align-items-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5 ">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block">
								<img src="view/admin/img/login.jpg" alt=""
									style="max-width: 100%;">
							</div>
							<div class="col-lg-6">
								<div class="p-5 h-100 d-flex align-items-center">
									<div>
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Đăng nhập giao diện
												admin</h1>
										</div>
										<form class="user" id="form-login" action="admin" method="POST">
										<input type="hidden" name="command" value="CHECK_LOGIN" />
											<div class="form-group">
												<input type="email" class="form-control form-control-user" name="emailAdmin"
													id="exampleInputEmail" aria-describedby="emailHelp"
													placeholder="Nhập email...">
											</div>
											<div class="form-group">
												<input type="password" name="passAdmin"
													class="form-control form-control-user"
													id="exampleInputPassword" placeholder="Mật khẩu">
											</div>
											<!-- Phần hiển thị validate dữ liệu -->
											<div id="invalid00" class="invalid-feedback"
												style="padding-left: 17px;">
												<i class="fas fa-times mr-2"></i>Email và mật khẩu không
												được để trống!
											</div>
											<div id="invalid01" class="invalid-feedback"
												style="padding-left: 17px;">
												<i class="fas fa-times mr-2"></i>Email không đúng định dạng!
											</div>
											<div id="invalid02" class="invalid-feedback"
												style="padding-left: 17px;">
												<i class="fas fa-times mr-2"></i>Mật khẩu phải có ít nhất 6
												ký tự!
											</div>
											<div id="invalid03" style="display:<%=display%>; padding-left: 17px;color: red;font-size: 13px;" 
												style="padding-left: 17px;">
												<i class="fas fa-times mr-2"></i>Tài khoản bạn đã nhập không khớp với bất kỳ tài khoản nào!
											</div>
											<!--  -->
											<!-- Nút đăng nhập -->
											<a class="btn btn-primary btn-user btn-block mt-4"
												id="submit-button" style="font-size: 18px"> Đăng nhập </a>
											<!--  -->
											<hr>
										</form>
										<div class="text-center">
											<a class="small" href="#">Chưa có tài khoản liên hệ ngay
												Chủ cửa hàng</a> <a class="small" href="#" style="color: red;">0978313756</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="view/admin/js/login.js"></script>
</body>
</html>