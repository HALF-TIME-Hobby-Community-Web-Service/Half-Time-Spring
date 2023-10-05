$(() => {
    const momentWriteBtn = $('.float-item1');
    const momentWriteCloseBtn = $('.closeBtn');
    const momentWrite = $('.modalWrap');
    const memberListClick = $('.memberList');
    const momentmodal = $('');
    const container = $('.feed_container_append');

    var state = true;

    $(document).on("click", ".feed_container_append", function (e) {
        console.log("feed_container_append Clicked");
        var clickedFeedContainer = e.currentTarget;
        var clickedTarget = e.target.className;
        var momentid = parseInt(clickedFeedContainer.id);
        console.log(momentid);
        if (clickedTarget === "carousel-control-prev" || clickedTarget === "carousel-control-next" || clickedTarget === "carousel-control-prev-icon" || clickedTarget === "carousel-control-next-icon") {
            return; // continue 대신에 return을 사용
        } else {
            $.ajax({
                url: 'http://localhost:8888/moment/modal',
                method: 'POST',
                data: { momentID: momentid },
                dataType: "json",
                success: function (data) {
                    alert(data.writer);
                    if (!state) {
                        return;
                    }
                    var newItem = $('body');
                    newItem.append(
                        '<div class="feed_modal_content">' +
                        '<div class="feed_modal_container">' +
                        '<div class="feed_modal_box">' +
                        '<div class="feed_modal_title">' +
                        '<div class="feed_modal_title_name">✍' + data.writer + '</div>' +
                        '<div class="feed_modal_title_date">' + data.date + '</div>' +
                        '<div class="feed_modal_title_time">' + data.time + '</div>' +
                        '<div class="feed_modal_title_category">' + data.category + '</div>' +
                        '<div class="feed_modal_title_location">' + data.location + '</div>' +
                        '</div>' +

                        '<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">' +
                        '<div class="carousel-indicators">' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"' +
                        'aria-current="true" aria-label="Slide 1"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"' +
                        'aria-label="Slide 2"></button>' +
                        '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"' +
                        'aria-label="Slide 3"></button>' +
                        '</div>' +
                        '<div class="carousel-inner">' +
                        '<div class="carousel-item active">' +
                        '<img src="' + data.contentPath1 + '" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="' + data.contentPath2 + '" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="' + data.contentPath3 + '" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="' + data.contentPath4 + '" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '<div class="carousel-item">' +
                        '<img src="' + data.contentPath5 + '" class="d-block w-100" alt="...">' +
                        '</div>' +
                        '</div>' +
                        '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"' +
                        'data-bs-slide="prev">' +
                        '<span class="carousel-control-prev-icon" aria-hidden="true"></span>' +
                        '<span class="visually-hidden">Previous</span>' +
                        '</button>' +
                        '<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"' +
                        'data-bs-slide="next">' +
                        '<span class="carousel-control-next-icon" aria-hidden="true"></span>' +
                        '<span class="visually-hidden">Next</span>' +
                        '</button>' +
                        '</div>' +

                        '<div class="feed_comment_box">' +
                        '<div class="feed_comment_top">' +
                        '<img class="feed_comment_top_heart" src="/resources/items/feed/comment/heart.svg" alt="좋아요버튼">' +
                        '<img class="feed_comment_top_comment" src="/resources/items/feed/comment/chat.svg" alt="댓글버튼">' +
                        '<img class="feed_comment_top_send" src="/resources/items/feed/comment/send.svg">' +
                        '<img class="feed_comment_top_add" src="/resources/items/comment/three-dots.svg" alt="더보기버튼">' +
                        '</div>' +
                        '</div>' +
                        '<div class="feed_modal_text_box">' +
                        '<div class="feed_modal_text">' +
                        data.text +
                        '</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom">' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">신유리</div> :&nbsp;' +
                        '<div class="feed_comment">아, 한자리 더 있습니다!</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">이수완</div> :&nbsp;' +
                        '<div class="feed_comment">남자도 가능한가요?</div>' +
                        '</div>' +
                        '<div class="feed_comment_bottom_box">' +
                        '<div class="feed_comment_user">신유리</div> :&nbsp;' +
                        '<div class="feed_comment">여자만 가능해요</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>'
                    );
                    console.log(newItem);
                    state = false;
                }
            });
        }
    });
});
