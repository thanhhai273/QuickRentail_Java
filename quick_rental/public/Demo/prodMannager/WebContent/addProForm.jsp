<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Add Product</title>
		<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/addForm.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</head>
	<body>
    <br/><br/><br/><br/><br/><br/><br/><br/>
      <div class="container-fluid" style="display: block;">
            <div class="row">
                <div class="col"></div>
                <div class="col-4" id="addForm">
                    <h3>Thêm sản phẩm</h3>
                    <form action="ProdManagerControllerServlet" method="get">
                        <input type="hidden" name="command" value="ADD"/>
                        <div class="input-box">
                            <input type="text" placeholder="Id sản phẩm">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Mã sản phẩm">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Tên sản phẩm">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Giá một sản phẩm">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Trạng thái sản phẩm">
                        </div>
                        <div class="input-box">
                            <input type="text" placeholder="Số lượng sản phẩm">
                        </div>
                        <div class="input-box">
                          <label>Danh mục :</label>
                          <select id="category" name="proCate">
                            <option value="phone">Điện thoại</option>
                            <option value="lapttop">Laptop</option>
                            <option value="camera">Máy ảnh</option>
                          </select>
                        </div>
                        <div class="input-box">
                          <label for="proDescription">Giới thiệu sản phẩm :</label>
                          <br>
                          <textarea id="proDescription" placeholder="Write something.."></textarea>
                      `</div>
                      <div class="btn-box">
                        <input type="submit" value="save" class="save"/>
                      </div>
                    </form>
                    <p>
                      <a href="ProdManagerControllerServlet">Quản lý sản phẩm</a>
                    </p>
                </div>
                <div class="col"></div>
            </div>
		  </div>
	</body>
</html>