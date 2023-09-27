$(() => {

const updateinfoBtn = $("#update_info");

updateinfoBtn.click((e)=>{
<<<<<<< HEAD
alert("@");
=======
>>>>>>> 4c1b5821bb470a7046c6b2b8a084cec3f3e26436
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
 
<<<<<<< HEAD
})

=======
})
>>>>>>> 4c1b5821bb470a7046c6b2b8a084cec3f3e26436
