<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
<div class="modal_content history_modal_content" style='display:none'>
  <div class="history_modal_img_box">  	
  	<img src="/resources/items/moment/6.jpg">
  </div>
  <div class="modal_content history_modal_container">
  	<div class="modal_title history_modal_title">
  		<div>
  			<a href="" class="history_modal_a_name">👦🏻 sungmin123</a>
  			<button class="modal_closebtn history_modal_closebtn btn">X</button>
  		</div>
  		<hr>
  		<div style="font-size:15px;margin-top: 10px;">
  			<span class="history_modal_category">😘자기과시</span>
  			<span class="history_modal_location">🌎경기도 동탄시</span>
  		</div>
        <div class="history_modal_historytext">나는 너무 과하게 잘생겨서 슬퍼 ㅠㅠ 공감좀요...?</div>        
  	</div>
  	<hr>
  	<div class="history_modal_comment_container">
  		<div class="history_modal_comment_box">
  			<div>
  				<span class="comment_writer"> <a href="" class="history_modal_a_name">moon_bomi</a> </span>
  				<span class="comment_time">3시간</span>
  			</div> 
  			<span class="comment_text">
  				와 너무 멋져요 ㅠㅠ ♥
  			</span>
  		</div>
  		<div class="history_modal_comment_write">
  			<form class="comment_form" action="">
  				<input class="history_modal_comment_write_input form-control" style="width:80%; display:inline;">
  				<button class="btn" style="width: 19.5%; color:blue; display: inline-block; float:right;">게시</button>
  			</form>
  		</div>
  	</div>
  	<hr>
	<div class="history_modal_items">
		<button class="btn">
        	<img class="history_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">
        </button>
        <button class="btn">
        <img class="history_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">
        </button>
        <button class="btn">
        	<img class="history_comment_top_send" src="/resources/items/history/comment/send.svg">
        </button>
        <button class="btn">
        	<img class="history_modal_etc" src="/resources/items/history/comment/three-dots.svg" alt="더보기버튼">
        </button>
	</div>    	
  </div>
</div>

<script>
  $(function(){
  	$('.history_modal_content').draggable({'cancel':'.history_modal_container', containment:'parent', scroll:false});
  });
  
  $('.history_modal_closebtn').click(()=> {
	  $('.history_modal_content').css('display','none');
  })
</script>
</body>