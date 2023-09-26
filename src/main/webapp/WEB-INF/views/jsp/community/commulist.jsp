<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- css -->
  <link rel="stylesheet" href="/resources/css/commulist.css" />

  <!-- js-->
  <script src="/resources/js/commulist.js"></script>  
</head>
	
  <jsp:include page="./clist_modal.jsp"/>
	  
  <div class="commuevery">

    <div class="filteringBox">
      <span class="filtering">최신순</span>
      <span class="filtering">인기순</span>
	  <span class="filtering">추천순</span>
      <span class="filtering">지역별</span>
      <span class="filtering">내 커뮤니티</span>
    </div>
    
    <div class="list community" id="community">
      <div class="commuBox_clone">
        <p class="commuName"></p>
        <hr style="width: 90%; margin-left: 5%;" >
        <img src="" class="img">
      </div>
    </div>
    
  </div>