<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">  
    <link rel="stylesheet" href="/resources/css/join.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/join_kakao.js"></script>
    <title>join page</title>
    
    
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
                <div class="join_ID_box">
                    아이디
                    <br>
                            <input class="form-control join_ID_input" 
                                type="text"
                                name="join_ID"
                                maxlength="10"
                                style="background-color: #bbb9b9;"
                                required="required"
                                value="${id}"
                                readonly>
                </div><br>
                
                <!-- 비밀번호 css display:none 적용 안됨 -->
                <!-- 비밀번호 임시 : kakaoID + 123 -->         
                
                <div class="join_name_box">
                    이름
                    <input class="form-control join_name_input"
                        type="text"
                        name="join_name"
                        required="required">
                </div><br>
                <div class="join_birth_box">
                    생년월일
                    <input class="form-control join_birth_input"
                        type="date"
                        name="join_birth"
                        required="required"> 
                </div><br>
                <div class="join_gender_box">
                    성별
                    	
                    	 <input class="form-control join_gender_input" 
                                type="text"
                                id= "join_gender"
                                name="join_gender"
                                style=" background-color: #bbb9b9;"
                                required="required"
                                value="${kakaoGender}"
                                readonly>
                    	
                </div><br>

                <div class="join_address_box">
                    주소
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
                <div class="join_nickname_box">
                    닉네임
                    <input class="form-control join_nickname_input"
                    type="text"
                    name="join_nickname"
                    maxlength="8"
                    placeholder="최대8자리"
                    required="required"
                    value="${kakaoNickname}"
                    >
                </div><br>
            </div>
            <button class="btn btn-light join_nextpagebtn1">다음</button>
        </form>
    </div>
</body>
<script type="text/javascript">

window.onload = function() {
    var birthInput = document.querySelector('input[name="join_birth"]');
    var today = new Date();
    var minDate = new Date(1900, 0, 1); 
    birthInput.setAttribute('min', minDate.toISOString().split('T')[0]);
    birthInput.setAttribute('max', today.toISOString().split('T')[0]);
};

	const kakaoID = sessionStorage.getItem('kakaoID');	
	const id = $('join_ID_input');		
		
	// 아이디 입력란의 값을 가져옵니다.
	const idInput = document.querySelector('.join_ID_input');
	const idValue = idInput.value;

	// 뒤의 6글자를 *로 숨깁니다.
	const hiddenPart = ''.repeat(6);
	const visiblePart = idValue.slice(0, -6);

	// 숨긴 부분과 보이는 부분을 합쳐서 다시 아이디 입력란에 설정합니다.
	idInput.value = visiblePart + hiddenPart;
	
	
</script>
</html>