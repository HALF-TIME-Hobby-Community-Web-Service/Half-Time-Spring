<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="/resources/js/mypage.js"></script>
		
<style>
.mypageContent {
	z-index: 300;
	width: 700px;
	height: 800px;
	
    position: fixed;
    top: 5%;
    left: 27.5%;
	 
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
	padding-top: 25px;
	padding-bottom: 10px;
	
	font-size: 18px;	
	font-weight: bolder;
	
	border: 1px solid;
	border-radius: 5px;
	background-color: #fffae5;
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
	border-bottom: 1px solid;
}

.mypage_subtitle {
	margin-top: 5px;
	text-align: center;	
	border-bottom: 1px solid;
}

.mypage_commu_container {
	overflow-y: auto;	 
	height: 86.2%;
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



/* etc */
.marginleft30px {
	margin-left: 30px;
}

</style>

    <div class="modal_content mypageContent">
    	<div class="userinfo">
    		<div class="userinfo_box">
		    	<span class="mypage_id">😀아이디:${id}</span>
		    	<span class="mypage_name" style="margin-left: 20px;">🤷‍♀️이름: ${name}</span>
		    	<span class="mypage_nickname" style="margin-left: 20px;">🕵️‍♂️닉네임: ${nickname}</span>
		    	<span class="modal_closebtn mypage_closebtn">&times;</span>
	    	</div> 
           	<button class="btn btn-danger update_info" >수정</button>        	    
    	</div>
    	<div class="mypageContainer">
	    	<div class="userinfo2">
	    		<div>    	
		    		<span >🎂나이: ${birth} </span>
		    		<span class="marginleft30px">❤성별: ${gender} </span>
		    		<span class="marginleft30px">🌎주소: ${address}</span>
		    	</div> 
		    	<div>
	    			<span>👀관심취미:${categoryName}  </span>
	    			<span class="marginleft30px">🌎관심지역:${locationName} </span>
	    		</div>
	    	</div>
	    	
	    	
	    	
	
        <div class="mypage_subtitle">가입한 커뮤니티 </div>
	    	<div class="mypage_commu_container">
          		<c:forEach items="${commu}" var="commuItem">
	    		  <div class="mypage_commu_box">
		            <img class="mypage_commu_img" src="/resources/items/commu/commu_page/1.jpg" alt="안녕" />
		            <div style="float: left">
		             	<div style="margin-top: 5px;">이름: ${commuItem.commuName}<span class="commu_name"></span></div>
		             	<div>지역:${commuItem.commuLocation} <span class="commu_location"></span></div>
		             	<div>장르:${commuItem.commuCategory} <span class="commu_category"></span></div>
		             </div>		             
			      </div>
				</c:forEach> 		             
	        </div>	        
        </div>
    </div>