<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%><!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Danh Sách Yêu Thích| QuickRental</title>

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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Phần loader dữ liệu -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp" />
	<!-- Phần đường dẫn trang -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb" style="font-size: 15px">
							<li class="breadcrumb-item"><i class="fa fa-home mr-1"></i>Trang
								chủ</li>
							<li class="breadcrumb-item" aria-current="page">Khách hàng</li>
							<li class="breadcrumb-item" aria-current="page">Danh sách yêu thích</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

	<!-- Nội dung giỏ hàng -->
	<section class="shop-cart spad">
		<div class="container">
				<div class="row">
				
					<div class="col-lg-12">
					<div class="shop__cart__table">
						<table>
							<thead>
								<tr>
									<th>Hình Ảnh</th>
									<th>Tên Sản phẩm</th>
									<th>Giá Thuê/Ngày</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								
						
								<c:forEach var="tempPro" items="${CURWISHLIST}">
									
									
									<tr>
										<td class="cart__product__item" style="width:200px;height:100%; display: flex; align-items: center;"><img
											style="max-width:100% !important;"src="${tempPro.image1}" alt="">
										</td>
										<td> <div class="cart__product__item__title">
											<h6>${tempPro.prodName}</h6>
											<div class="rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div></td>
										<td class="cart__price">${tempPro.prodPrice}</td>
										<td class="cart__detail">
											<c:url var="detail" value="home">
												<c:param name="command" value="VIEW_DETAIL_PRODUCT" />
												<c:param name="id-productdetail" value="${tempPro.prodId}" />
											</c:url>
											<a href="${detail}"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M4 7a1 1 0 100-2 1 1 0 000 2zm4.75-1.5a.75.75 0 000 1.5h11.5a.75.75 0 000-1.5H8.75zm0 6a.75.75 0 000 1.5h11.5a.75.75 0 000-1.5H8.75zm0 6a.75.75 0 000 1.5h11.5a.75.75 0 000-1.5H8.75zM5 12a1 1 0 11-2 0 1 1 0 012 0zm-1 7a1 1 0 100-2 1 1 0 000 2z"></path></svg>
											</a></td>
										<td class="cart__close">
										<c:url var="deletewish" value="home">
											<c:param name="command" value="DELETE_WISHLIST" />
											<c:param name="product_id" value="${tempPro.prodId}" />
										</c:url>
										<a href="${deletewish}"><span class="icon_close">  </span></a></td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				</div>
				
		</div>
	</section>
	<!--  -->

	<!-- Phần bộ sưu tập -->
	<div class="instagram">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-1.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-2.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-3.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-4.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-5.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="img/instagram/insta-6.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Kết thúc phần bộ sưu tập -->

	<!-- Phần Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-7">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="./index.html"
								style="font-family: 'Kaushan Script', cursive; font-size: 35px; color: black; font-weight: 900;">QuickRental</a>
						</div>
						<p>QuickRental luôn cố gắng đem đến trải nghiệm tốt nhất đến
							với các bạn!</p>
						<div class="footer__payment">
							<a href="#"><img src="img/payment/payment-1.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-2.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-3.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-4.png" alt=""></a>
							<a href="#"><img src="img/payment/payment-5.png" alt=""></a>
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
							<li><a href="#">Thông tin</a></li>
							<li><a href="#">Lịch sử đặt hàng</a></li>
							<li><a href="#">Danh sách yêu thích</a></li>
							<li><a href="#">Giỏ hàng</a></li>
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/main.js"></script>

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
	<script src="view/user/js/add-product.js"></script>
	<script src="view/user/js/updatecart.js"></script>
	<option value="3">Shop chưa hoàn tiền</option>
	

</body>

</html>