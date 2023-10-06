<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<script src="/resources/js/mypage.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
.mypageContent {
	width: 700px;
	height: 700px;
	 
	margin-left: 25%;
	margin-top: 30px;
	
	border: 1px solid; 
	background-color: rgb(247, 237, 224);
}

.userinfo {
	border: 1px solid;
	font-size: 24px;
	height: 6%;
}

.userinfo > span {
	margin-left: 10px;
}

.mypageContainer_myCommu {
	height:45%; 
	
	border: 1px solid;
}

.mypageContainer_updateInfo {
	float: right;
}

</style>
</head>
<body>
    <div class="mypageContent">
    	<div class="userinfo">
	    	<span>😀아이디</span>
	    	<span>🤷‍♀️이름</span> |
	    	<span>🎂나이</span>
	    	<span>❤성별</span>
	    	<span>🌎주소</span> 
	    	<div class="mypageContainer_updateInfo">
            	<button class="btn" style="border: 1px solid">수정</button>
        	</div>      
    	</div>
        <div style="border: 1px solid;" >가입된 커뮤니티 </div>
        <div class="mypageContainer_myCommu">
             커뮤니티 띄워주세용 여기에~
        </div>
        
    </div>

</body>

</html>