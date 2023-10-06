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
	const mypagebtn = $("#mypageBtn");
	const searchForm = $("#searchform");
	const selectObj = $("#selection")
	const searchObj = $("input[name='search_location']");
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
				console.log(response);

				feedContent.html(response); // 페이지 내용을 .feed_content에 삽입
			},
			error: (jqXhr, status) => {
				alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
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
				alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			},
		});
	});

	logoBtn.click((e) => {
		location.href = "/hf";
	});
	
	mapBtn.click((e)=>{
		var mapDisplay = $("#map_content").css('display');
    if (mapDisplay === 'none') {
      $('#map_content').css('display', 'block');
  } else {
      $('#map_content').css('display', 'none');
  }
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
					alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
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
					alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
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
				console.log(response);
				feedContent.html(response);
			},
			error: (jqXhr, status) => {
				alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			},
		});
	});

	mypagebtn.on("click", function () {
		$.ajax({
			url: "/user/mypage",
			type: "post",
			success: function (response) {
				feedContent.html(response);
			},
			error: function (jqXhr, status) {
				location.href = "/user/login";
			}
		});
	});

	searchForm.submit((e) => {

		e.preventDefault();
		if (selectObj.val() == "moment") {
			//선택자가 모먼트일 경우 ajax로 모먼트를 검색하는 방식 작성


		} else if (selectObj.val() == "community") {
			$.ajax({
				url: "/search/location",
				method: "post",
				dataType: "json",
				data: { search_location: searchObj.val() },
				success: (response) => {
					alert("성공이요~" + response.commuIntro);

					alert(response);

				},
				error: () => {
					alert("실패!");
				}

			})
			//선택자가 커뮤니티일 경우 ajax로 커뮤니티를 검색하는 방식 작성

		}


	});

	momentBtn.click((e) => {
		console.log("momentBtn Click");
		feedContent.html('');
		e.preventDefault();

		$.ajax({
			url: 'http://localhost:8888/moment/list',
			method: 'get',
			dataType: "html",
			success: (response) => {
				console.log(response);
				feedContent.html(response);
			},
			error: (jqXhr, status) => {
				alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			},
		});
	});
});
