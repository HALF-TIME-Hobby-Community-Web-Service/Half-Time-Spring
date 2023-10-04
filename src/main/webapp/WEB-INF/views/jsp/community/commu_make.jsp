<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="modal.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

  <style>
    /* 모달 전체 적용 */
    .cmake_content {
      z-index: 30000;
      width: 600px;
    }

    .cmake_container{
      overflow-x: hidden;

      height: 80%;
      padding-top: 20px;
      margin: 20px;

      background: #fffae5;     
      

      border: 1px solid;
      border-radius: 5px;
    }    

    .cmake_form {  
      width: 300%;
      height: 500px;
      transition: all 0.3s;   
      margin-left: 5%;   
    }

    .cmake_left, .cmake_center, .cmake_right {
      width: 31%;
      margin-left: 1%;
      margin-right: 1%;
      float: left;    
    }

    .cmake_form  input, textarea{
      width: 90%;
      margin-bottom: 3px;
    }

    .modal_subtitle {
      font-size: 32px;
      font-weight: bold;
      margin-bottom: 30px;
      padding-bottom: 10px;
      border-bottom: 0.5px solid lightgray;
      width: 90%;      
      text-align: center;
    }

    hr {
      width: 90%;
    }

    .mtop30px {
      margin-top: 30px;
    }

    /* 버튼 */
    .buttonBox {
      margin-top: 50px;
      margin-bottom: 50px;
      display: flex;
      justify-content: center;
      margin-left: -10%;
    }    
    
    .buttonBox button {
      margin: 5px;
      width: 25%;
    }

    /* 커뮤니티 기본 정보 */
    .selectbox {
      display:flex;
      width: 100%;
    }

    .selectBox select{
      display: flex;      
      width: 45%;
      float:left;
      margin-bottom: 3px;
    }

    /* 커뮤니티 대표 이미지 */
    .commu_img {
      height: 60%;
      width: 60%;

      margin-left: 15%;
      margin-top: 30px;
      margin-bottom: 30px;

      border: 0.5px solid lightgray;
      background: #fff;
    }
    
    .commu_file {
      display: none;
    }

    /* 커뮤니티 설정 */
    .genderbox select{
      display: flex;      
      width: 90%;
      margin-bottom: 3px;
    }

    .age_box{
      display: none;
      width: 50%;
      margin-top: 10px;
    }

    .genderbox {      
      display: none;
      margin-top: 10px;
    }

  </style>
</head>
<body>
  <div class="modal_content cmake_content">
    <div class="modal_title"> 
	   	⚡커뮤니티 개설
    <span class="modal_closebtn cmake_closebtn">&times;</span>
	  </div>
    
    <div class="cmake_container">      
      <form class="cmake_form" method="post" action="">         
        <div class="cmake_left">
          <div class="modal_subtitle">커뮤니티 기본 정보</div>
          <input class="form-control" name="commu_title" placeholder="커뮤니티 이름" required/>
          <textarea  placeholder="커뮤니티 소개" class="form-control" name="commu_intro" style="width: 90%; height: 200px; max-height: 400px; " cols="40" wrap="hard" required></textarea>
          
          <div class="form-floating selectBox">
            <select class="form-select lcate">
              <option>카테고리 대분류</option>            
            </select>
            <select class="form-select scate">
              <option>카테고리 소분류</option>            
            </select>
          </div>
          <input class="form-control" name="commu_title" placeholder="커뮤니티 지역" />
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-primary next">다음</button>          
          </div>
        </div>
        <div class="cmake_center">
          <div class="modal_subtitle">커뮤니티 대표 이미지</div>
          <img class="commu_img" src="/resources/items/moment/moment_default.png" />
          <input type="file" class="form-control commu_file" name="commu_file" /> 
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-danger back">이전</button>
            <button type="button" class="btn btn-primary next">다음</button>
          </div>
        </div>
        <div class="cmake_right">
          <div class="modal_subtitle">커뮤니티 설정</div>
          <input class="form-control" name="capacity" type="number" placeholder="커뮤니티 총원 (기본: 50)"/>  

          <div class="form-check form-switch mtop30px">
            <input class="form-check-input age_check" type="checkbox" role="switch" id="flexSwitchCheckDefault">
            <label class="form-check-label" for="flexSwitchCheckDefault">나이제한</label>
          </div>          
          <div class="age_box">
            <input class="form-control age" name="age_min" type="number"  placeholder="최소" />
            <input class="form-control age" name="age_max" type="number"  placeholder="최대" />
          </div>
          <div class="form-check form-switch mtop30px">
            <input class="form-check-input gender_check" type="checkbox" role="switch" id="flexSwitchCheckDefault">
            <label class="form-check-label" for="flexSwitchCheckDefault">성별제한</label>
          </div>
          <div class="form-floating genderbox" >
            <select class="form-select" name="gender">
              <option value="all">성별 - 모두</option>
              <option value="woman">여자만</option>
              <option value="man">남자만</option>
            </select>
          </div>
          <hr>
          <div class="buttonBox">
            <button type="button" class="btn btn-danger back">이전</button>
            <button type="submit" class="btn btn-success create">커뮤니티 생성</button>
          </div>
        </div>
      </form>      
    </div>
  </div>
  
  <script>
    $(function() {
	  $('.cmake_content').draggable({'cancel':'.cmake_container', containment:'parent', scroll:false});
    });
	//닫기 버튼
	
	$('.cmake_closebtn').click(()=> {    	
	  $('.cmake_content').css('display', 'none');
	  $('.cmake_form')[0].reset();
	  $('.commu_img').attr('src', '/resources/items/moment/moment_default.png');
	  x = 0;
	  $('.cmake_form').css('transform', 'translateX(0%)');
	})
	 
    let x = 0;    
    $('.next').click(() => {
      var form = $('.cmake_form');         
      if (x == -66) {
        x = 0;
        form.css('transform', 'translateX(' + x + '%)');
      }
      else {
        x -= 33;
        form.css('transform', 'translateX(' + x + '%)');
      }
    });

    $('.back').click(() => {
      var form = $('.cmake_form');         
      if (x == -33) {
        x = 0;
        form.css('transform', 'translateX(' + x + '%)');
      }
      else {
        x = -33;
        form.css('transform', 'translateX(' + x + '%)');
      }
    });

    $('.commu_img').click(()=> {
      $('.commu_file').click();
    })

    $('.commu_file').change(function(e) {
      alert('안세준 일해라');
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
           	 	SmallCate.append('<option value="소분류">소분류</option>');
            	$.each(data, function (index, item) {	 
            		SmallCate.append('<option value="'+ item +'">'+ item +'</option>');
				});
            },error: function(error) {
                        console.log("smallCategory error");
            console.error('데이터를 가져오는 중 오류가 발생했습니다:', error);
        }
        });
    });
  </script>
</body>