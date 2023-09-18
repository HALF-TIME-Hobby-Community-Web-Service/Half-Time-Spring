<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<script>
$(document).ready(() => {
var pageNum = 1;
alert(pageNum);
	$.ajax({
	    url: 'http://localhost:8888/moment/feed',
	    method: 'POST',
	    data: "pageNum=" + pageNum,
	    dataType: "json",
	    success: function (data) {
	        alert(data);
	        console.log(data);
	        const container = $('.feed_content');
	
	        $.each(data, function (data, item) {
	            // ...
	        });
	        pageNum++;
	    },
	    error: function (jqXhr, status) {
	        alert(`실패: ${status}\n오류명: ${jqXhr.status}`);
	        console.error('Failed to fetch new content.');
	    }
	});
});

</script>
</body>
</html>