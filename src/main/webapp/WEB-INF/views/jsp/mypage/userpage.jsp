<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<link rel="stylesheet" href="/resources/css/mypage.css">	
<script src="/resources/js/mypage.js"></script>

</style>
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
 		<div>    	
	  		<span >🎂나이: ${birth} </span>
	  		<span class="marginleft30px">❤성별: ${gender} </span>
	  		<span class="marginleft30px">🌎주소: ${address}</span>
  		</div> 
  		<div>
 			<span>👀관심취미: </span>
 			<span class="marginleft30px">🌎관심지역: </span>
 		</div>
 	</div>
 	
    <div class="mypage_subtitle"><b>가입한 커뮤니티</b></div>
 	<div class="mypage_commu_container">
 		<c:forEach items="${commu}" var="commuItem">
 		  <div class="mypage_commu_box">
	          <div style="float: left">
	           	<div style="margin-top: 5px;">이름: ${commuItem.commuName}<span class="commu_name"></span></div>
	           	<div>지역: ${commuItem.commuLocation} <span class="commu_location"></span></div>
	           	<div>장르: ${commuItem.commuCategory} <span class="commu_category"></span></div>
              </div>		             
     	</div>
		</c:forEach> 		             
     </div>	        
   </div>
</div>
