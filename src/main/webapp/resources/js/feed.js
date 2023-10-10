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
						+ '<div class="carousel-inner">'
						+ '<div class="carousel-item active">'
						+ '<img src="' + item.contentPath1 + '" class="d-block w-100 feed_thumb" alt="...">'
						+ '</div>'
						+ '<div class="carousel-item">'
						+ '<img src="' + item.contentPath2 + '" class="d-block w-100 feed_thumb" alt="...">'
						+ '</div>'
						+ '<div class="carousel-item">'
						+ '<img src="' + item.contentPath3 + '" class="d-block w-100 feed_thumb" alt="...">'
						+ '</div>'
						+ '<div class="carousel-item">'
						+ '<img src="' + item.contentPath4 + '" class="d-block w-100 feed_thumb" alt="...">'
						+ '</div>'
						+ '<div class="carousel-item">'
						+ '<img src="' + item.contentPath5 + '" class="d-block w-100 feed_thumb" alt="...">'
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
					);
  
					container.append(newItem);
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
  
  
  //$('.feed_modal_content').css('display','block');
  // 게시물 클릭시 피드 모달 두둥등장 -> 안먹어
	$('.feedbox').click(() => {    	
	$('.feed_modal_content').css('display','block');
	});
  
  //임시    
	$('.float-item2').click(()=> {
	$('.feed_modal_content').css('display','block');
  });	
  });
  