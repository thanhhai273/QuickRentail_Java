<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Product Manager</title>
        <link href="css/pro.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <div  class="container-fluid" style="display: block;">
            <div class="row">
                <div class="col"></div>
                <div class="col-8">
                    <input type="button" value="Thêm sản phẩm" 
						   onclick="window.location.href='addProForm.jsp'; return false;"
						   id="add-pro-button" class="buttons"
					/>
					<br><br>
                    <div id="layoutSidenav_content">
                        <main>
                            <div>
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table mr-1"></i>
                                        Quản lý sản phẩm
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Tên</th>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Ảnh</th>
                                                        <th>Giá</th>
                                                        <th>Số lượng</th>
                                                        <th>Trạng thái</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Tên</th>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Ảnh</th>
                                                        <th>Giá một sp</th>
                                                        <th>Số lượng</th>
														<th>Trạng thái</th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                                <c:forEach var="tempPro" items="${Pro_LIST}">
																										
													<tr>
														<td> ${tempPro.prodName} </td>
														<td> ${tempPro.prodCode} </td>
														<td> ${tempPro.prodImg} </td>
														<td> ${tempPro.prodPrice} </td>
														<td> ${tempPro.prodAmount} </td>
														<td> ${tempPro.prodStatus} </td>
														<td>
															<input type="button" value="Xoá" 
																   onclick="if (!(confirm('Bạn muốn xoá sản phẩm này?'))) return false;"
																   id="delete-pro-button" class="buttons"
															/>
															<input type="button" value="Cập nhật"
																   id="update-pro-button"  class="buttons"
															/>
														</td>
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
                <div class="col"></div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function() {
                $('#dataTable').DataTable();
                });
        </script>
</body>