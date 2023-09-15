<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />


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
  <link rel="stylesheet" href="../css/navbar.css" />
  <link rel="stylesheet" href="../css/commulist.css" />

  <!-- js-->
  <script src="../js/commulist.js"></script>

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
        <button class="modalbtn">가입신청</button>
        <button class="modalclose">닫기</button>
      </section>
    </div>
  </div>
  <div class="commuevery">
    <div class="tabBox">
      <div class="tab active" data-tab="community">커뮤니티</div>
      <div class="tab" data-tab="lightning">라이트닝</div>
      <div class="tab" data-tab="challenge">챌린지</div>
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

    <div class="list lightning">
      <div class="commuBox" id="lightning">
        <p class="commuName">마블 팬클럽</p>
        <img src="../img/commu1.jpg" alt="독서" class="img">
        <div class="introduce">
          <p class="commuintro">마블 영화 보러 갈사람~~~</p>
          <p class="commuintro">마블짱</p>
          <p class="commuintro">마조쿠 구합니다아~~~</p>
        </div>
      </div>
    </div>

    <div class="list challenge">
      <div class="commuBox" id="challenge">
        <div class="commuName">농조쿠들</div>
        <img src="../img/challenge1.jpg" alt="슬램덩크" class="img">
        <div class="introduce">
          <p class="commuintro">농구 좋아하시는 분들 welcome</p>
          <p class="commuintro">농구 직관 드가자</p>
          <p class="commuintro">농구 할 사람 다모여~</p>
        </div>
      </div>
    </div>


  </div>



</body>

</html>