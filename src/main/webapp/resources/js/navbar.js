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
<<<<<<< HEAD
    });
  
  
    fab.click((e) => {
      fabbox.toggle(400);
    });
  
    locationBtn.click((e) => {
  
      e.preventDefault();
      console.log("locationBtn Click");
      feedContent.html('');
  
=======
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

  loginBtn.on("click", (e) => {
    if (loginBtn.html() == "Login") {
>>>>>>> 1d8595138f46a33d45d9aa622cb4b33c9c1cf2db
      $.ajax({
        url: 'http://localhost:8888/location/map',
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
<<<<<<< HEAD
  
   mypagebtn.on("click", function() {
  
       alert("마페");
          $.ajax({
              url: "/user/mypage",
              type: "get",
              success: function(response) {
              feedContent.html(response);
              },
              error: function(jqXhr, status) { 
               location.href="/user/login"
              }            
          }); 
        });
  
  
    momentBtn.click((e) => {
      console.log("momentBtn Click");
      feedContent.html('');
      e.preventDefault();
  
      $.ajax({
        url: 'http://localhost:8888/moment/list', // 불러올 페이지의 경로
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
    });
  });
=======
  });

  mypagebtn.on("click", function () {
    $.ajax({
      url: "/user/mypage",
      type: "get",
      success: function (response) {
        feedContent.html(response);
      },
      error: function (jqXhr, status) {
        location.href = "/user/login";
      }
    });
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
>>>>>>> 1d8595138f46a33d45d9aa622cb4b33c9c1cf2db
