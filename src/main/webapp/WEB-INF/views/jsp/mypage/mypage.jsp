<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/css/mypage.css">		
<script src="/resources/js/mypage.js"></script>

<div class="mypageContent">
	<div class="userinfo">
		<div class="userinfo_box">
		  	<span class="mypage_id">😀아이디:${id}</span>
		  	<span class="mypage_name" style="margin-left: 20px;">🤷‍♀️이름: ${name}</span>
		  	<span class="mypage_nickname" style="margin-left: 20px;">🕵️‍♂️닉네임: ${nickname}</span>
		  	<span class="modal_closebtn mypage_closebtn" style="position:absolute; right: 8%; top: 4.2%;">&times;</span>
	 	</div> 
       	     	    
	</div>
	<div class="mypageContainer">
 	<div class="userinfo2">
		<button class="btn btn-danger update_info" style="height:45px; float:right; margin: 5px;">수정</button>   
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
 	
    <div class="mypage_subtitle"><b>가입한 커뮤니티</b></div>
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

<script>
$(function(){
	$('.mypageContent').draggable({'cancel':'.mypageContainer', containment:'parent', scroll:false}
);
</script>