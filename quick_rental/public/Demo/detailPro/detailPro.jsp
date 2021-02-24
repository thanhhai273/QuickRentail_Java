<!DOCTYPE html>
<%-- 
    Document   : detailPro
    Created on : Monday, Nov 3, 2020
    Created by : DuyTruong
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html>
    <header>
        <title>Sản Phẩm</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </header>
    <body>
    	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <div class="container-fluid" style="display: block;" id="proInformation">
            <div class="row">
                <div class="col"></div>
                <div class="col-7">
                	<div class="row">
                		<!-- Hình ảnh sản phẩm -->
                		<div class="col-6 carousel slide" id="proMainImage" data-ride="carousel">
		                    <ul class="carousel-indicators">
								<li class="img1 active"></li>
								<li class="img2"></li>
								<li class="img3"></li>
								<li class="img4"></li>
								<li class="img5"></li>
							  </ul>
							  <div class="carousel-inner">
								  <div class="carousel-item active">
					                 <img src="image/1.jpg" width="100%" height="auto" />
					              </div>
					              <div class="carousel-item">
					                 <img src="image/2.jpg" width="100%" height="auto" />
					              </div>
					              <div class="carousel-item">
					                 <img src="image/3.jpg" width="100%" height="auto" />
					              </div>
					              <div class="carousel-item">
					                 <img src="image/4.jpg" width="100%" height="auto" />
					              </div>
					              <div class="carousel-item">
					                 <img src="image/4.jpg" width="100%" height="auto" />
					              </div>
							  </div>
							 <a class="carousel-control-prev" href="#demo" data-slide="prev">
							    <span class="carousel-control-prev-icon"></span>
							  </a>
							  <a class="carousel-control-next" href="#demo" data-slide="next">
							    <span class="carousel-control-next-icon"></span>
							  </a>
		                </div>
		                
		                <div class="col-6" id="information">
		                	<!-- Về trang toàn bộ sản phẩm -->
		                	<div id="backToPro">
		                		<a href="product">Xem toàn bộ sản phẩm</a>
		                	</div>
		                    <div>
		                    	<!-- Tên sản phẩm -->
		                        <h2 id="nameProd">Máy ảnh Cannon RS1221</h2>
		                        <!-- Thêm vào danh sách yêu thích -->
		                        <i onclick="myFunction(this)" class="fa fa-heart"></i>
		                    </div>
		                    <!-- Giá -->
		                    <div id="price">
		                        <h4><strong>Giá/Ngày: 300.000 <u>đ</u></strong></h4>
		                    </div>
		                    <!-- Trạng thái sản phẩm -->
		                    <div>
		                    	Trạng thái: Còn hàng
		                    </div>
		                    <!-- Số lượng sản phẩm còn lại -->
		                    <div id="prodAmount">
		                       <i> Số lượng sản phẩm còn lại: 50</i>
		                    </div>
		                    <!-- Số lượng thuê -->
		                    <div id="num">
		                        <input type="button" onclick="sub();" class="btn" value="-" id="subBtn">
		                        <span id="sl"> 1 </span>
		                        <input type="button" onclick="add();" class="btn" value="+" id="addBtn">
		                    </div>
		                    <br>
		                    <div >
		                    	<button id="buyBtn"> Thuê đồ <i class="fa fa-balance-scale" color="fff"></i></button>
		                    </div>
		                </div>
                	</div>
                	<br><br>
                	<!-- Mô tả sản phẩm -->
                	<div id="prodDescription">
			       		<h3>Mô tả sản phẩm</h3>
			       		Máy được xách tay về trong tình trạng đẹp 95%, cao su nguyên vẹn chưa bung hay dán lại, main zin 100% chưa sửa chữa. kèm theo máy là lens 18-55 vr chống rung giúp hình ảnh rõ nét hơn không bị nhòe.
						chất ảnh của nikon d3200 khá đẹp, sắc nét và màu sắc tươi sáng, d3200 có chức năng hỗ trợ wifi có thể chia sẽ ảnh ngay trên chiếc máy ảnh qua điện thoại không cần laptop.
						sau đây là cấu hình sơ của máy:
						          Nikon D3200 Kit 18-55mm VR II
						- Cảm biến ảnh APS CMOS 24.1 Megapixels
						- Bộ xử lý ảnh EXPEED III, ISO cao nhất tới 12.800
						- Hệ thống lấy nét tự động 3D-tracking AF 11 điểm
						- Hệ thống đo sáng Active D-Lighting thế hệ mới nhất
						-quay phim Full-HD 1080p với hiệu ứng Cinematic 
						- Tích hợp hệ thống tự động làm sạch cảm biến
						- Màn hình Live View 3” độ phân giải 9210,000 điểm ảnh
						- Ống kính kèm theo: AF-S 18-55 VR.
			       </div>
			       <br><br>
			       <div class="row">
			       		<div class="col-3">
			       			 <img src="image/6.jpg" width="90%" height="auto" />
			       			 <br>
			       			 <div>
			       			 	<strong>iphone 8</strong>
			       			 </div>
			       			 <div>
			       			 	 200.000<u>đ</u>
			       			 </div>
			       		</div>
			       		<div class="col-3">
			       			 <img src="image/7.jpg" width="90%" height="auto" />
			       			 <br>
			       			 <div>
			       			 	<strong>iphone 8</strong>
			       			 </div>
			       			 <div>
			       			 	 200.000<u>đ</u>
			       			 </div>
			       		</div>
			       		<div class="col-3">
			       			 <img src="image/8.jpg" width="90%" height="auto" />
			       			 <br>
			       			 <div>
			       			 	<strong>iphone 8</strong>
			       			 </div>
			       			 <div>
			       			 	 200.000<u>đ</u>
			       			 </div>
			       		</div>
			       		<div class="col-3">
			       			 <img src="image/9.jpg" width="90%" height="auto" />
			       			 <br>
			       			 <div>
			       			 	<strong>iphone 8</strong>
			       			 </div>
			       			 <div>
			       			 	 200.000<u>đ</u>
			       			 </div>
			       		</div>
			       </div>
			       <br><br>
			       <div>
			       		<label for="comment"><strong>Nhận xét sản phẩm</strong></label>
						    <textarea id="comment" name="comment" placeholder="Write something.." style="height:200px"></textarea>					
						 <input type="submit" value="Submit">
			       </div>
			    </div>
                <div class="col"></div>
            </div>
       </div>
       <br/><br/>
       
       
    </body>
