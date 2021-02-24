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
						<h1 class="h3 mb-0 text-gray-800">Quản lý hóa đơn thuê</h1>
						<div class="d-sm-flex">
							<div class="d-sm-flex align-items-center mr-4">
								<div style="width: 85px;">Trạng thái</div>
								<select class="form-select" style="width: 175px;"
									aria-label="Default select example">
									<option selected>--Tất cả--</option>
									<option value="1">Đang xử lý</option>
									<option value="2">Đang giao hàng</option>
									<option value="3">Khách đã nhận hàng</option>
								</select>
							</div>
							<div class="d-sm-flex align-items-center mr-4">
								<div style="width: 95px;">Mã hóa đơn</div>
								<input type="text" class="form-control" style="width: 175px;"
									placeholder="Nhập mã...">
							</div>
							<a href="#" class="btn btn-primary"><i
								class="fas fa-filter mr-1"></i>Lọc</a>
						</div>
					</div>
					<!-- Phần bảng dữ liệu demo -->
					<div>
						<div id="layoutSidenav_content">
							<main>
								<c:forEach var="listOfListProcessBill"
									items="${LIST_OF_LIST_PROCESS_BILL}">
									<div class="tempTable"
										data-id="${listOfListProcessBill.billCode}">
										<div class="card mb-4">
											<div
												class="card-header d-sm-flex align-items-center justify-content-between">
												<div>
													<i class="fas fa-file-code"></i> Mã hóa đơn:
													${listOfListProcessBill.billCode}
												</div>
												<div class="d-flex">
													<a href="#" class="btn btn-warning mr-2"
														data-toggle="modal"
														data-target="#bill-${listOfListProcessBill.billCode}"><i
														class="fas fa-edit"></i><span>Cập nhật</span></a> <a href=""
														class="btn btn-success" data-toggle="modal"
														data-target="#statusmodal-${listOfListProcessBill.billCode}"><i
														class="fas fa-check mr-1"></i>Chốt</a>
												</div>
											</div>
											<!-- Modal chọn trạng thái hóa đơn hoàn thành  -->
											<div class="modal fade"
												id="statusmodal-${listOfListProcessBill.billCode}"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Chọn
																trạng thái hoàn thành hóa đơn</h5>
															<button class="close" type="button" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true"><i class="fas fa-times"></i></span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col-xl-12 order-xl-1">
																	<div>
																		<form id="ssForm-${listOfListProcessBill.billCode}"
																			action="admin" method="POST">
																			<input type="hidden" name="command"
																				value="CONVERT_SUCCESS_BILL" /> <input
																				type="hidden" name="ssBillCode"
																				value="${listOfListProcessBill.billCode}" />
																			<div class="row">
																				<!-- Trạng thái hóa đơn -->
																				<div class="col-lg-12">
																					<div class="form-group focused">
																						<label class="form-control-label"
																							for="input-status">Trạng thái </label> <select
																							class=" form-control form-control-alternative" name="ssStatus"
																							id="select-status">
																							<option value="1">Thành công</option>
																							<option value="2">Chưa hoàn phía khách
																								hàng</option>
																							<option value="3">Chưa hoàn phía cửa
																								hàng</option>
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
														<div class="modal-footer">
															<button class="btn btn-secondary" type="button"
																data-dismiss="modal">Hủy</button>
															<a class="btn btn-primary ssSubmit"
																data-id="ssForm-${listOfListProcessBill.billCode}">Chốt</a>
														</div>
													</div>
												</div>
											</div>
											<!-- end modal -->
											<!-- Modal cập nhật trạng thái đơn hàng -->
											<div class="modal fade"
												id="bill-${listOfListProcessBill.billCode}" tabindex="-1"
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
																							for="input-status">Trạng thái </label> <select
																							class=" form-control form-control-alternative"
																							id="select-status">
																							<option value="1">Đang xử lý</option>
																							<option value="2">Đang giao hàng</option>
																							<option value="3">Khách đã nhận hàng</option>
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
														id="${listOfListProcessBill.billCode}" width="100%"
														cellspacing="0">
														<thead>
															<tr>
																<th>Tên khách hàng</th>
																<th>Tên sản phẩm</th>
																<th>Mã sản phẩm</th>
																<th>Số lượng</th>
																<th>Giá thuê</th>
																<th>Tiền cọc</th>
																<th>Ngày thuê</th>
																<th>Hạn thuê (ngày)</th>
																<th>Trạng thái</th>
															</tr>
														</thead>
														<c:forEach var="tempProcessBill"
															items="${listOfListProcessBill.listBill}">
															<tr>
																<td>${tempProcessBill.firstName}<span class="ml-1">${tempProcessBill.lastName}</span></td>
																<td>${tempProcessBill.prodName}</td>
																<td>${tempProcessBill.prodCode}</td>
																<td>${tempProcessBill.processingBill.prodAmount}</td>
																<td>${tempProcessBill.processingBill.prodPrice}</td>
																<td>${tempProcessBill.processingBill.prodDeposit}</td>
																<td class="fomatDate">${tempProcessBill.processingBill.createdDate}</td>
																<td>${tempProcessBill.processingBill.rentalTerm}</td>
																<c:choose>
																	<c:when
																		test="${tempProcessBill.processingBill.billStatus == '1'}">
																		<td>Đang xử lý</td>
																	</c:when>
																	<c:when
																		test="${tempProcessBill.processingBill.billStatus == '2'}">
																		<td>Đang giao hàng</td>
																	</c:when>
																	<c:when
																		test="${tempProcessBill.processingBill.billStatus == '3'}">
																		<td>Khách đã nhận hàng</td>
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
	
	<!-- Submit khi chốt đơn -->
	<script>
		$('.ssSubmit').click(function() {
			var idFrom = $(this).data("id");
			$('#' + idFrom).submit();
		})
	</script>
</body>
</html>