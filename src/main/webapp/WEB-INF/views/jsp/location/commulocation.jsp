<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="/resources/js/commulocation.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5o_ctjVFbtm8kt-EfRg7KNU4_hL4JFaw&callback=initMap"></script>



</head>
<body>
	<div>
		<form class="d-flex" role="search">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" id="feed_searchinput" name="search_loation">
			<button class="btn btn-outline-dark btn-outline-success"
				id="location_search" type="button">Search</button>
		</form>
		
	</div>
		<div  class="community_list">
			<span class="member_closeBtn">&times;</span>
			<div class="member_content">
				<div class="member_head">🙏멤버목록</div>
				<div class="member_info">
					<table class="member_table">
						<tr class="member_tr">
							<td class="cn"><span class="font30px">커뮤니티이름</span>
							<hr></td>
							<td class="ci"><span class="font30px">커뮤니티 소개</span>
							<hr></td>
							<td class="cc"><span class="font30px">카테고리</span>
							<hr></td>
							<td class="cl"><span class="font30px">지역</span>
							<hr></td>
						</tr>
					</table>
				</div>
			</div>	
		</div>


		<div id="map" style="height: 600px;"></div>
</body>
</body>
</html>