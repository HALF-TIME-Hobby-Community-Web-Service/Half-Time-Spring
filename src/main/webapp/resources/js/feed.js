var pageNum = 1;

$(document).ready(() => {
    const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.5
    };
    loadMoreContent();
    
    const observer = new IntersectionObserver((entries) => {
        loadMoreCallback();
    }, options);

    function loadMoreContent() {
        alert("pagenum"+pageNum);
        
         $.ajax({
        url: 'http://localhost:8888/moment/feed',
        method: 'POST',
        data: {pageNum : pageNum},
        dataType: "json",
        success: function (data) {
        alert(data[0].MOMENTID);
		console.log(data);
            const container = $('.feed_content');

            $.each(data, function (data, item) {

                const newItem = $('<div class="feed_container_append">');
                newItem.append('<div class="feedbox">'
                    + '<div class="feed_title">'
                    + '<div class="feed_title_name">' + item.writer + '</div>'
                    + '<div class="feed_title_date">' + "" + '</div>'
                    + '<div class="feed_title_time">' + " "
                    + '</div>'
                    + '<div class="feed_title_category">' + item.category
                    + '</div>'
                    + '<div class="feed_title_location">' + item.location
                    + '</div>'
                    + '</div>'
                    + '<div id="carouselExample" class="carousel slide">'
                    + '<div class="carousel-inner">'
                    + '<div class="carousel-item active">'
                    + '<img src="' + item.contentpath1 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath2 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath3 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath4 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath5 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath6 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath7 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath8 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath9 + '" class="d-block w-100 feed_thumb" alt="...">'
                    + '</div>'
                    + '<div class="carousel-item">'
                    + '<img src="' + item.contentpath10 + '" class="d-block w-100 feed_thumb" alt="...">'
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
                    + ' <img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">'
                    + '<img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">'
                    + '<img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">'
                    + '<img class="feed_comment_top_add" src="/resources/items/comment/three-dots.svg" alt="더보기버튼">'
                    + '</div>'
                    + '</div>'
                    + '<div class="feed_text_box">'
                    + '<div class="feed_text">' + item.text
                    + '</div>'
                    + '</div>'
                    + '</div>'
                );
                container.append(newItem);
				pageNum++;
            });
        },
        error: function (jqXhr, status) {
        alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
            console.error('Failed to fetch new content.');
        }
    });
    }

    function loadMoreCallback() {
        alert("Callback ajax");
        
        $.ajax({
        url: 'http://localhost:8888/moment/feed',
        method: 'POST',
        data: {pageNum : pageNum},
        dataType: "json",
        success: function (data) {
        alert(data);
		console.log(data);
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
				pageNum++;
            });
        },
        error: function (jqXhr, status) {
        alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
            console.error('Failed to fetch new content.');
        }
    });
    }

    $('.feed_container_append').scroll(() => {
        // 스크롤 이벤트 발생 시 IntersectionObserver를 활성화하여 무한 스크롤 지원
        const observer = new IntersectionObserver(loadMoreCallback, { threshold: 0.2 });
        observer.observe($('.feed_container_append').get(0));
    });
});
