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
</head>

<body>
	<!-- Phần loader dữ liệu -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="header.jsp" />
 <!-- Các banner quảng cáo -->
    <section class="categories">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 p-0">
                    <div class="categories__item categories__large__item set-bg"
                        data-setbg="view/user/img/categories/category-1.jpg">
                        <div class="categories__text">
                            <h1>Women’s fashion</h1>
                            <p>Sitamet, consectetur adipiscing elit, sed do eiusmod tempor incidid-unt labore
                                edolore magna aliquapendisse ultrices gravida.</p>
                            <a href="#">Thuê ngay</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                            <div class="categories__item set-bg" data-setbg="view/user/img/categories/category-2.jpg">
                                <div class="categories__text">
                                    <h4>Men’s fashion</h4>
                                    <p>358 sản phẩm</p>
                                    <a href="#">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                            <div class="categories__item set-bg" data-setbg="view/user/img/categories/category-3.jpg">
                                <div class="categories__text">
                                    <h4>Kid’s fashion</h4>
                                    <p>273 sản phẩm</p>
                                    <a href="#">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                            <div class="categories__item set-bg" data-setbg="view/user/img/categories/category-4.jpg">
                                <div class="categories__text">
                                    <h4>Cosmetics</h4>
                                    <p>159 sản phẩm</p>
                                    <a href="#">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 p-0">
                            <div class="categories__item set-bg" data-setbg="view/user/img/categories/category-5.jpg">
                                <div class="categories__text">
                                    <h4>Accessories</h4>
                                    <p>792 sản phẩm</p>
                                    <a href="#">Thuê ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Kết thúc các banner quảng cáo -->

    <!-- Danh sách các sán phẩm mới -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="section-title">
                        <h4>Sản phẩm mới</h4>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Tất cả</li>
                        <li data-filter=".1">Cosplay</li>
                        <li data-filter=".2">Truyền thống</li>
                        <li data-filter=".3">Mùa - Lễ hội</li>
                        <li data-filter=".4">Phụ kiện - Đạo cụ</li>
                    </ul>
                </div>
            </div>
            
            <div class="row property__gallery">
            	<c:forEach var="tempPro" items="${NEW_PRODUCTS}">
            		<c:url var="details" value="home">
						<c:param name="command" value="VIEW_DETAIL_PRODUCT" />
						<c:param name="id-productdetail" value="${tempPro.prodId}" />
					</c:url>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix ${tempPro.itemId}">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${tempPro.image1}">
	                            <div class="label new">Mới</div>
	                            <ul class="product__hover">
	                                <li><a href="${tempPro.image1}" class="image-popup"><span
	                                            class="arrow_expand"></span></a></li>
	                                <li><a style= "width:50px; height:50px;" class="localclick1" data-idproduct="${tempPro.prodId}"><span class="icon_heart_alt"></span></a></li>
	                                <li><a style= "width:50px; height:50px;" class="localclick" data-idproduct="${tempPro.prodId}"><span class="icon_bag_alt" ></span></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="${details}">${tempPro.prodName}</a></h6>
	                            <div class="rating">
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                            </div>
	                            <div class="product__price">${tempPro.prodPrice}</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Kết thúc danh sách các sán phẩm mới -->

    <!-- Phần carousel quảng cáo -->
    <section class="banner set-bg" data-setbg="view/user/img/banner/banner-1.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-8 m-auto">
                    <div class="banner__slider owl-carousel">
                        <div class="banner__item">
                            <div class="banner__text">
                                <span>Bộ Sưu Tập Cosplay</span>
                                <h1>Anime - Anh Hùng</h1>
                                <a href="#">Thuê ngay</a>
                            </div>
                        </div>
                        <div class="banner__item">
                            <div class="banner__text">
                                <span>Trang Phục Truyền Thống</span>
                                <h1>Nhật - Hàn</h1>
                                <a href="#">Thuê ngay</a>
                            </div>
                        </div>
                        <div class="banner__item">
                            <div class="banner__text">
                                <span>Bộ Sưu Tập Lễ Hội</span>
                                <h1>Noel - Halloween</h1>
                                <a href="#">Thuê ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Kết thúc phần carousel quảng cáo -->

    <!-- Bảng trend sản phẩm -->
    <section class="trend spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="trend__content">
                        <div class="section-title">
                            <h4>Hot</h4>
                        </div>
                        <c:forEach var="tempPro" items="${HOT_PRODUCTS}">
                        	<div class="trend__item">                        
	                            <div class="trend__item__pic">
	                                <img src="${tempPro.image1}" alt="" style="height: 90px; width: 90px; max-width: 100%;">
	                            </div>
	                            <div class="trend__item__text">
	                                <h6>${tempPro.prodName}</h6>
	                                <div class="rating">
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                </div>
	                                <div class="product__price">${tempPro.prodPrice}</div>
	                            </div>
	                        </div>
                       	</c:forEach>         
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="trend__content">
                        <div class="section-title">
                            <h4>Giảm giá mạnh</h4>
                        </div>
                        <c:forEach var="tempPro" items="${SALE_PRODUCT}">
                        	<div class="trend__item">                            
	                             <div class="trend__item__pic">
	                                <img src="${tempPro.image1}" alt="" style="height: 90px; width: 90px; max-width: 100%;">
	                            </div>
	                            <div class="trend__item__text">
	                                <h6>${tempPro.prodName}</h6>
	                                <div class="rating">
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                </div>
	                                <div class="product__price">${tempPro.prodPrice}</div>
	                            </div>
	                         </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="trend__content">
                        <div class="section-title">
                            <h4>Xu hướng</h4>
                        </div>
                        <c:forEach var="tempPro" items="${TREND}">
                        	<div class="trend__item">                        	
	                             <div class="trend__item__pic">
	                                <img src="${tempPro.image1}" alt="" style="height: 90px; width: 90px; max-width: 100%;">
	                            </div>
	                            <div class="trend__item__text">
	                                <h6>${tempPro.prodName}</h6>
	                                <div class="rating">
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                    <i class="fa fa-star"></i>
	                                </div>
	                                <div class="product__price">${tempPro.prodPrice}</div>
	                            </div>                    
                       		 </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Kết thúc bảng trend sản phẩm -->

    <!-- Dịch vụ -->
    <section class="services spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <i class="fa fa-car"></i>
                        <h6>Giao hàng nhanh</h6>
                        <p>Giao hàng trong nội thành</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <i class="fa fa-money"></i>
                        <h6>Tiết kiệm tiền</h6>
                        <p>Cung cấp mặt hàng giá cả hợp lý nhất</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="services__item">
                        <i class="fa fa-support"></i>
                        <h6>Hỗ trợ 24/7</h6>
                        <p>Hỗ trợ khách hàng online mọi lúc</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Kết thúc phần dịch vụ -->

    <!-- Phần bộ sưu tập -->
    <div class="instagram">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-1.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-2.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-3.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-4.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-5.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-4 p-0">
                    <div class="instagram__item set-bg" data-setbg="view/user/img/instagram/insta-6.jpg">
                        <div class="instagram__text">
                            <i class="fa fa-instagram"></i>
                            <a href="#">@ ashion_shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Kết thúc phần bộ sưu tập -->
	<jsp:include page="footer.jsp" />

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
	</script>

	<script src="view/user/js/add-product.js"></script>

</body>

</html>