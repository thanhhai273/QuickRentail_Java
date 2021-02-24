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
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-7">
					<div class="footer__about">
						<div class="footer__logo">
							<c:url var="home" value="home">
								<c:param name="command" value="LOAD_HOME" />
							</c:url>
							<a href="${home}"
								style="font-family: 'Kaushan Script', cursive; font-size: 35px; color: black; font-weight: 900;">QuickRental</a>
						</div>
						<p>QuickRental luôn cố gắng đem đến trải nghiệm tốt nhất đến
							với các bạn!</p>
						<div class="footer__payment">
							<a href="#"><img src="view/user/img/payment/payment-1.png"
								alt=""></a> <a href="#"><img
								src="view/user/img/payment/payment-2.png" alt=""></a> <a
								href="#"><img src="view/user/img/payment/payment-3.png"
								alt=""></a> <a href="#"><img
								src="view/user/img/payment/payment-4.png" alt=""></a> <a
								href="#"><img src="view/user/img/payment/payment-5.png"
								alt=""></a>
						</div>
					</div>
				</div>
				<!-- Phần liên hệ -->
				<div class="col-lg-2 col-md-3 col-sm-5">
					<div class="footer__widget">
						<h6>Chúng Tôi</h6>
						<ul>
							<li><a href="#">Thông tin</a></li>
							<li><a href="#">Liên hệ</a></li>
							<li><a href="#">Phản hồi</a></li>
						</ul>
					</div>
				</div>
				<!-- Phần dịch vụ cho Khách hàng -->
				<div class="col-lg-2 col-md-3 col-sm-4">
					<div class="footer__widget">
						<h6>Tài khoản</h6>
						<ul>
						<c:url var="profile" value="home">
								<c:param name="command" value="VIEW_DETAIL_CUSTOMER" />
							</c:url>
							<li><a href="${profile}">Thông tin</a></li>
							<c:url var="bill" value="home">
								<c:param name="command" value="VIEW_BILL" />
							</c:url>
							<li><a href="${bill}">Lịch sử đặt hàng</a></li>
							<c:url var="viewWish" value="home">
								<c:param name="command" value="VIEW_WISHLIST"></c:param>
							</c:url> 
							<li><a href="${viewWish}">Danh sách yêu thích</a></li>
							<c:url var="carts" value="home">
								<c:param name="command" value="VIEW_CART" />
							</c:url>
							<li><a href="${carts}">Giỏ hàng</a></li>
							<li><c:url var="home" value="home">
									<c:param name="command" value="LOGOUT_CUSTOMER" />
								</c:url> <a href=${home} style="display:<%=displaycart %>;"><b>Đăng xuất</b></a></li>
						</ul>
					</div>
				</div>
				<!-- Hòm thư góp ý -->
				<div class="col-lg-4 col-md-8 col-sm-8">
					<div class="footer__newslatter">
						<h6>Hòm thư góp ý</h6>
						<form action="#">
							<input type="text" placeholder="Nhập email của bạn ... ">
							<button type="submit" class="site-btn">Gửi</button>
						</form>
						<div class="footer__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube-play"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<div class="footer__copyright__text">
						<p>
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							by QuickRental | This project is made with <i class="fa fa-heart"
								aria-hidden="true"></i> by <a href="https://colorlib.com"
								target="_blank">Team 11</a>
						</p>
					</div>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</footer>
	<!-- Kết thúc phần Footer -->

	<!-- Modal để search tên sản phẩm -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input"
					placeholder="Tên sản phẩm muốn tìm.....">
			</form>
		</div>
	</div>
	<!-- Kết thúc modal để search tên sản phẩm -->

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


</body>

</html>