<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

<jsp:include page="../header.jsp"/>

  <!-- 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet" />

  <!-- 부트스트랩, ajax, jquery-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>


  <!-- css -->
  <link rel="stylesheet" href="/resources/css/navbar.css" />
  <link rel="stylesheet" href="/resources/css/commulist.css" />

  <!-- js-->
  <script src="/resources/js/navbar.js"></script>
  <script src="/resources/js/commulist.js"></script>

</head>

<body>
  <div id="modalWrap">
    <div id="modalBody">

      <h3 class="modaltitle">책과 나는 한몸이다</h3>
      <div class="modalaround">커뮤니티 둘러보기</div>
      <div class="modalaround2">#독서 | 서울</div>
      <hr class="moondan">
      <img src="../img/lightning1.jpg" alt="독서모임사진" class="modalimg">
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
      <span class="filtering">내 커뮤니티</span>
    </div>
    <div class="list community" id="community">
      <div class="commuBox_clone">
        <p class="commuName">책과 나는 한몸이다 </p>
        <img src="../img/lightning1.jpg" alt="독서모임사진" class="img">
        <div class="introduce">
        </div>
      </div>
    </div>
  </div>
</body>
</html>