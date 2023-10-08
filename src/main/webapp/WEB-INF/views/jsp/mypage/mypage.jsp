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
	margin-top: 40px;
	
	border: 3px solid; 
	background-color: white;
}



.userinfo {
	height: 10%;
	
	margin-top: 20px;
	margin-left: 5%;
	margin-right: 5%;
	padding-top: 15px;
	padding-bottom: 10px;
	
	font-size: 24px;	
	font-weight: bolder;
	
	border: 1px solid;
	border-radius: 5px;
	background-color: #f6f4eb;
}

.userinfo_box {
	display: flex;
	justify-content: center;
	width: 90%;
	float:left;
}

.userinfo > span {
	margin-left: 10px;
}

.update-btn {
	margin-bottom: 5px;
	margin-right: 3px;
}


.mypageContainer {
	margin-left: 5%;
	margin-right: 5%;
	margin-top: 25px;
	
	height: 80%;
	
	border: 1px solid;
	border-radius: 5px;
	 
	background-color:  #fffae5;
	font-size: 18px;
}

.userinfo2 {
	display:flex;
	justify-content: center;
	
	border-bottom: 1px solid;
}

.mypage_subtitle {
	margin-top: 5px;
	text-align: center;	
	border-bottom: 1px solid;
}

.mypage_commu_container {
	overflow-y: auto;	 
	height: 89%;
}

.mypage_commu_box {
	border: 1px solid;
	width: 100%;
	height: 100px;
}


/* mypage_commu_img */
.mypage_commu_box > img {
	border: 1px solid;
	width: 100px;
	height: 100px;
	float: left;
}


.mypageContainer_myCommu {
	
}

</style>
</head>
<body>
    <div class="mypageContent">
    	<div class="userinfo">
    		<div class="userinfo_box">
		    	<span class="mypage_id">😀아이디</span>
		    	<span class="mypage_name" style="margin-left: 20px;">🤷‍♀️이름</span>
		    	<span class="mypage_nickname" style="margin-left: 20px;">🕵️‍♂️닉네임</span>
	    	</div> 
           	<button class="btn btn-danger update-btn" >수정</button>        	    
    	</div>
    	<div class="mypageContainer">
	    	<div class="userinfo2">    	
		    	<span>🎂나이</span>
		    	<span>❤성별</span>
		    	<span>🌎주소</span> | 
	    		<span>👀관심취미</span>
	    		<span>🌎관심지역</span>
	    	</div>
	        <div class="mypage_subtitle">가입한 커뮤니티 </div>
	    	<div class="mypage_commu_container">
	          <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>	
		      <div class="mypage_commu_box">
	             <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
	             <div style="float: left">
	             	<div style="margin-top: 5px;">이름: <span class="commu_name"></span></div>
	             	<div>지역: <span class="commu_location"></span></div>
	             	<div>장르: <span class="commu_category"></span></div>
	             </div>		             
		      </div>		              
	        </div>	        
        </div>
    </div>

</body>

</html>