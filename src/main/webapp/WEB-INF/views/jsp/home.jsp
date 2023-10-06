 <%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="header.jsp"/>
	<script src="/resources/js/feed.js"></script>
	
</head>

<div class="fab_container">
	<div class="fab">
	    <img src="/resources/items/floatitem/close.png" alt="">
	</div>
	
	<div class="float-box" style="height: 100;">
	    <span class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></span>
	    <span class="float-item float-item2"><img src="/resources/items/floatitem/alert.png" alt=""></span>
<!-- 	    <span class="float-item float-item3"><img src="/resources/items/floatitem/mypage.png" alt=""></span>
	    <span class="float-item float-item4"><img src="/resources/items/floatitem/setting.png" alt=""></span> -->
	</div>
</div>

<div class="feed_content"></div>
<jsp:include page="./moment/moment_write_modal.jsp"/>
<jsp:include page="./moment/feed_modal.jsp"/>	

<script>
	$('.float-item1').click(()=> {
		$('.mmake_content').css('display','block');
	});
</script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

</html>