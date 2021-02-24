<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ashion Template">
<meta name="keywords" content="Ashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Danh sách sản phẩm | QuickRental</title>

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
							<li class="breadcrumb-item"><i class="fa fa-home mr-1"></i>
								<c:url var="home" value="home">
									<c:param name="command" value="LOAD_HOME" />
								</c:url> <a href="${home}" style="color:black;">Trang chủ</a></li>
							<li class="breadcrumb-item" aria-current="page">Cosplay</li>
							<li class="breadcrumb-item" aria-current="page">Cổ phục nam</li>
							<li class="breadcrumb-item" aria-current="page">CPN1</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

	<!-- Phần nội dung chi tiết sản phẩm -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<!-- List hình ảnh demo cho sản phẩm -->
				<div class="col-lg-6">
					<div class="product__details__pic">
						<div
							class="product__details__pic__left product__thumb nice-scroll">
							<a class="pt active" href="#product-1"> <img
								src="${DETAIL.image1}" alt="">
							</a> <a class="pt" href="#product-2"> <img src="${DETAIL.image2}"
								alt="">
							</a> <a class="pt" href="#product-3"> <img src="${DETAIL.image3}"
								alt="">
							</a>
						</div>
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<img data-hash="product-1" class="product__big__img"
									src="${DETAIL.image1}" alt=""> <img data-hash="product-2"
									class="product__big__img" src="${DETAIL.image2}" alt="">
								<img data-hash="product-3" class="product__big__img"
									src="${DETAIL.image3}" alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="product__details__text">
						<!-- Tên sản phẩm -->
						<h3>${DETAIL.prodName}</h3>
						<!-- Rating -->
						<div class="rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <span>( 138 lượt thuê )</span>
						</div>
						<!-- Giá tiền -->
						<div class="product__details__price">${DETAIL.prodPrice}
							<span>420.000</span>
						</div>
						<!-- Số lượng sản phẩm thuê -->
						<div class="product__details__button mb-1">
							<div class="quantity">
								<span>Số lượng:</span>
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
						</div>
						<!-- Số ngày thuê -->
						<div class="product__details__button">
							<div class="quantity">
								<span>Số ngày thuê:</span>
								<div class="pro-qty">
									<input type="text" value="1">
								</div>
							</div>
							<a href="#" class="cart-btn"><span class="icon_bag_alt"></span>Thêm
								vào giỏ</a>
							<ul>
								<li><a href="#"><span class="icon_heart_alt"></span></a></li>
							</ul>
						</div>
						<div class="product__details__widget">
							<ul>
								<li><span>Màu sắc:</span>
									<div class="color__checkbox">
										<label for="red"> <input type="radio"
											name="color__radio" id="red" checked> <span
											class="checkmark"></span>
										</label>
									</div></li>
								<li><span>Cỡ:</span>
									<div class="size__btn">
										<label for="xs-btn" class="active"> <input
											type="radio" id="xs-btn"> FREE SIZE
										</label>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Phần thông tin thêm -->
				<div class="col-lg-12">
					<div class="product__details__tab">
						<!-- Tiêu đề các tab -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab">Mô tả</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab">Bảng giá thuê</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab">Đánh giá <span class="ml-1">(
										2 )</span></a></li>
						</ul>
						<!-- Nội dung các tab -->
						<div class="tab-content">
							<!-- Tab Mô tả -->
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<h6>Mô tả</h6>
								<p>${DETAIL.prodDescription}</p>
							</div>
							<!-- Tab Bảng giá -->
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<h6>Bảng giá thuê</h6>
								<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
									aut odit aut loret fugit, sed quia consequuntur magni dolores
									eos qui ratione voluptatem sequi nesciunt loret. Neque porro
									lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim
									ipsam voluptatem quia voluptas sit aspernatur aut odit aut
									loret fugit, sed quia ipsu consequuntur magni dolores eos qui
									ratione voluptatem sequi nesciunt. Nulla consequat massa quis
									enim.</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem.</p>
							</div>
							<!-- Tab đánh giá -->
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<h6>Đánh giá</h6>
								<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur
									aut odit aut loret fugit, sed quia consequuntur magni dolores
									eos qui ratione voluptatem sequi nesciunt loret. Neque porro
									lorem quisquam est, qui dolorem ipsum quia dolor si. Nemo enim
									ipsam voluptatem quia voluptas sit aspernatur aut odit aut
									loret fugit, sed quia ipsu consequuntur magni dolores eos qui
									ratione voluptatem sequi nesciunt. Nulla consequat massa quis
									enim.</p>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Danh sách sản phẩm liên quan -->
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="related__title">
						<h5>Sản phẩm liên quan</h5>
					</div>
				</div>
				<c:forEach var="tempPro" items="${RELATED}">
					<c:url var="details" value="home">
						<c:param name="command" value="VIEW_DETAIL_PRODUCT" />
						<c:param name="id-productdetail" value="${tempPro.prodId}" />
					</c:url>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">

							<div class="product__item__pic set-bg"
								data-setbg="${tempPro.image1}">
								<div class="label new">New</div>
								<ul class="product__hover">
									<li><a href="${tempPro.image1}" class="image-popup"><span
											class="arrow_expand"></span></a></li>
									<li><a href="#"><span class="icon_heart_alt"></span></a></li>
									<li><a href="#"><span class="icon_bag_alt"></span></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="${details }">${tempPro.prodName}</a>
								</h6>
								<div class="rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="product__price">${tempPro.prodPrice}</div>
							</div>

						</div>
					</div>
				</c:forEach>
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
						data-setbg="view/user/img/instagram/insta-1.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="view/user/img/instagram/insta-2.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="view/user/img/instagram/insta-3.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="view/user/img/instagram/insta-4.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="view/user/img/instagram/insta-5.jpg">
						<div class="instagram__text">
							<i class="fa fa-instagram"></i> <a href="#">@ ashion_shop</a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 col-sm-4 p-0">
					<div class="instagram__item set-bg"
						data-setbg="view/user/img/instagram/insta-6.jpg">
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
		<script src="view/user/js/add-product.js"></script>

</body>

</html>