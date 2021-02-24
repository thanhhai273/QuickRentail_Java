<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add product</title>
</head>
<body>
	<div class="container">

		<!-- Modal -->
		<div class="modal fade" id="modalAddProd" role="dialog">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<!-- Modal content-->
				<div class="modal-content ">
					<!-- Tiêu đề modal -->
					<div class="modal-header">
						<h4 class="modal-title">Thay đổi thông tin sản phẩm</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xl-12 order-xl-1">
								<div>
									<form id="form-add-prod" enctype='multipart/form-data' action='admin' method="POST">
									<input type="hidden" name="command" value="ADD_PRODUCT" />
										<h6 class="heading-small text-muted mb-4">Thông tin sản
											phẩm</h6>
										<div class="pl-lg-4">
											<div class="row">
												<!-- Tên sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-prodname">Tên
															sản phẩm <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-prodname"
															class="form-control form-control-alternative" value=""
															name="prodName">
													</div>
												</div>
												<!-- Mã sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group">
														<label class="form-control-label" for="input-prodcode">Mã
															sản phẩm <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-prodcode"
															class="form-control form-control-alternative"
															name="prodCode">
													</div>
												</div>
											</div>
											<div class="row">
												<!-- Mã sản phẩm bên đối tác -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-prodCodePartner">Mã sản phẩm đối tác <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-prodCodePartner"
															class="form-control form-control-alternative" value=""
															name="prodCodePartner">
													</div>
												</div>
												<!-- Giá nhập sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-importprice">Giá
															nhập <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-importprice"
															class="form-control form-control-alternative" value=""
															name="importPrice">
													</div>
												</div>
											</div>
											<div class="row">
												<!-- Giá thuê sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-prodprice">Giá
															thuê <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-prodprice"
															class="form-control form-control-alternative" value=""
															name="prodPrice">
													</div>
												</div>
												<!-- Số tiền đặt cọc -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-deposit">Cọc
															trước <span style="color: red;">(*)</span>
														</label> <input type="text" id="input-deposit"
															class="form-control form-control-alternative" value=""
															name="prodDeposit">
													</div>
												</div>
											</div>
											<div class="row">
												<!-- Chọn danh mục tương ứng với sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-cate">Danh
															mục <span style="color: red;">(*)</span>
														</label> <select class=" form-control form-control-alternative"
															id="select-cate" name="cateId">
															<c:forEach var="tempCate" items="${LIST_CATE}">
																<option value="${tempCate.cateId}">${tempCate.cateName}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<!-- Số lượng sản phẩm còn trong kho -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-amount">Số
															lượng trong kho <span style="color: red;">(*)</span>
														</label> <input type="number" id="input-amount"
															class="form-control form-control-alternative" value="" name="prodAmount">
													</div>
												</div>
											</div>
											<div class="row">
												<!-- Màu sắc sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-color">Màu
															sắc</label> <input type="text" id="input-color"
															class="form-control form-control-alternative" value="" name="propColor">
													</div>
												</div>
												<!-- Trạng thái sản phẩm -->
												<div class="col-lg-6">
													<div class="form-group focused">
														<label class="form-control-label" for="input-status">Trạng
															thái <span style="color: red;">(*)</span>
														</label> <select class=" form-control form-control-alternative"
															id="select-status" name="prodStatus">
															<option value="HOT">HOT</option>
															<option value="SALE">SALE</option>
															<option value="TREND">TREND</option>
														</select>
													</div>
												</div>
											</div>
										</div>

										<hr class="my-4">

										<h6 class="heading-small text-muted mb-4">Hình ảnh</h6>
										<div class="pl-lg-5">
											<div class="row">
												<!-- Ảnh 1 -->
												<div class="col-lg-4" style="text-align: center;">
													<div class="form-group focused"
														style="display: flex; align-items: center; justify-content: center;">

														<input type='file' name="input-1" onchange="readURL1(this);"
															id="selectedFile1" style="display: none;" class="btn-upd" accept="image/*" />
														<input type="button" value="Browse..."
															onclick="document.getElementById('selectedFile1').click();" />
													</div>
													<img id="blah1" src="view/admin/img/photos.png"
														alt="your image 1"
														style="text-align: center; width: 150px;" /> <br> <br>
													<label class="form-control-label" for="input-img1"
														style="display: flex; align-items: center; justify-content: center;">Ảnh
														1 (hiển thị) <span style="color: red; margin-left: 2px;">(*)</span>
													</label>
												</div>
												<!-- Ảnh 2 -->
												<div class="col-lg-4" style="text-align: center;">
													<div class="form-group focused"
														style="display: flex; align-items: center; justify-content: center;">
														<input type='file' name="input-2" onchange="readURL2(this);"
															id="selectedFile2" style="display: none;" class="btn-upd" accept="image/*"/>
														<input type="button" value="Browse..."
															onclick="document.getElementById('selectedFile2').click();" />
													</div>
													<img id="blah2" src="view/admin/img/photos.png"
														style="text-align: center; width: 150px;"
														alt="your image 2" /> <br> <br> <label
														class="form-control-label" for="input-img2"
														style="display: flex; align-items: center; justify-content: center; ">Ảnh
														2 <span style="color: red; margin-left: 2px;">(*)</span>
													</label>
												</div>
												<!-- Ảnh 3 -->
												<div class="col-lg-4" style="text-align: center;">
													<div class="form-group focused"
														style="display: flex; align-items: center; justify-content: center;">
														<input type='file' name="input-3" onchange="readURL3(this);"
															id="selectedFile3" style="display: none;" class="btn-upd" accept="image/*"/>
														<input type="button" value="Browse..."
															onclick="document.getElementById('selectedFile3').click();" />
													</div>
													<img id="blah3" src="view/admin/img/photos.png"
														style="text-align: center; width: 150px;"
														alt="your image 3" /> <br> <br> <label
														class="form-control-label" for="input-img3"
														style="display: flex; align-items: center; justify-content: center; ">Ảnh
														3 <span style="color: red; margin-left: 2px;">(*)</span>
													</label>
												</div>
											</div>
										</div>
										<hr class="my-4">
										<!-- Mô tả -->
										<div class="pl-lg-4">
											<div class="form-group focused">
												<label class="form-control-label">Mô tả sản phẩm</label>
												<textarea rows="4"
													class="form-control form-control-alternative" name="prodDescription"
													id="input-des"></textarea>
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
						<button type="button" class="btn btn-primary" id="add-button"
							data-dismiss="static">Thêm mới</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="view/admin/js/previewImage.js"></script>
	<script src="view/admin/js/modal-prod.js"></script>
</body>
</html>