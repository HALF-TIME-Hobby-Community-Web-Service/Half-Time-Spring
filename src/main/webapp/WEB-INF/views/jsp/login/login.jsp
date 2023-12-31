<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% response.setHeader("Access-Control-Allow-Origin", "*"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="153411467894-hb0a8uu4blq7dpkuhhi83apucdgd1s1s.apps.googleusercontent.com">

<title>로그인</title>

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/join.css">
<link rel="stylesheet" href="/resources/css/login.css">
    <style>
    .custom-bg {
        background-color: #e5e2d1;
    }
	</style>
</head>

<body class="custom-bg">
	<div class="login_class">
		<div class="login_container_logo">
			<a class="navbar-brand" href="../hf" id="logo">HALF-TIME</a>
		</div>
		<div class="login_container_login">
			<div class="login_container_login_inside">
				<form class="login_form" method="post">
					<!--<form method="post" action=""> 로그인버튼 누르면 어디로 이동하기 js 말고 여기에 써두기-->
					<fieldset>
						<input name="id" id="id" placeholder="사용자 아이디">
					</fieldset>
					<fieldset>
						<input name="pwd" id="pwd" type="password" placeholder="비밀번호">
					</fieldset>
				
					<button class="login_button" style="height:50px; font-weight: bolder; border-radius:5px;">로그인</button>
				</form>
			</div>
		</div>
		<div class="login_container_or">
			<div class="login_or">또는</div>
			<br> <br>
		</div>
		
		<!-- 카카오로그인 -->
		<a href="javascript:kakaoLogin();">
    <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 60px;width:auto;">
    </a>
    <div style="display: none">
    	<form class='kakaoform' action="localhost:8888/user/kakao">
    		<input type="hidden" name="kakaoID" class="hidden"/> 
    	</form>
    </div>

    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //9cde8b36ed8b7ae0a58142aed15d3972
        //1. 카카오 로그인 성공 및 아이디 반환
        window.Kakao.init("9cde8b36ed8b7ae0a58142aed15d3972");
        function kakaoLogin(){
            window.Kakao.Auth.login({
                scope:'profile_nickname, account_email, gender',
                success: function(authObj){
                    console.log(authObj);
                    console.log("access_token: "+authObj.access_token);
                    window.Kakao.API.request({
                        url:'/v2/user/me',
                        success: res => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                            const kakaoID = kakao_account.email +":kakao";
                            const kakaoGender = kakao_account.gender;
                          	const kakaoNickname = kakao_account.profile.nickname;
                          	const kakaoPWD = kakaoID+"123";
                          	
                            console.log("kakaoID : "+kakaoID);
                            console.log("kakaoGender : "+kakaoGender);
                            console.log("kakaoNickname: "+kakaoNickname);
                            
                           
                          	//2. 카카오 로그인 성공 및 아이디 반환
                          	sessionStorage.setItem('kakaoID', kakaoID, 'kakaoGender', kakaoGender, 'kakaoNickname', kakaoNickname);
                            
                          	//3. kakao_join으로 페이지 이동 (controller 호출)
                              $.ajax({ 
	                           	 data:{"kakaoID":kakaoID,
	                           		   "kakaoGender":kakaoGender, 
	                           		   "kakaoNickname":kakaoNickname,
	                           		   "kakaoPWD":kakaoPWD},
	                           	 url: '/user/kakao',
	                           	 method: 'get',
	                           	 success:(data)=>{
	                           		//location.href = "/hf";
	                           		$('body').html(data);
	                           	 }
                             });   
                        }
                    });
                }
            });
        }
    </script>    
    
    <!-- 네이버 로그인 -->
	<div id="naver_id_login"></div>
	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("ti9znvrk0HWNWiRlqWm8", "http://localhost:8888/user/naver");
  											//클라이언트 아이디 			//로그인 후, 리디렉션 될 url
  	var state = naver_id_login.getUniqState();
 	//토큰 생성 (로그인 요청의 유효성 확인)
  	naver_id_login.setButton("white", 25,60);
	
 	naver_id_login.setDomain("http://localhost:8888/user/naver");
 	//로그인 후 리디렉션 될 도메인 (전에는 /login으로 함)
  	naver_id_login.setState(state);
  	//naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
  </script>
  

 
</script>
   
		<br> <br>
		<button class="login_findIDbtn"
			onclick="location.href='http://localhost:8888/user/findid'" style="height:50px; font-weight: bolder; border-radius:5px;">아이디 찾기</button>
		<button class="login_findPWbtn"
			onclick="location.href='http://localhost:8888/user/findpw'" style="height:50px; font-weight: bolder; border-radius:5px;">비밀번호 찾기</button>
		<br> <br>
		<button class="join_button" onclick="location.href='http://localhost:8888/user/join1'" style="height:50px; font-weight: bolder; border-radius:5px;">가입하기</button>
	</div>

<script>
	let form = $(".login_form");
	let login_btn=$(".login_button");
	
	
	login_btn.on("click",function(e) {

		e.preventDefault();
		 $.ajax({
			url:"/user/login",
			type:"post",
			dataType: "json",
			data: form.serialize(),
			success: function(data){				
				if(!data.result){
					Swal.fire({
						  title: '로그인 실패!',
						  text: '아이디 또는 비번이 틀렸습니다!',
						  icon: 'error'
						}).then((result) => {
						  if (result.isConfirmed) {
						    // 여기에서 페이지 이동을 수행
						    location.href = "/user/login";
						  }
					});					
				}else{		
					Swal.fire({
						  title: '로그인 성공!',
						  text: '환영합니다',
						  icon: 'success'
						}).then((result) => {
						  if (result.isConfirmed) {
						    // 여기에서 페이지 이동을 수행
						    location.href = '/hf';
						  }
					});				
				}
			},
			error: function(jqXhr,status){
				alert("아이디 혹은 비밀번호를 다시 입력해주세요 ");
				//swal('에러!', "",'error')
			} 	
		});
	})
    </script>
</body>

</html>