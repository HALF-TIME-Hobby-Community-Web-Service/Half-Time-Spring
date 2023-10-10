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
<jsp:include page="./location/googlemap.jsp"/>

<script>

$('.fab_container').html('');
$('.fab_container').append('<div class="fab mmake-float">'
						 + '<img src="/resources/items/floatitem/close.png" alt="">'
						 + '</div>');

$('.mmake-float').on('click', function() {
	$('.mmake_content').css('display','block');
});

$('body').on("click", ".feed_a_name", function (e) {		
	  e.preventDefault();
	  
	  const idLink = $(this); 
	  const value = idLink.text();
	
	  $.ajax({
		url: "/user/userpage",
		type: "post",
		data: { value: value },
		success: function (response) {
		  $('.feed_content').append(response);
		},
		error: function (jqXhr, status) {
			location.href = "/user/login";
		}
	  });
	  
});

$('body').on("click", ".feed_a_name2", function (e) {		
	  e.preventDefault();
	  
	  const idLink = $(this);
	  var value = idLink.text();
	  
	  const commuID = sessionStorage.getItem('commuID');
	  
	  $.ajax({
			url: "http://localhost:8888/commu/getuserid",
			type: "post",
			data: { commuID: commuID, nickname: value },
			dataType: "text",
			success: function (response) {
				value = response;
			    $.ajax({
				 	url: "/user/userpage",
					type: "post",
					data: { value: value },
					success: function (response) {
					  $('.feed_content').append(response);
					},
					error: function (jqXhr, status) {
						location.href = "/user/login";
					}
			  	});
			},
			error: function (jqXhr, status) {
				alert('웨옹');
			}
	  });  
	
});
</script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>

</html>