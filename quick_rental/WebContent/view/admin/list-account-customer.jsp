<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Tài khoản | Admin</title>
<!-- Custom fonts for this template -->
<link href="view/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="view/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="view/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body id="page-top">
	<!-- Nội dung trang -->
	<div id="wrapper">

		<!-- Phần Sidebar -->
		<jsp:include page="sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Phần header -->
				<jsp:include page="header.jsp" />
				<!-- Kết thúc header -->

				<!-- Nội dung trang -->
				<div class="container-fluid">
					<!-- Tiêu đề thống kê -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Quản lý tài khoản Khách
							hàng</h1>
						<!-- <a href="#" class="btn btn-primary btn-icon-split"> <span
							class="icon text-white-50"> <i class="fas fa-plus-circle"></i>
						</span> <span class="text">Thêm tài khoản</span>
						</a>  -->
					</div>
					<!-- Phần bảng dữ liệu demo -->
					<div>
						<div id="layoutSidenav_content">
							<main>
								<div>
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-th-list mr-1"></i> Danh sách tài khoản Khách
											hàng
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<th>Mã khách hàng</th>
															<th>Tên khách hàng</th>
															<th>Email</th>
															<th>Địa chỉ</th>
															<th>Ngày sinh</th>
															<th>Giới tính</th>
															<th>Số điện thoại</th>
															<th>Tên ngân hàng</th>
															<th>Số tài khoản</th>
															<th></th>
														</tr>
													</thead>
													<tfoot>
														<tr>
															<th>Mã khách hàng</th>
															<th>Tên khách hàng</th>
															<th>Email</th>
															<th>Địa chỉ</th>
															<th>Ngày sinh</th>
															<th>Giới tính</th>
															<th>Số điện thoại</th>
															<th>Tên ngân hàng</th>
															<th>Số tài khoản</th>
															<th></th>
														</tr>
													</tfoot>
													<c:forEach var="tempCus" items="${LIST_CUS}">
														<tr>
															<td>${tempCus.customer.customerCode}</td>
															<td>${tempCus.customer.firstName}<span class="ml-1">${tempCus.customer.lastName}</span></td>
															<td>${tempCus.customer.email}</td>
															<td>${tempCus.customer.address}</td>
															<td>${tempCus.customer.birthday}</td>
															<c:choose>
																<c:when test="${tempCus.customer.gender=='1'}">
																	<td>Nữ</td>
																</c:when>
																<c:when test="${tempCus.customer.gender=='2'}">
																	<td>Nam</td>
																</c:when>
																<c:when test="${tempCus.customer.gender=='3'}">
																	<td>Khác</td>
																</c:when>
															</c:choose>
															<td>${tempCus.customer.phoneNumber}</td>
															<th>${tempCus.bankName}</th>
															<td>${tempCus.customer.bankCodeAccount}</td>
															<c:url var="tempLinkDeleteCus" value="admin">
																<c:param name="command" value="DELETE_ACCOUNT_CUS"></c:param>
																<c:param name="customerId"
																	value="${tempCus.customer.customerId}"></c:param>
															</c:url>
															<td style="width: 73px"><a
																href="${tempLinkDeleteCus}" class="btn btn-danger"
																onclick="if(!(confirm('Bạn có chắc chắn muốn xóa tài khoản này?'))) return false"><i
																	class="fas fa-trash mr-1"></i>Xóa</a></td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
							</main>

						</div>
					</div>

				</div>
				<!--  -->

			</div>
			<!--  -->


		</div>
		<!--  -->

	</div>
	<!-- Kế thúc nội dung trang -->

	<!-- Nút Scoll lên đầu-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn có chắc
						chắn muốn đăng xuất?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><i class="fas fa-times"></i></span>
					</button>
				</div>
				<div class="modal-body">Chọn "Đăng xuất" bên dưới nếu bạn chắc
					chắn muốn thoát khỏi phiên đăng nhập.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Hủy</button>
					<c:url var="logoutAdmin" value="admin">
						<c:param name="command" value="LOGOUT_ADMIN"></c:param>
					</c:url>
					<a class="btn btn-primary" href="${logoutAdmin}">Đăng xuất</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="view/admin/vendor/jquery/jquery.min.js"></script>
	<script src="view/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="view/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="view/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="view/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="view/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="view/admin/js/demo/datatables-demo.js"></script>
</body>
</html>