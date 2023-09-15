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
  <!-- <header>
    <nav class="navbar navbar-expand-lg" style="background-color: #f6f4eb;" id="navtop">
      <div class="container-fluid">
        <a class="navbar-brand" href="#" id="logo">HALF-TIME</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="searchul">
            <form class="d-flex" role="search" id="searchform">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                id="feed_searchinput">
              <button type="button" class="btn btn-outline-dark btn-outline-success" id="nav-searchbtn"
                type="submit">Search</button>
            </form>
        </div>
      </div>
    </nav>
    <div id="side_nav">
      <div>
          <ul class="nav flex-column">
              <li class="nav_item" id="sidefirst">
                  <img src="../IMG/sideItem/login.svg" alt="Login"><a href="./login.html" id="loginBtn"
                      class="atag">LOGIN</a>
              </li>
              <li class="nav_line">──────</li>
              <li class="nav_item">
                  <img src="../IMG/sideItem/journal.svg" alt="Moment"><a href="#" id="momentBtn"
                      class="atag">MOMENT</a>
              </li>
              <li class="nav_item">
                  <img src="../IMG/sideItem/people.svg" alt="Community"><a href="#" id="commuBtn"
                      class="atag">COMMUNITY</a>
              </li>
              <li class="nav_line">──────</li>
              <li class="nav_item">
                  <img src="../IMG/sideItem/hand-index.svg" alt="Interest"><a href="#" class="atag">INTEREST</a>
              </li>
              <li class="nav_item">
                  <img src="../IMG/sideItem/geo-alt.svg" alt="Location"><a href="#" class="atag">LOCATION</a>
              </li>
              <li class="nav_line">──────</li>
              <li class="nav_item">
                  <img src="../IMG/sideItem/chat-left-dots.svg" alt="Chatting"><a href="#" class="atag">CHATTING</a>
              </li>
          </ul>
      </div>
  </div>
  </header> -->
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