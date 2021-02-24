<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- saved from url=(0051)# -->
<html lang="zxx"><div id="translate-button" style="background-color: white; display: none;"><img src="data:image/png;base64,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"></div><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="description" content="Ashion Template">
    <meta name="keywords" content="Ashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sản phẩm | QuickRental</title>

    <!-- Google Font -->
    <link href="./Ashion _ Template_files/css2" rel="stylesheet">
    <link href="./Ashion _ Template_files/css2(1)" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
</head>

<body>
    <!-- Phần login/register, dịch vụ khách hàng -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__close">+</div>
        <ul class="offcanvas__widget">
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
                    <div class="tip">2</div>
                </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
                    <div class="tip">2</div>
                </a></li>
        </ul>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__auth">
            <a href="#">Login</a>
            <a href="#">Register</a>
        </div>
    </div>
    <!-- Kết thúc phần login/register, dịch vụ khách hàng -->

    <!-- Phần header -->
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <!-- Chữ logo -->
                <div class="col-xl-2 col-lg-2">
                    <div class="header__logo text-center">
                        <a href="./index.html"
                            style="font-family: 'Kaushan Script', cursive; font-size: 32px; color: black; font-weight: 900;">QuickRental</a>
                    </div>
                </div>
                <!-- Danh sách các danh mục -->
                <div class="col-xl-7 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                            <li class="active">
                                <a href="./index.html">Danh mục</a>
                                <ul class="dropdown">
                                    <li><a href="./">Thiết bị Quay phim - Chụp ảnh</a></li>
                                    <li><a href="./">Cosplay - Hóa trang</a></li>
                                    <li><a href="./">Phụ kiện</a></li>
                                    <li><a href="./">Blog Details</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Cosplay</a>
                                <ul class="dropdown">
                                    <li><a href="./">Cổ trang nam</a></li>
                                    <li><a href="./">Cổ trang nữ</a></li>
                                    <li><a href="./">Hán phục nam</a></li>
                                    <li><a href="./">Hán phục nữ</a></li>
                                    <li><a href="./">Anh hùng</a></li>
                                    <li><a href="./">Công chúa</a></li>
                                    <li><a href="./">Anime</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Truyền thống</a>
                                <ul class="dropdown">
                                    <li><a href="./">Hàn Quốc</a></li>
                                    <li><a href="./">Trung Quốc</a></li>
                                    <li><a href="./">Ấn Độ</a></li>
                                    <li><a href="./">Nhật Bản</a></li>
                                    <li><a href="./">Anh</a></li>
                                    <li><a href="./">Việt Nam</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="./shop.html">Mùa - Lễ hội</a>
                                <ul class="dropdown">
                                    <li><a href="./">Mùa xuân - Tết</a></li>
                                    <li><a href="./">Mùa hè</a></li>
                                    <li><a href="./">Mùa thu - Trung thu</a></li>
                                    <li><a href="./">Mùa đông - Noel</a></li>
                                    <li><a href="./">Halloween</a></li>
                                    <li><a href="./">Tất niên - Tổng kết</a></li>
                                    <li><a href="./">Gala - Party</a></li>
                                    <li><a href="./">8/3</a></li>
                                    <li><a href="./">1/6</a></li>
                                    <li><a href="./">20/11</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Phụ kiện - Đạo cụ</a>
                                <ul class="dropdown">
                                    <li><a href="./product-details.html">Tóc giả</a></li>
                                    <li><a href="./product-details.html">Kính - Kính áp tròng</a></li>
                                    <li><a href="./product-details.html">Vũ khí đạo cụ</a></li>
                                    <li><a href="./shop-cart.html">Giày dép guốc</a></li>
                                    <li><a href="./checkout.html">Nón - Mão - Vương</a></li>
                                    <li><a href="./blog-details.html">Phụ kiện cổ trang</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right" style="padding-right: 30px;">
                        <!-- <div class="header__right__auth">
                            <a href="#">Đăng ký</a>
                            <a href="#">Đăng nhập</a>
                        </div> -->
                        <ul class="header__right__widget">
                            <!-- Icon search -->
                            <li><span class="icon_search search-switch"></span></li>
                            <!-- Phần dịch vụ Khách hàng -->
                            <!-- Icon danh sách sản phẩm yêu thích -->
                            <li><a href="#"><span class="icon_heart_alt"></span>
                                    <div class="tip">2</div>
                                </a></li>
                                <!-- Icon giỏ hàng -->
                            <li><a href="./product-details.html"><span class="icon_bag_alt"></span>
                                    <div class="tip">2</div>
                                </a></li>
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

    <!-- Phần đường dẫn trang -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb" style="font-size: 15px">
                            <li class="breadcrumb-item"><i class="fa fa-home mr-1"></i>Trang chủ</li>
                            <li class="breadcrumb-item" aria-current="page">Cosplay</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!--  -->

    <!-- Danh sách sản phẩm theo loại -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="section-title">
                        <h4>Cosplay</h4>
                    </div>
                </div>
            </div>
            <div class="row property__gallery" id="MixItUp6E241F">
            	<c:forEach var="tempPro" items="${LIST_PRODUCT}">
            		<c:url var="details" value="StudentControllerServlet">
						<c:param name="command" value="VIEW_DETAIL_PRODUCT" />
						<c:param name="id-productdetail" value="${tempPro.prodId}" />
					</c:url>
	                <div class="col-lg-3 col-md-4 col-sm-6 mix ${tempPro.itemId}">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${tempPro.image1}" style="background-image: url(&quot;${tempPro.image1}&quot;);">
	                            <div class="label new">New</div>
	                            <ul class="product__hover">
	                                <li><a href="${tempPro.image1}" class="image-popup"><span class="arrow_expand"></span></a></li>
	                                <li><a href="##"><span class="icon_heart_alt"></span></a></li>
	                                <li><a href="##"><span class="icon_bag_alt"></span></a></li>
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
	                            <div class="product__price">${tempPro.prodPrice} </div>
	                        </div>
	                    </div>
	                </div>
	           	</c:forEach>
                <div class="col-lg-12 text-center">
                    <div class="pagination__option">
                        <a href="list.html">1</a>
                        <a href="list.html">2</a>
                        <a href="list.html">3</a>
                        <a href="list.html"><i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

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
                        <p>QuickRental luôn cố gắng đem đến trải nghiệm tốt nhất đến với các bạn!</p>
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
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <div class="footer__copyright__text">
                        <p>Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> by QuickRental | This
                            project is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                                href="https://colorlib.com" target="_blank">Team 11</a></p>
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
                <input type="text" id="search-input" placeholder="Tên sản phẩm muốn tìm.....">
            </form>
        </div>
    </div>
    <!-- Kết thúc modal để search tên sản phẩm -->
</body>
	<script src="view/user/js/add-product.js"></script>
</html>