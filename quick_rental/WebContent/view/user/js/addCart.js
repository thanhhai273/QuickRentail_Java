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
 
    