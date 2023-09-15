$(document).ready(() => {
    const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.5
    };
    const observer = new IntersectionObserver((entries)=>{
    loadMoreContent()
    }, options);
    observer.observe($('.feed_content'));



});

let isloading = false;

function loadMoreContent() {
    if (isloading) {
    	return;
    }
    

    isloading = true;
    $.ajax({
        url: 'http://localhost:8889/moment/list',
        method: 'POST',
        dataType: 'json',
        success: function (data) {
            const container = $('.feed_content');

            $.each(data, function (data, item) {

                const newItem = $('<div class="feed_container_append">');
                newItem.append('<div class="feedbox">'
                    + '<div class="feed_title">'
                    + '<div class="feed_title_name">' + item.MomentWriter + '</div>'
                    + '<div class="feed_title_date">' + "" + '</div>'
                    + '<div class="feed_title_time">' + " "
                    + '</div>'
                    + '<div class="feed_title_category">' + item.MomentCategory
                    + '</div>'
                    + '<div class="feed_title_location">' + item.MomentLocation
                    + '</div>'
                    + '</div>'
                    + '<div id="carouselExample" class="carousel slide">'
                    + '<div class="carousel-inner">'
                    + '<div class="carousel-item active">'
                    + '<img src="' + item.ContentPath1 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath2 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath3 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath4 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath5 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath6 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath7 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath8 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath9 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.ContentPath10 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '</div>'
                    + '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">'
                    + '<span class="carousel-control-prev-icon" aria-hidden="true"></span>'
                    + '<span class="visually-hidden">Previous</span>'
                    + '</button>'
                    + '<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">'
                    + '<span class="carousel-control-next-icon" aria-hidden="true"></span>'
                    + '<span class="visually-hidden">Next</span>'
                    + '</button>'
                    + '</div>'
                    + '<div class="feed_comment_box">'
                    + '<div class="feed_comment_top">'
                    + ' <img class="feed_comment_top_heart" src="../img/feed/comment/heart.svg" alt="좋아요버튼">'
                    + '<img class="feed_comment_top_comment" src="../img/feed/comment/chat.svg" alt="댓글버튼">'
                    + '<img class="feed_comment_top_send" src="../img/feed/comment/send.svg">'
                    + '<img class="feed_comment_top_add" src="../img/feed/comment/three-dots.svg" alt="더보기버튼">'
                    + '</div>'
                    + '</div>'
                    + '<div class="feed_text_box">'
                    + '<div class="feed_text">' + item.MomentText
                    + '</div>'
                    + '</div>'
                    + '</div>'
                );
                container.append(newItem);

            });
            isloading = false;
        },
        error: function () {
            console.error('Failed to fetch new content.');
            isloading = false;
        }
    });

}

function loadMoreCallback() {
    loadMoreContent();
};


$('.feed_container_append').scroll(() => {
    // 스크롤 이벤트 발생 시 IntersectionObserver를 활성화하여 무한 스크롤 지원
    const observer = new IntersectionObserver(loadMoreCallback, { threshold: 0.2 });
    observer.observe($('.feed_container_append').get(0));
});
