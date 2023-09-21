<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	
	<script src="/resources/js/feed.js"></script>
<<<<<<< HEAD
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
=======
	<script src="/resources/js/moment_modal.js"></script>
	
>>>>>>> 1d29eae64a0c739adcd6a52039a79f7857260b35
</head>

<div class="fab">
    <img src="/resources/items/floatitem/close.png" alt="">
</div>

<div class="float-box" style="height: 100;">
    <span class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></span>
    <span class="float-item float-item2"><img src="/resources/items/floatitem/alert.png" alt=""></span>
    <span class="float-item float-item3"><img src="/resources/items/floatitem/mypage.png" alt=""></span>
    <span class="float-item float-item4"><img src="/resources/items/floatitem/setting.png" alt=""></span>
</div>

<<<<<<< HEAD
<div class="feed_content">
=======

<div class="feed_content" id="content">
>>>>>>> 1d29eae64a0c739adcd6a52039a79f7857260b35

</div>

<jsp:include page="./moment_write_modal.jsp"/>	
<script>
	$('.float-item1').click(()=> {
		$('.mmake_content').css('display','block');
	});
</script>
</html>