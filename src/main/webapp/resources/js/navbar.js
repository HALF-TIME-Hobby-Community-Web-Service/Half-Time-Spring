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
      },
      error(jqXhr, status) {
        alert("세션 실패")
      }
    });
  
  
    fab.click((e) => {
      fabbox.toggle(400);
    });
<<<<<<< HEAD
  
    locationBtn.click((e) => {
  
      e.preventDefault();
      console.log("locationBtn Click");
      feedContent.html('');
  
=======

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
    location.href = "/hf";
  });

  loginBtn.on("click", (e) => {
    if (loginBtn.html() == "Login") {
>>>>>>> 500b2f8c9d755b5aa32f293265f799e9f4fb53d8
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
<<<<<<< HEAD
  
    });
  
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
      return false;
    } else {
      alert("1");
    }

  });
});
>>>>>>> 500b2f8c9d755b5aa32f293265f799e9f4fb53d8
