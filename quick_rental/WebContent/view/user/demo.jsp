<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Demo dữ liệu</title>
<link rel="stylesheet" href="assets/css/lib/bootstrap.min.css">
</head>
<body>
	<div>
		<h3 style="text-align: center;" class="mb-3 mt-5">Danh sách người dùng demo</h3>
		<div class="container">
			<div class="row justify-content-md-center">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col">Mã người dùng</th>
							<th scope="col">Họ và tên</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Giới tính</th>
							<th scope="col">Email</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tempUser" items="${LIST_USER}">
							<tr>
								<th scope="row">${tempUser.userCode}</th>
								<td>${tempUser.userName}</td>
								<td>${tempUser.userAddress}</td>
								<td>${tempUser.userPhone}</td>
								<c:choose>
									<c:when test="${tempUser.userGender=='1'}">
										<td>Nam</td>
									</c:when>
									<c:when test="${tempUser.userGender=='0'}">
										<td>Nữ</td>
									</c:when>
								</c:choose>
								<td>${tempUser.userEmail}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>