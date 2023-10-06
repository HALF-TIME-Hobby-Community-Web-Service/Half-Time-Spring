<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	
<link rel="stylesheet" type="text/css"
	href="/resources/css/modalwrite.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- sweetAlert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet" type="text/css" href="/resources/css/modalwrite.css">
<link rel="stylesheet" type="text/css" href="/resources/css/navbar.css">
<link rel="stylesheet" type="text/css" href="/resources/css/feed.css">
<link rel="stylesheet" type="text/css" href="/resources/css/floatingBtn.css">
<link rel="stylesheet" type="text/css" href="/resources/css/feed_inside.css">
<link rel="stylesheet" type="text/css" href="/resources/css/feed_modal.css">

<script src="/resources/js/navbar.js"></script>
<script src="/resources/js/modalfeed_inside.js"></script>
<script src="/resources/js/floatingbtn.js"></script>
<script src="/resources/js/moment_post.js"></script>

	<script src="/resources/js/moment_modal.js"></script>

</head>

<header>
	<nav class="navbar navbar-expand-lg" style="background-color: #f6f4eb;"
		id="navtop">
		<div class="container-fluid">
			<a class="navbar-brand" href="" id="logo">HALF-TIME</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="searchul">
					<form class="d-flex" role="search" id="searchform">
					
						<select name="selection" id="selection">
							<option value="moment">모멘트</option>
							<option value="community">커뮤니티</option>
						</select><br>
						
						 <input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" id="feed_searchinput"
							name="search_location">
							
						<button type="button"
							class="btn btn-outline-dark btn-outline-success"
							id="nav-searchbtn" type="submit">Search</button>
					</form>
			</div>
		</div>
	</nav>
	<div id="side_nav">
		<div>
			<ul class="nav flex-column">
				<li class="nav_item" id="sidefirst"><img
					src="/resources/items/sideItem/login.svg" alt="Login"><a
					id="loginBtn" href="" class="atag">LOGIN</a></li>
				<li class="nav_line">──────</li>
				<li class="nav_item"><img
					src="/resources/items/sideItem/journal.svg" alt="Moment"><a
					id="momentBtn" href="" class="atag">MOMENT</a></li>
				<li class="nav_item"><img
					src="/resources/items/sideItem/people.svg" alt="Community"><a
					id="commuBtn" href="" class="atag">COMMUNITY</a></li>
				<li class="nav_line">──────</li>
				<li class="nav_item"><img
					src="/resources/items/sideItem/geo-alt.svg" alt="Location"><a
					id="locationBtn" href="" class="atag">LOCATION</a></li>
				<li class="nav_item"><img
					src="/resources/items/sideItem/geo-alt.svg" alt="MyPage"><a
					id="mypageBtn" class="atag">MyPage</a></li>
				<li class="nav_line">──────</li>
				<div class="footer" style="color:white; text-align: center; background-color: black;">
					KOSTA 263기 HalfTime
				</div>
			</ul>
		</div>
	</div>
</header>

</html>