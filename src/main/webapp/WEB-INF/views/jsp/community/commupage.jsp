<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>community</title>

<!-- 부트스트랩, ajax, jquery-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </link>  
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  

  <!-- css -->
  <link rel="stylesheet" href="/resources/css/commuPage.css" />
  <link rel="stylesheet" href="/resources/css/floatingBtn.css" />
  <link rel="stylesheet" href="/resources/css/lmake.css">
  <link rel="stylesheet" href="/resources/css/ljoin.css">
  <link rel="stylesheet" href="/resources/css/modalmemberlist.css" />

  <!-- js-->
  <script src="/resources/js/modalmemberlist.js"></script>
  <script src="/resources/js/commupage.js"></script>
  <script src="/resources/js/lmake.js"></script>
  <script src="/resources/js/commumemberlist.js"></script>
  <script src="/resources/js/ljoin.js"></script>
  
</head>

<body>
  <%-- <jsp:include page="../header.jsp"/> --%>
  
  <section class="commu_content">
    <div class="right_nav">
      <div class="lightning">
        <button class="btn btn-primary lightningBtn lmakebtn">
          모임생성
        </button>
        <button class="btn btn-danger lightningBtn ljoinbtn">
          모임참가
        </button>
      </div>
      <div class="memberList">
        <div class="memberTitle" style="font-size: 22px; text-align: center">🤸‍♂️멤버🙋‍♀️</div>
      </div>
    </div>
 	<div class="tabbox">
      <div class="tab active" data-tab="intro">커뮤니티 소개</div>
      <div class="tab commu_tab_board" data-tab="board">
        게시판
        <!-- <ul class="commu_list_group">
          <li class="commu_list-item">모두 보기</li>
          <li class="commu_list-item">공지사항</li>
          <li class="commu_list-item">커뮤니티 게시글</li>
        </ul> -->
      </div>
      <div class="tab" data-tab="history">히스토리</div>
    </div>
    <div class="commu_container">
      <div class="commu_box intro active">
        <div class="introTitleBox">
          <span class="introTitle"></span> |&nbsp;
          <span class="introCategory"></span> |&nbsp;
          <span class="introLocation"></span>
        </div>
        <img src="" alt="커뮤 메인 사진" class="mainImage" />
        <p class="introText"></p>
        <p class="commu_const"></p>
      </div>
      <div class="commu_box board board_container">
        <div class="boardBox_clone">
          <div class="boardBox_topbox">
            <span class="boardbox_top board_posttype">📖공지사항</span>
            <span class="boardbox_top board_writer">✍🏻김수열</span>
            <span class="boardbox_top board_posttime">⏰23.08.10</span>
          </div>
          <p class="board boardTitle">
            <span class="boardTitleIntro">오리역 강도 코스프레 후기~~ </span>
          </p>
          <div class="board_imgbox">
            <img class="board boardimg" src="/resources/items/commu/commu_board/4-9-1.jpg" alt="이미지1" />
          </div>
          <div class="boardTextBox">
            <p class="board boardText">
              경찰과 도둑 현실판은 처음 해봤는데 너무 짜릿했어요~~ (테이져건 맞음)
            </p>
          </div>
          <div class="board_comment_box">
            <span style="font-size: larger; display: block; border-bottom: 1px solid; padding-left: 2px;">댓글</span>
            <div class="board_comment">
              <span class="board_comment_writer">👼닉네임</span>:&nbsp;
              <span class="board_comment_text">댓글내용</span>
            </div>
            <!-- <div class="board_comment">
              <span class="board_comment_writer">👼이규철</span>:&nbsp;
              <span class="board_comment_text">저는 걸려서 몽둥이 찜질당하다 어깨 박살났어요!!! 공감좀요ㅠㅠ</span>
            </div>
            <div class="board_comment">
              <span class="board_comment_writer">👦조성민</span>:&nbsp;
              <span class="board_comment_text">저는 저를 쫒아다니는 여경들에게 싸인뿌리고 왔습니다 캬</span>
            </div> -->
          </div>
        </div>
      </div>
      <div class="commu_box history">
        <div class="history_text">
          HISTORY
        </div>
        <div class="history_container">
          <div class="historyBox">
            <img src="/resources/items/moment/1.jpg" class="history_box_img" />
          </div>
        </div>
      </div>
    </div>
  </section>
