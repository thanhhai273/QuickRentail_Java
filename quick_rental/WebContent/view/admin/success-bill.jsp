<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Hóa đơn | Admin</title>
<!-- Custom fonts for this template -->
<link href="view/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this page -->
<link href="view/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link href="view/admin/css/sb-admin-2.min.css" rel="stylesheet">


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
						<h1 class="h3 mb-0 text-gray-800">Danh sách hóa đơn thành
							công</h1>
						<div class="d-sm-flex">
							<div class="d-sm-flex align-items-center mr-4">
								<div style="width: 85px;">Trạng thái</div>
								<select class="form-select" style="width: 175px;"
									aria-label="Default select example">
									<option selected>--Tất cả--</option>
									<option value="1">Thành công</option>
									<option value="2">KH chưa hoàn</option>
									<option value="3">Shop chưa hoàn</option>
									<option value="4">Thất bại</option>
								</select>
							</div>
							<div class="d-sm-flex align-items-center mr-4">
								<div style="width: 95px;">Mã hóa đơn</div>
								<input type="text" class="form-control" style="width: 175px;"
									placeholder="Nhập mã...">
							</div>
						</div>
					</div>
					<!-- Phần bảng dữ liệu demo -->
					<div>
						<div id="layoutSidenav_content">
							<main>
								<c:forEach var="listOfListSuccessBill"
									items="${LIST_OF_LIST_SUCCESS_BILL}">
									<div class="tempTable"
										data-id="${listOfListSuccessBill.billCode}">
										<div class="card mb-4">
											<div
												class="card-header d-sm-flex align-items-center justify-content-between">
												<div>
													<i class="fas fa-file-code"></i> Mã hóa đơn:
													${listOfListSuccessBill.billCode}
												</div>
												<div class="d-flex">
													<a href="#" class="btn btn-warning" data-toggle="modal"
														data-target="#bill-${listOfListSuccessBill.billCode}"><i
														class="fas fa-edit"></i>Cập nhật</a>
												</div>
											</div>
											<!-- Modal cập nhật trạng thái đơn hàng -->
											<div class="modal fade"
												id="bill-${listOfListSuccessBill.billCode}" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<!-- Modal Header -->
														<div class="modal-header">
															<h4 class="modal-title">Cập nhật trạng thái hóa đơn</h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>

														<div class="modal-body">
															<div class="row">
																<div class="col-xl-12 order-xl-1">
																	<div>
																		<form id="form-add-prod">
																			<div class="row">
																				<!-- Trạng thái hóa đơn -->
																				<div class="col-lg-12">
																					<div class="form-group focused">
																						<label class="form-control-label"
																							for="input-status">Trạng thái
																						</label> <select
																							class=" form-control form-control-alternative"
																							id="select-status">
																							<option value="1">Thành công</option>
																							<option value="2">KH chưa hoàn tiền</option>
																							<option value="3">Shop chưa hoàn tiền</option>
																							<option value="4">Thất bại</option>
																						</select>
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
											<!-- Kết thúc phần modal -->
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered"
														id="${listOfListSuccessBill.billCode}" width="100%"
														cellspacing="0">
														<thead>
															<tr>
																<th>Tên khách hàng</th>
																<th>Tên ngân hàng</th>
																<th>STK ngân hàng</th>
																<th>Tên sản phẩm</th>
																<th>Mã sản phẩm</th>
																<th>Số lượng</th>
																<th>Giá thuê</th>
																<th>Tiền cọc</th>
																<th>Ngày thuê</th>
																<th>Ngày trả hàng</th>
																<th>Trạng thái</th>
															</tr>
														</thead>
														<c:forEach var="tempSuccessBill"
															items="${listOfListSuccessBill.listBill}">
															<tr>
																<td>${tempSuccessBill.firstName}<span class="ml-1">${tempSuccessBill.lastName}</span></td>
																<td>${tempSuccessBill.bankName}</td>
																<td>${tempSuccessBill.successbill.bankCode}</td>
																<td>${tempSuccessBill.prodName}</td>
																<td>${tempSuccessBill.prodCode}</td>
																<td>${tempSuccessBill.successbill.prodAmount}</td>
																<td>${tempSuccessBill.prodPrice}</td>
																<td>${tempSuccessBill.prodDeposit}</td>
																<td>${tempSuccessBill.successbill.rentalDate}</td>
																<td>${tempSuccessBill.successbill.receivedDate}</td>
																<c:choose>
																	<c:when
																		test="${tempSuccessBill.successbill.statusRefund == '1'}">
																		<td>Thành công</td>
																	</c:when>
																	<c:when
																		test="${tempSuccessBill.successbill.statusRefund == '2'}">
																		<td>KH chưa hoàn tiền</td>
																	</c:when>
																	<c:when
																		test="${tempSuccessBill.successbill.statusRefund == '3'}">
																		<td>Shop chưa hoàn tiền</td>
																	</c:when>
																	<c:when
																		test="${tempSuccessBill.successbill.statusRefund == '4'}">
																		<td>Thành công</td>
																	</c:when>
																</c:choose>
															</tr>
														</c:forEach>
													</table>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
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
	<script src="view/admin/js/demo/database-filter.js"></script>
</body>
</html>