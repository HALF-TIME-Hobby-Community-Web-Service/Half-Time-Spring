$(() => {
  const commuID = sessionStorage.getItem('commuID');

  /* 일정 */
  var currentDate = new Date();
  var year = currentDate.getFullYear();
  var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
  var day = currentDate.getDate().toString().padStart(2, '0');
  var hours = currentDate.getHours().toString().padStart(2, '0');
  var minutes = currentDate.getMinutes().toString().padStart(2, '0');

  var formattedDate = year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;

  $('.startTime').attr('min', formattedDate);
  $('.startTime').val(formattedDate);
  $('.endTime').attr('min', formattedDate);
  $('.endTime').val(formattedDate);  

  $('#endTime').change(function () {
    if ($(this).prop('checked')) {
      $('.endTime').css('visibility', 'visible');
    } else {
      $('.endTime').css('visibility', 'hidden');
    }
  });



  /* 폼 전송 */
  $('.lmake_container form').submit(() => {
    $('.lmake_text').html(function(index, oldHtml) {
    	return oldHtml.replace(/(?:\r\n|\r|\n)/g, '<br/>');
    });
       
    
    var formData = $('.lmake_container form').serialize();    
    formData += `&commuID=${commuID}`;
        
    if ($('.startTime').val() > $('.endTime').val()) {
      swal('모임 생성 실패!', '모임의 끝나는시간이 시작시간보다 빠릅니다!^', 'warning'); 
    } else {
      $.ajax({
        url: 'http://localhost:8888/commu/lmake',
        method: 'POST',
        data: formData,
        success: () => {
	        $.ajax({
			    url: `http://localhost:8888/commu/lget`,
			    method: 'POST',
			    data: {commuID : commuID},
			    success: (data) => {   
			      $('.ljoin_container').html('');
			        $('.ljoin_container').append(
			        '<div class="ljoin_box_clone">' +
				      '<div class="ljoin_box_title">' +
				        '<span class="ljoin_box_date1"></span>' +
				        '<span class="ljoin_box_dday"></span>' +
				      '</div>' +
				      '<div class="ljoin_box_container">' +
				        '<p></p>' +
				        '<div>일시: <span class="ljoin_box_date2"></span></div>' +
				        '<div>위치: <span class="ljoin_box_location"></span></div>' +
				        '<div>내용: <span class="ljoin_box_text"></span></div>' +
				        '<div>금액: <span class="ljoin_box_price"></span></div>' +
				        '<div>정원: <span class="ljoin_box_count" style="color:red"></span><span class="ljoin_box_capacity"></span>' +
				          '<button class="btn btn-primary ljoin_joinbtn">참가하기</button>' +
				        '</div>' +
				      '</div>' +
				    '</div>' 
				    );   
			      data.forEach((element) => {			      
			        appendGathering(element);
			      });
			    },
			    error: (jqXhr, status) => {
			      alert(`모임 불러오기 실패~~`);
			    },
			  });
	          swal('모임 생성 성공!', '모임을 홍보해보세요!', 'success');       
        },
        error: (jqXhr, status) => {
          swal('오류 발생!', `${status}`, 'error');
        },
      });
    }

    return false;
  });

  $('.lmake_btn').on('click', function () {
   	var currentValue = parseInt($('.cap').val(), 10);
	  if ($(this).hasClass('lmake_cap_plus')) {
	    currentValue++;
	  } 
	  else if ($(this).hasClass('lmake_cap_minus')) {
	    currentValue--;
	    if (currentValue < 2) 
	      currentValue = 2;
	  }
	  else
	    return;
	  
	  $('input[name=capacity]').val(currentValue);
  });


  /* 금액 */
  $('.lmake_btn2').on('click', function () {
   	var currentValue = parseInt($('input[name=price]').val(), 10);
   	
    if ($(this).hasClass('lmake_price_plus')) {
      currentValue += 10000;
    } 
    else if ($(this).hasClass('lmake_price_minus')) {
      currentValue -= 10000;
      if (currentValue <= 0) 
      	currentValue = 0;
    }
    else
    	return;
    
    $('input[name=price]').val(currentValue);
  });
  
  
});