<!--   <div>
    <div class="fab">
      <img src="/resources/items/floatitem/close.png" alt="">
    </div>
    <div class="float-box" style="height: 100;">
      <a href="" class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></a>
      <a href="" class="float-item float-item2"><img src="/resources/items/floatitem/alert.png" alt=""></a>
      <a href="" class="float-item float-item3"><img src="/resources/items/floatitem/mypage.png" alt=""></a>
      <a href="" class="float-item float-item4"><img src="/resources/items/floatitem/setting.png" alt=""></a>
    </div>
  </div> -->

  <!-- 모달 창 -->
  <!-- 번개 신청 -->
  <div class="lmake_content">
    <div class="lmake_title"> ⚡모임생성 <span class="lmake_closebtn">&times;</span></div>
    <div class="lmake_container">
      <form method="post" action="">
        <div class="form-floating mb-3">
          <fieldset>
            <span>이름:</span>
            <input name="title" class="form-control lmake_name" placeholder="2030 롯데리아좋아하는사람들 정기모임~~!~!!@@" />
          </fieldset>
        </div>

        <div class="form-floating mb-3 lmake_schedule">
          <span>일정:</span>
          <input name="startTime" class="startTime form-control" type="datetime-local" max="2023-12-240T21:00" min=""
            value="" style="height: 30px;">
          <input name="endTime" class="endTime form-control" type="datetime-local" max="2023-12-24T21:00" min=""
            value="">
          <fieldset class="lmake_checkbox">
            <input name="check" id="endTime" type="checkbox" checked>
            <label for="endTime">끝나는 시간</label>
          </fieldset>
        </div>

        <div class="form-floating mb-3">
          <span>위치:</span>
          <input class="form-control location" name="location" value="맥도날드 뱅뱅사거리점" />
          <!-- <input class="form-control location" name="location_map" value="서울시-강남구-도곡동" /> -->
        </div>

        <div class="form-floating mb-3">
          <span>내용:</span>
          <textarea name="text" class="lmake_text" placeholder="롯데리아 종이배 모자쓰고 맥도날드앞에서 시위해요~~~ ^>^"></textarea>
        </div>

        <div class="form-floating mb-3 lmake_detailbox">
          <div>
            <span>정원:</span>
            <span class="lmake_calcbox">
              <button type="button" class="lmake_btn lmake_cap_minus">-</button>
              <input name="capacity" class="form-control" value="00명" />
              <button type="button" class="lmake_btn lmake_cap_plus">+</button>
            </span>
          </div>
          <div>
            <span>금액:</span>
            <span class="lmake_calcbox">
              <button type="button" class="lmake_btn lmake_price_minus">-</button>
              <input name="price" class="form-control" value="10000원" />
              <button type="button" class="lmake_btn lmake_price_plus">+</button>
            </span>
          </div>
        </div>
        <div class="lmake_button_container" style="border-top: 1px solid;">
          <button class="btn btn-primary">모임 생성</button>
        </div>
      </form>
    </div>
  </div>
  <!-- 번개 참가 -->
  <div class="ljoin_content">
    <div class="ljoin_title"> ⚡모임 참가 <span class="ljoin_closebtn">&times;</span></div>
    <div class="ljoin_container">
      <div class="ljoin_box_clone">
        <div class="ljoin_box_title">
          <span class="ljoin_box_date1">07/29 (일)</span>
          <span class="ljoin_box_dday">D-30</span>
        </div>
        <div class="ljoin_box_container">
          <p>강릉 알파메일 정기모임</p>
          <div>일시: <span class="ljoin_box_date2">07/29(화) 오후 12:00</span></div>
          <div>위치: <span class="ljoin_box_location">강원도 강릉</span></div>
          <div>내용: <span class="ljoin_box_text">02년생 헌팅하고 다니실 185cm이상 알파메일 분들 찾아요</span></div>
          <div>금액: <span class="ljoin_box_price">29만원</span></div>
          <div>
            정원:
            <span class="ljoin_box_count" style="color:red">4</span> / <span class="ljoin_box_capacity">5</span>
            <button class="btn btn-primary ljoin_joinbtn">참가하기</button>
          </div>
        </div>
      </div>
      <!-- <div class="ljoin_box">
        <div class="ljoin_box_title">
          <span class="ljoin_box_date">08/01 (화)</span>
          <span class="ljoin_box_dday">D-32</span>
        </div>
        <div class="ljoin_box_container">
          <p>⚡ 어깨박살 동호회 번개⚡</p>
          <div>일시: 08/01(화) 오전 9:00</div>
          <div>위치: 서울시 송파구 문정동</div>
          <div>내용: 어깨 재활하실 분들 구해요~~~ 탈골환자도 환영 *^^*</div>
          <div>금액: 300만원</div>
          <div>
            정원:
            <span style="color:red">4</span>/5
            <button class="btn btn-primary ljoin_joinbtn">참가하기</button>
          </div>
        </div>
      </div>
      <div class="ljoin_box">
        <div class="ljoin_box_title">
          <span class="ljoin_box_date">08/03 (목)</span>
          <span class="ljoin_box_dday">D-34</span>
        </div>
        <div class="ljoin_box_container">
          <p>도태 오메가메일 메이플 정모 😜</p>
          <div>일시: 08/03(목) 오후 10:00</div>
          <div>위치: 커닝시티 20세 채널</div>
          <div>내용: 인기도 테러 하고 다니실 메푸리 유저 구해요 @@@@@@@@@@@@@</div>

          <div>금액: 10억메소</div>
          <div>
            정원:
            <span style="color:red">2</span>/n
            <button class="btn btn-primary ljoin_joinbtn">참가하기</button>
          </div>
        </div>
      </div> -->
    </div>
  </div>
  <!-- 멤버 목록-->
  <div class="member_modalWrap">
    <div class="member_modalBody">
      <span class="member_closeBtn">&times;</span>
      <div class="member_content">
        <div class="member_head">🙏멤버목록</div>
        <div class="member_info">
          <table class="member_table">            
            <tr class="member_tr">
              <td class="ca"><span class="font30px">권한</span><hr></td>
              <td class="cn"><span class="font30px">닉네임</span><hr></td>
              <td class="ci"><span class="font30px">성별</span><hr></td>
              <td class="cs"><span class="font30px">나이</span><hr></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>

</html>