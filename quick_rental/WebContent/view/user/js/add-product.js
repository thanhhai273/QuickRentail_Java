$(".localclick").click
(
	    function()
	    {
	    	var prod_id = $(this).data("idproduct");
	        $.ajax
	        (
	            {
	                url:'home',
	                data:{command:"ADD_CART",product_id: prod_id},
	                type:'post',
	                cache:false,
	                success:function(data){
						 $("body").append(data);
						 $("#gio-hang").html(data);},
	                error:function(){console.log('error');}
	            }
	        );
	    }
    );
    
  
  
 // cap nhat danh sach yeu thich
 $(".localclick1").click
(
	    function()
	    {
	    	var prod_id = $(this).data("idproduct");
	        $.ajax
	        (
	            {
	                url:'home',
	                data:{command:"ADD_WISHLIST",product_id: prod_id},
	                type:'post',
	                cache:false,
	                success:function(data){
						if(data == -1){
							alert("Sản phẩm đã có trong danh sách yêu thích");
						}else{
							$("#yeuthich").html(data);

						}
						 
						},
	                error:function(){console.log('error');}
	            }
	        );
	    }
    );
    
  
  
  
  
  
  $(document).ready(function(){
	   
	        $.ajax
	        (
	            {
	                url:'home',
	                data:{command:"NUM_CART"},
	                type:'get',
	                cache:false,
	                success:function(data){
	                	 $("#gio-hang").html(data);},
	                error:function(){console.log('error');}
	            }
	        );
	});
	// hien thi so luong danh sach yeu thich
	$(document).ready(function(){
	   
		$.ajax
		(
			{
				url:'home',
				data:{command:"NUM_YEU"},
				type:'get',
				cache:false,
				success:function(data){
					 $("#yeuthich").html(data);},
				error:function(){console.log('error');}
			}
		);
});
 
 
    