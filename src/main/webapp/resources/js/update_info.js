$(() => {


	const pwdUpdateBtn = $("#pw_updateBtn");
	const pnumUpdateBtn = $("#pnum_updateBtn");
	const pwdFormObj = $("#pw_update");
	const pnumFormObj = $("#pnum_update");


	pwdUpdateBtn.click((e) => {
		e.preventDefault();
		$.ajax({
			url: 'http://localhost:8888/user/updatePassword', // 불러올 페이지의 경로
			data:pwdFormObj.serialize(),
			method: 'post', 
			dataType:"json",
			success: (response) => {
			
				if(response == 1){
					alert("비밀번호가 변경되었습니다!");
					
				}else{
					alert("실패다이놈");
				}
			},
			error: (jqXhr, status) => {
				
			}
		});
	});

	pnumUpdateBtn.click((e) => {
	e.preventDefault();
		$.ajax({
			url: 'http://localhost:8888/user/updatePhoneNumber', // 불러올 페이지의 경로
			data:pnumFormObj.serialize(),
			method: 'post',
			dataType:"json",
			success: (response) => {
			
				if(response == 1){
					alert("전화번호가 변경되었습니다.");

				}else{
					alert("실패다이놈");
				}
			},
			error: (jqXhr, status) => {
				alert(`실패: ${status}\n오류명: ${jqXhr.statusCode}`);
			}
		});
	});
})