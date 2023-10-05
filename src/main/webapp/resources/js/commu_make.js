$(() => {
	$('.cmake_closebtn').click(()=> {    	
	  $('.cmake_content').css('display', 'none');
	  $('.cmake_form')[0].reset();
	  $('.commu_img').attr('src', '/resources/items/moment/moment_default.png');
	  $('textarea[name="commuintro"]').css('height', '200px');  
	  $('.age_box').css('display','none');
	  $('.gender_box').css('display','none');
	  x = 0;
	  $('.cmake_form').css('transform', 'translateX(0%)');
	})
	 
    let x = 0;    
    $('.next').click(() => {
      var form = $('.cmake_form');     
        x -= 25;
        form.css('transform', 'translateX(' + x + '%)');      
    });

    $('.back').click(() => {
      var form = $('.cmake_form');      
      x += 25;
      form.css('transform', 'translateX(' + x + '%)');
      
    });

    $('.commu_img').click(()=> {
      $('.commu_file').click();
    })

    $('.gender_check').change(()=> {
      if ($('.gender_check').is(':checked')) 
        $('.genderbox').css('display', 'block');
      else {
        $('.genderbox').css('display', 'none');
        $('.genderbox > select').val('all');
      }
    })

    $('.age_check').change(()=> {
      if ($('.age_check').is(':checked')) 
        $('.age_box').css('display', 'block');
      else {
        $('.age_box').css('display', 'none');
        $('.age').val('');
      }
    })
    
   $(".commu_file").on("change", function() {
      var input = this;
      var img = $(this).siblings(".commu_img"); // 이미지 요소를 선택합니다.

      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function(e) {
              // 선택한 이미지를 이미지 요소의 소스(src)로 설정합니다.
              img.attr("src", e.target.result);
          }

          reader.readAsDataURL(input.files[0]);
      }
    });
    
    const LargeCate = $('.lcate');
   	const SmallCate = $('.scate'); 
   
    $.ajax({
        url: 'http://localhost:8888/moment/modal_LargeCategory',
        method: 'POST',
        dataType: "json",
        success: function (data) {
            $.each(data, function (index, item) {
		    	LargeCate.append('<option value="'+ item +'">'+ item +'</option>');
			});
        },
        error: function(error) {
          console.log("largeCategory error");
          console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
    	}
    });

    
    $('.lcate').change(() => {
    	SmallCate.html('');
        $.ajax({
            url: 'http://localhost:8888/moment/modal_SmallCategory',
            method: 'POST',
            data:{largecate: LargeCate.val()},
            dataType: "json",
            success: function (data) {
           	 	SmallCate.append('<option value="소분류">카테고리 없음</option>');
            	$.each(data, function (index, item) {	 
            		SmallCate.append('<option value="'+ item +'">'+ item +'</option>');
				});
            },error: function(error) {
                        console.log("smallCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
        });
    });
    
    const form = $('.cmake_form');
    form.submit((e)=> {
	    e.preventDefault();
	    	    
	    checkBlank();
	    /*
	    
    	$.ajax({
            url: 'http://localhost:8888/commu/????',
            method: 'POST',
            data: $('.cmake_form').serialize(),
            success: function (data) {
           	 	alert('form submit 성공~');
            },error: function(error) {
            	alert('데이터를 가져오는 중 오류가 발생했습니다:', error);
        	}
        });//ajax끝
        */ 
    })
    
    const commuName = $('input[name="communame"]');
    function checkBlank() {		
    	if (commuName.val() == '') {
    		run_swal('커뮤니티 이름을 입력해주세요');
    	}				
		else {	
 	    	$.ajax({
	            url: 'http://localhost:8888/commu/checkcommuname',
	            method: 'POST',
	            data:{commuName: commuName.val()},
	            dataType: 'text',
	            success: function (data) {
	            	if (data =='fail')
           	 			swal('커뮤니티 생성 실패!', '이미 존재하는 커뮤니티 이름입니다', 'error');	
	            },error: function(error) {
	            	alert('데이터를 가져오는 중 오류가 발생했습니다');
	        	}
       		});//ajax끝
    	}
    }
    
    function run_swal(errorMSG) {
    	swal('커뮤니티 생성 실패!', errorMSG, 'warning');	
    }
})