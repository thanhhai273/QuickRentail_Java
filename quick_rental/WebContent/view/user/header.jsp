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

	<!-- Phần header -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<!-- Chữ logo -->
				<div class="col-xl-2 col-lg-2">
					<div class="header__logo text-center">
						<c:url var="home" value="home">
							<c:param name="command" value="LOAD_HOME" />
						</c:url>
						<a href="${home}"
							style="font-family: 'Kaushan Script', cursive; font-size: 32px; color: black; font-weight: 900;">QuickRental</a>
					</div>
				</div>
				<!-- Danh sách các danh mục -->
				<div class="col-xl-7 col-lg-7">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.html">Danh mục</a>
								<ul class="dropdown">
									<c:forEach var="tempItem" items="${NAV_BAR}">
										<li><a href="./">${tempItem.itemName}</a></li>
									</c:forEach>
								</ul></li>
							<c:forEach var="tempItem" items="${NAV_BAR}">
								<li><a href="#">${tempItem.itemName}</a>
									<ul class="dropdown">
										<c:forEach var="tempcate" items="${tempItem.cates}">
											<li><a href="./">${tempcate.cateName}</a></li>
										</c:forEach>
									</ul></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__right" style="display: <%=displaylogin%>;">
						<div class="header__right__auth" style="padding-right: 30px;">
							<c:url var="logins" value="home">
								<c:param name="command" value="LOGIN_CUSTOMER" />
							</c:url>
							<c:url var="register" value="home">
								<c:param name="command" value="REGISTER_CUSTOMER" />
							</c:url>
							<a href="${register}">Đăng ký</a> <a href="${logins}">Đăng
								nhập</a>
						</div>
						<ul class="header__right__widget">
							<!-- Icon search -->
							<li><span class="icon_search search-switch"></span></li>
						</ul>
					</div>

					<div class="header__right" style="display: <%=displaycart%>;">
						<ul class="header__right__widget">
							<!-- Icon search -->
							<li><span class="icon_search search-switch"></span></li>
							<!-- Phần dịch vụ Khách hàng -->
							<!-- Icon danh sách sản phẩm yêu thích -->
							<li><c:url var="viewWish" value="home">
									<c:param name="command" value="VIEW_WISHLIST"></c:param>
								</c:url> 
								<a href="${viewWish}"><span class="icon_heart_alt"></span>
									<div class="tip" id="yeuthich"></div> </a></li>
							<!-- Icon giỏ hàng -->
							<li><c:url var="viewTest" value="home">
									<c:param name="command" value="VIEW_CART"></c:param>
								</c:url> <a href="${viewTest}"><span class="icon_bag_alt"></span>
									<div class="tip" id="gio-hang"></div> </a></li>

						</ul>
					</div>


				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Kết thúc phần Header -->
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

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

</body>

</html>