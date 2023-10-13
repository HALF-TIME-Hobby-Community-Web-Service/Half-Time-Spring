<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 부트스트랩, ajax, jquery-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </link>  
  <script src="https://code.jquery.com/jquery-3.7.0.min.js"
    integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  
  <!-- css -->
  <link rel="stylesheet" href="/resources/css/commupage.css" />
  <link rel="stylesheet" href="/resources/css/modal.css">
  <link rel="stylesheet" href="/resources/css/modalmemberlist.css" />
  <link rel="stylesheet" href="/resources/css/commu_gathering_make.css">  
  <link rel="stylesheet" href="/resources/css/commu_gathering_join.css">
  
  <!-- js -->  
  <script src="/resources/js/commupage.js"></script>
  <script src="/resources/js/commumemberlist.js"></script>  
  <script src="/resources/js/commu_gathering_join.js"></script>
  <script src="/resources/js/commu_gathering_make.js"></script>
  <script src="/resources/js/commu_board_make.js"></script>

</head>

<body>  
  <section class="commu_content">
	<div class="tabbox">
	  <div class="tab active" data-tab="intro">커뮤니티 소개</div>
	  <div class="tab commu_tab_board" data-tab="board">게시판</div>
	  <div class="tab" data-tab="schedule">모임 일정</div>
	  <div class="tab" data-tab="history">히스토리</div>
	</div>
    <div class="commu_container">
      <div class="commu_box intro active">
        <div class="introTitleBox">
          <span class="introTitle"></span> &nbsp;|&nbsp;
          <span class="introCategory"></span> &nbsp;|&nbsp;
          <span class="introLocation"></span>
        </div>
        <img src="" class="mainImage" onerror="this.src='/resources/items/commu_preview_default.png'" alt="커뮤 메인 사진" />
        <!-- 커뮤니티 소개 -->
        <p class="introBox introText"></p>
        <!-- 커뮤니티 안내사항(const) -->
        <p class="introBox commu_const"></p>
        <!-- 커뮤니티 멤버 -->
		<div class="member_modalBody">
	      <div class="member_content">	        
	       <div class="member_info">
	        <div class="member_head">🙏멤버목록</div>
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
      <div class="commu_box board board_container">
        <div class="boardBox_clone">
          <div class="boardBox_topbox">
            <span class="boardbox_top board_posttype">📖공지사항</span>
            <span class="boardbox_top board_writer ">✍🏻<a href="" class="board_writer2 feed_a_name2">김수열</a></span>
            <span class="boardbox_top board_posttime">⏰23.08.10</span>
          </div>
          <p class="board boardTitle">
            <span class="boardTitleIntro">오리역 강도 코스프레 후기~~ </span>
          </p>
          <div class="board_imgbox">
            <img class="board boardimg" src="/resources/items/commu/commu_board/4-9-1.jpg"  alt="이미지1" />
          </div>
          <div class="boardTextBox">
            <p class="board boardText">
              경찰과 도둑 현실판은 처음 해봤는데 너무 짜릿했어요~~ (테이져건 맞음)
            </p>
          </div>
          <div class="board_comment_box">
            <span style="font-size: larger; display: block; border-bottom: 1px solid; padding-left: 2px;">댓글</span>
            <div class="board_comment">
              <!-- <span class="board_comment_writer">👼닉네임</span>:&nbsp;
              <span class="board_comment_text">댓글내용</span> -->
              <form class="board_comment_form" action="">
              	<input class="board_comment_input form-control" placeholder="댓글">
              </form>
            </div>
          </div>
        </div>
      </div>
	  <div class="commu_box schedule">	  	
  		<jsp:include page="./gathering_join_modal.jsp"/>	  	
  		<jsp:include page="./gathering_make_modal.jsp"/>
	  </div>
      <div class="commu_box history">
        <div class="history_text">
          HISTORY
        </div>
        <div class="history_container">
          <div class="historyBox" onclick="history_modal_open(this)">
            <img src="/resources/items/commu_preview_default.png" class="history_box_img" />
          </div>
        </div>
      </div>
    </div>
  </section>
	
  <!-- 모달 페이지 -->
  <jsp:include page="./commu_board_write_modal.jsp"/>
  <jsp:include page="./commu_history_modal.jsp"/>
  
  <script>
	  $('.history_modal_closebtn').click(()=>{
		  $('.history_modal_content').css('display','none');
	  })
	  
 	/* 히스토리 모달 클릭 동작 */
	function history_modal_open(historyBox) {
		var historyBox = $(historyBox);	  
		  
	    var title 	 = historyBox.find('input[name="title"]').val();
	    var writer 	 = historyBox.find('input[name="writer"]').val();
	    var posttime = historyBox.find('input[name="posttime"]').val();
	    var text 	 = historyBox.find('input[name="text"]').val();
	    var commupostid = historyBox.find('input[name="commupostid"]').val();
	    
	    // 이제 title, writer, posttime, text를 사용할 수 있습니다.	
	    $('.history_title').text('📖' + title);
	    $('.history_writer').text(writer);
	    $('.history_time').text('⏰' + posttime);
	    
	    $.ajax({
	        url: 'http://localhost:8888/content/getcontentsrc',
	        method: 'POST',
	        data: {referenceid: commupostid, contenttype: 5},
	        success: (response) => {				        	
        		$('.history_modal_img').attr('src', response.contentPath1);
	    	},
	        error: (jqXhr, status) => {
	        	$('.history_modal_img').attr('src', '/resources/items/commu_preview_default.png');
	        }
   		 }); 
	    
	   	$('.history_modal_text').text(' ' + text);
	    
	    $('.history_modal_content').css('display', 'block');	    
	}

	  

  </script>
</body>

</html>