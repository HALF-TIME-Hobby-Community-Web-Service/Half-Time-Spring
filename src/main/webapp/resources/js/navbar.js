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

  commuBtn.click((e) => {
    e.preventDefault();
    console.log("commuBtn Click");

    feedContent.html('');

    $.ajax({
      url: 'http://localhost:8888/commulist', // 불러올 페이지의 경로
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
      url: 'http://localhost:8888/hf', // 불러올 페이지의 경로
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

  logoBtn.click((e) => {
<<<<<<< HEAD
  console.log("loginBtn Click");
    $.ajax({
      url: 'http://localhost:8888/hf', // 불러올 페이지의 경로
      method: 'get', // GET 요청

      success: (response) => {
         
        feedContent.html(response); // 페이지 내용을 .feed_content에 삽입
      },
      error: (jqXhr, status) => {
        alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
      },
    });
    return false;
=======
    location.href = "/hf";
  });

  loginBtn.on("click", (e) => {
    if (loginBtn.html() == "Login") {
      $.ajax({
        url: 'http://localhost:8888/user/login', // 불러올 페이지의 경로
        method: 'get', // GET 요청
        dataType: "html",
        success: (response) => {

          location.href = "/user/login"; // 페이지 내용을 .feed_content에 삽입
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
        },
      });
      return false;
    }
    else if (loginBtn.html() == "Logout") {
      $.ajax({
        url: 'http://localhost:8888/user/logout', // 불러올 페이지의 경로
        method: 'get', // GET 요청
        success: (response) => {
          location.href = "/user/logout"; // 페이지 내용을 .feed_content에 삽입
        },
        error: (jqXhr, status) => {
          alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
        },
      });
      return false;
    } else {
      alert("1");
    }
>>>>>>> 37b4f3f11d601044f6017cd168e658f22632f621
  });
});