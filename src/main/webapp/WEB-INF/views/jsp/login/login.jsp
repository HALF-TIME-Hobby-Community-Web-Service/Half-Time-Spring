<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% response.setHeader("Access-Control-Allow-Origin", "*"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="153411467894-hb0a8uu4blq7dpkuhhi83apucdgd1s1s.apps.googleusercontent.com">

<title>Login page</title>

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<link rel="stylesheet" href="/resources/css/join.css">
<link rel="stylesheet" href="/resources/css/login.css">
</head>

<body>
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
					<button class="login_button">로그인</button>
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
	                           		
	                           		 $('body').html(data);
	                           	 }
                             });   
                        }
                    });
                }
            });
        }
    </script>    
  <br>


    <!--구글 로그인 -->

    <div style="display: flex; justify-content: center;">
       <div class="g-signin2" data-onsuccess="onSignIn" data-width="275" data-height="55" data-clientid="153411467894-hb0a8uu4blq7dpkuhhi83apucdgd1s1s.apps.googleusercontent.com" data-scope="profile email"></div>
	</div>
     <script>
     
        function onSignIn(googleUser) {
          console.log('구글 하이');
		  const profile = googleUser.getBasicProfile();
		  console.log('구글 하이');
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  
		  const googleId = profile.getId();
		  const googleName = profile.getName(); 
		  
		  const id_token = googleUser.getAuthResponse().id_token;
		  console.log("ID Token: " + id_token);
		  
		  $.ajax({ 
            	 data:{"googleId":googleId,
            		   "googleName":googleName },
            	 url: '/user/google',
            	 method: 'get',
            	 success:(data)=>{
            		 location.href="/hf";//임시로 해놓음 
            	 }
          });  
}
    </script>



    <br> <br>
		<button class="login_findIDbtn"
			onclick="location.href='http://localhost:8888/user/findid'">아이디 찾기</button>
		<button class="login_findPWbtn"
			onclick="location.href='http://localhost:8888/user/findpw'">비밀번호 찾기</button>
		<br> <br>
		<button class="join_button" onclick="location.href='http://localhost:8888/user/join1'">가입하기</button>
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
					alert("false"+ data.result);
					location.href="/user/login";
					
				}else{
					alert("환영합니다");
					location.href="/hf";			
				}
			},
			error: function(jqXhr,status){
				alert("status : " + status);
			} 	
		});
	})
    </script>
</body>

</html>