</html>
<script>
		$(document).ready(function(){
		  // Activate Carousel
		  $("#proMainImage").carousel();
		    
		  // Enable Carousel Indicators
		  $(".img1").click(function(){
		    $("#proMainImage").carousel(0);
		  });
		  $(".img2").click(function(){
		    $("#proMainImage").carousel(1);
		  });
		  $(".img3").click(function(){
		    $("#proMainImage").carousel(2);
		  });
		  $(".img4").click(function(){
			    $("#proMainImage").carousel(2);
			  });
		  $(".img4").click(function(){
			    $("#proMainImage").carousel(2);
			  });
		  // Enable Carousel Controls
		  $(".carousel-control-prev").click(function(){
		    $("#proMainImage").carousel("prev");
		  });
		  $(".carousel-control-next").click(function(){
		    $("#proMainImage").carousel("next");
		  });
		});
		function myFunction(x) {
			  x.classList.toggle("click_icon");
			}
</script>
 <script type="text/javascript">
                function add() {
                    var max = 100;
                    var soluong = parseInt($("#sl").html());

                    if (soluong < max) {
                        soluong += 1;
                        $("#sl").html(soluong);
                        $("#soLuong").val(soluong);
                    }
                }
                function sub() {
                    var soluong = parseInt($("#sl").html());
                    if (soluong > 1) {
                        soluong -= 1;
                        $("#sl").html(soluong);
                        $("#soLuong").val(soluong);
                    }

                }
 </script>	
 <style>
 	body {
 		background-color:#f5f5f5;
 	}
 	.col-7 {
 		background-color:#fff;
 	}
 	
	.fa-heart {
	  font-size: 25px;
	  cursor: pointer;
	  user-select: none;
	  color: rgb(240, 173, 173);
		 
	}
				
	.click_icon {color: red;}
	
    .btn {
        background-color: #e0e0e0;
        border: none;
        transition: 0.3s;
        opacity: 0.6;
    }
    .btn:hover {
    	opacity: 1;
    }
    #addBtn #subBtn {
    	margin-top: 4px;
		margin-bottom: 4px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        margin: 1px 1px 1px 1px;
        cursor: pointer;
        height: 40px;
  		width: 40px;
    }
	#sl {
		margin-top: 4px;
		margin-bottom: 4px;
		padding: 5px 5px;
		font-size: 20px;
		height: 40px;
  		width: 40px;
  		text-align: center;
        text-decoration: none;
        display: inline-block;
	}
	#backToPro {
		border-bottom: double;
	}
	textarea {
	  width: 100%;
	  padding: 12px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	  margin-top: 6px;
	  margin-bottom: 16px;
	  resize: vertical;
	}
	input[type=submit], #buyBtn {
	  background-color: #4CAF50;
	  color: white;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	}
	
	input[type=submit]:hover {
	  background-color: #45a049;
	}
	#buyBtn:hover {background-color: #45a049;}
 </style>