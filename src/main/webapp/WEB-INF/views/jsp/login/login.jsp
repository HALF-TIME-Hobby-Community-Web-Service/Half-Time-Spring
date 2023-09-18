<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/login.css">



<title>Login page</title>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<body>
	<div class="login_class">
		<div class="login_container_logo">
			<a class="navbar-brand" href="./feed.html" id="logo">HALF-TIME</a>
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
		<button>카카오</button>
		<button>페이스북</button>
		<button>구글</button>
		<br> <br>
		<button class="login_findIDbtn"
			onclick="location.href='http://localhost:8888/user/findid'">아이디 찾기</button>
		<button class="login_findPWbtn"
			onclick="location.href='../jsp/login_findPW.html'">비밀번호 찾기</button>
		<br> <br>
		<!--가입하기 페이지로 이동시키기-->
		<!-- <form method="post" action="http://127.0.0.1:5501/front/html/join.html"> -->
		<button class="join_button" onclick="location.href='http://localhost:8888/user/join1'">가입하기</button>
		<!-- </form> -->
	</div>

<script>

	let form = $(".login_form");
	let login_btn=$(".login_button");
	
	login_btn.on("click",function(e) {
		e.preventDefault();
		alert("로그인 버튼 클릭");
		console.log("에러1");
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
					alert("true"+data.result);
					location.href="/user/mypage";			
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