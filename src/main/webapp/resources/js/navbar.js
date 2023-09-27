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
