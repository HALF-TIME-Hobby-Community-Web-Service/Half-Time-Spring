 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="header.jsp"/>
	<script src="/resources/js/feed.js"></script>
	<script src="/resources/js/moment_modal.js"></script>
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

<div class="feed_content">
    <!--부트스트랩에서 가져왔습니다-->
</div>

<footer>

</footer>

</html>