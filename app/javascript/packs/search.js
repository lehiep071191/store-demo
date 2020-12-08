$(document).ready(function(){
    $('#search').click(function(){
    debugger
      $.ajax({
        url: '/searches',
        type: 'get',
        dataType: 'json',
        data: {
          q: $('#value-search').val()
        },
        success: function(data){

            $('.modal-body').html(data.data_search);
        
        }
      })
    })
    $('.close-modal').click(function(){
    	$('#myModal').hide()
    	$('.modal-body').html(null)
    })
  })

