$(() => {
<<<<<<< HEAD

const updateinfoBtn = $(".update_info");

updateinfoBtn.click((e)=>{
alert("update");
    $.ajax({
        url: 'http://localhost:8888/user/updateInfo', // 불러올 페이지의 경로
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
})
 
})
=======
   
    mypagebtn.on("click", function() {
        $.ajax({
            url: "/user/mypage",
            type: "get",
            success: function() {
            location.href="/user/mypage"
            },
            error: function(jqXhr, status) { 
             location.href="/user/login"
            }            
        }); 
      });
      
       logoutbtn.on("click", function() {
       alert("로그아웃 -> 로그인페이지로 이동합니다");
       	  $.ajax({
       	  url:"/user/logout",
       	  type:"get",
       	  success:function(){
       	  location.href="/user/login"
       	  },
       	  error: function(jqXhr, status) {    
            }            
       });
    })
  })
>>>>>>> 076492b2d891a73ece3ae1e68988a705f452389e

