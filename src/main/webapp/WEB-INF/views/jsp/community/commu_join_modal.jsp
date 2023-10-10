<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>


  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/resources/css/modal.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  
  <style>
  	.cjoin_content {
  	  z-index: 2;
	  display: none;
	  position: fixed;
	
	  overflow-y: auto;
	  width: 500px;
	
	  top: 25%;
	  left: 40%;
	
	  margin-top: 10px;
	  margin-left: 10px;
	  background: white;
	  border: 2px solid;
  	}
  	
  	.commutitle {
  		font-weight: bold;
  		font-size: 24px;
  		padding-bottom: 10px;
  		margin-bottom: 20px;
  		border-bottom: 1px solid;
  	}
  </style>
  
  <div class="cjoin_content">
    <div class="modal_title">👨‍👩‍👧‍👦커뮤니티 가입<span class="modal_closebtn">&times;</span></div>
    <div class="modal_container cjoin_container" style="padding-bottom: 30px;">
      <div class="commutitle"></div>
      <input class="form-control nickname" name="nickname" style="width: 70%;" placeholder="닉네임" required>
      <button type="button" class="btn btn-primary check_nickname_btn" style="float:right;">중복확인</button>
      <button class="btn btn-success cjoin_btn" style="width: 100%; margin-top: 30px; visibility: hidden;">커뮤니티 가입!</button>
    </div>
  </div>

  <script>  
  	$('.modal_closebtn').click(()=> {		 		  		
  		$('.cjoin_content').css('display','none');
	  	$('.cjoin_container > input').val('');
	  	$('.cjoin_btn').css('visibility', 'hidden');
  	})
  
  	//닉네임 중복체크
   	
    $('.check_nickname_btn').click(()=>{
   	  const nickname = $('.nickname').val();
   	  const commuID = sessionStorage.getItem("commuID");
   	  
      if (nickname == '') {
    	  swal('주의!', '닉네임을 입력해주세요', 'info');
    	  return;
      }
      else if (nickname.length < 2) {
    	  swal('주의!', '닉네임을 두 글자 이상 입력해주세요!', 'info');
    	  return;
      }    	
    	
	  $.ajax({
	    url: 'http://localhost:8888/community/checkmember', 
	    method: 'post',
	    data: { commuID: commuID, nickname: nickname }, 
		dataType: 'text',          
	    success: (response) => {     
	    	if (response=='OK') {
	    		$('.cjoin_btn').css('visibility', 'visible');
	    		swal('성공!', '사용되지 않은 닉네임입니다!', 'success');
	    	}
	    	else {
	    		swal('주의!', '중복된 닉네임 입니다!', 'error');
	    	} 
	    },
	    error: (jqXhr, status) => {
	    	swal('오류', '닉네임중복확인 에러', 'error');
	    },
	   });
      
    });

    $('.cjoin_btn').click(()=> {
       const nickname = $('.nickname').val();
       const commuID = sessionStorage.getItem("commuID");
    	
       $.ajax({
            url: 'http://localhost:8888/community/cjoin', 
            method: 'post',  
            data: { commuID: commuID, nickname: nickname },       
            dataType: 'text',   
            success: (response) => { 
            	$.ajax({
		            url: 'http://localhost:8888/commupage', // 불러올 페이지의 경로
		            method: 'get', // GET 요청
		            data: { commuID: commuID },            
		            success: (response) => {          	
		            	$('.cjoin_content').css('display','none');
		            	const modal = document.getElementById('modalWrap');
		            	modal.style.display = 'none';
	            		$('.commuevery').html(response); // 페이지 내용을 .feed_content에 삽입
		            },
		            error: (jqXhr, status) => {
		                alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
		            },
       			 });
            },
            error: (jqXhr, status) => {
                swal('오류', '닉네임중복확인 에러', 'error');
            },
        }); 
    })
    
  </script>