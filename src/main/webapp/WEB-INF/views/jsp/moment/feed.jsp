<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<<<<<<< HEAD
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/modalwrite.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feed.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/floatingBtn.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feed_inside.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feed_modal.css">
    <script src="/resources/js/feed.js"></script>
    <script src="/resources/js/modal.js"></script>
    <script src="/resources/js/modalfeed_inside.js"></script>
    <script src="/resources/js/floatingbtn.js"></script>
    <script src="/resources/js/write.js"></script>
    <script src="/resources/js/moment_post.js"></script>
    <script src="/resources/js/navbar.js"></script>

=======
	<jsp:include page="../header.jsp"/>
>>>>>>> 33c765d1240957d45548ace7ca0e1789a4325da1
</head>


<div class="fab">
    <img src="/resources/items/floatitem/close.png" alt="">
</div>

<div class="float-box" style="height: 100;">
    <span class="float-item float-item1"><img src="/resources/items/floatitem/write.png" alt=""></span>
    <div class="modalWrap">
        <div id="modalBody">
            <span class="closeBtn">&times;</span>

            <div class="backboard">
                <nav>
                    <ul class="write">
                        <div id="image_container"></div>
                    </ul>

                    <form action="">
                        <input type="text" class="write">
                        <input type="file" id="image" class="form-control" accept="image/*"
                            onchange="setThumbnail(event);">
                        <div class="upload"></div>
                        <ul class="image-preview"></ul>
                        <button class="btn btn-primary">게시물 작성</button>
                    </form>
                    <div class="searchlocation">
                        <form class="form-inline d-flex justify-content-center md-form form-sm location">
                            <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="위치를 입력해주세요."
                                aria-label="Search" name="search_location">
                            <button type="button" class="btn btn-outline-primary searchbtn">검색</button>
                        </form>
                    </div>
                    <div class="searchcategory">
                        <form class="form-inline d-flex justify-content-center md-form form-sm category">
                            <input class="form-control form-control-sm mr-3 w-75" type="text"
                                placeholder="카테고리를 입력해주세요." aria-label="Search">
                            <button type="button" class="btn btn-outline-primary searchbtn">검색</button>
                    </div>

                </nav>

            </div>

        </div>
    </div>
    <span class="float-item float-item2"><img src="/resources/items/floatitem/alert.png" alt=""></span>
    <span class="float-item float-item3"><img src="/resources/items/floatitem/mypage.png" alt=""></span>
    <span class="float-item float-item4"><img src="/resources/items/floatitem/setting.png" alt=""></span>
</div>
</div>

<div class="feed_content">


    <!--부트스트랩에서 가져왔습니다-->





</div>
</div>
</div>

<footer>

</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>

</html>