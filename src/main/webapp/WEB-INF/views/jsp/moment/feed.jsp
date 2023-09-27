<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
	<div class="feedbox">
	    <div class="feed_title" id="{{item.momentid}}">
	        <div class="feed_title_name">이규철</div>
	        <div class="feed_title_date">23/09/22</div>
	        <div class="feed_title_time">{{" "}}</div>
	        <div class="feed_title_category">{{item.category}}</div>
	        <div class="feed_title_location">{{item.location}}</div>
	    </div>
	    <div id="carouselExample" class="carousel slide">
	        <div class="carousel-inner">
	            <div class="carousel-item active">
	                <img src="{{item.contentPath1}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath2}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath3}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath4}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath5}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath6}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath7}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath8}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath9}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	            <div class="carousel-item">
	                <img src="{{item.contentpath10}}" class="d-block w-100 feed_thumb" alt="...">
	            </div>
	        </div>
	        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Previous</span>
	        </button>
	        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Next</span>
	        </button>
	    </div>
	    <div class="feed_additional_box">
           	<img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">
            <img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">
            <img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">
            <img class="feed_comment_top_add" src="/resources/items/feed/comment/three-dots.svg" alt="더보기버튼">
	    </div>
	    <div class="feed_text_box">
	        <div class="feed_text">{{item.text}}</div>
	    </div>
	</div>
</body>

</html>