$(() => {
  const formObj = $('div.backboard form');

  formObj.submit(() => {
    $.ajax({
      url: 'http://localhost:8888/hf/momentwrite',
      method: 'post',
      data: formObj.serialize(),

      //조성민 TODO
      success: (response) => {
        if (response == '1') alert('게시물 작성이 완료되었습니다');
        else alert('게시물 작성이 완료되었습니다');
      },
      error: (jqXhr, status) => {
        alert(`실패했다: ${status}\n오류명:${jqXhr.statusCode}`);
      },
    });

    return false;
  });
});
