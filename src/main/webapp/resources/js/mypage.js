$(() => {

	const updateinfoBtn = $(".update_info");
	const pwdUpdateBtn = $("#pw_updateBtn");
	const pnumUpdateBtn = $("#pnum_updateBtn");
	const mypageContent = $(".mypageContent");
	
	updateinfoBtn.click((e)=>{
		alert("@");
	    $.ajax({
	        url: 'http://localhost:8888/user/updateInfo', // 불러올 페이지의 경로
	        method: 'post', // GET 요청
	        dataType: "html",
	        success: (response) => {
	          console.log(response);
	  
	          mypageContent.html(response); // 페이지 내용을 .feed_content에 삽입
	        },
	        error: (jqXhr, status) => {
	          alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
	        }
      });
  });

  pwdUpdateBtn.click((e)=>{
	alert("@");
	$.ajax({
		url: 'http://localhost:8888/user/updatePassword', // 불러올 페이지의 경로
		method: 'post', // GET 요청
		dataType: "html",
		success: (response) => {
		  console.log(response);
  
		  mypageContent.html(response); // 페이지 내용을 .feed_content에 삽입
		},
		error: (jqXhr, status) => {
		  alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
		}
  });
});

pnumUpdateBtn.click((e)=>{
	alert("@");
	$.ajax({
		url: 'http://localhost:8888/user/updatePhoneNumber', // 불러올 페이지의 경로
		method: 'post', // GET 요청
		dataType: "html",
		success: (response) => {
		  console.log(response);
  
		  mypageContent.html(response); // 페이지 내용을 .feed_content에 삽입
		},
		error: (jqXhr, status) => {
		  alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
		}
  });
});
})