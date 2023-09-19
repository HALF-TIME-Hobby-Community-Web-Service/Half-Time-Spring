<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
  <meta charset="UTF-8" />
  <jsp:include page="../header.jsp"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- css -->
  <link rel="stylesheet" href="/resources/css/commulist.css" />

  <!-- js-->
  <script src="/resources/js/commulist.js"></script>  
</head>

<body>
  <div id="modalWrap">
    <div id="modalBody">
      <h3 class="modaltitle"></h3>
      <div class="modalaround"></div>
      <div class="modalaround2"></div>
      <hr class="moondan">
	  <img src="/resources/items/commu/commu_page/1.jpg"  class="modalimg">
      <div class="modalintro">
        <p class="modalintro2">독서를 좋아하는 사람들의 모임</p>
        <!-- <p class="commumember">정원 3/40</p> -->
      </div>
      <section class="btns">
        <button class="modalbtn" id="commuSignup">가입신청</button>
        <button class="modalclose">닫기</button>
      </section>
    </div>
  </div>
  <div class="commuevery">
    <div class="tabBox">
    </div>
    <div class="filteringBox">
      <span class="filtering">최신순</span>
      <span class="filtering">인기순</span>
	  <span class="filtering">추천순</span>
      <span class="filtering">지역별</span>
      <span class="filtering">내 커뮤니티</span>
    </div>
    <div class="list community" id="community">
      <div class="commuBox_clone">
        <p class="commuName">책과 나는 한몸이다 </p>
        <hr style="width: 90%; margin-left: 5%;" >
        <img src="/resources/items/commu/commu_page/1.jpg"  class="img">
        <!-- <div class="introduce">
        </div> -->
      </div>
    </div>
  </div>
</body>
</html>