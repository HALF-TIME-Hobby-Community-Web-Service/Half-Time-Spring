<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.history_modal_content {
		max-height: 800px;
	}
	
	.history_title_box {
		width: 100%;
		
		font-size: 24px;
		text-align: center;
		border-bottom: 1px solid;
		
		margin-bottom: 10px;
	}

	.history_modal_container {	

	}

	.history_modal_img_box {
		margin-top: 30px;
		width: 100%;
		height: 50%;
		
		
		border: 1px solid;
	}
	
	.history_modal_img{
		width: 100%;
		max-height: 50%;
	}
	
	.margin-left20 {
		margin-left: 20px;
	}
	
	.history_modal_text {
		border: 1px solid;
		border-radius: 5px;
		margin-top: 20px;
		margin-bottom: 20px;
		
		font-size: 18px;
		background: white;
	}
</style>

<div class="modal_content history_modal_content">
  <div class="modal_title history_modal_title">
    HISTORY
    <span class="modal_closebtn history_closebtn">&times;</span>  
  </div>
  <div class="modal_container history_modal_container">
  	<div class="history_title_box">
  		<span class="history_title">📖HISTORY</span>
  		<span class="margin-left20">✍🏻<a href="" class="feed_a_name2 history_writer"></a></span>
  		<span class="margin-left20 history_time">⏰</span>
  	</div>
    <div class="history_modal_img_box">  	
  	  <img src="/resources/items/moment/2.jpg" class="history_modal_img">
  	</div>
  	<div class="history_modal_text">안녕</div>
  </div>
</div>

<script>
  $(function() {
  	$('.history_modal_content').draggable({'cancel':'.history_modal_container', containment:'parent', scroll:false});
  });
    
  
  $('.history_closebtn').click(()=> {
	  $('.history_modal_content').css('display','none');
  })  
  
</script>