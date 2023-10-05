<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5o_ctjVFbtm8kt-EfRg7KNU4_hL4JFaw&libraries=places&callback=initMap"></script>
<script src="/resources/js/googlemap.js"></script>
<style>
/* 스타일링을 위한 CSS 코드 추가 */
#map {
	height: 400px;
	width: 100%;
}

#location-search {
	position: absolute;
	top: 10px;
	left: 10px;
	z-index: 1;
	background-color: white;
	padding: 5px;
	border-radius: 5px;
}
</style>

</head>
<body>
	<div id="map_content"
		style="height: 600px; width: 600px; border: 1px solid; background-color: blanchedalmond; display: none; margin-left: 400px;">
		<span class="modal_closebtn mmake_closebtn">&times;</span>
		<div id="map_container"
			style="border: 1px solid; height: 450px; margin-top: 5%; margin-bottom: 5%;">
			<div id="location-search">
				<input type="text" id="place-input" placeholder="장소 검색">
				<button onclick="searchPlace()">검색</button>
			</div>
			<div id="map"></div>


		</div>
	</div>
</body>
</html>