$(() => {
	const fab = $('.fab');
	const fabbox = $('.box');
	const bactive = $('.box-active');
	const factive = $('.fab-active');

	const loginBtn = $('a#loginBtn');
	const momentBtn = $('a#momentBtn');
	const commuBtn = $('a#commuBtn');
	const feedContent = $('.feed_content');
	const logoBtn = $('#logo');
	const locationBtn = $('#locationBtn');
	const mypagebtn = $("#mypageBtn1");
	const searchForm = $("#searchform");
	const selectObj = $("#selection")
	const searchObj = $("input[name='search_location']");
	const searchBtn = $("#locationBtn");
	const mapBtn = $(".float-item4");

	var cnt = 0;	

	$.ajax({
		url: "/getSession",
		method: "get",
		dataType: "text",
		success: function (data) {
			if (data != "") {
				loginBtn.html("Logout");
			} else {
				loginBtn.html("Login");
			}
		},
		error(jqXhr, status) {
			alert("세션 실패")
		}
	});

	fab.click((e) => {
		fabbox.toggle(400);
	});

	locationBtn.click((e) => {

		e.preventDefault();
		console.log("locationBtn Click");
		feedContent.html('');

		$.ajax({
			url: 'http://localhost:8888/location/map', // 불러올 페이지의 경로
			method: 'get', // GET 요청
			dataType: "html",
			success: (response) => {
				feedContent.html(response); // 페이지 내용을 .feed_content에 삽입
			},
			error: (jqXhr, status) => {
				alert(`locationBtn실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			},
		});

	});


	momentBtn.click((e) => {
		console.log("momentBtn Click");
		feedContent.html('');
		e.preventDefault();

		$.ajax({
			url: 'http://localhost:8888/hf',
			method: 'get',
			dataType: "html",
			success: (response) => {
				console.log(response);
				feedContent.html(response);
			},
			error: (jqXhr, status) => {
				alert(`momentBtn실패: 얏호`);
			},
		});
	});

	logoBtn.click((e) => {
		location.href = "/hf";
	});


	loginBtn.on("click", (e) => {
		e.preventDefault();

		if (loginBtn.html() == "Login") {
			$.ajax({
				url: 'http://localhost:8888/user/login',
				method: 'get',
				dataType: "html",
				success: (response) => {
					console.log(response);
					location.href = "/user/login";
				},
				error: (jqXhr, status) => {
					alert(`loginBtn실패: ${status}\n오류명: ${jqXhr.statusCode}`);
				},
			});
		} else if (loginBtn.html() == "Logout") {
			$.ajax({
				url: 'http://localhost:8888/user/logout',
				method: 'get',
				success: (response) => {
					location.href = "/user/logout";
				},
				error: (jqXhr, status) => {
					alert(`loginBtn실패: ${status}\n오류명: ${jqXhr.statusCode}`);
				},
			});
		} else {
			alert("1");
		}
	});

	commuBtn.click((e) => {
		e.preventDefault();
		console.log("commuBtn Click");
		feedContent.html('');

		$.ajax({
			url: 'http://localhost:8888/commulist',
			method: 'get',
			dataType: "html",
			success: (response) => {
				feedContent.html(response);
			},
			error: (jqXhr, status) => {
				alert(`commuBtn실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			},
		});
	});

	$('#mypagebtn1').on('click', function(e) {
		e.preventDefault();			
			
	    $.ajax({
		 	url: "/user/mypage",
			type: "post",
			success: function (response) {
			  $('body').append(response);
			},
			error: function (jqXhr, status) {
				alert('로그인을 해야 합니다!');
				location.href = "/user/login";
			}
	  	});
			
	});

	
	

	searchForm.submit((e) => {
		e.preventDefault();
		if (selectObj.val() == "moment") {
			//선택자가 모먼트일 경우 ajax로 모먼트를 검색하는 방식 작성
			$.ajax({
				url: "/search/moment",
				method: "post",
				dataType: "json",
				data: { search_location: searchObj.val() },
				success: function (data) {
				feedContent.html('');
					$.each(data, function (data, item) {
						// 새로운 리스트 아이템을 만들고 데이터를 포함시킵니다.
						
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

						// 리스트 아이템을 리스트 컨테이너에 추가합니다.
						feedContent.append(newItem);
					});



				},


				error: () => {
					alert("실패!");
				}

			})
			

		} else if (selectObj.val() == "community") {
		
			$.ajax({
				url: "/search/commu",
				method: "post",
				dataType: "json",
				data: { search_location: searchObj.val() },
				success: function (data) {
				feedContent.html('');
					$.each(data, function (data, item) {
						// 새로운 리스트 아이템을 만들고 데이터를 포함시킵니다.
						
						const newItem = $('<div class="community_container_append" id=' + '>');
						newItem.append(
							'<ul class="list-group" id="#community_box">'
							+ '<div class="community_title"/>'
							+ '<li class="list-group-item" id="community_title_name">' +'커뮤니티 이름:&nbsp;'+ '<a href="" class="community_a_name" id="'+item.commuID+'">' + item.commuName + '</a><br>' 
							+ '<span class="community_title_intro">커뮤니티 소개:&nbsp;' + item.commuIntro + '</span><br>'
							+ '<span class="community_title_category">카테고리:&nbsp;' + item.commuCategory + '</span><br>'
							+ '<span class="community_title_location">위치:&nbsp;' + item.commuLocation + '</span>'
							+ '</li>'
							+ '</ul>'
							+ '</div>'
							+'</div>'

						);

						// 리스트 아이템을 리스트 컨테이너에 추가합니다.
						feedContent.append(newItem);
					});



				},


				error: () => {
					alert("실패!");
				}

			})
			//선택자가 커뮤니티일 경우 ajax로 커뮤니티를 검색하는 방식 작성

		}


	});
	
	
	
	$('body').on("click", ".community_a_name", function (e) {		
	  e.preventDefault();
	  const commuLink = $(this); 
	  const value = commuLink.attr('id');
	  sessionStorage.setItem('commuID', value);
	  $.ajax({
		url: "http://localhost:8888/commupage",
		type: "get",
		data: { commuID: value },
		success: function (response) {
		  $('.feed_content').html(response);
		},
		error: function (jqXhr, status) {
			
		}
	  });	  
	});
	

});
