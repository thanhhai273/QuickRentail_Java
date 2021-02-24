<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>QuickRental</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="view/user/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="view/user/css/index.css" type="text/css">
<link rel="stylesheet" href="view/user/css/profile.css">
<%
	String displaycart = "none";
String displaylogin = "block";
if (session.getAttribute("idCustomer") != null) {
	displaycart = "block";
	displaylogin = "none";
}
%>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="container emp-profile">
		<form method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<img
							src="https://filmdaily.co/wp-content/uploads/2020/05/dog-videos-lede-1300x868.jpg"
							alt="" />
						<div class="file btn btn-lg btn-primary">
							Thay đổi ảnh đại diện <input type="file" name="file" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Tiêu đề profile  -->
					<div class="profile-head">
						<h5 style="text-transform: uppercase;">
							<c:out value="${sessionScope.CUSTOMER.lastName}" />
						</h5>
						<h6>Hồ sơ của tôi</h6>
						<br>
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab">ABOUT</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab">Thay Đổi Thông Tin</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab">Thông Tin Ngân Hàng</a></li>
						</ul>
					</div>
				</div>

			</div>
			<!-- Nội dung các tab -->
			<div class="tab-content">
				<!-- Tab hồ sơ -->
				<div class="tab-pane active" id="tabs-1" role="tabpanel">

					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row">
										<div class="col-md-6">
											<label>Tên đăng nhập</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.email}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Họ</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.firstName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Tên</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.lastName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Email</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.email}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Số điện thoại</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.phoneNumber}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Giới tính</label>
										</div>
										<div class="col-md-6">
											<c:choose>
												<c:when test="${sessionScope.CUSTOMER.gender == '0'}">
													<p>Nữ</p>
												</c:when>
												<c:when test="${sessionScope.CUSTOMER.gender == '1'}">
													<p>Nam</p>
												</c:when>

											</c:choose>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Ngày sinh</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.birthday}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Địa chỉ</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.address}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				<!-- Thay Đổi Thông Tin -->
				<div class="tab-pane" id="tabs-2" role="tabpanel">
					
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row">
										<div class="col-md-6">
											<label>Tên đăng nhập</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.email}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Họ</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.firstName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Tên</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.lastName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Email</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.email}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Số điện thoại</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.phoneNumber}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Giới tính</label>
										</div>
										<div class="col-md-6">
											<c:choose>
												<c:when test="${sessionScope.CUSTOMER.gender == '0'}">
													<p>Nữ</p>
												</c:when>
												<c:when test="${sessionScope.CUSTOMER.gender == '1'}">
													<p>Nam</p>
												</c:when>

											</c:choose>

										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Ngày sinh</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.birthday}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Địa chỉ</label>
										</div>
										<div class="col-md-6">
											<p>${sessionScope.CUSTOMER.address}</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					
					
				</div>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
	<!-- Js Plugins -->
	<script src="view/user/js/jquery-3.3.1.min.js"></script>
	<script src="view/user/js/bootstrap.min.js"></script>
	<script src="view/user/js/jquery.magnific-popup.min.js"></script>
	<script src="view/user/js/jquery-ui.min.js"></script>
	<script src="view/user/js/mixitup.min.js"></script>
	<script src="view/user/js/jquery.countdown.min.js"></script>
	<script src="view/user/js/jquery.slicknav.js"></script>
	<script src="view/user/js/owl.carousel.min.js"></script>
	<script src="view/user/js/jquery.nicescroll.min.js"></script>
	<script src="view/user/js/main.js"></script>
	<script src="view/user/js/add-product.js"></script>

</body>

</html>