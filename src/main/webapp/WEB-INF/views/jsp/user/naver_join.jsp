<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">  
    <link rel="stylesheet" href="/resources/css/join.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="/resources/js/join_naver.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
	
</head>
<body>

 <div class="login_container_logo">
        <a class="navbar-brand" href="./login" id="logo">HALF-TIME</a>
    </div>
    <div class="join_content">
        <form class="join_container">
            <div class="join_container_border">
                <div class="join_ID_box" hidden>
                <!-- 아이디 안보이게 가리기 -->
                   	아이디
                  
                            <input class="form-control join_ID_input" 
                                type="text"
                                name="join_ID"
                                maxlength="10"
                                style="background-color: #bbb9b9;"
                                required="required"
                                value="${naverID}"
                                readonly>
                </div><br>

				<!-- 비밀번호 보이지는 않지만 db에 저장되게 하기 -->
				<!-- 이름 안보이게 가리기 -->
                <div class="join_name_box" hidden>
                    이름
                    <input class="join_name_input"
                        type="text"
                        name="join_name"
                        style="background-color: #bbb9b9;"
                        required="required"
                        value="${name}"
                        readonly
                        >
                </div><br>
                
                <div class="join_birth_box" >
                    생년월일
                    <br>
                    <input class="form-control join_birth_input"
                        type="date"
                        name="join_birth"
                        required="required"> 
                </div><br>
                
                <!-- 성별도 안보이게 하기 -->
                <div class="join_gender_box" hidden>
                    성별
                    	
                    	 <input class="join_gender_input" 
                                type="text"
                                id= "join_gender"
                                name="join_gender"
                                style="width: 150px; background-color: #bbb9b9;"
                                required="required"
                                value="${gender}"
                                readonly>
                    	
                </div><br>

                <div class="join_address_box">
                    주소
                    <br>
                    <input class="form-control join_address_input"
                    type="text"
                    name="join_address">
                </div><br>

                <div class="join_pnum_box">
                    핸드폰 번호
                    <br>
                    <select class="form-select form-select-lg mb-3 join_pnum_select" name="join_pnum1" style="width:100%">
                        <option value="010" selected>010</option>
                        <option value="011">011</option>
                        <option value="017">017</option>
                    </select>
                    <br>
                        <input class="form-control join_pnum1_input"
                            type="tel"
                            maxlength="4"
                            name="join_pnum2"
                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                            required="required"
                            >
                            <br>
                        <input class="form-control join_pnum2_input"
                        type="tel"
                        maxlength="4"
                        name="join_pnum3"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                        required="required"
                       >
                       
                </div><br>
                
                <div class="join_nickname_box" hidden>
                    닉네임
                    <input class="join_nickname_input"
                    type="text"
                    name="join_nickname"
                    maxlength="8"
                    placeholder="최대8자리"
                    style="background-color: #bbb9b9;"
                    required="required"
                    value="${nickname}"
                    >
                </div><br>
            </div>
            <button class="btn btn-light join_nextpagebtn1">다음</button>
        </form>
    </div>
</body>
 
</body>

  <script type="text/javascript">
  
  window.onload = function() {
      var birthInput = document.querySelector('input[name="join_birth"]');
      var today = new Date();
      var minDate = new Date(1900, 0, 1); 
      birthInput.setAttribute('min', minDate.toISOString().split('T')[0]);
      birthInput.setAttribute('max', today.toISOString().split('T')[0]);
  };
  
    const naverID = sessionStorage.getItem('naverID');	
	const id = $('join_ID_input');		
		
  var naver_id_login = new naver_id_login("ti9znvrk0HWNWiRlqWm8", "http://localhost:8888/user/naver_join");
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    const nickname = (naver_id_login.getProfileData('nickname'));
 	const gender = (naver_id_login.getProfileData('gender'));
 	const name = (naver_id_login.getProfileData('name'));

 	sessionStorage.setItem('nickname','gender','name');
 	
 	  $.ajax({ 
 		  		data:{"nickname":nickname,
 		  			  "gender":gender,
 		  			  "name":name},
 		  		url:'/user/naver',
 		  		method:'get',
 		  		success:(data)=>{
 		  		 $('body').html(data);
 		  		 
 		  		}
 	  })
 	
  }
  </script>
  



</html>