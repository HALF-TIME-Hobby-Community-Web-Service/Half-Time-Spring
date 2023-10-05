
// 회원가입 1페이지 > 2페이지 넘어가기
$(() => {
  const formObj = $('form.join_container');
  const id = $('input.join_ID_input');
	
  $(formObj).submit(() => {
  sessionStorage.setItem('userid', id.val());
    $.ajax({
      url: 'http://localhost:8888/user/naver',
      method: 'POST',
      data: formObj.serialize(),
      dataType: "JSON",
      
      success: (response) => {
        alert('다음페이지로 이동합니다');
        if (response == 1) {
        //좀있다변경하기
          location.href = 'http://localhost:8888/user/naver2';
        } else {
          alert('전부 작성해주세요');
        }
      },
      error: (jqXhr, status) => {
        alert(`실패: ${status}\n오류명:${jqXhr.statusCode}`);
      },
    });
    return false;
  });
});



