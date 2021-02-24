<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Register</title>
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
					<input type="hidden" name="command" value="INSERT" />
					<h3>Đăng kí</h3>
					<!-- Input tên -->
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
						<input type="text" class="form-control" placeholder="Firstname" name="firstname">
						<!-- Xác thực -->
						<div id="invalid00" class="invalid-feedback">
							This field is required!
						</div>
					</div>
					<div class="form-holder">
						<span class="lnr lnr-user"></span>
						<input type="text" class="form-control" placeholder="Lastname" name="lastname">
						<!-- Xác thực -->
						<div id="invalid00" class="invalid-feedback">
							This field is required!
						</div>
					</div>
					<!-- Input số điện thoại -->
					<div class="form-holder">
						<span class="lnr lnr-phone-handset"></span>
						<input type="text" class="form-control" placeholder="Phone Number" name="phone_number">
						<!-- Xác thực -->
						<div id="invalid01" class="invalid-feedback">
							This field is required!
						</div>
						<div id="invalid11" class="invalid-feedback">
							Invalid phone number, please enter 9 full numbers!
						</div>
					</div>

					<!-- Input Địa chỉ -->
					<div class="form-holder">
						<span class="lnr lnr-apartment"></span>
						<input type="text" class="form-control" placeholder="Address" name="address" />
						<!-- Xác thực -->
						<div id="invalid01" class="invalid-feedback">
							This field is required!
						</div>
					</div>


					<!-- Input địa chỉ email -->
					<div class="form-holder">
						<span class="lnr lnr-envelope"></span>
						<input type="text" class="form-control" placeholder="Mail" name="email">
						<!-- Xác thực -->
						<div id="invalid02" class="invalid-feedback">
							This field is required!
						</div>
						<div id="invalid12" class="invalid-feedback">
							Invalid email! Ex: email@example.com.
						</div>
					</div>


					<!-- input mật khẩu -->
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
						<input type="password" class="form-control" placeholder="Password" name="password">
						<!-- Xác thực -->
						<div id="invalid03" class="invalid-feedback">
							This field is required!
						</div>
						<div id="invalid13" class="invalid-feedback">
							Should contain at least one digit, upper case and 8 from the mentioned characters!
						</div>
					</div>
					<!-- Input xác nhận mật khẩu -->
					<div class="form-holder">
						<span class="lnr lnr-lock"></span>
						<input type="password" class="form-control" placeholder="Confirm Password" name="confirm-pass">
						<!-- Xác thực -->
						<div id="invalid04" class="invalid-feedback">
							This field is required!
						</div>
						<div id="invalid14" class="invalid-feedback">
							Invalid confirm password, please enter again!
						</div>
					</div>
					<!-- Nút submit -->
					<button id="submit-button">
						<span>Submit</span>
					</button>
				</form>
				<!-- End form -->
				<img src="view/user/img/gift.png" alt="" class="image-2">
			</div>
		</div>
		
		<!-- Script -->
		<script src="view/user/js/jquery-3.3.1.min.js"></script>
		<script src="view/user/js/main.js"></script>
	</body>
</html>