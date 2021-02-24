<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Kho | Admin</title>
<!-- Custom fonts for this template -->
<link href="view/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="view/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="view/admin/css/table-product.css" rel="stylesheet">

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
						<h1 class="h3 mb-0 text-gray-800">Thông tin chi tiết sản phẩm
						</h1>
						<a href="#" class="btn btn-primary btn-icon-split"> <span
							class="icon text-white-50"> <i class="fas fa-plus-circle"></i>
						</span> <span class="text" data-toggle="modal"
							data-target="#modalAddProd">Thêm sản phẩm</span>
						</a>
					</div>
					<!-- Phần dialog thêm sản phẩm -->
					<jsp:include page="add-prod.jsp" />
					<!--  -->
					<!-- Phần bảng dữ liệu demo -->
					<div>
						<div id="layoutSidenav_content">
							<main>
								<div>
									<div class="card mb-4">
										<div class="card-header">
											<i class="fas fa-th-list mr-1"></i> Danh sách sản phẩm trong
											kho
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">
													<thead>
														<tr>
															<th>Danh mục</th>
															<th>Mã sản phẩm</th>
															<th>Tên sản phẩm</th>
															<th>Ảnh</th>
															<th>Màu sắc</th>
															<th>Giá thuê/ngày</th>
															<th>Tiền cọc</th>
															<th>Số lượng còn</th>
															<th>Trạng thái</th>
															<th></th>
														</tr>
													</thead>
													<tfoot>
														<tr>
															<th>Danh mục</th>
															<th>Mã sản phẩm</th>
															<th>Tên sản phẩm</th>
															<th>Ảnh</th>
															<th>Màu sắc</th>
															<th>Giá thuê/ngày(VNĐ)</th>
															<th>Tiền cọc(VNĐ)</th>
															<th>Số lượng còn</th>
															<th>Trạng thái</th>
															<th></th>
														</tr>
													</tfoot>
													<c:forEach var="tempProd" items="${LIST_PRODUCT_TABLE}">
														<tr>
															<td>${tempProd.cateName}</td>
															<td>${tempProd.product.prodCode}</td>
															<td>${tempProd.product.prodName}</td>
															<td style="width: 135px"><img
																style="width: 135px; height: 135px;"
																src="${tempProd.product.image1}" width="auto"
																height="35px"></td>
															<td>${tempProd.product.prodColor}</td>
															<td>${tempProd.product.prodPrice}</td>
															<td>${tempProd.product.prodDeposit}</td>
															<td>${tempProd.product.prodAmount}</td>
															<td>${tempProd.product.prodStatus}</td>
															<c:url var="tempLinkDeleteProd" value="admin">
																<c:param name="command" value="DELETE_PRODUCT"></c:param>
																<c:param name="prodId"
																	value="${tempProd.product.prodId}"></c:param>
															</c:url>
															<td style="width: 185px"><a data-toggle="modal"
																data-target="#prod-${tempProd.product.prodId}"
																class="btn btn-warning"> <i class="fas fa-edit mr-1">
																</i> Chi tiết
															</a> <a href="${tempLinkDeleteProd}" class="btn btn-danger"
																onclick="if(!(confirm('Bạn có chắc chắn muốn xóa sản phẩm này?'))) return false"><i
																	class="fas fa-trash mr-1"></i>Xóa</a></td>
														</tr>
														<!-- Phần dialog thêm sản phẩm -->
														<div class="modal fade"
															id="prod-${tempProd.product.prodId}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true">
															<div class="modal-dialog modal-lg modal-dialog-centered"
																role="document">
																<!-- Modal content-->
																<div class="modal-content ">
																	<!-- Tiêu đề modal -->
																	<div class="modal-header">
																		<h4 class="modal-title">Thông tin chi tiết thông
																			tin sản phẩm</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																	</div>
																	<div class="modal-body">
																		<div class="row">
																			<div class="col-xl-12 order-xl-1">
																				<div>
																					<form id="form-add-prod" enctype='multipart/form-data' action='admin'
																						method="POST">
																						<input type="hidden" name="command"
																							value="UPDATE_PRODUCT" />
																						<h6 class="heading-small text-muted mb-4">Thông
																							tin sản phẩm</h6>
																						<div class="pl-lg-4">
																							<div class="row">
																								<!-- Tên sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-prodname">Tên sản phẩm <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-prodname"
																											class="form-control form-control-alternative"
																											value="${tempProd.product.prodName}" name="nameProd">
																									</div>
																								</div>
																								<!-- Mã sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group">
																										<label class="form-control-label"
																											for="input-prodcode">Mã sản phẩm <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-prodcode"
																											class="form-control form-control-alternative"
																											name="codeProd" value="${tempProd.product.prodCode}">
																									</div>
																								</div>
																							</div>
																							<div class="row">
																								<!-- Giá thuê sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-prodprice">Giá thuê <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-prodprice"
																											class="form-control form-control-alternative"
																											value="${tempProd.product.prodPrice}" name="priceProd">
																									</div>
																								</div>
																								<!-- Số tiền đặt cọc -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-deposit">Cọc trước <span
																											style="color: red;">(*)</span>
																										</label> <input type="text" id="input-deposit"
																											class="form-control form-control-alternative"
																											value="${tempProd.product.prodDeposit}" name="depositProd">
																									</div>
																								</div>
																							</div>
																							<div class="row">
																								<!-- Chọn danh mục tương ứng với sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-cate">Danh mục <span
																											style="color: red;">(*)</span>
																										</label> <select
																											class=" form-control form-control-alternative"
																											id="select-cate" value="${tempProd.product.cateId}">
																											<c:forEach var="tempCate"
																												items="${LIST_CATE}">
																												<option value="${tempCate.cateId}">${tempCate.cateName}</option>
																											</c:forEach>
																										</select>
																									</div>
																								</div>
																								<!-- Số lượng sản phẩm còn trong kho -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-amount">Số lượng trong kho
																											<span style="color: red;">(*)</span>
																										</label> <input type="number" id="input-amount"
																											class="form-control form-control-alternative"
																											value="${tempProd.product.prodAmount}">
																									</div>
																								</div>
																							</div>
																							<div class="row">
																								<!-- Màu sắc sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-color">Màu sắc</label> <input
																											type="text" id="input-color"
																											class="form-control form-control-alternative"
																											value="${tempProd.product.prodColor}">
																									</div>
																								</div>
																								<!-- Trạng thái sản phẩm -->
																								<div class="col-lg-6">
																									<div class="form-group focused">
																										<label class="form-control-label"
																											for="input-status">Trạng thái <span
																											style="color: red;">(*)</span>
																										</label> <select
																											class=" form-control form-control-alternative"
																											id="select-status" value="${tempProd.product.prodStatus}">
																											<option value="HOT">HOT</option>
																											<option value="SALE">SALE</option>
																											<option value="TREND">TREND</option>
																										</select>
																									</div>
																								</div>
																							</div>
																						</div>

																						<hr class="my-4">

																						<h6 class="heading-small text-muted mb-4">Hình
																							ảnh</h6>
																						<div class="pl-lg-5">
																							<div class="row">
																								<!-- Ảnh 1 -->
																								<div class="col-lg-4"
																									style="text-align: center;">
																									<div class="form-group focused"
																										style="display: flex; align-items: center; justify-content: center;">

																										<input type='file' onchange="readURL1(this);"
																											id="selectedFile1" style="display: none;"
																											class="btn-upd" accept="image/*" /> <input
																											type="button" value="Browse..."
																											onclick="document.getElementById('selectedFile1').click();" />
																									</div>
																									<img id="blah1" src="${tempProd.product.image1}"
																										style="width: 150px;" alt="your image 1" /> <br>
																									<br> <label class="form-control-label"
																										for="input-img1"
																										style="display: flex; align-items: center; justify-content: center;">Ảnh
																										1 (hiển thị) <span
																										style="color: red; margin-left: 2px;">(*)</span>
																									</label>
																								</div>
																								<!-- Ảnh 2 -->
																								<div class="col-lg-4"
																									style="text-align: center;">
																									<div class="form-group focused"
																										style="display: flex; align-items: center; justify-content: center;">
																										<input type='file' onchange="readURL2(this);"
																											id="selectedFile2" style="display: none;"
																											class="btn-upd" accept="image/*" /> <input
																											type="button" value="Browse..."
																											onclick="document.getElementById('selectedFile2').click();" />
																									</div>
																									<img id="blah2" src="${tempProd.product.image2}"
																										style="width: 150px;" alt="your image 2" /> <br>
																									<br> <label class="form-control-label"
																										for="input-img2"
																										style="display: flex; align-items: center; justify-content: center;">Ảnh
																										2 <span style="color: red; margin-left: 2px;">(*)</span>
																									</label>
																								</div>
																								<!-- Ảnh 3 -->
																								<div class="col-lg-4"
																									style="text-align: center;">
																									<div class="form-group focused"
																										style="display: flex; align-items: center; justify-content: center;">
																										<input type='file' onchange="readURL3(this);"
																											id="selectedFile3" style="display: none;"
																											class="btn-upd" accept="image/*" /> <input
																											type="button" value="Browse..."
																											onclick="document.getElementById('selectedFile3').click();" />
																									</div>
																									<img id="blah3" src="${tempProd.product.image3}"
																										style="width: 150px;" alt="your image 3" /> <br>
																									<br> <label class="form-control-label"
																										for="input-img3"
																										style="display: flex; align-items: center; justify-content: center;">Ảnh
																										3 <span style="color: red; margin-left: 2px;">(*)</span>
																									</label>
																								</div>
																							</div>
																						</div>
																						<hr class="my-4">
																						<!-- Mô tả -->
																						<div class="pl-lg-4">
																							<div class="form-group focused">
																								<label class="form-control-label">Mô tả
																									sản phẩm</label>
																								<textarea rows="4"
																									class="form-control form-control-alternative"
																									id="input-des" value="${tempProd.product.prodDescription}"></textarea>
																							</div>
																						</div>
																					</form>
																				</div>
																			</div>
																		</div>
																		<div id="invalid" class="invalid-feedback"
																			style="display: none; color: red; padding-left: 25px; font-size: 19px;">Vui
																			lòng nhập đầy đủ các thông tin (*)!</div>
																	</div>
																	<!-- Thêm mới -->
																	<div class="modal-footer">
																		<button type="button" class="btn btn-warning"
																			id="add-button" data-dismiss="static">Cập
																			nhật</button>
																		<button type="button" class="btn btn-outline-warning"
																			data-dismiss="modal">Đóng</button>
																	</div>
																</div>
															</div>
														</div>
														<!--  -->
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
	<script src="view/admin/js/previewImage.js"></script>
</body>
</html>