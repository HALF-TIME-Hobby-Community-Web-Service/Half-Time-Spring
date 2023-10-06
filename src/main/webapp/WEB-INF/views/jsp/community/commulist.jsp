<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="/resources/css/commulist.css" />
  <script src="/resources/js/commulist.js"></script>  
</head>
	
  <jsp:include page="./commulist_modal.jsp"/>
  <jsp:include page="./commu_make.jsp"/>
	  
   <div class="commuevery">
<!--     <div class="filteringBox">
      <span class="filtering">최신순</span>
      <span class="filtering">인기순</span>
	  <span class="filtering">추천순</span>
      <span class="filtering">지역별</span>
      <span class="filtering">내 커뮤니티</span>
    </div> --> 
    
    <div class="list community" id="community">
      <div class="commuBox_clone">
        <p class="commuName"></p>
        <hr style="width: 90%; margin-left: 5%;" >
        <img src="" class="img" onerror="this.src='/resources/items/commu_preview_default.png'">
      </div>
    </div>
    
  </div>
  
  <script>
  $('.fab_container').html('');
  $('.fab_container').append('<div class="fab clist-float">'
  						 + '<img src="/resources/items/floatitem/close.png" alt="">'
  						 + '</div>');
  </script>