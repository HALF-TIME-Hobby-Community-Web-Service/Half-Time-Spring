$(() => {
    $('.feed_content').html('');
    var pageNum = 1;
    var isLoading = false;

    const options = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        loadMoreContent();
    }, options);


    function loadMoreContent() {
        if (isLoading) {
            return;
        }
        isLoading = true;

        $.ajax({
            url: 'http://localhost:8888/moment/feed',
            method: 'POST',
            data: { pageNum: pageNum },
            dataType: "json",
            success: function (data) {
                console.log("pagNum : " + pageNum);
                console.log(data.momentid);

                const container = $('.feed_content');

                if (data.length === 0) {
                    console.log("No more data to load.");
                    pageNum = 0;
                }

                $.each(data, function (data, item) {
                    const newItem = $('<div class="feed_container_append" id=' + item.momentID + '>');

                    newItem.append(
                        '<div class="feedbox">'
                        + '<div class="feed_title">'
                        + '<span class="feed_title_name">🐱' + '<a href="" class="feed_a_name">' + item.writer + '</a>' + '</span>'
                        + '<span class="feed_title_date">⏰23/12/10' + "" + '</span>'
                        + '<span class="feed_title_category">🚩' + item.category + '</span>'
                        + '<span class="feed_title_location">⛱' + item.location + '</span>'
                        + '</div>'
                        + '<hr>'
                        + '<div id="carouselExample" class="carousel slide">'
                        + '<div class="carousel-inner '+ item.momentID +'">'
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
                        + '<hr>'
                        + '<div class="feed_text_box">'
                        + '<div class="feed_text">' + item.text + '</div>'
                        + '</div>'
                        + '<hr>'
                        + '<div class="feed_additional_box">'
                        + '<button class="btn">'
                        + '<img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">'
                        + '</button>'
                        + '<button class="btn"">'
                        + '<img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">'
                        + '</button>'
                        + '<button class="btn">'
                        + '<img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">'
                        + '</button>'
                        + '<button class="btn">'
                        + '<img class="feed_comment_top_add" src="/resources/items/feed/comment/three-dots.svg" alt="더보기버튼">'
                        + '</button>'
                        + '</div>'
                        + '</div>'
                    );  //append end
                    container.append(newItem);
                    let id = item.momentID;
				
                    const innerContent = $('.'+id);
                    if (item.contentPath1 != null) {
                        innerContent.append(
                            '<div class="carousel-item active">'
                            + '<img src="' + item.contentPath1 + '" class="d-block w-100 feed_thumb" alt="...">'
                            + '</div>'
                        );//append end
                    }// if end 
                    else {
                        innerContent.append(
                            '<div class="carousel-item">'
                            + '<img src="/resources/items/moment/moment_default.png" class="d-block w-100 feed_thumb" alt="...">'
                            + '</div>'
                        );//append end
                    }//else end

                    for (let i = 2; i < 6; i++) {
                        let contentSrc = item['contentPath' + i];
                        console.log(contentSrc);
                        if (contentSrc != null) {
                            innerContent.append(
                                '<div class="carousel-item">'
                                + '<img src="' + contentSrc + '" class="d-block w-100 feed_thumb" alt="...">'
                                + '</div>'
                            )
                        }

                    }
                });

                pageNum++;
                isLoading = false;
            },
            error: function (jqXhr, status) {
                alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
                console.error('Failed to fetch new content.');
                isLoading = false;
            }
        });
    }


    const idLink = $('.feed_a_name');
    idLink.click(function (e) {

        alert("!");

    })

    $('.feed_content').scroll(() => {
        const lastFeedContainer = $('.feed_container_append').last()[0];
        const observer = new IntersectionObserver((entries) => {
            if (entries[0].isIntersecting) {
                loadMoreContent();
            }
        }, options);
        observer.observe(lastFeedContainer);
    });

    // 초기 페이지 로드 시 IntersectionObserver를 활성화하기 위한 코드
    const initialObserver = new IntersectionObserver((entries) => {
        if (entries[0].isIntersecting) {
            loadMoreContent();
        }
    }, options);
    initialObserver.observe($('.feed_content').last()[0]);

    $(".carousel-item").on("click", function () {

    });
    $('.feedbox').click(() => {
        $('.feed_modal_content').css('display', 'block');
    });

});
