var a = 1;
$(document).on('turbolinks:load', function(){
 
  $("#add").click(function(){
  	 a += 1;
    $("#result_quantity").val(a);
  });
});


$(document).on('turbolinks:load', function(){
 
  $("#reduce").click(function(){
  	if(a>1){
	  	 a -= 1;
	    $("#result_quantity").val(a);
	  }
  });
});

$(document).on('turbolinks:load', function(){
    $('.color-button').on('click', function(){
      debugger
      var color = $(this).data('id');
      var production_id = $('#production_id').val();
      $.ajax({
        url: '/production_details',
        type: 'get',
        dataType: 'json',
        data: { 
          production_id: production_id,
          color: $('#color-'+color).val()
        },
        success: function(data){
    
          var grepsize = new Array();  
            grepsize = $.grep(data.data_rom_all, function(item){
              return $.inArray(item, data.data_rom) < 0
            });
            for (i = 0;i < grepsize.length; i++){
              $('#roms-'+grepsize[i]).hide()  
            }
            for (i = 0; i< data.data_rom.length; i++){
              $('#roms-'+data.data_rom[i]).show()
          }
      
        }
      })
    })
    $('.rom-button').on('click', function(){
      debugger
      var rom = $(this).data('id');
      var production_id = $('#production_id').val();
      $.ajax({
        url: '/productions/'+ production_id ,
        type: 'get',
        dataType: 'json',
        data: { 
          rom: $('#rom-'+ rom).val()
        },
        success: function(data){
          
          var grepsize = new Array();  
            grepsize = $.grep(data.data_ram_all, function(item){
              return $.inArray(item, data.data_ram) < 0
            });
            for (i = 0;i < grepsize.length; i++){
              $('#rams-'+grepsize[i]).hide()  
            }
            for (i = 0; i< data.data_ram.length; i++){
              $('#rams-'+data.data_ram[i]).show()
          }
        
        }
      })
    })
  });

$(document).on('click', '.button-cart', function(){
  debugger
  var cart_id = $('#cart_id').val();
  $.ajax({
    url: '/carts/'+ cart_id,
    data: {
            authenticity_token: $('[name="csrf-token"]')[0].content,
            quantity: $("#result-quantity").val(),
            production_id: $('#production_id').val(),
            color: $('.color-button:checked').val(),
            rom: $('.rom-button:checked').val(),
            ram: $('.ram-button:checked').val()
        },
        datatype: "json",
        type: 'put',
        error: function(){ 
           alert('yêu cầu chọn đầy đủ thông tin về sản phẩm')
        },
        success : function(data) { 
            if(!data.success&& !data.quantity){
              $("#notice-select").html(data.errors[0].message); 
  
            } else if(data.success){
              alert('bạn đã đặt hàng thành công xin vui lòng kiểm trả trong giỏ hàng')
              
            }
        } 

  })

})

$(document).on('turbolinks:load', function(){
  $(".delete-product").click(function(){
    var id = $(this).data('id');
    var production_detail_id = $(this).data('production_detail');
    $.ajax({

      url: '/carts/'+id ,
      type: 'DELETE',
      data: {
         authenticity_token: $('[name="csrf-token"]')[0].content,
        _method: 'DELETE',
        production_detail_id: production_detail_id
        
      },
      success: function(data) {
        $(".xoa-"+production_detail_id).remove();
        alert('xoa thanh cong');
      }  
    
    });
  });
});