<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form class="d-flex" role="search" id="search_location">
			<input class="form-control me-2" type="search" placeholder="Search"
				aria-label="Search" id="feed_searchinput" name="search_loation">
			<button class="btn btn-outline-dark btn-outline-success"
				id="location_search">Search</button>
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
		
<jsp:include page="./googlemap.jsp"/>
</body>
	
</body>
</html>