<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<title>Login page</title>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	let form = $(".login_form");
	let login_btn=$(".login_button");
	login_btn.on("click",function(e) {
		alert("로그인 버튼 클릭");
		 $.ajax({
			url:"/user/login",
			type:"post",
			data: form.serialize(),
			success: function(data){
				alert(data);
			},
			error: function(jqXhr,status){
				alert("실패");
			} 	
		});
	});
    </script>
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
			onclick="location.href='../jsp/login_findID.html'">아이디 찾기</button>
		<button class="login_findPWbtn"
			onclick="location.href='../jsp/login_findPW.html'">비밀번호 찾기</button>
		<br> <br>
		<!--가입하기 페이지로 이동시키기-->
		<!-- <form method="post" action="http://127.0.0.1:5501/front/html/join.html"> -->
		<button class="join_button" onclick="location.href='../jsp/join.html'">가입하기</button>
		<!-- </form> -->
	</div>


</body>

</html>