 <%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="header.jsp"/>
	<script src="/resources/js/feed.js"></script>
	
</head>

<div class="fab_container ">
	<div class="fab">
	    <img src="/resources/items/floatitem/close.png" alt="">
	</div>	
</div>

<div class="feed_content"></div>
<jsp:include page="./moment/moment_write_modal.jsp"/>
<jsp:include page="./moment/feed_modal.jsp"/>	

<script>

$('.fab_container').html('');
$('.fab_container').append('<div class="fab mmake-float">'
						 + '<img src="/resources/items/floatitem/close.png" alt="">'
						 + '</div>');

$('.mmake-float').on('click', function() {
	$('.mmake_content').css('display','block');
});
</script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

</html>