$(() => {

  //    const loginTag = $('#sidefirst')
  //    $.ajax({
  //     url: 'http://localhost:8888/user/login',
  //         method: 'POST',
  //         data: loginTag.serialize(), //form내에 input태그들의 name과 value를 매핑

  //          //response: back -> front로 넘겨준 데이터(작명을 임의로 response라고 함)
  //          //맵으로 넘겨줬을시 response.id, response.state등으로 key값으로 value를 찾으면 됨.
  //         success: (response) => {

  //           if (response == null ) {
  //             loginTag.text('Login');
  //           }
  //            else{
  //            loginTag.text('Logout');
  //           }
  //         },
  //         error: (jqXhr, status) => {
  //           alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
  //         },
  //    })이는 로그인 됐을 시 session 으로 logout으로 바꿔주는 작업 추후 진행

  const fab = $('.fab');
  const fabbox = $('.box');
  const bactive = $('.box-active');
  const factive = $('.fab-active');

  const loginBtn = $('a#loginBtn');
  const momentBtn = $('a#momentBtn');
  const commuBtn = $('a#commuBtn');
  const feedContent = $('.feed_content');
  const logoBtn = $('#logo');
  const locationBtn =$('#locationBtn');

  var cnt = 0;

  $.ajax({
    url:"/user/getSession",
    method:"get",
    dataType:"text",
    success: function(data){
      loginBtn.html("Logout");
    },
    error(jqXhr,status){
    alert("실패 ㅠㅠ")
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
      dataType:"html",
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
	  dataType:"html",
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
      url: 'http://localhost:8888/moment/list', // 불러올 페이지의 경로
      method: 'get', // GET 요청
		dataType:"html",
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
  console.log("loginBtn Click");
    $.ajax({
      url: 'http://localhost:8888/moment/list', // 불러올 페이지의 경로
      method: 'get', // GET 요청

      success: (response) => {
      	
        feedContent.html(response); // 페이지 내용을 .feed_content에 삽입
		$()
      },
      error: (jqXhr, status) => {
        alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
      },
    });
    return false;
  });
});
