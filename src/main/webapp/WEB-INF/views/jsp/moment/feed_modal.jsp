<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div class="feed_modal_content">
  <div class="feed_modal_container">
    <div class="feed_modal_box">
      <div class="feed_modal_title">
        <div class="feed_modal_title_name">✍🏻 정겨운</div>
        <div class="feed_modal_title_date">23.08.02</div>
        <div class="feed_modal_title_time">14:26 </div>
        <div class="feed_modal_title_category">⚽️풋살</div>
        <div class="feed_modal_title_location">성남</div>
      </div>

      <!--a-->

      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
            aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
            aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
            aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="/resources/img/moment/1.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="/resources/img/moment/2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="/resources/img/moment/3.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="/resources/img/moment/4.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="/resources/img/moment/3.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
          data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
          data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <!--/a-->

      <div class="feed_comment_box">
        <div class="feed_comment_top">
          <img class="feed_comment_top_heart" src="../img/feed/comment/heart.svg" alt="좋아요버튼">
          <img class="feed_comment_top_comment" src="../img/feed/comment/chat.svg" alt="댓글버튼">
          <img class="feed_comment_top_send" src="../img/feed/comment/send.svg">
          <img class="feed_comment_top_add" src="../img/feed/comment/three-dots.svg" alt="더보기버튼">
        </div>
      </div>
      <div class="feed_modal_text_box">
        <div class="feed_modal_text">
          [팀원구함]풋살 같이 하실 분?<br>1자리 남았어요!<br>
        </div>
      </div>
      <div class="feed_comment_bottom">
        <div class="feed_comment_bottom_box">
          <div class="feed_comment_user">신유리</div> :&nbsp;
          <div class="feed_comment">아, 한자리 더 있습니다!</div>
        </div>
        <div class="feed_comment_bottom_box">
          <div class="feed_comment_user">이수완</div> :&nbsp;
          <div class="feed_comment">남자도 가능한가요?</div>
        </div>
        <div class="feed_comment_bottom_box">
          <div class="feed_comment_user">신유리</div> :&nbsp;
          <div class="feed_comment">여자만 가능해요</div>
        </div>
      </div>
    </div>
  </div>
</div>
</html>