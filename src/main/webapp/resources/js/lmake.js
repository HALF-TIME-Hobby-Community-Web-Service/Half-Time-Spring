$(() => {

  const commuID = sessionStorage.getItem('commuID');

  /* 일정 */
  var currentDate = new Date();
  var year = currentDate.getFullYear();
  var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
  var day = currentDate.getDate().toString().padStart(2, '0');
  var hours = currentDate.getHours().toString().padStart(2, '0');
  var minutes = currentDate.getMinutes().toString().padStart(2, '0');

  var formattedDate =
    year + '-' + month + '-' + day + 'T' + hours + ':' + minutes;

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
    
    alert($('.lmake_text').html());    
    
    var formData = $('.lmake_container form').serialize();    
    formData += `&commuID=${commuID}`;
        
    if ($('.startTime').val() > $('.endTime').val()) {
      alert('끝나는 시간이 시작시간보다 빠릅니다~~@!@@#@# ^^');
    } else {
      $.ajax({
        url: 'http://localhost:8888/commu/lmake',
        method: 'POST',
        data: formData,
        success: () => {
          alert('모임이 생성됐습니다~~')
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명:${jqXhr.status}`);
        },
      });
    }

    return false;
  });

  /* 정원 */
  $('.lmake_btn').on('click', function () {
    var inputField = $('input[name=capacity]');
    var currentValue = parseFloat(inputField.val());

    if ($(this).hasClass('lmake_cap_plus')) {
      currentValue++;
    } else if ($(this).hasClass('lmake_cap_minus')) {
      currentValue--;
      if (currentValue < 0) 
      currentValue = 0;
    }

    inputField.val(currentValue.toString().padStart(2, '0') + '명');
  });

  /* 금액 */
  $('.lmake_btn').on('click', function () {
    var inputField = $('input[name=price]');
    var currentValue = parseFloat(inputField.val());

    if ($(this).hasClass('lmake_price_plus')) {
      currentValue += 10000;
    } else if ($(this).hasClass('lmake_price_minus')) {
      currentValue -= 10000;
      if (currentValue < 0) currentValue = 0;
    }

    inputField.val(currentValue.toString().padStart(2, '0') + '원');
  });
});
