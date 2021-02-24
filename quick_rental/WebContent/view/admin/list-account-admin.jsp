<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h1 class="h3 mb-0 text-gray-800">Quản lý tài khoản Admin</h1>
						<a href="#" class="btn btn-primary btn-icon-split"> <span
							class="icon text-white-50"> <i class="fas fa-plus-circle"></i>
						</span> <span class="text" data-toggle="modal" data-target="#addAccount">Thêm
								tài khoản</span>
						</a>
					</div>
					<!-- Modal thêm tài khoản mới -->
					<div class="modal fade" id="addAccount" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title">Thêm tài khoản quản lý mới</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<div class="modal-body">
									<div class="row">
										<div class="col-xl-12 order-xl-1">
											<div>
												<form id="form-add-prod">
													<div class="row">
														<!-- Mã qủan lý -->

														<div class="col-lg-6">
															<div class="form-group focused">
																<label class="form-control-label" for="input-prodname">Mã
																	quản lý <span style="color: red;">(*)</span>
																</label> <input type="text" id="input-prodname"
																	class="form-control form-control-alternative" value=""
																	name="codeAdmin">
															</div>
														</div>
														<!-- Tên quản lý -->
														<div class="col-lg-6">
															<div class="form-group">
																<label class="form-control-label" for="input-prodcode">Tên
																	quản lý <span style="color: red;">(*)</span>
																</label> <input type="text" id="input-prodcode"
																	class="form-control form-control-alternative"
																	name="nameAdmin">
															</div>
														</div>
													</div>
													<div class="row">
														<!-- Tài khoản -->

														<div class="col-lg-6">
															<div class="form-group focused">
																<label class="form-control-label" for="input-prodname">Tài
																	khoản <span style="color: red;">(*)</span>
																</label> <input type="email" id="input-prodname"
																	class="form-control form-control-alternative" value=""
																	name="accountAdmin">
															</div>
														</div>
														<!-- Mật khẩu -->
														<div class="col-lg-6">
															<div class="form-group">
																<label class="form-control-label" for="input-prodcode">Mật
																	khẩu <span style="color: red;">(*)</span>
																</label> <input type="password" id="input-prodcode"
																	class="form-control form-control-alternative"
																	name="passAdmin">
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- Thêm mới -->
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="add-button"
										data-dismiss="modal">Tạo mới</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Kết thúc modal -->
					<!-- Phần bảng dữ liệu demo -->
					<div>
						<div id="layoutSidenav_content">
							<main>
								<div>
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-th-list mr-1"></i> Danh sách tài khoản quản
											trị
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<th>Mã admin</th>
															<th>Tên admin</th>
															<th>Email</th>
															<th></th>
														</tr>
													</thead>
													<tfoot>
														<tr>
															<th>Mã admin</th>
															<th>Tên admin</th>
															<th>Email</th>
															<th></th>
														</tr>
													</tfoot>
													<c:forEach var="tempAdmin" items="${LIST_ADMIN}">
														<tr>
															<td>${tempAdmin.adminCode}</td>
															<td>${tempAdmin.adminName}</td>
															<td>${tempAdmin.adminAccount}</td>
															<c:url var="tempLinkDeleteAdmin" value="admin">
																<c:param name="command" value="DELETE_ACCOUNT_ADMIN"></c:param>
																<c:param name="adminId" value="${tempAdmin.adminId}"></c:param>
															</c:url>
															<td style="width: 190px"><a
																href="${tempLinkDeleteAdmin}" class="btn btn-danger"
																onclick="if(!(confirm('Bạn có chắc chắn muốn xóa tài khoản này?'))) return false"><i
																	class="fas fa-trash mr-1"></i>Xóa</a> <a href=""
																class="btn btn-warning" data-toggle="modal"
																data-target="#admin-${tempAdmin.adminId}"><i
																	class="fas fa-edit mr-1"></i>Cập nhật</a></td>

															<!-- Modal thêm tài khoản mới -->
															<div class="modal fade" id="admin-${tempAdmin.adminId}"
																tabindex="-1" role="dialog"
																aria-labelledby="exampleModalLabel" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<!-- Modal Header -->
																		<div class="modal-header">
																			<h4 class="modal-title">Cập nhật tài khoản</h4>
																			<button type="button" class="close"
																				data-dismiss="modal">&times;</button>
																		</div>

																		<div class="modal-body">
																			<div class="row">
																				<div class="col-xl-12 order-xl-1">
																					<div>
																						<form id="form-add-prod">
																							<div class="row">
																								<!-- Mã qủan lý -->

																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-prodname">Mã quản lý <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-prodname"
																											class="form-control form-control-alternative"
																											value="${tempAdmin.adminCode}"
																											name="codeAdmin">
																									</div>
																								</div>
																								<!-- Tên quản lý -->
																								<div class="col-lg-6">
																									<div class="form-group">
																										<label class="form-control-label"
																											for="input-prodcode">Tên quản lý <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-prodcode"
																											class="form-control form-control-alternative"
																											name="nameAdmin"
																											value="${tempAdmin.adminName}">
																									</div>
																								</div>
																							</div>
																							<div class="row">
																								<!-- Tài khoản -->

																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-prodname">Tài khoản <span
																											style="color: red;">(*)</span>
																										</label> <input type="email" id="input-prodname"
																											class="form-control form-control-alternative"
																											value="${tempAdmin.adminAccount}"
																											name="accountAdmin">
																									</div>
																								</div>
																								<!-- Mật khẩu -->
																								<div class="col-lg-6">
																									<div class="form-group">
																										<label class="form-control-label"
																											for="input-prodcode">Mật khẩu <span
																											style="color: red;">(*)</span>
																										</label> <input type="password" id="input-prodcode"
																											class="form-control form-control-alternative"
																											name="passAdmin" value="${tempAdmin.adminPass}">
																									</div>
																								</div>
																							</div>
																						</form>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-- Thêm mới -->
																		<div class="modal-footer">
																			<button type="button" class="btn btn-warning"
																				id="add-button" data-dismiss="modal">Cập nhật</button>
																		</div>
																	</div>
																</div>
															</div>
															<!-- Kết thúc modal -->
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