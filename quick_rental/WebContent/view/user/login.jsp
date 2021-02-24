<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Icon -->
		<link rel="stylesheet" href="view/user/fonts/linearicons/style.css">
		
		<!-- Style css -->
		<link rel="stylesheet" href="view/user/css/bootstrap.min.css">
		<link rel="stylesheet" href="view/user/css/style.css">
		
	</head>

	<body>
		<div class="wrapper">
			<div class="inner">
				<div class="img"><img src="view/user/img/santa2.png" alt="" class="image-1"></div>
				<img src="view/user/img/santa_1.png" alt="" class="image-3">
				<!-- Form submit -->
				<form id="form-register" action="home" method="POST">
					<input type="hidden" name="command" value="CHECK_LOGIN" />
					<h3>Đăng nhập</h3>
					<!-- Input tên -->
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
						<input type="text" class="form-control" placeholder="Email" name="email">
						<!-- Xác thực -->
						<div id="invalid00" class="invalid-feedback">
                            The account that you've entered doesn't match any account. 
                            <a href="index.html">up for an account.</a> 
						</div>
					</div>
					<br>
					<!-- input mật khẩu -->
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
						<input type="password" class="form-control" placeholder="Mật khẩu" name="password">
						<div id="invalid03" class="invalid-feedback">
							Enter your password
						</div>
					</div>
					<!-- Nút submit -->
					<button id="submit-button">
						<span>Login</span>
					</button>
				</form>
				<!-- End form -->
				<img src="view/user/img/gift.png" alt="" class="image-2">
			</div>
		</div>
		
		<!-- Script -->
		<script src="view/user/js/jquery-3.3.1.min.js"></script>
		<script src="view/user/js/login.js"></script>
	</body>
</html>