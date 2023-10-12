$(() => {
	const updateinfoBtn = $(".update_info");
	const pwdUpdateBtn = $("#pw_updateBtn");
	const pnumUpdateBtn = $("#pnum_updateBtn");
	const mypageContent = $(".mypageContent");
 	const mycommuContent = $(".mypageContainer_myCommu");
	
	updateinfoBtn.click((e)=>{
	    $.ajax({
	        url: 'http://localhost:8888/user/updateInfo', // 불러올 페이지의 경로
	        method: 'post', // GET 요청
	        dataType: "html",
	        success: (response) => {	  
	          mypageContent.html(response); // 페이지 내용을 .feed_content에 삽입
	        },
	        error: (jqXhr, status) => {
	          swal('오류!',`update실패: ${status}\n오류명: ${jqXhr.statusCode}`,'error');
	        }
      });
  });


	$('.mypage_closebtn').on('click', function() {
		$('.mypageContent').remove();
	});
});
